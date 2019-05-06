import Vue from 'vue'
import formatDate from '../utils/formatDate'
Vue.directive('time', (el, binding) => {
  el.innerText = formatDate.format(binding.value, 'yyyy-MM-dd')
})
