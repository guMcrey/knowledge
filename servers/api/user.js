import request from '../request'

/**
* @desc 用户注册
* @param {string} username 用户名
* @param {string} password 密码
*/
export const apiRegister = (username, password) => request("/signup/", { username, password })

/**
* @desc 用户登录
* @param {string} username 用户名
* @param {string} password 密码
*/
export const apiLogin = (username, password) => request("/login/", { username, password })

/**
* @desc 个人详情页
* @param {string} token token值
*/
export const apiUserDetail = (method) => request('/user/detail/', {}, { method })
