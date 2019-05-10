// 题库中心

import request from '../request'

/**
* @desc 获取选择题信息
*/
export const apiSelectQuestion = (type, method) => request('/list/select/questions/', { type }, { method })

/**
 * @desc 获取选择题选项信息
 */
export const apiSelectAnswer = (question_id, method) => request('/list/select/answers/', { question_id }, { method })

/**
 * @desc 创建邀约
 * @param {string} id 发布者id
 * @param {string} score 邀约积分
 * @param {string} content 邀约讲解内容
 * @param {string} question_id 问题id
 */
export const apiCreateInvite = (type, owner, score, content, question_id, created_time, updated_time) => request('create/information/', { type, owner, score, content, question_id, created_time, updated_time })

/**
 * @desc 信息广场列表
 */
export const apiInformationList = (method) => request('/list/informations/', {}, { method })

/**
 * @desc 创建邀约回答
 * @param {string} owner 用户id
 * @param {string} information_id 邀约回答id
 * @param {string} content 邀约回答内容
 * @param {string} created_time 邀约回答创建时间
 * @param {string} updated_time 邀约回答更新时间
 */
export const apiCreateAnswer = (owner, information_id, content, created_time, updated_time) => request('create/information/comment/', { owner, information_id, content, created_time, updated_time })