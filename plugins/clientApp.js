import Vue from 'vue'
import sdData from '~/assets/utils/sdData'
import hash from '~/assets/utils/hash'
import urlParam from '~/assets/utils/urlParam'
import VueAwesomeSwiper from 'vue-awesome-swiper/dist/ssr'
import '~/assets/directive/lazyPic'

Vue.use(VueAwesomeSwiper)
Vue.use(sdData)

let uuid = window.localStorage.uuid
if (!uuid) {
  uuid = window.localStorage.uuid = hash()
}

Vue.sdTrackEvent.send({
  op: 'page_enter',
  selfTag: uuid,
  fromPath: document.referrer,
  toPath: window.location.href,
  channel: urlParam('channel')
})
