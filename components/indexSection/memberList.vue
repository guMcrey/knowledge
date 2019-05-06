<template>
<div class="slide-root swiper-container" v-swiper:memberSwiper="swiperOption">
  <div class="swiper-wrapper">
    <div class="swiper-slide item comments" v-for="item in memberList" :key="item.id">
      <div class="item__avatar">
        <img :src="item.avatar" alt="">
      </div>
      <div class="item__comment">
        <div class="item__name">{{item.nickname}} <div class="item__joinday">加入知学平台1天</div></div>
        <p class="speak">{{item.message.slice(0, 38) + '...'}}</p>
      </div>
    </div>
  </div>
</div>
</template>

<script>
import memberList from './member'
export default {
  name: 'member-list',
  serverCacheKey() {
    return 1
  },

  data () {
    return {
      memberList: Object.freeze(memberList),
      swiperOption: {
        direction: 'vertical',
        autoplay: true,
        loop: true,
        width: 400,
        height: 83,
        delay: 6000
      }
    }
  }
}
</script>

<style lang="less" scoped>
.slide-root {
  width: 400px;
  height: 83px;
  overflow: hidden;
}
.item {
  &__avatar {
    display: inline-block;
    vertical-align: top;
    background:#d8d8d8;
    width:40px;
    height:40px;
    overflow: hidden;
    border-radius: 40px 0 40px 40px;
    margin-right: 10px;
    img {
      width:40px;
      height:40px;
    }
  }
  &__comment {
    display: inline-block;
    .speak {
      width: 290px;
      margin-top: 5px;
      font-size:14px;
      color:#333333;
    }
  }
  &__name {
    font-size:14px;
    color:#333333;
    margin-right: 5px;
    text-align: left;
  }
  &__joinday {
    display: inline-block;
    border:1px solid #e5e5e5;
    border-radius:34px;
    width:98px;
    height:34px;
    text-align: center;
    font-size:12px;
    color:#848484;
    line-height: 34px;
  }
}
</style>
