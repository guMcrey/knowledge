<template>
<div class="two-root">
  <div class="plan-tab">
    <div class="tips">
      <h1 class="tips-title">功能特性</h1>
    </div>
    <div class="tab">
      <div class="item">
        <div @mouseenter="toogleCard(1)" @mouseleave="clearQr">
          <div class="item__pic plan"><img src="./img/1188579.png" alt=""></div>
        </div>
        <div class="item__title">
          题库资源
        </div>
        <p class="item__desc">适合学习使用的题目,合理<br>、多样的题目分类</p>
        <div class="item__arrow"></div>
      </div>

      <div class="item">
        <div @mouseenter="toogleCard(2)" @mouseleave="clearQr">
          <div class="item__pic"><img src="./img/1208112.png" alt=""></div>
        </div>
        <div class="item__title">
          模拟考试
       
        </div>
        <p class="item__desc">即使是正规的教学考试,也<br>能轻松应对,准备评判</p>
        <div class="item__arrow"></div>
      </div>

      <div class="item">
        <div @mouseenter="toogleCard(3)" @mouseleave="clearQr">
          <div class="item__pic"><img src="./img/1218636.png" alt=""></div>
        </div>
        <div class="item__title">
          社区
         
        </div>
        <p class="item__desc">在这里同学可以分享自己的<br>学习体会&nbsp;,解答疑惑</p>
        <div class="item__arrow"></div>
      </div>

      <div class="item">
        <div @mouseenter="toogleCard(3)" @mouseleave="clearQr">
         
          <div class="item__pic"><img src="./img/1176016.png" alt=""></div>
        </div>
        <div class="item__title">
          技术
          
        </div>
        <p class="item__desc">多样化判题技术,灵活选择<br>判题模式,准确的同时也能尽人情</p>
        <div class="item__arrow"></div>
      </div>
    </div>
  </div>
  <notice-list></notice-list>
</div>
</template>

<script>
import NoticeList from './noticeList'

export default {
  name: 'plans-intro',
  serverCacheKey() {
    return 1
  },
  data() {
    return {
      showQrIndex: 0,
      isShowQr: false
    }
  },
  components: {
    NoticeList
  },
  methods: {
    toogleCard(index) {
      this.showQrIndex = index
      this.isShowQr = true
    },
    clearQr() {
      this.isShowQr = false
    }
  }
}
</script>


<style lang="less" scoped>
@keyframes fade-in {
    0% {opacity: 0.2; background: #f1f1f1;}
    20% {opacity: 0.6; background: #f3f3f3;}
    40% {opacity: 0.7; background: #f5f5f5;}
    60% {opacity: 0.8; background: #f7f7f7;}
    80% {opacity: 0.9; background: #f9f9f9;}
    100% {opacity: 1; background: #f9f9f9;}
}
@-webkit-keyframes fade-in {
    0% {opacity: 0.2; background: #f1f1f1;}
    20% {opacity: 0.6; background: #f3f3f3;}
    40% {opacity: 0.7; background: #f5f5f5;}
    60% {opacity: 0.8; background: #f7f7f7;}
    80% {opacity: 0.9; background: #f9f9f9;}
    100% {opacity: 1; background: #f9f9f9;}
}

.two-root {
  width: 1000px;
  margin: auto;
  padding-bottom: 100px;
}
.plan-tab {
  width: 1000px;
  .tips {
    padding-top: 50px;
    display: flex;
    align-items: center;
    justify-content: center;

    &-title {
      font-size:22px;
      color:#333333;
      letter-spacing:0;
    }

    &-group-enter {
      width: 120px;
      height: 36px;
      background: #126EF8;
      border-radius: 40px 0 40px 40px;
      text-align: center;
      line-height: 36px;
      cursor: pointer;

      &-title {
        font-family: PingFangSC-Medium;
        font-size: 12px;
        color: #fff;
      }
    }
  }

  .sub-title {
    font-size:14px;
    color:#848484;
    font-weight: 400;
  }

  .tab {
    width: 60%;
    margin: 0 auto;
    display: flex;
    align-items: center;
    justify-content: center;
    text-align: center;
    padding-top: 40px;
    border-bottom: 1px solid #e5e5e5;
    &::after {
      content: '';
      display: block;
      clear: both;
      zoom: 1;
    }
    .item {
      width:290px;
      // float: left;
      // margin-right: 55px;
      text-align: center;
      display: flex;
      justify-content: center;
      flex-direction: column;
      align-items: center;
      // margin: 0 auto;
      &:last-child {
        margin-right: 0;
      }
      &__pic, .qr {
        // background:#d8d8d8;
        border-radius:20px;
        // width:376px;
        // height:255px;
        overflow: hidden;
        // &:hover {
        //   animation: fade-in;
        //   animation-duration: .8s;
        //   -webkit-animation: fade-in .8s;
        //   background: #f9f9f9;
        //   box-shadow: 0px 6px 20px rgba(0, 0, 0, 0.1);
        // }
        img {
          // position: relative;
          // transform: translate(100%, 0%);
          width: 100px;
        }
      }
      .qr {
        img {
          display: block;
          width: 140px;
          height: 140px;
          margin: 57px auto;
        }
      }
      &__title {
        margin-top: 25px;
        font-size:16px;
        color:#333333;
        display: flex;
        align-items: center;
      }
      &__label {
        border:1px solid #e5e5e5;
        border-radius:100px;
        width:128px;
        font-size:12px;
        color:#848484;
        height:28px;
        text-align: center;
        line-height: 28px;
        margin-left: 20px;
      }
      &__desc {
        width: 374px;
        font-size:14px;
        color:#848484;
        margin-top: 13px;
      }
      &__arrow {
        margin: 40px auto 0;
        // width: 10px;
        // height: 10px;
        // border-top: 1px solid #e5e5e5;
        // border-right: 1px solid #e5e5e5;
        // background: #fff;
        // transform: rotate(-45deg) translateY(8px);
      }
      &__title {
        display: flex;
        justify-content: center;
        font-size: 16px;
        font-weight: bold;
      }
    }
  }
}
</style>
