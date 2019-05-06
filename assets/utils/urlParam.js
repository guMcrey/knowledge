function urlParam(name, url) {
  let results = new RegExp('[\\?&]' + name + '=([^&#]*)').exec(url)

  if (!results) {
    return ''
  }

  return results[1] || ''
}

module.exports = urlParam
