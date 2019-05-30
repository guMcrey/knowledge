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
export const apiGetSelectRecord = (limit, offset, method) => request('/list/select/operations/', { limit, offset }, { method })

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

export const apiCompleteInfo = (name, gender, birthday, mobile, email, method) => request('/update/user/detail/', { name, gender, birthday, mobile, email }, { method })


/**
 * @desc 更改密码
 * @param {string} nickname 用户名
 * @param {string} password 旧密码
 * @param {string} new_password 新密码
 */
export const apiUpdatePaw = (nickname, password, new_password, method) => request('/update/user/password/', { nickname, password, new_password }, { method })

/**
 * @desc 申请小老师
 */
export const apiApplySmallTeacher = (method) => request('/update/user/smt/', {}, { method })

/**
 * @desc 我的讨论区发布
 */
export const apiMyDiscussList = (limit, offset, method) => request('/list/me/questions/', { limit, offset }, { method })

/**
 * @desc 荣誉榜
 */
export const apiHonorsList = (limit, offset, type, method) => request('/users/detail/', { limit, offset, type }, { method })

/**
 * @desc 我的评价
 */
export const apiCommitList = (limit, offset, method) => request('/list/course/feedback/', { limit, offset }, { method })

/**
 * @desc 我发布的课程
 */
export const apiReportCourse = (limit, offset, method) => request('/list/course/mine', { limit, offset }, { method })

/**
 * @desc 我的课程
 * @param {string} teacher_id
 * @param {string} selector_id
 */
export const apiCourseList = (limit, offset, method) => request('/list/select/student/', { limit, offset }, { method })

/**
 * @desc 我的预约
 */
export const apiMyInvite = (limit, offset, method) => request('/list/select/teacher/', { limit, offset }, { method })

/**
 * @desc 我的课程取消
 */
export const apiCancelCourse = (course_id, order_id, method) => request('/cancle/course/order/', { course_id, order_id }, { method })

/**
 * @desc 我发布的课程删除
 * @param {string} couese_id 课程id
 */
export const apiDeleteCourse = (course_id, method) => request('/cancle/course/', { course_id }, { method })

/**
 * @desc 我的课程完成
 * @param {string} course_id 课程id
 */
export const apiCompleteCourse = (course_id, method) => request('/complete/course/', { course_id }, { method })

/**
 * @desc 创建课程评论
 * @param {string} order_id  列表id
 * @param {string} course_id  课程id
 * @param {string} selector_id 选中的id
 * @param {string} score  积分
 * @param {string} content 评价内容
 * @param {string } status 当前课程状态
 */
export const apiCreateCommit = (order_id, course_id, selector_id, teacher_id, score, content, status) => request('/create/course/feedback/', { order_id, course_id, selector_id, teacher_id, score, content, status })