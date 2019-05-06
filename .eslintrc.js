module.exports = {
  root: true,
  parser: 'babel-eslint',
  env: {
    browser: true,
    node: true
  },
  extends: 'standard',
  // required to lint *.vue files
  plugins: [
    'html'
  ],
    // add your custom rules here
    'rules': {
      // allow paren-less arrow functions
      'arrow-parens': 0,
      // allow async-await
      'generator-star-spacing': 0,
      // allow debugger during development
      'no-debugger': process.env.NODE_ENV === 'production' ? 2 : 0,
      // 指定数组的元素之间要以空格隔开(,后面)， never参数：[ 之前和 ] 之后不能带空格，always参数：[ 之前和 ] 之后必须带空格
      'array-bracket-spacing': [2, 'never'],
      // 控制逗号前后的空格
      'comma-spacing': [2, {'before': false, 'after': true}],
      'indent': [2, 2, {'SwitchCase': 1}],
      //语句强制分号结尾
      //'semi': [2, 'always'],
      'no-unused-vars': 0,
      //禁止修改const声明的变量
      'no-const-assign': 2,
      //函数定义时括号前面要不要有空格
      'space-before-function-paren': [0, 'never'],
      // 禁止在非赋值或条件语句中使用 new 操作符
      'no-new': 0,
      // 禁止对 Function 对象使用 new 操作符
      'no-new-func': 0,
      // 禁止对 String，Number 和 Boolean 使用 new 操作符
      'no-new-wrappers': 0,
      //禁止在正则表达式中使用控制字符
      'no-control-regex': 0,
      //不能使用看起来像除法的正则表达式/=foo/
      'no-div-regex': 0,
      //正则表达式中的[]内容不能为空
      'no-empty-character-class': 0,
      //禁止无效的正则表达式
      'no-invalid-regexp': 0,
      //禁止在正则表达式字面量中使用多个空格 /foo bar/
      'no-regex-spaces': 0,
      'no-useless-escape': 0,
      'no-unneeded-ternary': 0,
      'eqeqeq': 0,
      // 要求或禁止使用分号而不是 ASI
      'semi': ['error', 'never'],
      // 禁止不必要的分号
      'no-extra-semi': 'error'
    },
  globals: {}
}
