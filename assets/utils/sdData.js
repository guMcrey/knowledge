import SD_DATA from 'sd-sdk'

export default {
  install(Vue) {
    Vue.SD_DATA = Vue.$SD_DATA = Vue.prototype.$SD_DATA = SD_DATA

    Vue.SD_DATA.init({
      biz: 'hz'
    })

    Vue.SD_DATA.autoTrack()

    Vue.sdTrackEvent = Vue.$sdTrackEvent = Vue.prototype.$sdTrackEvent = Object.assign({
      send(obj, callback) {
        Vue.SD_DATA.track(obj.op, obj, callback)
      }
    }, SD_DATA)

    this.initTrackDirective(Vue)
  },

  initTrackDirective(Vue) {
    Vue.directive('sd-track', {
      inserted: (el, binding) => {
        el.addEventListener('click', (e) => {
          let dataset = Object.assign({}, el.dataset)
          let data = {
            elementCode: binding.value,
            op: 'click'
          }

          dataset.extInfo = this.makeExtInfo(dataset)

          Object.assign(data, dataset)

          Vue.sdTrackEvent.send(data)
        })

        el.addEventListener('keyup', (e) => {
          let data = {
            elementCode: binding.value,
            extInfo: {
              input: el.value
            },
            op: 'input'
          }

          Object.assign(data, el.dataset)

          Vue.sdTrackEvent.send(data)
        })
      }
    })
  },

  // 处理extInfo
  makeExtInfo: (dataset) => {
    let extInfo = {}
    let extFlag = 'extInfo'

    for (let item in dataset) {
      if (item.indexOf(extFlag) > -1) {
        let key = item.replace(extFlag, '').toLowerCase()

        extInfo[key] = dataset[item]

        delete dataset[item]
      }

      if (item.indexOf('v-') > -1) {
        delete dataset[item]
      }
    }

    return JSON.stringify(extInfo)
  }
}
