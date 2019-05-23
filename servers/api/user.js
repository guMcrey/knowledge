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
* @param {string} token token校验
*/
export const apiUserDetail = (method) => request('/user/detail/', {}, { method })

/**
 * @desc 获取选择题问题操作记录
 */
export const apiGetSelectRecord = (method) => request('/list/select/operations/', {}, { method })

/**
 * @desc 普通问题操作记录列表
 */
export const apiGetNomalRecord = (method) => request('/list/normal/operations/', {}, { method })

/**
 * @desc 完善个人信息
 * @param {string} name 用户姓名
 * @param {number} gender 性别
 * @param {string} birthday 生日
 * @param {string} mobile 手机
 * @param {string} email 邮箱
 */

export const apiCompleteInfo = (name, gender, birthday, mobile, email, method) => request('/update/user/detail/', { name, gender, birthday, mobile, email}, {method})


/**
 * @desc 更改密码
 * @param {string} nickname 用户名
 * @param {string} password 旧密码
 * @param {string} new_password 新密码
 */
export const apiUpdatePaw = (nickname, password, new_password, method) => request('/update/user/password/', { nickname, password, new_password}, {method})

/**
 * @desc 申请小老师
 */
export const apiApplySmallTeacher = (method) => request('/update/user/smt/', {}, {method})

/**
 * @desc 我的讨论区发布
 */
export const apiMyDiscussList = (method) => request('/list/me/questions/', {}, {method})