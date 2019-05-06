import Vue from 'vue'
Vue.directive('lazy-pic', (el, binding) => {
  const url = binding.value
  setTimeout(() => {
    el.src = url
  }, 2000)
})
