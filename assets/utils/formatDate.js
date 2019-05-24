export default {
  buildDate(str) {
    if (typeof str == 'number') {
      return new Date(str)
    } else if (str instanceof Date) {
      return str
    }
    if (!str) {
      return null
    }
    if (str.indexOf('+') >= 0) {
      str = str.replace('+0800 ', '')
    }
    str = str.replace(/-/g, '/')
    return new Date(str)
  },
  /**
   * yyyy-MM-dd HH:mm
   * @param {Date| number | str} dataStr
   * @param {Object} pattern
  */
  format(dataStr, pattern) {
    let date = this.buildDate(dataStr)
    let hour = date.getHours()
    let o = {
      'M+': date.getMonth() + 1,
      'd+': date.getDate(),
      'H+': hour,
      'h+': (hour > 12 ? hour - 12 : hour),
      'm+': date.getMinutes(),
      's+': date.getSeconds(),
      'q+': Math.floor((date.getMonth() + 3) / 3),
      'S': date.getMilliseconds()
    }
    if (/(y+)/.test(pattern)) {
      pattern = pattern.replace(RegExp.$1, (date.getFullYear() + '').substr(4 - RegExp.$1.length))
    }

    for (let k in o) {
      if (new RegExp('(' + k + ')').test(pattern)) {
        pattern = pattern.replace(RegExp.$1, RegExp.$1.length == 1 ? o[k] : ('00' + o[k]).substr(('' + o[k]).length))
      }
    }

    return pattern
  },

  getChineseDate(tar, res) {
    if (!res) {
      res = new Date()
    }
    if (typeof tar == 'string') {
      tar = this.buildDate(tar)
    }
    if (!tar || !tar.getTime()) {
      return ''
    }
    let resTime = res.getTime()
    let tarTime = tar.getTime()
    let between = (resTime - tarTime) / 1000
    return this.between(between) + '前'
  },

  between(bet) {
    bet = Math.abs(parseInt(bet))
    bet = bet == 0 ? 1 : bet
    if (bet < 60) {
      return bet + '秒'
    }
    if (bet < 3600) {
      return parseInt(bet / 60) + '分钟'
    }
    if (bet < 3600 * 24) {
      return parseInt(bet / 3600) + '小时'
    }
    if (bet < 3600 * 24 * 30) {
      return parseInt(bet / (3600 * 24)) + '天'
    }
    if (bet < 3600 * 24 * 30 * 12) {
      return parseInt(bet / (3600 * 24 * 30)) + '月'
    }
    return parseInt(bet / (3600 * 24 * 30 * 12)) + '年'
  },
  /**
   * 剩余多少时间
   * 1天20小时15分20秒
   * @param {Object} second
  */
  liveTime(second) {
    if (second < 60) {
      return second + '分'
    } else {
      return Math.floor(second / 60) + '小时' + (second % 60) + '分'
    }
  },
  /**
  时间差
  */
  differenceTime(second, str, flag) {
    let m = parseInt(second / 60)
    let h = parseInt(m / 60)
    let s = second % 60
    m = m < 10 ? '0' + m : m
    s = s < 10 ? '0' + s : s
    if (!/h+/.test(str)) {
      let o = {
        'm+': m,
        's+': s
      }
      for (let k in o) {
        if (new RegExp('(' + k + ')').test(str)) {
          str = str.replace(RegExp.$1, o[k])
        }
      }
    } else {
      h = h < 10 ? '0' + h : h
      m = m % 60
      m = m < 10 ? '0' + m : m
      let o = {
        'h+': h,
        'm+': m,
        's+': s
      }
      for (let k in o) {
        if (new RegExp('(' + k + ')').test(str)) {
          str = str.replace(RegExp.$1, o[k])
        }
      }
    }
    if (h == 0 && flag == true) {
      return str.substr(3, 7)
    }
    return str
  },

  // 根据时间戳返回对应日期
  unixToTime(time) {
    // time = parseInt(time)

    let date = new Date(time)
    let year = date.getFullYear()
    let month = date.getMonth() + 1 < 10 ? '0' + (date.getMonth() + 1) : date.getMonth() + 1
    let day = date.getDate() < 10 ? '0' + date.getDate() : date.getDate()

    return year + '-' + month + '-' + day
  }
}
