export default (len = 32) => {
  let $chars = ''
  let maxPos = $chars.length
  let pwd = ''

  for (let i = 0; i < len; i++) {
    pwd += $chars.charAt(Math.floor(Math.random() * maxPos))
  }

  return pwd
}
