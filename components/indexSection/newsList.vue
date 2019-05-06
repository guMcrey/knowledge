<template>
  <div class="four-root">
    <h2 class="title">
      新闻动态
      <div class="link-box">
        <a href class="check-more">查看更多</a>
      </div>
    </h2>

    <div class="slide">
      <div class="card" :style="{width: `${200 * 10 + blankWidth}px`}">
        <a
          :href="`/aboutUs/media/${item.id}`"
          :key="item.id"
          class="item"
          v-for="(item, index) in newsList"
          @mouseenter="hoverItem(index)"
        >
          <div class="item__title-pic">
            <img :src="item.imgUrl || imgUrl[index]" alt>
          </div>
          <h3 class="item__title">{{item.title}}</h3>
          <p class="item__desc">
            {{item.reportWebName}} /
            <span v-time="item.reportDate"></span>
          </p>
        </a>
      </div>
    </div>
  </div>
</template>


<script>
import * as api from "~/assets/api";
export default {
  data() {
    return {
      blankWidth: 0,
      newsList: [],
      cardDom: "",
      imgUrl: []
    };
  },
  mounted() {
    this.blankWidth = this.getBlankWidth();
    this.cardDom = this.$el.querySelector(".card");
    this.getNews();
  },
  methods: {
    hoverItem(index) {
      let transDistance; // 滑动距离
      switch (index) {
        case 0:
          transDistance = 0;
          break;
        case 1:
          transDistance = 150;
          break;
        case 2:
          transDistance = 350;
          break;
        case 3:
          transDistance = 550;
          break;
        case 4:
          transDistance = 770;
          break;
      }
      this.cardDom.style.transform = "translateX(-" + transDistance + "px)";
    },
    getBlankWidth() {
      return (document.body.clientWidth - 1200) / 2;
    },
    getNews() {
      api
        .fetchMediaArea({
          pagination: JSON.stringify({ current: 1, pageSize: 10 }),
          token: "1ddccd17-cf30-4ae0-8455-56be282d7be3",
          type: 0
        })
        .then(res => {
          let list = res.data.data.data;
          this.newsList = list.slice(0, 5);
        });
    }
  }
};
</script>

<style lang="less" scoped>
.four-root {
  padding-bottom: 100px;
  width: 1200px;
  margin: auto;
  .title {
    font-size: 18px;
    color: #333333;
    padding: 70px 0;
  }
}

.slide {
  width: 1200px;
  margin: auto;
  overflow: hidden;
  // &::-webkit-scrollbar{
  //   display: none;
  // }
}
.card {
  transition: transform 0.8s linear;
  overflow: hidden;
  &:after {
    content: "";
    clear: both;
  }
  .item {
    float: left;
    width: 375px;
    margin-right: 20px;
    display: block;

    &__title-pic {
      position: relative;
      cursor: pointer;
      width: 375px;
      height: 255px;
      // background: url(./img/new-content.png) 0 0 no-repeat;
      // background-size: 100%;
      border-radius: 20px;
      box-sizing: border-box;
      padding: 63px 42px;
      transition: all 0.8s ease;
      img {
        display: block;
        width: 375px;
        height: 255px;
        position: absolute;
        top: 0;
        left: 0;
        border-radius: 18px;
      }
      &:hover {
        box-shadow: 0px 10px 30px rgba(0, 0, 0, 0.2);
      }
      .icon-pic {
        font-size: 64px;
        line-height: 1;
        height: 40px;
        color: #dadada;
        font-family: "Lucida Sans", "Lucida Sans Regular", "Lucida Grande",
          "Lucida Sans Unicode", Geneva, Verdana, sans-serif;
      }
    }
    &__title {
      font-size: 16px;
      color: #333333;
      margin-top: 20px;
    }
    &__desc {
      margin-top: 12px;
      font-size: 14px;
      color: #848484;
    }
  }
}

.link-box {
  float: right;
}
.check-more {
  display: block;
  background: rgba(18, 110, 248, 0.9);
  border-radius: 100px 0 100px 100px;
  width: 95px;
  height: 36px;
  font-size: 12px;
  color: #ffffff;
  text-align: center;
  line-height: 36px;
  transition: all 0.8s ease;
  &:hover {
    box-shadow: 0px 5px 10px rgba(0, 0, 0, 0.3);
  }
}
</style>
