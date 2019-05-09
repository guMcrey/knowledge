import * as types from './mutation-types'

const ADD_ITEMNUM = 'ADD_ITEMNUM'
const REMBER_ANSWER = 'REMBER_ANSWER'
// const REMBER_TIME = 'REMBER_TIME' 
const INITIALIZE_DATA = 'INITIALIZE_DATA'
const SET_USER = 'SET_USER'

export default {
	// 校验登录状态
	[types.CHECKOUT_LOGIN_STATUS](state) {
		state.isLogined = !!window.localStorage.ACCESS_TOKEN
	},
	[types.SET_TOKEN](state, token) {
		state.token = token
		sessionStorage.token = token
	},
	// 设置用户信息
	[SET_USER](state, num) {

	},
	// 用户退出
	// [types.USER_LOGOUT](state) {
	// 	// 清除用户的ACCESS_TOKEN
	// 	window.localStorage.removeItem('ACCESS_TOKEN')
	// },
	//点击进入下一题
	[ADD_ITEMNUM](state, num) {
		state.itemNum += num;
	},
	//记录答案
	[REMBER_ANSWER](state, id) {
		state.answerid.push(id);
	},
	/*
	记录做题时间
	 */
	// [REMBER_TIME](state) {
	// 	state.timer = setInterval(() => {
	// 		state.allTime++;
	// 	}, 1000)
	// },
	/*
	初始化信息，
	 */
	[INITIALIZE_DATA](state) {
		state.itemNum = 1;
		state.allTime = 0;
		state.answerid = [];
	},
}