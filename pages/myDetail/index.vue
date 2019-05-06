<template>
  <div>
    <sd-header :activeTab="0"></sd-header>
    <div class="root">
      <div class="root-wrap">
        <div class="wrap">
          <div class="info1">
            <div class="userInfo">
              <div class="avator">
                <img src="./img/avator.jpg">
              </div>
              <div class="right">
                <div class="username">昵称: {{nickname}}</div>
                <div class="grade">等级: V4</div>
                <div class="score">积分: 20</div>
              </div>
            </div>

            <div class="user-info">
              <div class="nick-level">
                <div class="nick" v-text="nick"></div>
                <div :class="'level level'+levelClass">
                  <i :class="'icons icon_level_'+levelClass"></i>
                  <span v-text="level"></span>
                </div>
              </div>

              <div class="uid" v-text="'ID:'+uid"></div>

              <div class="wealth">
                <div class="w-star">
                  <span v-text="starNumber"></span>
                  <i class="icons star-sm"></i>
                </div>
                <span class="cut">|</span>
                <div class="w-diamond">
                  <span v-text="diamondNumber"></span>
                  <i class="icons diamond-sm"></i>
                </div>
              </div>
            </div>
          </div>
          <div class="app menu">
            <!-- 推荐这种写法-->
            <ul class="menu-ul">
              <li
                class="menu-link"
                tag="li"
                v-for="(title,index) in tabTitle"
                @click="cur=index"
                :class="{active:cur==index}"
                :key="index"
              >{{title}}</li>
            </ul>
          </div>
        </div>
        <div class="tab-content">
          <div v-for="(m,index) in tabMain" v-show="cur==index" :key="index">
            <div id="table">{{m}}</div>
          </div>
        </div>
      </div>
    </div>
    <page-footer></page-footer>
  </div>
</template>
<script>
import SdHeader from "~/components/navBar";
import PageFooter from "~/components/pageFooter";
import * as api from "~/assets/api";
import { apiUserDetail } from "~/servers/api/user";

export default {
  data() {
    return {
      tabTitle: ["我的试卷", "我的回复", "发布的帖子", "我的预约"],
      tabMain: ["内容一", "内容二", "内容三", "内容四"],
      cur: 0, //默认选中第一个tab
      addDetail: {},
      editlist: false,
      editDetail: {},
      newsList: [
        {
          title: "在移动设备开发",
          user: "张若昀",
          dates: "2018-02-09",
          id: "45211546"
        },
        {
          title: "图形及特效特性",
          user: "张若昀",
          dates: "2018-02-09",
          id: "61341341"
        },
        {
          title: "设备兼容特性",
          user: "张若昀",
          dates: "2018-02-09",
          id: "62451431"
        },
        {
          title: "W3C将致力于开发用于实时通信",
          user: "张若昀",
          dates: "2018-02-09",
          id: "62345213"
        },
        {
          title: "全新的表单输入对象",
          user: "张若昀",
          dates: "2018-02-09",
          id: "23322445"
        }
      ],
      editid: "",
      nickname: ""
    };
  },
  mounted() {
    this.getUserInfo();
    this.userInfo();
    this.selectQuesiotn();
  },
  methods: {
    // 获取用户信息
    getUserInfo() {
      // 昵称
      // this.nickname = window.localStorage.getItem('USERNAME')
      // 用户等级
      // 积分
    },
    // 发布的帖子
    async userInfo() {
      const username = this.nickname;
      const data = await apiUserDetail();
      console.log("data", data);
    },
    // 我的试卷
    selectQuesiotn() {
      api.selectQustionList().then(res => {
        console.log("通了");
      });
    }
  },
  components: {
    SdHeader,
    PageFooter
  }
};
</script>
<style type="text/css">
* {
  font-size: 16px;
}
.root-wrap {
  display: flex;
  align-items: center;
  justify-content: center;
  width: 1140px;
  margin: 0 auto;
}
.wrap {
  display: flex;
  align-content: center;
  align-items: center;
  flex-direction: column;
  padding-top: 100px;
}
.userInfo {
  display: flex;
  align-items: center;
  justify-content: center;
  align-items: center;
  width: 250px;
  height: 150px;
  background: #fff;
}
.avator {
  width: 80px;
  height: 80px;
  background: #ccc;
  border-radius: 50%;
  margin-right: 30px;
}
.avator img {
  width: 100px;
  height: 100px;
}
.right {
  line-height: 30px;
  margin-top: 20px;
}
.root {
  background: #f5f5f5;
}
ul li {
  margin: 0;
  padding: 0;
  list-style: none;
}
.app {
  box-shadow: 0 2px 1px #d9d9d9, inset 0 1px 1px #f1f1f1;
  display: flex;
  justify-content: center;
  margin: 0px auto;
  background: #fff;
  padding: 50px;
}
.info1 {
  background: #fff;
  width: 300px;
  height: 180px;
  text-align: left;
}
.portrait {
  width: 80px;
  height: 80px;
  overflow: hidden;
  -webkit-border-radius: 40px;
  -moz-border-radius: 40px;
  -ms-border-radius: 40px;
  -o-border-radius: 40px;
  border-radius: 40px;
  background-color: #cccccc;
  margin: 40px 18px 0 15px;
}
.user-info {
  margin: 38px 0 0 0;
  vertical-align: top;
}
.portrait,
.user-info,
.w-star,
.w-diamond,
.nick,
.level {
  display: inline-block;
}
.nick {
  white-space: nowrap;
  overflow: hidden;
  text-overflow: ellipsis;
  max-width: 110px;
}
.nick,
.level {
  vertical-align: middle;
}
.cut {
  padding: 0 10px;
  color: #e9e9e9;
  font-size: 15px;
}

.uid,
.wealth {
  margin-top: 14px;
}
.uid {
  font-size: 13px;
}
.level {
  padding: 0 6px;
  color: #fff;
  font-size: 12px;
  margin-left: 5px;
  -webkit-border-radius: 10px;
  -moz-border-radius: 10px;
  -ms-border-radius: 10px;
  -o-border-radius: 10px;
  border-radius: 10px;
  height: 20px;
  line-height: 20px;
}
.level .icons {
  display: inline-block;
}
.level1 {
  background: #50e4ce;
}
.level2 {
  background: #4a87f6;
}
.level3 {
  background: #fa9f47;
}
.level4 {
  background: #fad247;
}
.level5 {
  background: #5061e4;
}
.level6 {
  background: #ac47fa;
}
.level .num {
  display: inline-block;
}
.wealth {
  font-size: 12px;
  white-space: nowrap;
}
.wealth .icons {
  margin-top: -3px;
  vertical-align: middle;
}
.menu {
  background: #fff;
  width: 300px;
  height: 490px;
  margin-top: 15px;
  text-align: left;
  color: #737373;
}
.menu-ul {
  padding: 0;
  margin: 0;
}
.tab-content {
  width: 2400px;
  height: 690px;
  background: #fff;
  margin-top: 100px;
}
.router-link-active {
  font-weight: bold;
  color: #353535;
  background: #dcf9f5;
}
.menu-link {
  list-style-type: none;
  width: 300px;
  text-align: center;
  height: 60px;
  cursor: pointer;
  line-height: 60px;
  padding: 0 0 0 25px;
  transition: all 0.4s;
  border-bottom: 1px solid #f5f5f5;
}
.menu-link:hover {
  background: rgba(245, 173, 27, 0.6);
}
</style>