import * as types from './mutation-types'
import * as api from '~/assets/api'
import axios from 'axios'
import { apiUserDetail } from '~/servers/api/user'

export default {
    addNum({ commit, state }, id) {
        //点击下一题，记录答案id，判断是否是最后一题，如果不是则跳转下一题
        commit('REMBER_ANSWER', id);
        if (state.itemNum < state.itemDetail.length) {
            commit('ADD_ITEMNUM', 1);
        }
    },
    //初始化信息
    initializeData({ commit }) {
        commit('INITIALIZE_DATA');
    },
    async nuxtServerInit({ commit }, { req, redirect }) {
        // token存在
        let cookieArr = req.headers.cookie
        let count = cookieArr && cookieArr.indexOf("token=")
        // console.log("----------------------------------------------------->")
        // console.log(cookieArr)
        // console.log(count)
        // console.log(axios.defaults.headers['token'])
        // console.log("<-----------------------------------------------------")
        axios.defaults.headers['token'] = ""
        if (req.headers.cookie && count >= 0) {
            axios.defaults.headers['token'] = (cookieArr.substr(Number(count) + 6)).split(";")[0]
            console.log('axios.defaults.headers', axios.defaults.headers['token'])
            try {
                console.log('try')
                // 请求用户信息
                // let userInfo = await apiUserDetail('get')
                // console.log('=================userInfo===============', userInfo)
                // commit('SET_USER', userInfo.developerInfo)
            } catch (error) {
                // commit('SET_USER', '')
                // console.log('catch')
            }
        } else {
            // commit('SET_USER', '')
        }
    },
    // 退出登录
    // logout({ commit }) {
    //     commit(types.TOGGLE_LOADING_STATUS)
    //     api.post('/logout').then(response => {
    //         commit(types.TOGGLE_LOADING_STATUS)
    //         // 如果用户退出成功
    //         if (response.data.logout) {
    //             // 清除 localstorage 中的 ACCESS_TOKEN
    //             commit(types.USER_LOGOUT)
    //             // 检测登录状态
    //             commit(types.CHECKOUT_LOGIN_STATUS)
    //             Message({ message: '退成成功。', type: 'success', customClass: 'c-msg' })
    //         }
    //     }).catch(error => {
    //         commit(types.TOGGLE_LOADING_STATUS)
    //         Message({
    //             message: '出问题啦，您可以稍后再来光顾~~',
    //             type: 'error',
    //             customClass: 'c-msg',
    //             duration: 0,
    //             showClose: true
    //         })
    //         Promise.reject(error)
    //     })
    // }
}