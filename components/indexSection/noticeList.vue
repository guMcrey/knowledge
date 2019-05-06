<template>
  <div class="notice">
    <div class="btn-box">
      <div class="btn notice__btn-prev"></div>
    </div>

    <div class="list" v-swiper:noticeSwiper="swiperOption">
      <ul class="swiper-wrapper">
        <li class="swiper-slide item" v-for="n in noticeList" :key="n.id">
          <div class="avatar"><img :src="n.avatar" alt=""></div>
          <div class="info">
            <div class="title">
              <div class="title__name">{{n.name}}</div>
              <div class="title__plan">{{n.planName}}</div>
            </div>
            <div class="tips">
              <div class="tips__pay">共计刷题{{n.coast}}套</div>
              <div class="tips__obtain">共为他人解答问题{{n.moneyCount}}次</div>
            </div>
            <div class="desc">{{n.message}}</div>
          </div>
          <!-- <div class="message" @click="toogleMessagePic(n.messagePic)" v-if="n.messagePic.length > 0"><img :src="n.messagePic[0]" alt=""></div> -->
        </li>
      </ul>
    </div>

    <div class="btn-box">
      <div class="btn notice__btn-next have-more"></div>
    </div>

    <pic-preview :toogleMessagePic="toogleMessagePic" v-if="isShowPreview" :pic-data="picData"></pic-preview>
  </div>
</template>

<script>
import noticeList from './notice'
import PicPreview from './picPreview'

export default {
  name: 'notice-list',
  serverCacheKey() {
    return 1
  },
  data () {
    return {
      noticeList: noticeList,
      picData: [],
      isShowPreview: false,
      swiperOption: {
        loop: true,
        lazy: true,
        navigation: {
          prevEl: '.notice__btn-prev',
          nextEl: '.notice__btn-next'
        }
      }
    }
  },

  methods: {
    toogleMessagePic (picList) {
      this.isShowPreview = (Array.isArray(picList) ? true : false)
      window.document.body.style.overflow = (Array.isArray(picList) ? 'hidden' : 'auto')
      this.picData = picList || []
    }
  },

  components: {
    PicPreview
  }
}
</script>


<style lang="less" scoped>
.notice {
  padding-top: 57px;
  display: flex;
  align-items: center;
  justify-content: space-between;
  .list {
    overflow: hidden;
    width: 750px;
  }
  .btn-box {
    display: flex;
    align-items: center;
    justify-content: center;
    outline: none;
  }
  .btn {
    outline: none;
    width: 100px;
    height: 100px;
    border-radius: 100px;
    border:1px solid #e5e5e5;
    background: #fff;
    display: flex;
    align-items: center;
    justify-content: center;
    transition: all .8s ease;
    &:after {
      content: '';
      display: block;
      width: 17px;
      height: 17px;
      border-top: 4px #848484 solid;
      border-right: 4px #848484 solid;
    }
    cursor: pointer;
  }
  .notice__btn-prev {
    &:after {
      transform: rotate(-135deg);
    }
    &:hover {
      .have-more-hover()
    }
  }
  .notice__btn-next {
    &:after {
      transform: rotate(45deg);
    }
    &:hover {
      .have-more-hover()
    }
  }
  .have-more-hover() {
    border: none;
    background:rgba(18,110,248,0.90);
    box-shadow: 0 20px 30px rgba(18,110,248,0.20);
    &:after {
      content: '';
      display: block;
      width: 17px;
      height: 17px;
      border-top: 4px #fff solid;
      border-right: 4px #fff solid;
    }
  }
}

.swiper-wrapper > .item {
  display: flex;
  align-items: center;
  justify-content: center;
  transform: translate(20%,5%);
  padding: 30px;
  // width: 650px;
  // margin: auto;
  .avatar {
    width: 70px;
    height: 70px;
    overflow: hidden;
    border-radius: 70px;
    background: #e5e5e5;
    margin-right: 17px;
    align-self: flex-start;
    img {
      width: 40px;
      height: 40px;
    }
  }
  .message {
    cursor: pointer;
    width: 110px;
    padding: 5px;
    box-shadow: 0 5px 15px rgba(0, 0, 0, 0.3);
    margin-left: 10px;
    img {
      width: 100%;
      display: block;
    }
  }
  .info {
    flex: 1;
  }
}

.info {
  .title {
    display: flex;
    align-items: center;
    margin-bottom: 8px;
    &__name {
      font-size:18px;
      color:#333333;
      margin-right: 5px;
    }
    &__plan {
      font-size:15px;
      color:#848484;
    }
  }

  .tips {
    background:rgba(18,110,248,0.90);
    border-radius:100px;
    width:350px;
    height:40px;
    display: flex;
    align-items: center;
    justify-content: center;
    font-size:15px;
    color:#ffffff;
    &__pay {
      flex: 1;
      background:rgba(194,218,255,0.90);
      height: 100%;
      line-height: 40px;
      text-align: center;
      border-radius:100px 0 0 100px;
    }
    &__obtain {
      flex: 1;
      text-align: center;
    }
  }

  .desc {
    font-size:16px;
    color:#848484;
    margin: 20px 0 10px;
    line-height: 1.4;
  }

  .notice-info {
    .info-element {
      display: inline-block;
      border-right: 1px #848484 solid;
      height: 14px;
      line-height: 14px;
      padding: 0 15px;
      &:first-child {
        padding-left: 0;
      }
      &:last-child {
        border: none;
      }
      &__data {
        font-size:16px;
        color:#333333;
        font-weight: 800;
      }
      &__title {
        font-size:14px;
        color:#848484;
      }
    }
  }
}
</style>

