export default {
  data () {
    return {
      viewWidth: 0,
      viewHeight: 0
    }
  },
  mounted () {
    const { document } = window
    this.viewWidth = document.body.clientWidth
    this.viewHeight = this.getClientHeight()
  },
  methods: {
    getClientHeight () {
      let ch = 0
      if (document.body.clientHeight && document.documentElement.clientHeight) {
        ch = (document.body.clientHeight < document.documentElement.clientHeight) ? document.body.clientHeight : document.documentElement.clientHeight
      } else {
        ch = (document.body.clientHeight > document.documentElement.clientHeight) ? document.body.clientHeight : document.documentElement.clientHeight
      }

      return ch
    }
  }
}
