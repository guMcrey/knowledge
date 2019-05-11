<template>
  <div class="root">
    <sd-header :activeTab="2"></sd-header>
    <div class="wrap">
      <div class="your_scores_container">
        <header class="your_scores">
          <span class="score_num">{{this.$route.query.totalScore}}</span>
          <span class="fenshu">分！</span>
        </header>
        <div class="result_tip">{{scoreTips}}</div>
      </div>
      <div class="share_button" @click="showCover"></div>
    </div>

    <page-footer class="heigh"></page-footer>
  </div>
</template>

<script>
import PageFooter from "~/components/pageFooter";
import SdHeader from "~/components/navBar";
import { mapState } from "vuex";
export default {
  name: "score",
  data() {
    return {
      showHide: false, //是否显示提示
      score: 0, //分数
      scoreTips: "", //分数提示
      rightAnswer: [2, 7, 12, 13, 18], //正确答案
      scoreTipsArr: [
        "你说，是不是把知识都还给小学老师了？",
        "还不错，但还需要继续加油哦！",
        "不要嘚瑟还有进步的空间！",
        "智商离爆表只差一步了！",
        "你也太聪明啦，知学平台欢迎你！"
      ]
    };
  },
  computed: mapState(["answerid"]),
  created() {
    this.computedScore();
    this.getScoreTip();
    // document.body.style.backgroundImage = 'url(./static/img/4-1.jpg)';
  },
  methods: {
    //计算分数
    computedScore() {
      this.answerid.forEach((item, index) => {
        if (item == this.rightAnswer[index]) {
          this.score += 20;
        }
      });
    },
    //是否显示分享提示
    showCover: function() {
      window.location.href = `/questoins`;
    },
    //根据分数显示提示
    getScoreTip: function() {
      if (this.score <= 20) {
        this.scoreTips = this.scoreTipsArr[0];
        return;
      }
      if (this.score <= 40) {
        this.scoreTips = this.scoreTipsArr[1];
        return;
      }
      if (this.score <= 60) {
        this.scoreTips = this.scoreTipsArr[2];
        return;
      }
      if (this.score <= 80) {
        this.scoreTips = this.scoreTipsArr[3];
        return;
      }
      if (this.score <= 100) {
        this.scoreTips = this.scoreTipsArr[4];
      }
    }
  },
  components: {
    SdHeader,
    PageFooter
  }
};
</script>

<style lang="less">
.root {
  background: #f5f5f5;
}
.wrap {
  box-shadow: 0 2px 10px #d9d9d9, inset 0 10px 1px #f1f1f1;
  display: flex;
  justify-content: space-around;
  flex-direction: column;
  max-width: 1180px;
  margin: 0px auto;
  background: #fff;
  padding: 190px;
}
.your_scores_container {
  width: 19.7rem;
  height: 19.1rem;
  background: url(../images/4-2.png) no-repeat;
  background-size: 100% 100%;
  margin: 0 auto 0;
  position: relative;
  .your_scores {
    position: absolute;
    width: 100%;
    text-indent: 7.3rem;
    top: 10.7rem;
    font-size: 2.5rem;
    font-weight: 1000;
    -webkit-text-stroke: 0.05rem #412318;
    font-family: "Microsoft YaHei";
    .score_num {
      font-family: Tahoma, Helvetica, Arial;
      color: #a51d31;
    }
    .fenshu {
      color: #a51d31;
    }
  }
  .result_tip {
    position: absolute;
    top: 15rem;
    width: 19rem;
    left: 1.6rem;
    color: #3e2415;
    font-size: 1.12rem;
    text-align: center;
    line-height: 20px;
  }
}
.share_button {
  width: 150px;
  height: 60px;
  margin: 1.7rem auto 0;
  background: url(../images/4-3.png) no-repeat 0.4rem 0;
  background-size: 100% 100%;
}
.share_code {
  width: 5.3rem;
  margin: 1.5rem auto 0;
  .share_header {
    color: #664718;
    font-size: 0.475rem;
    font-family: "Microsoft YaHei";
    width: 7rem;
    font-weight: 500;
  }
  .code_img {
    height: 5.3rem;
    width: 5.3rem;
    margin-top: 0.5rem;
  }
}
.share_cover {
  position: fixed;
  bottom: 0;
  right: 0;
  top: 0;
  left: 0;
  background: url(../images/5-1.png) no-repeat;
  background-size: 100% 100%;
  opacity: 0.92;
}
.share_img {
  height: 10.975rem;
  width: 11.95rem;
  position: fixed;
  top: 0.5rem;
  left: 50%;
  margin-left: -5.975rem;
}
</style>
