import * as types from './mutation-types'
import axios from 'axios'
import { apiUserDetail } from '~/servers/api/user'
import { apiSelectQuestion } from '../servers/api/questions'
import Vue from 'vue';

export default {
    // 获取题目列表
    async getSelectQuestion({ commit, state }) {
        const data = await apiSelectQuestion(1, 'get')
        state.itemDetail = data.results
    },
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
        console.log("----------------------------------------------------->")
        // console.log(cookieArr)
        console.log(count)
        // console.log('00000', axios.defaults.headers['token'])
        // console.log("<-----------------------------------------------------")
        // axios.defaults.headers['token'] = ""
        if (req.headers.cookie && count >= 0) {
            axios.defaults.headers['Authorization'] = `JWT ${(cookieArr.substr(Number(count) + 6)).split(";")[0]}`
            console.log('axios.defaults.headers', axios.defaults.headers['Authorization'])
            try {
                // 请求用户信息
                let userInfo = await apiUserDetail('get')
                commit('SET_USER', userInfo)
                console.log('set-user', SET_USER)
                redirect('/')

            } catch (error) {
                commit(types.SET_USER, '')
                console.log('catch', types.SET_USER)
            }
        } else {
            commit(types.SET_USER, '')
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