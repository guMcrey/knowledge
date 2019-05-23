<template>
  <div class="root">
    <sd-header :activeTab="6"></sd-header>
    <div style="height:60px;"></div>
    <div class="ques-section clearfix">
      <div class="ques-section-item" v-if="userType == 1">
        <h2 class="ques-item-title1">小老师排行>></h2>
        <div class="ques-section-card">
          <div class="ques-card-head ques-card-org">
            <svg
              version="1.1"
              xmlns="http://www.w3.org/2000/svg"
              xmlns:xlink="http://www.w3.org/1999/xlink"
              x="0px"
              y="0px"
              width="1050px"
              height="30px"
              xml:space="preserve"
            >
              <defs>
                <pattern
                  id="water"
                  width=".25"
                  height="1.1"
                  patternContentUnits="objectBoundingBox"
                >
                  <path
                    fill="#fff"
                    d="M0.25,1H0c0,0,0-0.659,0-0.916c0.083-0.303,0.158,0.334,0.25,0C0.25,0.327,0.25,1,0.25,1z"
                  ></path>
                </pattern>
                <g id="eff">
                  <rect
                    fill="url(#water)"
                    x="-119.461"
                    y="0"
                    width="1200"
                    height="120"
                    opacity="0.3"
                  >
                    <animate
                      attributeType="xml"
                      attributeName="x"
                      from="-300"
                      to="0"
                      repeatCount="indefinite"
                      dur="10s"
                    ></animate>
                  </rect>
                  <rect
                    fill="url(#water)"
                    y="5"
                    width="1600"
                    height="125"
                    opacity="0.3"
                    x="-399.447"
                  >
                    <animate
                      attributeType="xml"
                      attributeName="x"
                      from="-400"
                      to="0"
                      repeatCount="indefinite"
                      dur="13s"
                    ></animate>
                  </rect>
                </g>
              </defs>
              <use xlink:href="#eff" opacity="1" style="mix-blend-mode:normal;"></use>
            </svg>
          </div>
          <div class="ques-card-title ques-card-title-top">小老师荣誉榜</div>
          <ul class="ques-card-list">
            <li class="ques-card-list-noe" v-for="(item, index) in teacherList" :key="index">
              <div class="ques-list-box clearfix">
                <div class="ques-list-head">
                  <div class="ques-list-image">
                    <img src="./images/avator.jpg" alt>
                  </div>
                </div>
                <div class="ques-list-name">
                  <div class="ques-list-name-head">{{item.username}} <span v-if="item.name">(姓名：{{item.name}})</span></div>
                  <div class="ques-list-name-info">
                    <div class="ques-list-name-text">性别：{{item.gender}}</div>
                    <div class="ques-list-name-text">用户积分: {{item.score}}</div>                     
                    <div class="ques-list-name-text">手机号：{{item.mobile}}</div>
                    <div class="ques-list-name-text">邮箱: {{item.email}}</div>
                    <div class="ques-list-name-text">生日: {{item.birthday}}</div>
                  </div>
                </div>
                <span class="ques-list-name-icon item-icon003">{{index+1}}</span>
              </div>
            </li>
          </ul>
        </div>
      </div>
      <div class="ques-section-item" v-else>
        <h2 class="ques-item-title2">学生排行>></h2>
        <div class="ques-section-card">
          <div class="ques-card-head ques-card-bul">
            <svg
              version="1.1"
              xmlns="http://www.w3.org/2000/svg"
              xmlns:xlink="http://www.w3.org/1999/xlink"
              x="0px"
              y="0px"
              width="1050px"
              height="30px"
              xml:space="preserve"
            >
              <defs>
                <pattern
                  id="water"
                  width=".25"
                  height="1.1"
                  patternContentUnits="objectBoundingBox"
                >
                  <path
                    fill="#fff"
                    d="M0.25,1H0c0,0,0-0.659,0-0.916c0.083-0.303,0.158,0.334,0.25,0C0.25,0.327,0.25,1,0.25,1z"
                  ></path>
                </pattern>
                <g id="eff">
                  <rect
                    fill="url(#water)"
                    x="-119.461"
                    y="0"
                    width="1200"
                    height="120"
                    opacity="0.3"
                  >
                    <animate
                      attributeType="xml"
                      attributeName="x"
                      from="-300"
                      to="0"
                      repeatCount="indefinite"
                      dur="10s"
                    ></animate>
                  </rect>
                  <rect
                    fill="url(#water)"
                    y="5"
                    width="1600"
                    height="125"
                    opacity="0.3"
                    x="-399.447"
                  >
                    <animate
                      attributeType="xml"
                      attributeName="x"
                      from="-400"
                      to="0"
                      repeatCount="indefinite"
                      dur="13s"
                    ></animate>
                  </rect>
                </g>
              </defs>
              <use xlink:href="#eff" opacity="1" style="mix-blend-mode:normal;"></use>
            </svg>
          </div>
          <div class="ques-card-title ques-card-title-top">学生荣誉榜</div>
          <ul class="ques-card-list">
            <li class="ques-card-list-noe" v-for="(item, index) in studentList" :key="index">
              <div class="ques-list-box clearfix">
                <div class="ques-list-head">
                  <div class="ques-list-image">
                    <img src="./images/avator.jpg" alt>
                  </div>
                </div>
                <div class="ques-list-name">
                  <div class="ques-list-name-head">{{item.username}} <span v-if="item.name">(姓名：{{item.name}})</span></div>
                  <div class="ques-list-name-info">
                    <div class="ques-list-name-text">性别：{{item.gender}}</div>
                    <div class="ques-list-name-text" v-if="item.score">用户积分: {{item.score}}</div>                     
                    <div class="ques-list-name-text" v-if="item.mobile">手机号：{{item.mobile}}</div>
                    <div class="ques-list-name-text" v-if="item.email">邮箱: {{item.email}}</div>
                    <div class="ques-list-name-text" v-if="item.birthday">生日: {{item.birthday}}</div>
                  </div>
                </div>
                <span class="ques-list-name-icon item-icon002">{{index + 1}}</span>
              </div>
            </li>
          </ul>
        </div>
      </div>
    </div>
    <page-footer></page-footer>
  </div>
</template>
<script>
import PageFooter from "~/components/pageFooter";
import SdHeader from "~/components/navBar";
import { apiUserDetail, apiHonorsList } from "~/servers/api/user";
export default {
  data() {
    return {
      userType: '',
      teacherList: [],
      studentList: []
    };
  },
  mounted() {
    // this.getUserInfo();
    this.honorList();
  },
  methods: {
    // 获取用户信息
    // async getUserInfo() {},
    async honorList() {
      const user = await apiUserDetail("get");
      this.userType = user.type;
      const student = await apiHonorsList(this.userType, "get");
      this.teacherList = student.results;
      this.studentList = student.results
    }
  },
  components: {
    PageFooter,
    SdHeader
  }
};
</script>
<style scoped>
.root {
  background: #f5f5f5;
}
/* 公共样式表css */
html,
body {
  color: #333;
  margin: 0;
  height: 100%;
  font-family: "Myriad Set Pro", "Helvetica Neue", Helvetica, Arial, Verdana,
    sans-serif;
  -webkit-font-smoothing: antialiased;
  -moz-osx-font-smoothing: grayscale;
  font-weight: normal;
}

* {
  -webkit-box-sizing: border-box;
  -moz-box-sizing: border-box;
  box-sizing: border-box;
}

a {
  text-decoration: none;
  color: #000;
}

img {
  border: 0;
}

body {
  background: #f8f8f8;
  color: #666;
}

html,
body,
div,
dl,
dt,
dd,
ol,
ul,
li,
h1,
h2,
h3,
h4,
h5,
h6,
p,
blockquote,
pre,
button,
fieldset,
form,
input,
legend,
textarea,
th,
td {
  margin: 0;
  padding: 0;
}

a {
  text-decoration: none;
  color: #08acee;
}

button {
  outline: 0;
}

img {
  border: 0;
}

button,
input,
optgroup,
select,
textarea {
  margin: 0;
  font: inherit;
  color: inherit;
  outline: none;
}

li {
  list-style: none;
}

a {
  color: #666;
}

a:hover {
  color: #eee;
}

.clearfix::after {
  clear: both;
  content: ".";
  display: block;
  height: 0;
  visibility: hidden;
}

/* 必要布局样式css */

.ques-section {
  max-width: 1080px;
  min-height: 740px;
  margin: auto;
  padding: 50px;
  border-radius: 2px;
  background-color: #fff;
  display: flex;
  justify-content: center;
}
.ques-section-item {
  width: 1050px;
  position: relative;
  float: left;
}
.ques-item-title1 {
  font-size: 18px;
  line-height: 24px;
  margin-bottom: 20px;
  font-weight: weight;
  color: #f8a413;
}
.ques-item-title2 {
  font-size: 18px;
  line-height: 24px;
  margin-bottom: 20px;
  font-weight: weight;
  color: #3f85ef;
}

.ques-section-card {
  position: relative;
  /* height: 424px; */
  text-align: center;
  border: 1px solid #f2f2f2;
  border-radius: 2px;
  background-color: #fafafa;
}
.ques-card-head {
  position: absolute;
  top: 0;
  left: 0;
  width: 100%;
  height: 30px;
  padding-top: 48px;
  border-radius: 2px 2px 0 0;
}

.ques-card-gul {
  background-color: #f55727;
  background-image: -webkit-radial-gradient(50% 3%, circle, #f07a56, #f55727);
  background-image: radial-gradient(circle at 50% 3%, #f07a56, #f55727);
  height: 78px;
}
.ques-card-org {
  background-color: #f59b00;
  background-image: -webkit-radial-gradient(
    50% -6%,
    circle,
    #ffb83d 2%,
    #f59b00
  );
  background-image: radial-gradient(circle at 50% -6%, #ffb83d 2%, #f59b00);
  height: 78px;
}
.ques-card-bul {
  background-color: #397bee;
  background-image: -webkit-radial-gradient(50% -45%, circle, #53a7f5, #397bee);
  background-image: radial-gradient(circle at 50% -45%, #53a7f5, #397bee);
  height: 78px;
}

.ques-card-title {
  font-size: 18px;
  font-weight: 500;
  line-height: 24px;
  position: relative;
  padding-top: 15px;
  color: #fff;
}
.ques-card-text {
  line-height: 18px;
  position: relative;
  margin-top: 6px;
  opacity: 0.7;
  color: #fff;
  font-weight: normal;
}
.ques-card-num {
  overflow: hidden;
  margin: 40px auto 0;
  border-radius: 50%;
  position: relative;
  display: block;
  width: 80px;
  height: 80px;
}

.ques-card-num:before {
  position: absolute;
  top: 0;
  left: 0;
  width: 76px;
  height: 76px;
  content: "";
  border: 2px solid rgba(255, 255, 255, 0.9);
  border-radius: 100%;
}
.ques-card-num:hover:before {
  background-color: rgba(0, 0, 0, 0.3);
}

.ques-card-num img {
  width: 100%;
  height: auto;
  display: block;
  border: none;
}
.ques-card-name {
  font-size: 18px;
  line-height: 24px;
  margin-top: 10px;
}
.ques-card-major {
  line-height: 18px;
  margin-top: 6px;
  color: #a3a3a3;
}
.ques-card-field {
  font-size: 12px;
  line-height: 18px;
  height: 18px;
  margin-top: 25px;
  text-align: center;
  color: #000;
}
.ques-card-tag {
  font-size: 12px;
  margin: 6px 0 25px;
}
.ques-card-tag span {
  line-height: 17px;
  display: inline-block;
  max-width: 84px;
  height: 18px;
  padding: 0 6px;
  color: #fa9600;
  border: 1px solid #f5cc84;
  border-radius: 2px;
  margin: 0 4px;
}

.ques-card-help {
  display: block;
  margin: 20px auto;
  line-height: 29px;
  width: 90px;
  height: 30px;
  text-align: center;
  color: #fff;
  border-radius: 2px;
  background-color: #2fa9f1;
}
.ques-card-bots {
  line-height: 18px;
  margin-top: 25px;
  color: #a3a3a3;
}
.ques-section-item + .ques-section-item {
  margin-left: 20px;
}
.ques-card-title-top {
  padding: 27px 0;
}
.ques-card-list {
  text-align: left;
}

.ques-card-list li {
  position: relative;
}

.ques-card-list-noe:before {
  position: absolute;
  z-index: 2;
  top: 6px;
  left: 37px;
  display: block;
  content: "";
  background-position: -115px -44px;
  width: 20px;
  height: 20px;
  background-image: url("./images/icon-body.png");
}

.ques-card-list-three:before {
  position: absolute;
  z-index: 2;
  top: 6px;
  left: 37px;
  display: block;
  content: "";
  background-position: -115px -88px;
  width: 20px;
  height: 20px;
  background-image: url("./images/icon-body.png");
}

.ques-card-list li:after {
  position: absolute;
  bottom: 0;
  left: 10px;
  display: block;
  width: 280px;
  height: 1px;
  content: "";
  background-color: #ededed;
}
.ques-list-box {
  position: relative;
  display: block;
  height: 80px;
  padding: 16px 15px 17px;
}
.ques-list-head {
  position: relative;
  float: left;
  padding-right: 8px;
}
.ques-list-image {
  position: relative;
  display: block;
  width: 42px;
  height: 42px;
  z-index: 2;
  margin: 0 auto;
  margin-right: 20px;
}
.ques-list-image:before {
  position: absolute;
  top: 0;
  left: 0;
  width: 42px;
  height: 42px;
  content: "";
  border: 2px solid #f87851;
  border-radius: 100%;
}
.ques-list-image img {
  border-radius: 100%;
  width: 100%;
  height: auto;
  display: block;
  border: none;
}
.ques-list-name {
  overflow: hidden;
  margin-right: 33px;
}
.ques-list-name-head {
  line-height: 18px;
  color: #333;
  font-size: 16px;
}
.ques-list-name-info {
  display: flex;
  justify-content: flex-start;
}
.ques-list-name-text {
  font-size: 14px;
  line-height: 17px;
  margin-top: 8px;
  color: #a3a3a3;
  margin-right: 20px;
}
.ques-list-name-icon {
  font-size: 12px;
  line-height: 24px;
  position: absolute;
  top: 50%;
  right: 14px;
  display: block;
  margin-top: -13px;
  text-align: center;
  color: #fff;
  background-position: 0 -60px;
  width: 25px;
  height: 25px;
  background-image: url("./images/icon-body.png");
}

.item-icon001 {
  background-position: -62px -27px;
  width: 25px;
  height: 25px;
  display: block;
}

.item-icon002 {
  background-position: -62px 0;
  width: 25px;
  height: 25px;
}

.item-icon003 {
  background-position: -28px -32px;
  width: 25px;
  height: 25px;
}
.item-icon004 {
  background-position: 0 -60px;
  width: 25px;
  height: 25px;
}
.item-icon005 {
  background-position: 0 -60px;
  width: 25px;
  height: 25px;
}

.ques-list-box:hover {
  cursor: pointer;
  background-color: #f5f5f5;
}
.ques-card-list-two:before {
  background-position: -115px -66px;
  width: 20px;
  height: 20px;
  position: absolute;
  z-index: 2;
  top: 6px;
  left: 37px;
  display: block;
  content: "";
  background-image: url(./images/icon-body.png);
}
</style>