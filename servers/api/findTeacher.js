// 寻师模块
import request from '../request'

/**
* @desc 获取预约列表
*/
export const apiInviteList = (method) => request("list/select/teacher", {}, { method })

/**
* @desc 创建预约
* @param {string} title 预约标题
* @param {string} content 预约内容
* @param {string} room 预约房间
* @param {string} score 预约积分
* @param {string} interview_time 预约开始时间
* @param {string} end_time 预约结束时间
*/
export const apiCreateInvite = (title, content, room, score, interview_time, end_time) => request("/create/course/", { title, content, room, score, interview_time, end_time })

/**
* @desc 创建预约成功后获取预约列表
*/
export const apiGetInvite = (method) => request("/list/courses/", {}, { method })

/**
* @desc 点击预约
* @param {string} selector_id 列表id
* @param {string} teacher_id 老师id
* @param {string} status 课程状态
* @param {string} room 上课房间
* @param {string} score 课程积分
* @param {string} interview_time 预约开始时间
* @param {string} end_time 预约结束时间
*/
export const apiClickInvite = (selector_id, teacher_id, status, room, score, course_id, interview_time, end_time) => request("/create/select/teacher/", { selector_id, teacher_id, status, room, score, course_id, interview_time, end_time})

/**
 * @desc 获取课程列表
 */
export const apiSubjectList = (method) => request('/list/course/category/', {}, {method})