<template>
  <div>
    <sd-header :activeTab="4"></sd-header>
    <div class="root">
      <div class="ask_main">
        <div class="amVist">
          <div class="curNav"></div>
          <div class="vistInfo" v-for="(item, index) in questionContent" :key="index">
            <h1>
              <!-- <span>[已采纳]&nbsp;</span> -->
              {{item.title}}
            </h1>
            <div class="fui"></div>

            <div class="content">{{item.content}}</div>

            <div class="vice-info">
              <a class="MydaBut" id="MydaBut">
                <i>答</i>
                <span>我来答</span>
              </a>
              <div class="th"></div>
              <div class="hits">积分：{{item.score}}</div>
            </div>

            <div class="AnswerForm" id="AnswerForm">
              <p>&hearts; 请认真作答，如牛头不对马嘴或发布违规及广告内容，发现一律封号处理！</p>
              <form>
                <textarea
                  name="content22"
                  id="editor1"
                  style="width:99.8%;height:150px;"
                  v-model="content"
                ></textarea>
                <div class="button" @click="createAnswer()">
                  <!-- <a class="sq" id="sq">​&spades; 收起</a> -->
                  <input class="button" value="提交回答">
                </div>
              </form>
            </div>

            <div v-if="item.answers.length>0">
              <div>
                <div class="AnswerQuantity">
                  <span>
                    共
                    <em>{{item.answers.length}}</em>个回答
                  </span>
                </div>
                <div class="AnswerItemList" v-for="(sitem, index) in item.answers" :key="index">
                  <div class="userInfo">
                    <div class="info">
                      <span>
                        <a href>{{sitem.owner}}</a>
                      </span>
                      <span>
                        <dl>回答时间：</dl>
                        <em>{{sitem.created_time}}</em>
                      </span>
                    </div>
                  </div>
                  <div class="content" id="wrap3">
                    <p>{{sitem.content}}</p>
                    <div class="gradient" id="gradient3"></div>
                  </div>
                  <div class="read-more" id="read-more3"></div>
                  <div class="fuInfo">
                    <!-- <a href class="Report">举报</a> -->
                  </div>
                </div>
              </div>
            </div>
            <!-- <div class="pageType">
                  <ul class="pagination">
                    <li class="disabled">
                      <dl>上一页</dl>
                    </li>
                    <li class="active">
                      <span>1</span>
                    </li>
                    <li>
                      <a href>2</a>
                    </li>
                    <li>
                      <a href>3</a>
                    </li>
                    <li>
                      <a href>下一页</a>
                    </li>
                    <li class="pageRemark">
                      共
                      <b>3</b>页
                      <b>43</b>条数据
                    </li>
                  </ul>
            </div>-->
          </div>
        </div>
      </div>
      <page-footer></page-footer>
    </div>
  </div>
</template>
<script>
import SdHeader from "~/components/navBar";
import PageFooter from "~/components/pageFooter";
import {
  apiCheckInfo,
  apiCreateAnswer,
  apiNomalBehavior
} from "~/servers/api/discuss";
import { apiUserDetail } from "~/servers/api/user";

const scoreMap = {
  1: "5分",
  2: "10分",
  3: "15分",
  4: "20分"
};
export default {
  data() {
    return {
      question_id: this.$route.query.question_id, // 问题id
      questionContent: [], // 问题详情
      // otherAnswerList: [], // 其他回答列表
      score: "", // 积分
      content: "", // 回答内容
      created_time: null, // 问题创建时间
      owner: "", // 回答者id
      updated_time: null // 问题更新时间
    };
  },
  created() {
    this.getQuestionInfo();
  },
  methods: {
    // 获取问题详情
    async getQuestionInfo() {
      const data = await apiCheckInfo(this.question_id, "get");
      this.questionContent = data.results;
      console.log("otherAnswerList", this.otherAnswerList);
      this.score = this.questionContent.forEach(res => {
        res.score = scoreMap[res.score];
      });
    },
    // 创建问题回答
    async createAnswer() {
      if (this.content === "") {
        this.$notify({
          title: "提示",
          message: "您还没有输入内容哦~",
          type: "warning"
        });
      } else {
        const userInfo = await apiUserDetail("get");
        this.owner = userInfo.id;
        const data = await apiCreateAnswer(
          this.owner,
          this.question_id,
          this.content,
          this.created_time,
          this.updated_time
        );
        this.$notify({
          title: "成功",
          message: "添加回复成功",
          type: "success"
        });
        this.content = "";
        this.getQuestionInfo();
      }
    }
  },
  components: {
    SdHeader,
    PageFooter
  }
};
</script>
<style scoped>
.root {
  background: #f5f5f5;
  padding-top: 60px;
}
.ask-button {
  display: block;
  background-color: rgba(245, 173, 27, 0.8);
  font: 15px/50px "microsoft yahei";
  color: #fff;
  text-align: center;
  border-radius: 3px;
  border: 1px solid rgba(245, 173, 27, 0.6);
  padding: 3px;
}
.ask-top,
.ask_main {
  box-shadow: 0 2px 10px #d9d9d9, inset 0 10px 1px #f1f1f1;
  display: flex;
  justify-content: space-around;
  max-width: 1140px;
  margin: 0px auto;
  background: #fff;
  padding: 40px;
  min-height: 71vh;
}
.ask_main .amLeft h2 {
  display: block;
  width: 100%;
  height: 36px;
  font: 15px/36px "microsoft yahei";
  background-color: rgba(245, 173, 27, 0.8);
  color: #fff;
  text-align: center;
}
.ask_main .amLeft ul {
  display: block;
  width: 100%;
  height: auto;
  overflow: auto;
  padding-bottom: 8px;
  background-color: #e8e8e8;
}
.ask_main .amLeft ul li {
  display: block;
  width: 100%;
  height: 35px;
  margin: 2px auto;
}
.ask_main .amLeft ul li a {
  display: block;
  width: 100%;
  height: 35px;
  font: 15px/35px "microsoft yahei";
  color: #666;
  text-align: center;
}
.ask_main .amLeft ul li a:hover {
  background-color: rgba(245, 173, 27, 0.6);
  color: #fff;
}

.ask_main .amIn {
  width: 935px;
  height: auto;
  overflow: hidden;
  float: left;
  background-color: #fff;
  margin-left: 20px;
}
.AskItemList {
  width: 100%;
  height: auto;
  overflow: hidden;
  padding-bottom: 8px;
  margin-bottom: 8px;
  border-bottom: 1px solid #e6e6e6;
}
.AskItemList .top {
  width: 100%;
  height: auto;
  overflow: hidden;
}
.AskItemList .top .info {
  width: 86%;
  height: auto;
  overflow: hidden;
  float: left;
}
.AskItemList .top .info span {
  display: block;
  height: 30px;
  float: left;
  font: 14px/26px "microsoft yahei";
  color: #a4a4a4;
}
.AskItemList .top .info .uname {
  display: block;
  height: 30px;
  float: left;
  font: 14px/26px "microsoft yahei";
  color: #39f;
}
.AskItemList .top .info .title {
  display: block;
  width: 100%;
  height: auto;
  padding-top: 8px;
  overflow: hidden;
  font: 24px/32px "microsoft yahei";
  color: #555;
  transition-duration: 0.2s;
}
.AskItemList .top .info .title:hover {
  color: #000;
}
.AskItemList .top .info .title span {
  font: 16px/26px "microsoft yahei";
  color: rgba(76, 103, 232, 0.9);
}
.AskItemList .top .da {
  width: 12%;
  height: 80px;
  float: right;
}
.AskItemList .top .da span {
  display: block;
  width: 80px;
  height: 70px;
  background-color: rgba(76, 103, 232, 0.9);
  float: right;
  border-radius: 3px;
}
.AskItemList .top .da span.active {
  background-color: #666;
}
.AskItemList .top .da span em {
  display: block;
  width: 100%;
  height: 40px;
  font: 30px/46px "microsoft yahei";
  color: #fff;
  text-align: center;
}
.AskItemList .top .da span dl {
  display: block;
  width: 100%;
  height: 30px;
  font: 14px/24px "microsoft yahei";
  color: #fff;
  text-align: center;
}

.AskItemList .desc {
  width: 100%;
  height: auto;
  overflow: hidden;
  font: 14px/22px "microsoft yahei";
  color: #666;
  padding: 8px 0;
}

.AskItemList .desc .cover {
  display: block;
  width: 14%;
  height: 70px;
  float: left;
  margin-right: 10px;
}
.AskItemList .desc .c {
  width: 84%;
  height: auto;
  overflow: hidden;
  font: 14px/22px "microsoft yahei";
  color: #666;
  float: right;
}
.AskItemList .tags {
  width: 100%;
  height: 34px;
}
.AskItemList .tags a {
  display: block;
  height: 28px;
  padding: 0 10px;
  float: left;
  margin-right: 6px;
  margin-top: 3px;
  font: 14px/28px "microsoft yahei";
  background-color: #e8e8e8;
  color: #666;
  border-radius: 4px;
  transition-duration: 0.2s;
}
.AskItemList .tags .Appreciation {
  display: block;
  height: 22px;
  margin-top: 6px;
  margin-left: 10px;
  float: left;
}
.AskItemList .tags .Appreciation i {
  display: block;
  width: 22px;
  height: 22px;
  float: left;
  /* background-image: url(img/goldcoin.png);  */
}
.AskItemList .tags .Appreciation span {
  display: block;
  height: 22px;
  float: left;
  font: 14px/24px "microsoft yahei";
  color: #f60;
}
.AskItemList .tags a:hover {
  background-color: rgba(76, 103, 232, 0.9);
  color: #fff;
}
.AskItemList .tags .share_bar_con {
  display: block;
  float: right;
  height: 34px;
}
.AskItemList .tags .share_bar_con span {
  display: block;
  height: 34px;
  float: left;
}
.AskItemList .tags .share_bar_con span dl {
  display: block;
  float: left;
  height: 34px;
  font: 14px/34px "microsoft yahei";
  color: #999;
  float: left;
}
.AskItemList .tags .share_bar_con span em {
  display: block;
  float: left;
  height: 34px;
  font: 14px/34px "microsoft yahei";
  color: #999;
  float: left;
}
.AskItemList .tags .share_bar_con span .cur {
  cursor: pointer;
  color: #333;
}
.AskItemList .tags .share_bar_con span i {
  display: block;
  float: left;
  height: 34px;
  font: 13px/32px "microsoft yahei";
  color: #999;
  float: left;
  padding: 0 15px;
}

.ask_main .amRight {
  width: 270px;
  height: auto;
  float: right;
}

.ask_main .amRight .userInfo {
  width: 270px;
  height: auto;
  margin: 30px auto 30px auto;
  overflow: hidden;
}
.ask_main .amRight .userInfo .us {
  width: 270px;
  height: 50px;
  overflow: hidden;
}
.ask_main .amRight .userInfo .us .info {
  width: 190px;
  height: 50px;
  margin-top: 4px;
  float: right;
  overflow: hidden;
}
.ask_main .amRight .userInfo .us .info a {
  display: block;
  width: 100%;
  height: 22px;
  font: 14px/22px "microsoft yahei";
  color: #09f;
}
.ask_main .amRight .userInfo .us .info a:hover {
  color: #09f;
}
.ask_main .amRight .userInfo .us .info span {
  display: block;
  width: 100%;
  height: 22px;
}
.ask_main .amRight .userInfo .us .info span dl {
  display: block;
  float: left;
  font: 14px/22px "microsoft yahei";
  color: #999;
}
.ask_main .amRight .userInfo .us .info span em {
  display: block;
  float: left;
  font: 14px/22px "microsoft yahei";
  color: #09f;
}
.ask_main .amRight .userInfo .wenda {
  width: 100%;
  height: auto;
  overflow: hidden;
  margin-top: 15px;
}
.ask_main .amRight .userInfo .wenda .txt {
  width: 100%;
  height: auto;
  overflow: hidden;
  margin: 6px 0;
}
.ask_main .amRight .userInfo .wenda .txt i {
  display: block;
  width: 24px;
  height: 24px;
  font: 14px/24px "microsoft yahei";
  text-align: center;
  color: #fff;
  border-radius: 2px;
  float: left;
  margin-right: 6px;
}
.ask_main .amRight .userInfo .wenda .txt i.w {
  background-color: #f60;
}
.ask_main .amRight .userInfo .wenda .txt i.d {
  background-color: #8bc558;
}
.ask_main .amRight .userInfo .wenda .txt span {
  display: block;
  height: auto;
  overflow: hidden;
  font: 14px/24px "microsoft yahei";
  color: #666;
  float: left;
}
.ask_main .amRight .userInfo .wenda .txt span a {
  font: 14px/24px "microsoft yahei";
  /* color: #f00; */
}

.ask_main .amRight .askBut {
  display: block;
  width: 268px;
  height: 50px;
  background-color: #5fc626;
  font: 16px/50px "microsoft yahei";
  color: #fff;
  text-align: center;
  border-radius: 3px;
  border: 1px solid #53b41d;
}
.ask_main .amRight h2 {
  display: block;
  height: 40px;
  margin-top: 10px;
  margin-bottom: 6px;
  font: 18px/40px "microsoft yahei";
  border-bottom: 1px solid #d2cfcf;
}
.ask_main .amRight .titleList {
  width: 100%;
  height: auto;
  overflow: hidden;
}
.ask_main .amRight .titleList a {
  display: block;
  width: 100%;
  height: auto;
  overflow: hidden;
  font: 14px/22px "microsoft yahei";
  color: #666;
  padding: 6px 0;
  border-bottom: 1px dotted #e3e3e3;
}
.ask_main .amRight .titleList a:hover {
  color: rgba(76, 103, 232, 0.9);
}

.ask_main .amRight .newAnswer {
  display: block;
  width: 100%;
  height: auto;
  overflow: hidden;
}
.ask_main .amRight .newAnswer .item {
  width: 100%;
  height: 60px;
  overflow: hidden;
  padding: 8px 0;
}
.ask_main .amRight .newAnswer .item .info {
  width: 200px;
  height: 48px;
  margin-top: 8px;
  float: right;
  overflow: hidden;
}
.ask_main .amRight .newAnswer .item .info .uname {
  display: block;
  height: 24px;
  font: 14px/24px "microsoft yahei";
  color: #09f;
  float: left;
}
.ask_main .amRight .newAnswer .item .info dl {
  display: block;
  height: 24px;
  font: 14px/24px "microsoft yahei";
  color: #666;
  float: left;
}
.ask_main .amRight .newAnswer .item .info .t {
  display: block;
  height: 24px;
  font: 14px/24px "microsoft yahei";
  color: #333;
  float: left;
}
.ask_main .amRight .newAnswer .item .info .t:hover {
  color: rgba(76, 103, 232, 0.9);
}

.floatRight {
  width: 270px;
  height: 100vh;
  overflow: hidden;
  position: relative;
  float: right;
}
.floatRight .askBut {
  display: block;
  width: 268px;
  height: 50px;
  background-color: #5fc626;
  font: 16px/50px "microsoft yahei";
  color: #fff;
  text-align: center;
  border-radius: 3px;
  border: 1px solid #53b41d;
}
.floatRight .footer {
  width: 100%;
  height: auto;
  overflow: hidden;
  padding-bottom: 10px;
  position: absolute;
  background-color: #fff;
  bottom: 0;
  z-index: 100;
}
.floatRight .footer h2 {
  display: block;
  width: 100%;
  height: 30px;
  background-color: #fff;
}
.floatRight .footer h2 span {
  display: block;
  float: left;
  height: 20px;
  font: 16px/20px "microsoft yahei";
  border-left: 4px solid #f30;
  padding-left: 10px;
}
.floatRight .footer .qrc {
  width: 100%;
  height: 130px;
  margin: 4px 0 5px 0;
  background-color: #fff;
  text-align: center;
}
.floatRight .footer .qrc span {
  display: inline-block;
  vertical-align: middle;
  width: 100px;
  height: 130px;
  margin: 0 8px;
}
.floatRight .footer .qrc span img {
  display: block;
  width: 90px;
  height: 90px;
  padding: 4px;
  border: 1px solid #dfdfdf;
}
.floatRight .footer .qrc span dl {
  display: block;
  width: 100px;
  height: 30px;
  font: 14px/30px "microsoft yahei";
  text-align: center;
  color: #333;
}
.floatRight .footer .qq {
  width: 100%;
  height: auto;
  overflow: hidden;
  padding: 10px 0;
  background-color: #fff;
  border-top: 1px solid #dfdfdf;
  border-bottom: 1px solid #dfdfdf;
}
.floatRight .footer .qq span {
  display: block;
  width: 100%;
  height: 28px;
  font: 14px/28px "microsoft yahei";
  color: #666;
}
.floatRight .footer .nlink {
  width: 100%;
  height: auto;
  overflow: hidden;
  padding: 5px 0;
  background-color: #fff;
  text-align: center;
}
.floatRight .footer .nlink span {
  display: inline-block;
  vertical-align: middle;
}
.floatRight .footer .nlink span a {
  display: block;
  float: left;
  height: 28px;
  font: 14px/28px "microsoft yahei";
  color: #333;
}
.floatRight .footer .nlink span a:hover {
  color: #f30;
}
.floatRight .footer .nlink span i {
  display: block;
  float: left;
  height: 28px;
  font: 13px/28px "microsoft yahei";
  color: #999;
  float: left;
  padding: 0 3px;
}
.floatRight .footer .copyright {
  width: 100%;
  height: auto;
  overflow: hidden;
  padding: 5px 0;
  background-color: #fff;
  font: 14px/22px "microsoft yahei";
  color: #666;
}
.floatRight .footer .copyright p {
  font: 14px/22px "microsoft yahei";
  color: #666;
}

.curNav {
  width: 100%;
  height: 50px;
}
.curNav a {
  display: block;
  height: 30px;
  font: 14px/30px "microsoft yahei";
  float: left;
  color: #333;
}
.curNav a:hover {
  color: #f30;
}
.curNav span {
  display: block;
  height: 30px;
  font: 14px/30px "microsoft yahei";
  float: left;
  color: #888;
  margin: 0 8px;
}

/**********************************/
.ask_main .amVist {
  width: 890px;
  height: auto;
  overflow: hidden;
  float: left;
  background-color: #fff;
}

.vistInfo {
  width: 100%;
  height: auto;
  overflow: hidden;
  margin-bottom: 40px;
}

.vistInfo h1 {
  display: block;
  width: 100%;
  height: auto;
  overflow: hidden;
  font: 20px/34px "microsoft yahei";
  color: #333;
  float: left;
}
.vistInfo h1 span {
  font: 16px/26px "microsoft yahei";
  color: rgba(76, 103, 232, 0.9);
}
.vistInfo .fui {
  width: 100%;
  height: 22px;
  padding: 30px 0 0 0;
  /* overflow: hidden; */
}
.vistInfo .fui .time {
  display: block;
  height: 22px;
  float: left;
  margin-right: 10px;
  font: 14px/22px "microsoft yahei";
  color: #666;
}
.vistInfo .fui .time span {
  color: #999;
}
.vistInfo .fui .Appreciation {
  display: block;
  height: 22px;
  margin-right: 10px;
  float: left;
}
.vistInfo .fui .Appreciation i {
  display: block;
  width: 22px;
  float: left;
}
.fui {
  margin-top: 30px;
}
.vistInfo .fui .Appreciation span {
  display: block;
  /* float: left; */
  font: 14px/24px "microsoft yahei";
  color: #f60;
}
.vistInfo .content {
  width: 100%;
  height: auto;
  overflow: hidden;
  font: 15px/26px "microsoft yahei";
  color: #333;
  margin-top: 15px;
}
.vistInfo .content img {
  max-width: 890px;
  height: auto;
  zoom: expression(
    function(elm) {if (elm.width>890) {var oldVW = elm.width; elm.width=890;
      elm.height = elm.height * (890 / oldVW) ;} elm.style.zoom = "1" ;} (this)
  );
}
.vistInfo .vice-info {
  width: 100%;
  height: 42px;
  margin-top: 20px;
}
.vistInfo .vice-info .MydaBut {
  display: block;
  height: 42px;
  padding: 0 15px;
  background-color: rgba(245, 173, 27);
  float: left;
  border-radius: 4px;
  cursor: pointer;
}
.vistInfo .vice-info .MydaBut i {
  display: block;
  width: 32px;
  height: 32px;
  float: left;
  background-color: #fff;
  border-radius: 18px;
  margin-top: 5px;
  margin-right: 12px;
  font: 18px/32px "microsoft yahei";
  color: rgba(245, 173, 27);
  text-align: center;
}
.vistInfo .vice-info .MydaBut span {
  display: block;
  height: 32px;
  float: left;
  font: 16px/32px "microsoft yahei";
  color: #fff;
  margin-top: 5px;
}
.vistInfo .vice-info .hits {
  height: 42px;
  float: right;
  font: 13px/42px "microsoft yahei";
  color: #999;
}
.vistInfo .vice-info .th {
  height: 42px;
  float: left;
  margin-left: 20px;
}
.vistInfo .vice-info .th .z {
  display: block;
  height: 42px;
  float: left;
}
.vistInfo .vice-info .th .z span {
  display: block;
  height: 42px;
  float: left;
  font: 13px/42px "microsoft yahei";
  color: #777;
  transition-duration: 0.2s;
}
.vistInfo .vice-info .th .z:hover span {
  color: #000;
}
.vistInfo .vice-info .th .z em {
  display: block;
  height: 42px;
  float: left;
  margin-left: 4px;
  font-weight: bold;
  font: 13px/42px "microsoft yahei";
  color: #f60;
  transition-duration: 0.2s;
}
.vistInfo .vice-info .th .z:hover em {
  font: 18px/42px "microsoft yahei";
}
.vistInfo .vice-info .th i {
  display: block;
  height: 42px;
  float: left;
  margin: 0 10px;
  font: 13px/42px "microsoft yahei";
  color: #d5d5d5;
}
.vistInfo .AnswerForm {
  width: 100%;
  height: auto;
  overflow: hidden;
}
.vistInfo .AnswerForm p {
  display: block;
  margin-top: 8px;
  width: 100%;
  height: auto;
  overflow: hidden;
  font: 14px/40px "microsoft yahei";
  color: #666;
}
.vistInfo .AnswerForm .button {
  width: 100%;
  height: 50px;
  margin-bottom: 10px;
  margin-top: 10px;
}
.vistInfo .AnswerForm .button .sq {
  display: block;
  height: 46px;
  font: 14px/46px "microsoft yahei";
  color: #666;
  float: left;
  margin-right: 20px;
  cursor: pointer;
}
.vistInfo .AnswerForm .button .button {
  -webkit-appearance: none;
  border: none;
  display: block;
  width: 140px;
  height: 46px;
  font: 16px/46px "microsoft yahei";
  color: #fff;
  background-color: rgba(245, 173, 27);
  float: right;
  cursor: pointer;
  text-align: center;
  border-radius: 3px;
}
.vistInfo .AnswerQuantity {
  width: 100%;
  height: 50px;
  margin-top: 30px;
  margin-bottom: 15px;
  border-bottom: 1px solid #e6e6e6;
}
.vistInfo .AnswerQuantity span {
  display: block;
  height: 50px;
  float: left;
  font: 20px/50px "microsoft yahei";
  color: #09f;
}
.vistInfo .AnswerQuantity em {
  font: 26px/50px "microsoft yahei";
  color: rgba(245, 173, 27);
}
.AnswerItemList {
  width: 100%;
  height: auto;
  overflow: hidden;
  margin-top: 10px;
}
.AnswerItemList .userInfo {
  width: 100%;
  height: 50px;
}
.AnswerItemList .userInfo .info {
  width: 400px;
  height: 50px;
  margin-top: 4px;
  /* margin-left: 15px; */
  float: left;
  overflow: hidden;
}
.AnswerItemList .userInfo .info span a {
  display: block;
  float: left;
  height: 22px;
  font: 16px/22px "microsoft yahei";
  color: #333;
}
.AnswerItemList .userInfo .info span a:hover {
  color: #f30;
}
.AnswerItemList .userInfo .info span {
  display: block;
  width: 100%;
  height: 22px;
}
.AnswerItemList .userInfo .info span dl {
  display: block;
  float: left;
  font: 14px/22px "microsoft yahei";
  color: #c9c9c9;
}
.AnswerItemList .userInfo .info span em {
  display: block;
  float: left;
  font: 14px/22px "microsoft yahei";
  color: #999;
}
.AnswerItemList .content {
  width: 100%;
  height: auto;
  overflow: hidden;
  font: 16px/26px "microsoft yahei";
  color: #333;
  margin-bottom: 10px;
  position: relative;
}
.AnswerItemList .content p {
  font: 15px/26px "microsoft yahei";
  color: #333;
  margin: 4px 0;
}
.AnswerItemList .content img {
  max-width: 890px;
  height: auto;
  zoom: expression(
    function(elm) {if (elm.width>890) {var oldVW = elm.width; elm.width=890;
      elm.height = elm.height * (890 / oldVW) ;} elm.style.zoom = "1" ;} (this)
  );
}

/*展开收起*/
/* .AnswerItemList .gradient{width: 100%;height:80px;background:url(img/gradient_zz.png)repeat-x;position: absolute;bottom: 0;left: 0;} */
.AnswerItemList .read-more {
  width: 100%;
  height: auto;
  overflow: hidden;
  margin: 0 auto;
}
.AnswerItemList .read-more a {
  display: block;
  width: 120px;
  height: 30px;
  font: 14px/30px "microsoft yahei";
  text-align: center;
  color: #888;
  cursor: pointer;
  border: 1px solid #ccc;
  margin: 10px auto 0 auto;
  border-radius: 15px;
}
/*展开收起*/

.AnswerItemList .fuInfo {
  width: 100%;
  height: 50px;
  margin-bottom: 10px;
  border-bottom: 1px solid #e6e6e6;
}
.AnswerItemList .fuInfo .Fabulous {
  display: block;
  height: 32px;
  padding: 0 15px;
  border: 1px solid #ccc;
  margin-top: 8px;
  border-radius: 17px;
  float: left;
  cursor: pointer;
  transition-duration: 0.2s;
}
.AnswerItemList .fuInfo .Fabulous:hover {
  border: 1px solid rgba(76, 103, 232, 0.9);
}
.AnswerItemList .fuInfo .Fabulous span {
  display: block;
  height: 32px;
  font: 14px/32px "microsoft yahei";
  color: #666;
  float: left;
  transition-duration: 0.2s;
}
.AnswerItemList .fuInfo .Fabulous:hover span {
  color: rgba(76, 103, 232, 0.9);
}
.AnswerItemList .fuInfo .Fabulous em {
  display: block;
  height: 32px;
  margin-left: 4px;
  font: 14px/32px "microsoft yahei";
  color: #666;
  float: left;
  transition-duration: 0.2s;
}
.AnswerItemList .fuInfo .Fabulous:hover em {
  color: rgba(76, 103, 232, 0.9);
  font-weight: bold;
}
.AnswerItemList .fuInfo .Report {
  display: block;
  height: 32px;
  font: 14px/32px "microsoft yahei";
  color: #666;
  padding: 0 15px;
  border: 1px solid #ccc;
  margin-top: 8px;
  border-radius: 4px;
  float: right;
  cursor: pointer;
  transition-duration: 0.2s;
}
.AnswerItemList .fuInfo .Report:hover {
  background-color: #eaeaea;
  color: #333;
}

.pageType {
  width: 100%;
  height: auto;
  overflow: hidden;
  margin: 10px auto 10px auto;
}
.pageType .pagination {
  width: 100%;
  height: 40px;
  overflow: hidden;
  text-align: center;
}
.pageType .pagination li {
  display: inline-block;
  height: 40px;
}

.pageType .pagination li a {
  display: block;
  height: 40px;
  margin: 0 3px;
  padding: 0 15px;
  border-radius: 4px;
  background-color: #eaeaea;
  font-size: 15px;
  line-height: 40px;
  height: 40px;
  color: #151515;
  transition-duration: 0.2s;
}
.pageType .pagination li a:hover {
  background-color: rgba(76, 103, 232, 0.9);
  color: #fff;
}

.pageType .pagination li dl {
  display: block;
  height: 40px;
  margin: 0 3px;
  padding: 0 15px;
  border-radius: 4px;
  background-color: #eaeaea;
  font-size: 15px;
  line-height: 40px;
  height: 40px;
  color: #6c6b6b;
}

.pageType .pagination li span {
  display: block;
  height: 40px;
  margin: 0 3px;
  padding: 0 15px;
  border-radius: 4px;
  background-color: rgba(76, 103, 232, 0.9);
  font-size: 15px;
  line-height: 40px;
  height: 40px;
  color: #fff;
}
.pageType .pagination li.pageRemark {
  font-size: 15px;
  color: #666;
}
.pageType .pagination li.pageRemark b {
  font-size: 15px;
  color: rgba(76, 103, 232, 0.9);
  font-weight: bold;
}

/*发布提问*/
.AnswerQuestions {
  width: 100%;
  height: auto;
  overflow: hidden;
}
.AnswerQuestions .text {
  width: 100%;
  height: auto;
  overflow: hidden;
  margin-bottom: 15px;
}
.AnswerQuestions .text h2 {
  width: 90%;
  margin-left: 4px;
  height: 32px;
  font: 16px/32px "microsoft yahei";
  color: #666;
}
.AnswerQuestions .text h3 {
  display: block;
  float: right;
  height: 32px;
  font: 15px/32px "microsoft yahei";
  color: #666;
}
.AnswerQuestions .text h3 span {
  display: block;
  float: left;
  height: 32px;
  font: 15px/32px "microsoft yahei";
  color: #666;
}
.AnswerQuestions .text h3 a {
  display: block;
  float: left;
  height: 32px;
  font: 15px/32px "microsoft yahei";
  color: #09f;
}
.AnswerQuestions .text h2 span {
  color: #f60;
  font: 16px/32px "microsoft yahei";
}
.AnswerQuestions .text .input {
  border: 0;
  outline: none;
  border: 1px solid #ccc;
  border-radius: 2px;
  padding: 0 8px;
  width: 80%;
  height: 40px;
  font: 16px/40px "microsoft yahei";
  color: #666;
}
.AnswerQuestions .text select {
  border: 0;
  outline: none;
  border: 1px solid #ccc;
  border-radius: 2px;
  padding: 0 8px;
  float: left;
  height: 40px;
  font: 16px/40px "microsoft yahei";
  color: #666;
}
.AnswerQuestions .xuans {
  width: 90%;
  height: 30px;
  padding-top: 15px;
  margin: 15px 0 5px 4px;
}
.AnswerQuestions .xuans span {
  display: block;
  height: 30px;
  float: left;
  font: 16px/30px "microsoft yahei";
  color: #666;
}
.AnswerQuestions .xuans select {
  display: block;
  height: 30px;
  float: left;
  margin-left: 15px;
  padding: 0 6px;
  margin-right: 6px;
  font: 16px/30px "microsoft yahei";
  color: #666;
}
.AnswerQuestions .tijiao {
  width: 100%;
  height: 50px;
}
.AnswerQuestions .tijiao .button {
  -webkit-appearance: none;
  border: none;
  display: block;
  width: 140px;
  height: 46px;
  font: 16px/46px "microsoft yahei";
  color: #fff;
  background-color: #64c032;
  float: right;
  cursor: pointer;
  text-align: center;
  border-radius: 3px;
}
</style>