// 题库中心

import request from '../request'

/**
* @desc 获取顺序答题（选择题）信息
*/
export const apiSelectQuestion = (type, method) => request('/list/select/questions/', { type }, { method })

/**
* @desc 获取乱序答题（选择题）信息
*/
export const apiSelectQuestionRandom = (type, mode, method) => request('/list/select/questions/', { type, mode }, { method })

/**
 * @desc 获取选择题选项信息
 */
export const apiSelectAnswer = (question_id, method) => request('/list/select/answers/', { question_id }, { method })

/**
 * @desc 获取文本题信息
 */
export const apiContentQuestion = (type, method) => request('/list/content/questions', { type }, { method })

/**
 * @desc 文本题回答接口
 * @param {string} content 回答内容
 */
export const apiContentAnswer = (content) => request('/create/content/answer/', { content })

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
export const apiInformationList = (limit, offset, method) => request('/list/informations/', { limit, offset }, { method })

/**
 * @desc 创建邀约回答
 * @param {string} owner 用户id
 * @param {string} information_id 邀约回答id
 * @param {string} content 邀约回答内容
 * @param {string} created_time 邀约回答创建时间
 * @param {string} updated_time 邀约回答更新时间
 */
export const apiCreateAnswer = (owner, information_id, content, created_time, updated_time) => request('create/information/comment/', { owner, information_id, content, created_time, updated_time })

/**
 * @desc 用户选择题操作记录
 * @param {number} question_id 当前题目id
 * @param {string} answer_id 选择的选型id
 * @param {string} user_id 用户id
 * @param {string} score 积分
 * @param {string} is_correct 选择是否正确
 */
export const apiSelectBehavior = (question_id, answer_id, user_id, score, is_correct) => request('/create/select/operation/', { question_id, answer_id, user_id, score, is_correct })

/**
 * @desc 创建笔记
 */
export const apiCreateNote = (owner, question_id, content, created_time, updated_time) => request('/create/select/note/', { owner, question_id, content, created_time, updated_time })


/**
 * @desc 查看笔记
 */
export const apiMyNoteList = (question_id, method) => request('retrieve/select/note/', { question_id }, { method })