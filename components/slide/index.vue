<template lang="html">
  <div v-swiper:mySwiper="swiperOption" style="overflow: hidden;">
    <div class="swiper-wrapper">
      <div class="swiper-slide" v-for="item in list">
        <div class="slider" @click="showDetail(item.infoId)">
          <h3 class="title" v-html="item.title"></h3>
          <ul class="img-list">
            <li v-for="(pic, index) in item.crowdfundingAttachmentList" v-if="index < 4">
              <a v-if="canBeClick" :href="`${caseUrl}${item.infoId}`">
                <img :src="pic.url" :alt="item.alt">
              </a>
              <img v-else :src="pic.url" :alt="item.alt">
            </li>
          </ul>
          <div class="info">
            <div class="left">
              <div class="head-img">
                <img :src="item.userHeadImgUrl" alt="">
              </div>
              <div class="name">
                <span>{{item.userNickName}}</span>
                <span></span>
              </div>
            </div>
            <div class="right" v-text="item.beginTime"></div>
          </div>
          <ul class="stat">
            <li>
              <h5></h5>
              <p><em v-text="item.targetAmount"></em><span> 元</span></p>
            </li>
            <li>
              <h5></h5>
              <p><em v-text="item.amount"></em><span> 元</span></p>
            </li>
            <li>
              <h5></h5>
              <p v-text="item.donationCount"></p>
            </li>
          </ul>
        </div>
      </div>
    </div>
    <div class="swiper-pagination swiper-pagination-bullets"></div>
  </div>
</template>

<script>
export default {
  data () {
    return {
      swiperOption: {
        autoplay: 5000,
        loop: true,
        pagination: '.swiper-pagination',
        slidesPerView: 1.2,
        spaceBetween: 10,
        centeredSlides: true,
        paginationClickable: true,
        onSlideChangeEnd: swiper => {
          // console.log('onSlideChangeEnd', swiper.realIndex)
        }
      },
      caseUrl: `${this.$domain}/casedetail/`
    }
  },
  props: ['list', 'canBeClick'],
  methods: {
    showDetail (infoUuid) {
      if (!this.canBeClick) {
        return
      }
      window.location.href = this.caseUrl + infoUuid
    }
  }
}
</script>

<style lang="css" src="./swiper.css" scoped></style>
<style media="screen" lang="less">
.slide-root {
  overflow: hidden;
}
.swiper-pagination-fraction,
.swiper-pagination-custom,
.swiper-container-horizontal > .swiper-pagination-bullets {
  display: block;
  text-align: center;
  margin-bottom: 10px;
}
.swiper-pagination-bullet {
  width: 8px;
  height: 8px;
  display: inline-block;
  border-radius: 100%;
  background: #fff;
  margin: 0 5px;
}
.swiper-pagination-clickable .swiper-pagination-bullet {
  cursor: pointer;
}
.swiper-pagination-white .swiper-pagination-bullet {
  background: #fff;
}
.swiper-pagination-bullet-active {
  opacity: 1;
  background: #ffba00;
}
</style>
<style media="screen" lang="less" scoped>
  .slider {
    background: #fff;
    padding: 6% 5%;
    box-sizing: border-box;
    margin: 10px 0 10px;
    .title {
      font-size: 15px;
      color: #333;
      line-height: 19px;
      font-weight: 400;
      overflow: hidden;
      height: 19*2px;
    }
    .img-list {
      display: flex;
      margin-top: 8px;
      li {
        flex:1;
        margin-right: 2%;
        background-repeat: no-repeat;
        background-position: center;
        background-size: cover;
        background-clip: border-box;
        height: 70px;
        &:last-child {
          margin-right: 0;
        }
        img {
          width: 100%;
          height: 70px;
          overflow: hidden;
        }
      }
    }
    .info {
      background: #f6f6f6;
      margin-top: 37/2px;
      height: 70/2px;
      display: flex;
      align-items: center;
      justify-content: space-between;
      padding: 0 3%;
      font-size: 12px;
      color: #999;
      .left {
        display: flex;
        align-items: center;
        .head-img {
          width: 24px;
          height: 24px;
          border-radius: 24px;
          overflow: hidden;
          margin-right: 5px;
          img {
            width: 24px;
            height: 24px;
            border-radius: 24px;
          }
        }
        .name {
          span {
            &:first-child {
              color: #333;
            }
          }
        }
      }
    }
    .stat {
      display: flex;
      margin-top: 7px;
      li {
        flex: 1;
        text-align: center;
        h5 {
          font-size: 12px;
          color: #333;
        }
        p {
          font-size: 14px;
          color: #ffba00;
          span {
            font-size: 11px;
            display: inline-block;
            vertical-align: middle;
            transform: translateY(-1px);
          }
        }
      }
    }
  }
</style>
