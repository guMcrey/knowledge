<template>
  <div>
    <sd-header :activeTab="3"></sd-header>
    <div class="root">
      <div class="newsCenterPanel">
        <div class="title">
          <a href="#" target="_self">最新邀约</a>
        </div>
        <div class="newsCenterPanel_inner">
          <div v-for="(item, index) in informationList" :key="index">
            <div class="newContentBox odd" @click="openInfo(item)">
              <a hidefocus="true" href="#">
                <div class="time">
                  <p class="day">{{item.type}}</p>
                </div>
                <div class="bigTitle">
                  <div class="newTitle">{{item.content}}</div>
                  <div class="ym">{{item.username}} 发布于：{{item.created_time}}</div>
                  <div class="reward">悬赏积分：{{item.score}}</div>
                </div>
                <div class="newTitleIcon"></div>
                <div class="border"></div>
                <div class="newContent">{{item.question.title}}</div>
              </a>
            </div>
            <div class="openContent" v-if="item.checkFlag">
              <div class="content-text">
                <div v-for="(sitem, index) in item.question.answers" :key="index">
                  <div class="openContent-option">{{sitem.select_code}}. {{sitem.content}}</div>
                </div>
                <div class="openContent-info">{{item.question.analyzations}}</div>

                <div class="openContent-reply" @click="createReply()">添加评论</div>
                <div class="open-content" v-if="showCreate">
                  <textarea class="create-input" placeholder="请输入你的观点..." v-model="answerContent"></textarea>
                  <div class="create-button" @click="createAnswer(item)">发送</div>
                </div>
                <!-- 评论成功后生成下面的样子 -->
                <div class="open-content" v-for="(sitem, index) in item.answers" :key="index">
                  <div class="openContent-allReply">
                    <img class="user-avator" src="./img/avator.jpg">
                    <div class="middle">
                      <div class="user-name">{{sitem.username}}</div>
                      <div class="reply-text">{{sitem.content}}</div>
                      <div class="bottom">
                        <div class="repaly-time">发表于 {{sitem.created_time}}</div>
                        <!-- <div class="repaly-reply" @click="replyNow()">点击回复</div> -->
                      </div>
                    </div>
                    <div class="user-grade">用户等级</div>
                  </div>
                  <div class="click-reply" v-if="showReplyNow">
                    <textarea class="reply-input" placeholder="请输入你的观点..."></textarea>
                    <div class="reply-button">发送</div>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
    <page-footer></page-footer>
  </div>
</template>
<script>
import PageFooter from "~/components/pageFooter";
import SdHeader from "~/components/navBar";
import { apiInformationList, apiCreateAnswer } from "~/servers/api/questions";
import { apiUserDetail } from "~/servers/api/user";

// 悬赏积分
const rewardMap = {
  0: "5分",
  1: "10分",
  2: "20分"
};
// 问题类型
const typeMap = {
  0: "基础",
  1: "C语言",
  2: "C++",
  3: "大数据",
  4: "计算机",
  5: "数据库",
  6: "数据结构",
  7: "图形学",
  8: "Java",
  9: "网络",
  10: "Python",
  11: "测试",
  12: "OS"
};
// 选项列表
const optionMap = {};
export default {
  data() {
    return {
      showInfo: false, // 展开提问详情
      showCreate: false, // 创建评论
      showReplyNow: false, // 点击回复
      informationList: [], // 邀约讲解
      score: "", // 悬赏积分
      quesitonList: [], // 问题详情
      answerContent: "", // 回复内容
      information_id: "" // 邀约信息id
    };
  },
  mounted() {
    this.getInformation();
  },
  methods: {
    // 获取邀约讲解列表
    async getInformation() {
      const data = await apiInformationList("get");
      this.informationList = data.results;
      this.informationList.forEach(res => {
        this.$set(res, "checkFlag", false);
      });
      this.score = this.informationList.forEach(res => {
        res.score = rewardMap[res.score];
        res.type = typeMap[res.type];
        return res.score, res.type;
      });
    },
    // 点击问题列表
    openInfo(item) {
      // 只显示一个
      item.checkFlag = !item.checkFlag;
    },
    // 展示邀约评论
    createReply() {
      this.showCreate = !this.showCreate;
    },
    // 点击 点击回复
    // replyNow() {
    //   this.showReplyNow = !this.showReplyNow;
    // },
    // 创建邀约 
    async createAnswer(item) {
      const userInfo = await apiUserDetail("get");
      const owner = userInfo.id;
      const data = await apiCreateAnswer(
        owner,
        item.id,
        this.answerContent,
        null,
        null
      );
      this.getInformation()
      this.$message("评论成功~");
    }
  },
  components: {
    PageFooter,
    SdHeader
  }
};
</script>
<style scoped>
* {
  padding: 0;
  margin: 0;
  font-family: "微软雅黑";
}
.root {
  background: #f5f5f5;
}
ul {
  list-style: none;
}
a {
  text-decoration: none;
}
.newsCenterPanel {
  box-shadow: 0 2px 10px #d9d9d9, inset 0 10px 1px #f1f1f1;
  width: 1150px;
  /* height: 793px; */
  background: #fff;
  /* overflow: hidden; */
  padding-bottom: 100px;
  margin: 40px auto 0;
}
.newsCenterPanel .title {
  /* position: relative; */
  width: 560px;
  height: 85px;
  line-height: 85px;
  margin: 35px auto 30px auto;
  font-size: 20px;
  font-weight: bold;
  padding-top: 30px;
  /* background: url(./img/3678.png) center no-repeat; */
}
.newsCenterPanel .title a {
  display: block;
  width: 100%;
  color: #f5ad1b;
  text-align: center;
}
.newsCenterPanel_inner {
  /* width: 100%; */
  display: flex;
  align-items: center;
  justify-content: center;
  flex-direction: column;
  /* margin: 0 auto; */
}
.newsCenterPanel_inner .newContentBox {
  /* float: left; */
  width: 850px;
  height: 118px;
  text-align: left;
  vertical-align: top;
  position: relative;
}
.newsCenterPanel_inner .newContentBox.odd {
  /* margin-right: 100px; */
}
.newsCenterPanel_inner .newContentBox a {
  cursor: pointer;
}
.newsCenterPanel_inner .newContentBox .newTitle {
  float: left;
  line-height: 44px;
  height: 50px;
  font-size: 18px;
  color: #333;
  /* width: 400px; */
  /* margin-right: 300px; */
  white-space: nowrap;
  word-break: normal;
  overflow: hidden;
  text-overflow: ellipsis;
}
.newTitle {
  width: 280px;
  text-align: left;
}
.reward {
  width: 100px;
  margin-right: 60px;
  height: 30px;
  line-height: 30px;
  border: 1px solid #4c67e8;
  text-align: center;
  border-radius: 50px;
  color: #4a68ec;
}
.newsCenterPanel_inner .newContentBox a:hover .newTitleIcon {
  background-color: #4a68ec;
}
.newsCenterPanel_inner .newContentBox .newTitleIcon {
  width: 19px;
  height: 19px;
  background: url(./img/plus.png) center no-repeat;
  background-color: #979696;
  position: absolute;
  right: 0;
  top: 14px;
}
.newsCenterPanel_inner .newContentBox .border {
  left: 87px;
  top: 44px;
  width: 21px;
  border-top: 1px solid #4a68ec;
}
.newsCenterPanel_inner .newContentBox .newContent {
  float: left;
  /* height: 50px; */
  width: 620px;
  font-size: 15px;
  line-height: 28px;
  color: #b0b0b0;
  margin-bottom: 50px;
  overflow: hidden;
  /* word-wrap: break-word;
  text-overflow: ellipsis; */
  display: -webkit-box;
  -webkit-box-orient: vertical;
  -webkit-line-clamp: 1;
  overflow: hidden;
}
.newContentBox .time {
  width: 54px;
  height: 54px;
  line-height: 54px;
  border: 1px solid #4a68ec;
  background: #fff;
  text-align: center;
  margin-right: 40px;
  margin-top: 14px;
  float: left;
  border-radius: 100px;
}
.newContentBox .time .day {
  line-height: 34px;
  font-size: 18px;
  color: #4c67e8;
  padding: 6px 0 0 0;
}
.newContentBox .time .ym {
  font-size: 18px;
  color: #f5f5f5;
}
.ym {
  font-size: 14px;
}
.newContentBox a:hover .time {
  background: #4a68ec;
}
.newContentBox a:hover .day {
  color: #fff;
}
.newContentBox a:hover .ym {
  color: #b5bcf3;
}
.newContentBox a:hover .reward {
  background: #4c67e8;
  color: #fff;
}

.openContent {
  border: 1px solid #ccc;
  width: 800px;
  border-radius: 6px;
  margin-bottom: 30px;
  background: #f5f5f5;
}
.bigTitle {
  display: flex;
  align-items: center;
  justify-content: space-between;
}
.content-text {
  padding-top: 20px;
  padding-left: 65px;
}
.openContent-option {
  font-size: 16px;
  color: #333;
  line-height: 30px;
}
.openContent-info {
  font-size: 15px;
  color: #333;
  background: #fff;
  width: 650px;
  height: 30px;
  margin-top: 13px;
  line-height: 30px;
  padding-left: 20px;
  border-radius: 2px;
}
.openContent-reply {
  background: #f5ad1b;
  margin-left: 570px;
  width: 67px;
  height: 20px;
  margin-top: 10px;
  margin-bottom: 10px;
  text-align: center;
  line-height: 20px;
  color: #fff;
  font-size: 14px;
  border-radius: 2px;
}
.create-input {
  width: 610px;
  height: 40px;
  border-radius: 3px;
}
.create-button {
  background: #f5ad1b;
  margin-left: 560px;
  width: 50px;
  height: 20px;
  margin-top: 10px;
  margin-bottom: 10px;
  text-align: center;
  line-height: 20px;
  color: #fff;
  font-size: 14px;
}
.open-content {
  background: #fff;
  width: 650px;
  padding: 20px;
  margin-bottom: 30px;
  border-radius: 2px;
}

.openContent-allReply {
  display: flex;
  justify-content: space-between;
}
.user-avator {
  background: #ccc;
  width: 50px;
  height: 50px;
  border-radius: 50%;
}
.middle {
  width: 480px;
  margin-left: 20px;
}
.user-name {
  color: #f5ad1b;
  height: 20px;
  line-height: 20px;
  font-size: 12px;
}
.reply-text {
  font-size: 14px;
  height: 30px;
  line-height: 30px;
  color: #333;
}
.bottom {
  display: flex;
  justify-content: space-between;
  width: 533px;
}
.repaly-time {
  font-size: 12px;
  color: #999;
  height: 20px;
  line-height: 20px;
}
.repaly-reply {
  color: #f5ad1b;
  font-weight: bold;
}
.user-grade {
  background: #b5bcf3;
  height: 20px;
  line-height: 20px;
  text-align: center;
  color: #fff;
  font-size: 12px;
  border-radius: 2px;
}
.click-reply {
  padding: 10px;
  margin: 20px auto;
  width: 600px;
  background-color: #f5f5f5;
  border-radius: 2px;
}
.reply-input {
  width: 580px;
  height: 40px;
  border-radius: 3px;
}
.reply-button {
  background: #f5ad1b;
  margin-left: 530px;
  width: 50px;
  height: 20px;
  margin-top: 10px;
  margin-bottom: 10px;
  text-align: center;
  line-height: 20px;
  color: #fff;
  font-size: 14px;
  border-radius: 2px;
}
</style>
