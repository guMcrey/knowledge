import formatDate from '~/assets/utils/formatDate'

const state = function () {
  return {
    caseList: {},
    dreamList: {},
    successCaseList: {}
  }
}

const actions = {
  FETCH_CASELIST: ({ commit, state }, payload) => {
    commit('SET_IS_MOBILE', { isMobile: payload.isMobile })
    return api.fetchNewCaseList({
      size: 30,
      type: payload.type
    }).then(res => {
      commit('SET_CASELIST', {
        caseList: res.data
      })
    })
  },
  FETCH_SUCCESSCASELIST: ({ commit, state }, payload) => {
    commit('SET_IS_MOBILE', { isMobile: payload.isMobile })
    return api.getSuccessCase({
      size: 30
    }).then(res => {
      commit('SET_CASELIST', {
        caseList: res.data
      })
    })
  }
}

const mutations = {
  SET_CASELIST: (state, { caseList }) => {
    state.caseList = caseList.data
  }
}

// const getters = {
//   activeCaseList(state, getters) {
//     return state.caseList.map((value, index, array) => {
//       value.beginTime = formatDate.format(value.beginTime, 'yyyy-MM-dd')
//       value.alt = value.title + '_证明材料'
//       value.content = value.content.replace(/\<br.*?\/\>/g, '\n')
//         .replace(/\</g, '&lt;').replace(/\>/g, '&gt;')
//         .split('\n').join('</br>')
//         .replace(/#{(.*?)\|\|(.*?)}/g, '<a href="$1">$2</a>')
//         .replace(/&lt;/g, '<')
//         .replace(/&gt;/g, '>')
//         .replace(/\<.\s\/\>/g, '')
//       return array[index]
//     })
//   }
// }

export default {
  state,
  mutations,
  actions,
  getters
}
