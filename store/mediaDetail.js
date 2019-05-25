import Vue from 'vue'

const state = function () {
  return {
    mediaDetail: {},
    detailId: 1,
    pageFlag: ''
  }
}

const actions = {
  FETCH_MEDIADETAIL: ({commit, state, dispatch}, payload) => {
    let pageAjaxurl = api.fetchMediaDetail
    if (payload.pageFlag == 'prev') {
      pageAjaxurl = api.getPrev
    } else if (payload.pageFlag == 'next') {
      pageAjaxurl = api.getNext
    }
    return pageAjaxurl({
      token: '1ddccd17-cf30-4ae0-8455-56be282d7be3',
      id: payload.detailId
    }).then(res => {
      commit('SET_DETAIL_ID', {
        detailId: payload.detailId
      })
      commit('SET_MEDIADETAIL', {
        mediaDetail: res.data
      })
      commit('SET_META_DATA', {
        title: res.data.data.title
      })
    })
  }
}

const mutations = {
  SET_MEDIADETAIL: (state, { mediaDetail }) => {
    state.mediaDetail = mediaDetail.data
  },
  SET_DETAIL_ID: (state, { detailId }) => {
    state.detailId = detailId
  }
}

const getters = {
  activeMediaDetail (state, getters) {
    return state.mediaDetail
  },
  detailId (state, getters) {
    return state.detailId
  }
}

export default {
  state,
  mutations,
  actions,
  getters
}
