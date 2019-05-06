<template>
  <div>
    <div class="home-header other">
      <div class="nav clearfix">
        <h1 class="fl">
          <a class="home-logo" href="/"></a>
        </h1>
        <ul class="fr">
          <li>
            <a href="/">首页</a>
          </li>
          <li>
            <a class="selected" id="j-aboutus" href="/aboutUs">关于我们</a>
          </li>
        </ul>
      </div>
    </div>
    <div class="container">
      <div class="wrapper clearfix">
        <div class="wrapper-cont">
          <ul class="aboutus-nav">
            <li class="aboutus-tab" data-id="media"></li>
            <li class="aboutus-tab joinus-link joinus" data-id="join">
              <a href="/aboutUs">
                <em class="sign-report"></em>加入我们
              </a>
            </li>
          </ul>
          <div class="aboutus-details detail-move-top">
            <div class="details-content">
              <!-- 媒体报道区域 -->
              <div v-if="mediaDetail">
                <div class="media-details" id="1">
                  <h2 class="media-title details-title">{{mediaDetail.title}}</h2>
                  <p class="media-info">
                    <a :href="mediaDetail.url" target="_blank">{{mediaDetail.reportWebName}}</a>
                    <em class="media-time">/{{addTime}}</em>
                  </p>
                  <div class="media-msg" v-html="mediaDetail.content"></div>
                </div>
                <div class="page">
                  <a href="/aboutUs" class="details-left">返回列表</a>
                  <span class="details-right">
                    <a :href="mediaDetailPrev" class="prev-page" v-if="hasPrevious">上一篇</a>
                    <a :href="mediaDetailNext" class="next-page" v-if="hasNext">下一篇</a>
                  </span>
                </div>
              </div>
              <div v-else>
                <h2 class="media-title details-title">没有该文章</h2>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
    <bottom></bottom>
  </div>
</template>
<script>
import formatDate from "~/assets/utils/formatDate";
export default {
  async asyncData({ store, params, query }) {
    await store.dispatch("mediaDetail/FETCH_MEDIADETAIL", {
      detailId: params.id,
      pageFlag: query.pageFlag
    });
    let md = store.getters["mediaDetail/activeMediaDetail"];
    return {
      mediaDetail: md,
      hasNext: md.hasNext,
      hasPrevious: md.hasPrevious,
      addTime: formatDate.unixToTime(md.addTime),
      mediaDetailPrev: "/aboutUs/media/" + md.id + "?pageFlag=prev",
      mediaDetailNext: "/aboutUs/media/" + md.id + "?pageFlag=next"
    };
  },
  components: {
    bottom: footer
  }
};
</script>
<style lang="less" scoped>
body {
  font-family: "微软-雅黑";
  line-height: 1.5;
}
.home-header {
  background: #1280f5;
  color: #fff;
  position: relative;
}
.home-header a {
  color: #fff;
}
.home-header .fr {
  margin-right: 40px;
}
.fl {
  float: left;
}
.fr {
  float: right;
}
.navbar {
  float: right;
  font-size: 14px;
  margin-top: 18px;
}
.navbar > li {
  float: left;
  margin-left: 30px;
}
.navbar a {
  display: block;
  line-height: 40px;
}
.navbar a:hover,
.selected {
  display: inline-block;
  border-bottom: 2px solid #fff;
  color: #fff;
}
.nav ul {
  padding-top: 35px;
}
.nav ul li {
  float: left;
  margin-right: 26px;
  font-size: 18px;
}
.container {
  margin: 90px 0;
  color: #333;
}
/*.wrapper-cont{
  overflow: hidden;
}
*/
.aboutus-nav {
  float: left;
  margin-left: 8%;
  padding-bottom: 30px;
  width: 130px;
  background: #fafafa;
  text-align: center;
  font-size: 18px;
}
.aboutus-tab {
  padding-top: 30px;
}
.media-default {
  position: absolute;
  margin-left: -30px;
  width: 5px;
  height: 30px;
  background: #00aaff;
}
.bule-color {
  color: #00aaff;
}
.aboutus-details {
  width: 69%;
  margin-left: 27%;
  margin-top: -146px;
}
.media-area li {
  padding: 30px 0;
  border-bottom: 1px #ccc solid;
}
.media-area li:first-child {
  margin: 0;
  padding-top: 0;
}
.page-list {
  width: 320px;
  margin: 32px auto 0 auto;
  display: block;
  padding: 0 20px;
  font-size: 20px;
}
.page-list a {
  width: 30px;
  height: 26px;
  line-height: 28px;
  display: inline-block;
  margin-left: 10px;
  text-align: center;
  border-radius: 3px;
}
.tag-active {
  background: #00aaff;
  color: #fff;
}
.prev {
  margin-right: 10px;
  color: #999;
}
.next {
  margin-left: 10px;
  color: #999;
}
.media-list {
  font-size: 14px;
}
.media-title {
  padding-bottom: 15px;
  font-size: 20px;
}
.media-link-msg {
  margin-top: 10px;
}
.media-title:hover,
.media-link-msg:hover {
  color: #00aaff;
}
.details-title:hover {
  color: #333;
}
.media-info {
  padding-bottom: 20px;
  font-size: 16px;
  color: #666;
}
.media-info a {
  color: #0092ff;
}
.media-time {
  font-style: normal;
}

.media-msg {
  width: 95%;
  line-height: 26px;
  border-bottom: 1px #ccc solid;
  padding-bottom: 20px;
  font-size: 14px;
}
.media-msg table {
  width: auto !important;
}

.disabled-color {
  color: #666 !important;
}
.details-left {
  float: left;
  color: #00aaff;
  margin-top: 20px;
  font-size: 14px;
}
.details-right {
  float: right;
  margin-right: 50px;
  margin-top: 20px;
  font-size: 14px;
}
.details-right a {
  display: inline-block;
  margin-left: 20px;
  color: #00aaff;
}
.jobs-list dl {
  margin-bottom: 25px;
  padding-bottom: 12px;
  border-bottom: 1px #ccc solid;
  font-size: 14px;
}
.jobs-list dl:last-child {
  border-bottom: 0;
}

.jobs-list dt {
  font-size: 20px;
  font-weight: bold;
  margin-bottom: 10px;
  color: #00aaff;
}
.jobs-num {
  margin-left: 10px;
}
.jobs-list dd {
  /*margin-bottom: 5px;*/
}
.contactUs {
  border-top: 1px #b3b3b3 solid;
  padding-left: 12%;
  padding-top: 60px;
}
.contactUs h5 {
  font-size: 24px;
}
.contact-tel-wrap,
.contact-add-wrap,
.contact-qrcode {
  width: 25%;
  float: left;
}
.contact-qrcode-app {
  width: 25%;
  float: left;
  margin-left: -130px;
  margin-top: -4px;
  text-align: center;
  font-size: 16px;
}
.contact-qrcode-app img {
  /* width: 50%;*/
  width: 50%;
  margin-top: 4px;
  background: #fff;
}
.contact-qrcode-app .app-font {
  /*    margin-top: 10px;*/
}
.contact-tel-wrap .tel {
  font-size: 36px;
}
.contact-tel-wrap .contact-time {
  font-size: 20px;
  background: #4d91fd;
  color: #fff;
  width: 60%;
  text-align: center;
  margin-top: 10px;
}
.contact-tel-wrap h5 {
  padding-bottom: 35px;
}
.contact-add-wrap h5 {
  padding-bottom: 40px;
}
.contact-add-wrap .contact-add {
  font-size: 16px;
  line-height: 30px;
}
.contact-qrcode {
  text-align: center;
  font-size: 16px;
}

.contact-qrcode h5 {
  margin-bottom: 34px;
}

.contact-qrcode img {
  width: 50%;
}
.contact-copy {
  clear: both;
  padding-top: 80px;
  text-align: center;
  margin-left: -15%;
  padding-bottom: 50px;
}
.contact-copy a:hover {
  color: #0092ff;
}

.award {
  border-top: 1px #b3b3b3 solid;
  padding: 0 9%;
  padding-bottom: 150px;
}
.award h3 {
  margin: 80px 0 70px 0;
}
.award-left {
  width: 50%;
  color: #4a4a4a;
}
.award-left h5 {
  font-size: 20px;
  margin-bottom: 35px;
}
.award-left span {
  font-size: 16px;
}
.award-right {
  margin-left: 10%;
  width: 40%;
}

.award-right img {
  max-width: 100%;
}
.pages {
  text-align: right;
  padding-top: 20px;
  font-size: 14px;
  a {
    display: inline-block;
    margin-left: 20px;
    color: #0af;
  }
}
.detail-move-top {
  margin-top: -146px;
}
.details-content {
  margin-top: 146px;
}
.next-page,
.prev-page {
  color: #0092ff;
  margin-right: 30px;
}
</style>

