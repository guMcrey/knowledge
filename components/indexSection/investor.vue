<template>
<div>
<section class="investor-root">
    <h2 class="title">题库来源渠道</h2>

    <div class="investor-list">
    </div>
  </section>
  <section class="investor-root">
    <h2 class="title">加入我们</h2>

    <div class="investor-list">
      <img class="join" src="./img/header.png" alt="">
    </div>
  </section>
</div>
</template>
<script>
export default {
  name: 'investor',
  serverCacheKey() {
    return 1
  }
}
</script>

<style lang="less" scoped>
.title {
  text-align: center;
  font-size:18px;
  color:#333333;
  padding: 20px 0 0;
  width: 1200px;
  margin: auto;
}
.investor-list {
  width: 1200px;
  margin: auto;
  padding-bottom: 50px;
  img {
    width: 100%;
  }
  .join {
    margin-top: 40px;
  }
}
</style>

