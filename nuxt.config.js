var LRU = require('lru-cache')
const env = require('./servers/env')

module.exports = {
  env: {
    baseUrl: env[process.env.MODE].ENV_API,
    mode: process.env.MODE
  },
  /*
  ** Headers of the page
  */

  head: {
    title: '知学平台',
    meta: [
      { charset: 'utf-8' },
      { name: 'viewport', content: 'width=device-width, initial-scale=1, user-scalable=0' },
      {
        name: 'description',
        content: '知学平台是一个专为好学人士提供在线学习、模拟练习的免费学习平台。'
      },
      {
        name: 'keywords',
        content: '知学平台,在线模拟,产学研'
      },
      {
        httpEquiv: "Access-Control-Allow-Origin",
        content: "*"
      }
    ],
    link: [
      { rel: 'icon', type: 'image/x-icon', href: './static/favicon.ico' }
    ]
  },
  css: [
    '~static/style/reset.css',
    '~static/style/swiper.css',
    '~static/style/common.css',
    'element-ui/lib/theme-chalk/index.css'
  ],
  /*
  ** Customize the progress-bar color
  */
  loading: { color: '#3B8070' },
  /*
  ** Build configuration
  */
  plugins: [
    {
      src: '~/plugins/clientApp.js',
      src: '~/plugins/ElementUI',
      ssr: false
    },
    '~/plugins/app.js'
  ],
  render: {
    bundleRenderer: {
      cache: LRU({
        max: 1000,
        maxAge: 1000 * 60 * 15
      })
    }
  },
  build: {
    vendor: ['element-ui']   //防止element-ui被打包多次
    // publicPath: '//s2.shuidihuzhu.com/website/',
    /*
    ** Run ESLINT on save
    */
    // extend(config, { isDev, isClient }) {
    //   if (isDev && isClient) {
    //     // config.module.rules.push({
    //     //   enforce: 'pre',
    //     //   test: /\.(js|vue)$/,
    //     //   loader: 'eslint-loader',
    //     //   exclude: /(node_modules)/
    //     // })
    //   }
    // }
  },
  // modules: [
  //   '@nuxtjs/axios',
  //   '@nuxtjs/proxy'
  // ],
  // proxy: [
  //   [
  //     '/api',
  //     {
  //       target: 'http://localhost:8000', // api主机
  //       pathRewrite: { '^/api': '/' }
  //     }
  //   ]
  // ]
}


var funcs = []
for (var i = 0; i < 10; i++) {
  funcs.push(function () {
    console.log(i)
  })
}
funcs.forEach(function (func) {
  func();
})

// 闭包
setTimeout(function () {
  console.log(i)
}, 0);
new Promise(function executor(resolve) {
  console.log(2);
  for (var i = 0; i < 1000; i++) {
    i = 9999 && resolve();
  }
  console.log(3);
}).then(function () {
  console.log(4);
});
console.log(5)