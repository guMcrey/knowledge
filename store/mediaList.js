import * as api from '~/assets/api'
import formatDate from '~/assets/utils/formatDate'

const state = function () {
  return {
    mediaList: {},
    currentPage: 1
  }
}

const actions = {
  FETCH_MEDIALIST: ({ commit, state, dispatch }, payload) => {
    return api.fetchMediaList({
      pagination: JSON.stringify({ current: payload.currentPage, pageSize: 10 }),
      token: '1ddccd17-cf30-4ae0-8455-56be282d7be3',
      type: 0
    }).then(res => {
      commit('SET_PAGE', {
        currentPage: payload.currentPage
      })
      commit('SET_MEDIALIST', {
        mediaList: res.data.data.data
      })
    })
  }
}

const mutations = {
  SET_MEDIALIST: (state, { mediaList }) => {
    mediaList.map((value, index, array) => {
      value.reportDate = formatDate.unixToTime(value.reportDate)
      return array[index]
    })
    state.mediaList = mediaList
  },
  SET_PAGE: (state, { currentPage }) => {
    state.currentPage = currentPage
  }
}

const getters = {
  activeMediaList (state, getters) {
    return state.mediaList
  },
  currentPage (state, getters) {
    return state.currentPage
  },
  nextPage (state) {
    return parseInt(state.currentPage, 10) + 1
  },
  prevPage (state) {
    return parseInt(state.currentPage, 10) - 1
  }
}

export default {
  state,
  mutations,
  actions,
  getters
}
