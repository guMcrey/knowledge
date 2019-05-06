import Axios from 'axios'
import qs from 'qs'

Axios.defaults.baseURL = 'http://localhost:8000'
// TODO 设置POST等请求 body 序列化
Axios.defaults.transformRequest = [function (body) {
  return qs.stringify(body)
}]

export const getStatCount = () => {
  return Axios.post('/api/hz/order/v3/allocationSummary')
}

// export const getUserInfo = () => {
//   return Axios.get('http://localhost:8000/user/detail/')
// }
// 用户登录
export const login = (body) => {
  return Axios.post('/login/', body)
}
// 用户注册
export const signup = (body) => {
  return Axios.post('/signup/', body)
}

// 题库中心--获取选择题列表--有问题
export const getSelectInfo = (body) => {
  return Axios.get('/list/select/questions/?type=0', body)
}

// 个人详情页--用户普通问题操作记录列表 -- 通了但是缺少数据
export const normalQuestionList = () => {
  return Axios.get('/list/normal/operations/')
}

// 个人详情页--获取选择题选择记录列表 
export const selectQustionList = () => {
  return Axios.get('/list/select/operations/')
}

// 讨论区--创建用户评论
export const discussComment = (body) => {
  return Axios.post('/create/select/comment/', body)
}


// ###################### 寻师 有问题 ########################

// 邀约列表--有问题
export const getInviteList = (body) => {
  return Axios.get('/list/select/teacher?type=0', body)
}

// 创建预约--有问题
export const createInvite = (body) => {
  return Axios.post('/create/select/teacher/', body)
}


// #######################$ 讨论区 #############################

// 创建讨论区问题
export const cerateDiscuss = (body) => {
  return Axios.post('/create/normal/question/', body)
}