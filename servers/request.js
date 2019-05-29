import axios from 'axios'
import { getCookie, setCookie } from "~/assets/js/cookie.js"
import Vue from 'vue';

axios.defaults.timeout = 10000;   // 请求超时
axios.defaults.withCredentials = false;
// 请求的基本配置
let _options = {
    baseURL: process.env.baseUrl,// 接口的域名地址
}
if (!process.server) {//当不是服务端的时候获取cookie设置header
    _options.headers = {
        'Authorization': `JWT ${getCookie('token')}`,
    }
}
const service = axios.create(_options)
// 请求拦截 设置cookie
service.interceptors.request.use(function (config) {
    if (!process.server) {
        config.headers['Authorization'] = `JWT ${getCookie('token')}`
    }
    // else {
    // 在服务端  设置Referer
    // config.headers['Referer'] = process.env.Referer
    // }    
    return config;
}, function (error) {
    return Promise.reject(error);
});
// 输出方法
export default function request(url, data = {}, options) {
    // console.log('url', url)
    // console.log('data', data)
    // console.log('options', options)
    const defaultOptions = { //默认参数
        method: "post",//请求方式
        hidetoast: false    // 默认参数不隐藏toast
    }
    const { method, hidetoast } = Object.assign(defaultOptions, options);
    return new Promise((resolve, reject) => {
        const options = {
            url,
            method
        }
        if (method.toLowerCase() === 'get') {
            options.params = data
        } else {
            options.data = data
        }
        service(options)
            .then(res => {
                console.log('res', res)
                // if (res.data === "SESSIONTIMEOUT") {
                //     //登录信息过期
                //     if (process.browser) {
                //         Vue.prototype.$toast.error({
                //             duration: 1500,
                //             message: res.data
                //         })
                //         setCookie('jkyy', '', 0)
                //         Vue.prototype.$loginRegister.show()
                //         return
                //     }
                // }
                if (res.detail === "Invalid Authorization header. No credentials provided.") {
                    // 强制登出
                    if (process.browser) {
                        // Vue.prototype.$toast.error({
                        //     duration: 1500,
                        //     message: res.data.tooltip || res.data.retInfo
                        // })
                        setCookie('token', '', 0)
                        window.location.href = './login'
                        // Vue.prototype.$loginRegister.show()
                        return
                    }
                }
                resolve(res.data)
                // if (res.data.retCode === "SUCCESS") {
                //     resolve(res.data)
                // } else {
                //     if (!hidetoast) {
                //         Vue.prototype.$toast.error({
                //             duration: 1500,
                //             message: res.data.tooltip || res.data.retInfo
                //         })
                //     }
                //     reject(res.data)
                // }
                // console.log('请求出参，resolve')
            })
            .catch(error => {
                // if (error.message.indexOf("timeout") !== -1) {
                //     //超时
                //     Vue.prototype.$toast.error({
                //         message: "请求超时",
                //         duration: 1500
                //     })
                // } else {
                //     Vue.prototype.$toast.error({
                //         message: error.message,
                //         duration: 1500
                //     })
                // }
                // console.log('error', error)
                reject(error)
            })
    })
}