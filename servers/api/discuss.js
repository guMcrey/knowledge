// 讨论区模块
import request from '../request'

/**
* @desc 创建讨论区问题
* @param {string} title 问题标题
* @param {string} content 问题描述
* @param {string} score 问题积分
* @param {string} type 问题类型
*/
export const apiCreateQuestion = (title, content, score, type) => request("/create/normal/question/", { title, content, score, type })

/**
* @desc 获取讨论区问题列表
*/
export const apiGetQuestionList = (limit, offset, method) => request('list/normal/questions/', { limit, offset }, { method })

/**
* @desc 查看问题详情
*/
export const apiCheckInfo = (question_id, method) => request('/list/normal/answers/', { question_id }, { method })

/**
 * @desc 创建讨论区问题回答
 * @param {number} owner 用户id
 * @param {number} question_id 问题id
 * @param {string} content 回答内容
 * @param {string} created_time 创建时间
 * @param {string} updated_time 更新时间
 */
export const apiCreateAnswer = (owner, question_id, content, created_time, updated_time) => request('/create/normal/answer/', { owner, question_id, content, created_time, updated_time })

/**
 * @desc 记录用户讨论区回复操作记录
 * @param {number} question_id 当前问题id
 * @param {number} answer_id 回答问题id
 * @param {number} user_id 用户id
 * @param {string} score 积分
 */
export const apiNomalBehavior = (question_id, answer_id, user_id, score) => request('/create/normal/operation/', { question_id, answer_id, user_id, score })