<template>
  <div class="root">
    <section>
      <sd-header :activeTab="2"></sd-header>
      <div class="topic">
        <!-- <header class="top_tips">
    		<span class="num_tip" v-if="fatherComponent == 'home'">{{level}}</span>
    		<span class="num_tip" v-if="fatherComponent == 'item'">题目{{itemNum}}</span>
        </header>-->
        <div v-if="fatherComponent == 'home'">
          <div class="home_logo item_container_style"></div>
          <router-link to="item" class="start button_style"></router-link>
        </div>
        <div v-if="fatherComponent == 'item'" class="option">
          <div class="item_back item_container_style">
            <div class="timer">
              <div class="showTime">{{callinTime}}</div>
            </div>
            <div class="item_list_container" v-if="itemDetail.length > 0">
              <header class="item_title">{{itemNum}}. {{itemDetail[itemNum-1].title}}：</header>
              <div class="view">
                <div class="content-text" @click="viewContent()">查看解析</div>
                <div class="question" @click="haveQuestion()">重答</div>
                <div class="question" @click="invite()">邀约讲解</div>
                <div class="question" @click="createNode=true">添加笔记</div>
              </div>
              <el-input
                type="textarea"
                rows="8"
                class="option_content"
                placeholder="请在这里输入您的回答......"
                v-model.trim="contentText"
                v-if="exam === '文本题'"
              ></el-input>
              <ul>
                <li
                  v-for="(item, index) in itemDetail[itemNum-1].answers"
                  @click="choosed(index, item.select_code, item.id)"
                  class="item_list"
                  :key="index"
                >
                  <span
                    class="option_style"
                    v-bind:class="{'has_choosed':choosedNum==index}"
                  >{{chooseType(index)}}</span>
                  <span class="option_detail">{{item.content}}</span>
                </li>
                <p class="content1" v-if="getContent">{{itemDetail[itemNum-1].analyzations}}</p>
                <div v-if="showInvite">
                  <textarea class="content2" placeholder="请将疑惑用简短的话描述下吧~~" v-model="textContent"></textarea>
                  <div class="integral">
                    <span class="reward">悬赏积分:</span>
                    <span
                      class="fen"
                      v-for="(item, index) in reward"
                      :key="index"
                      @click="choosedReward(index)"
                    >
                      <div :class="{'fen-choosed':choosedFen==index}">{{item.jifen}}</div>
                    </span>
                  </div>
                  <div class="post-question" @click="postInvite">发布邀约</div>
                </div>
              </ul>
            </div>
          </div>
        </div>
      </div>
      <el-dialog title width="1000px" :visible="createNode" :before-close="createNodeClose">
        <p class="nodeContent">请添加笔记内容：</p>
        <el-input type="textarea" :rows="4" placeholder="请输入内容..." v-model="nodeText"></el-input>
        <span slot="footer" class="dialog-footer">
          <el-button @click="createNodeClose">取 消</el-button>
          <el-button type="primary" @click="nodeConfirm">确 定</el-button>
        </span>
      </el-dialog>
      <span class="next_item button_style" @click="nextItem" v-if="itemNum < itemDetail.length"></span>
      <span class="submit_item button_style" v-else @click="submitAnswer"></span>
    </section>
    <page-footer class="heigh"></page-footer>
  </div>
</template>

<script>
import PageFooter from "~/components/pageFooter";
import SdHeader from "~/components/navBar";
import { mapState, mapActions } from "vuex";
import {
  apiSelectQuestion,
  apiSelectAnswer,
  apiCreateInvite,
  apiSelectBehavior,
  apiContentQuestion,
  apiContentAnswer
} from "~/servers/api/questions";
import { apiUserDetail } from "~/servers/api/user";

export default {
  name: "itemcontainer",
  data() {
    return {
      itemId: null, //题目ID
      choosedNum: null, //选中答案索引
      choosedId: null, //选中答案id
      getContent: false, // 查看解析
      isTrue: true, //选择答案是正确
      showInvite: false, // 显示邀约框
      textContent: "",
      choosedFen: 0, // 选中积分的索引
      // 悬赏积分列表
      reward: [
        { id: 1, jifen: "5分" },
        { id: 1, jifen: "10分" },
        { id: 1, jifen: "20分" }
      ],
      type: this.$route.query.type,
      itemDetail: [], // 题目内容
      question_id: "", // 当前题目id
      created_time: null, // 创建邀约时间
      updated_time: null, // 创建邀约更新时间
      totalScore: 0, // 总分
      totalContentScore: 0, // 文本题分数
      owner: "", // 用户id
      is_correct: "", // 答案是否正确
      answers_id: "", // 获取当前选中id
      callinTime: "0:0:0",
      loading: false, // 加载
      createNode: false, // 添加笔记
      nodeText: "", // 笔记内容
      exam: this.$route.query.exam, // 题型
      contentText: "", // 文本题输入
      analyzations: "" // 文本题答案是否正确
    };
  },
  props: ["fatherComponent"],
  computed: mapState([
    "itemNum", //第几题
    "level" //第几周
  ]),
  mounted() {
    this.getSelectQuestion();
    this.start(true);
  },
  methods: {
    // 计时器
    start(bolean) {
      let _this = this;
      let hour, minute, second;
      hour = minute = second = 0;
      if (bolean === true) {
        _this.timer = setInterval(function() {
          if (second >= 0) {
            second = second + 1;
          }
          if (second >= 60) {
            second = 0;
            minute = minute + 1;
          }
          if (minute >= 60) {
            minute = 0;
            hour = hour + 1;
          }
          _this.callinTime = hour + ":" + minute + ":" + second;
        }, 1000);
      } else {
        window.clearInterval(_this.timer);
      }
    },
    // 记录用户操作行为
    async recordSelectBehavior() {
      const userInfo = await apiUserDetail("get");
      this.owner = userInfo.id;
      const data = await apiSelectBehavior(
        this.question_id,
        this.answers_id,
        this.owner,
        5,
        this.is_correct
      );
    },
    // 获取选择题信息
    async getSelectQuestion() {
      const exam = this.$route.query.exam;

      // 根据不同题型请求不同接口
      if (exam == "顺序答题（选择题）") {
        const data = await apiSelectQuestion(this.$route.query.type, "get");
        this.itemDetail = data.results;
        this.itemDetail.answers = data.results.answers;
        this.question_id = this.itemDetail[this.itemNum - 1].id;
      } else if (exam == "文本题") {
        const data = await apiContentQuestion(this.$route.query.type, "get");
        this.itemDetail = data.results;
        this.question_id = this.itemDetail[this.itemNum - 1].id;
        this.analyzations = data.results.analyzations;
        console.log("itemDetail", this.itemDetail);
      }
    },
    ...mapActions(["addNum", "initializeData"]),
    //点击下一题
    nextItem() {
      this.showInvite = false;
      this.getContent = false;
      if (this.contentText == "") {
        this.$notify({
          title: "提示",
          message: "您还没有输入答案哦~~",
          type: "warning"
        });
      }
      if (this.contentText !== "" || this.choosedNum !== null) {
        this.contentText = "";
        this.choosedNum = null;
        //保存答案, 题目索引加一，跳到下一题
        this.addNum(this.choosedId);
      } else if (!this.exam === "文本题") {
        this.$notify({
          title: "失败",
          message: "您还没有选择答案哦",
          type: "warning"
        });
      }
      if (!this.exam === "文本题") {
        this.recordSelectBehavior();
      }
    },
    // 添加笔记
    createNodeClose() {
      this.nodeText = "";
      this.createNode = false;
    },
    // 点击添加笔记的确认按钮
    nodeConfirm() {
      //提交回访内容
      let nodeText = this.nodeText;
      if (nodeText) {
        if (nodeText.length > 500) {
          this.$notify({
            title: "警告",
            message: `笔记内容只能输入500个字哦~~`,
            type: "warning"
          });
          return;
        }
        // this.$api.caseTrial
        //   .addReturnVisit({
        //     refuseApplyId: this.currentId,
        //     content: hasReturnVisitStr
        //   })
        //   .then(() => {
        this.$notify({
          title: "成功",
          message: "添加笔记成功,您可到个人详情页查看~",
          type: "success"
        });
        this.createNode = false;
        this.nodeText = "";
        // })
        return;
      }
      this.$notify({
        title: "失败",
        message: `请填写笔记内容`,
        type: "error"
      });
    },
    //索引0-3对应答案A-B
    chooseType: type => {
      switch (type) {
        case 0:
          return "A";
        case 1:
          return "B";
        case 2:
          return "C";
        case 3:
          return "D";
      }
    },
    //选中的答案信息
    choosed(type, id, answers_id) {
      this.answers_id = answers_id;
      this.choosedNum = type;
      this.choosedId = id;
      if (this.choosedId != this.itemDetail[this.itemNum - 1].correct_code) {
        this.$notify({
          title: "错误",
          message: "哎呀~，回答错误啦😝",
          type: "error"
        });
        this.is_correct = false;
      } else {
        this.$notify({
          title: "正确",
          message: "真聪明，回答正确!",
          type: "success"
        });
        this.is_correct = true;
        this.totalScore += 10;
      }
    },
    // 选中的积分信息
    choosedReward(index) {
      this.choosedFen = index;
    },
    // 查看解析
    viewContent() {
      this.getContent = !this.getContent;
    },
    // 重答
    haveQuestion() {
      this.contentText = "";
      this.choosedNum = null;
    },
    // 邀约讲解
    invite() {
      this.showInvite = !this.showInvite;
    },
    // 发布邀约
    async postInvite() {
      if (this.textContent == "") {
        this.$notify({
          title: "失败",
          message: "邀约内容不能为空哦~",
          type: "warning"
        });
        return;
      } else {
        const userInfo = await apiUserDetail("get");
        this.owner = userInfo.id;
        const data = await apiCreateInvite(
          Number(this.$route.query.type),
          this.owner,
          this.choosedFen,
          this.textContent,
          this.question_id,
          this.created_time,
          this.updated_time
        );
        console.log("创建邀约", data);
        this.$notify({
          title: "成功",
          message: "发布邀约成功,您可到信息广场查看~",
          type: "success"
        });
        this.showInvite = false;
      }

      console.log(this.textContent);
    },
    //到达最后一题，交卷，请空定时器，跳转分数页面
    async submitAnswer() {
      if (this.contentText == "") {
        this.$notify({
          title: "提示",
          message: "您还没有输入答案哦~~",
          type: "warning"
        });
      } else {
        console.log("9999999999999", this.contentText == this.analyzations);
        // 这里判断都是false
        // const data = await apiContentAnswer('post');
        // console.log(data);
        this.totalContentScore += 10;
        this.$router.push(
          `/exercise/score/?totalScore=${this.totalContentScore}&timer=${
            this.callinTime
          }`
        );
      }
      if (!(this.exam === "文本题") && this.choosedNum !== null) {
        this.recordSelectBehavior();
        this.addNum(this.choosedId);
        this.$router.push(
          `/exercise/score/?totalScore=${this.totalScore}&timer=${
            this.callinTime
          }`
        );
      } else if (!(this.exam === "文本题")) {
        this.$notify({
          title: "失败",
          message: "您还没有选择答案哦",
          type: "warning"
        });
      }
    }
  },
  created() {
    //初始化信息
    this.initializeData();
    // document.body.style.backgroundImage = 'url(./static/img/1-1.jpg)';
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
.option_content {
  width: 94.5%;
  margin-top: 30px;
}
.nodeContent {
  font-size: 15px;
  margin: 20px 20px 20px 0;
}
.timer {
  width: 80px;
  height: 80px;
  border-radius: 50%;
  background: rgba(245, 173, 27, 0.8);
  margin: auto;
  margin-top: 20px;
  box-shadow: 0 1px 10px rgba(245, 173, 27, 0.8);
}
.showTime {
  font-size: 23px;
  color: #fff;
  font-weight: bold;
  line-height: 80px;
  text-align: center;
}
.heigh {
  // position: relative;
  margin-top: 165px;
}
.topic {
  box-shadow: 0 2px 10px #d9d9d9, inset 0 10px 1px #f1f1f1;
  display: flex;
  justify-content: space-around;
  max-width: 1180px;
  margin: 80px auto;
  background: #fff;
  box-shadow: 0 1px 1px #d9d9d9, inset 0 1px 1px #f1f1f1;
}
.option {
  display: flex;
  padding-bottom: 40px;
}
.option_true {
  color: green;
}
.option_false {
  color: red;
}
.top_tips {
  height: 15.35rem;
  width: 15.25rem;
  top: 2.3rem;
  right: 1.6rem;
  background-size: 100% 100%;
  z-index: 10;
  .num_tip {
    left: 0.48rem;
    bottom: 1.1rem;
    height: 0.7rem;
    width: 2.5rem;
    font-size: 0.6rem;
    font-family: "黑体";
    font-weight: 600;
    color: #a57c50;
    text-align: center;
  }
}
.home_logo {
  background-image: url(../images/1-2.png);
  background-size: 13.142rem 100%;
  background-position: right center;
}
.button_style {
  display: block;
  height: 2.1rem;
  width: 4.35rem;
  background-size: 100% 100%;
  left: 50%;
  margin-left: -2.4rem;
  background-repeat: no-repeat;
}
.start {
  background-image: url(../images/1-4.png);
}
.next_item {
  // position: absolute;
  width: 120px;
  height: 60px;
  margin: 10px auto;
  background-image: url(../images/2-2.png);
}
.submit_item {
  width: 120px;
  height: 60px;
  margin: 10px auto;
  background-image: url(../images/3-1.png);
}
.item_list_container {
  font-family: Lucida Grande, Helvetica, Arial, Verdana, sans-serif;
  font-size: 18px;
}
.item_title {
  color: #000;
  margin-top: 50px;
  margin-bottom: 25px;
  // font-size: 20px;
  // font-weight:
}
.item_list {
  margin-top: 1rem;
  span {
    display: inline-block;
    font-size: 0.6rem;
    color: #000;
    vertical-align: middle;
  }
  .option_style {
    height: 1.725rem;
    width: 1.725rem;
    border: 1px solid #fff;
    border-radius: 50%;
    line-height: 1.725rem;
    text-align: center;
    margin-right: 0.3rem;
    font-size: 17px;
    font-family: "Arial";
  }
  .has_choosed {
    background-color: #ffd400;
    color: #575757;
    border-color: #ffd400;
  }
  .option_false {
    font-size: 17px;
    margin-left: 15px;
    color: red;
  }
  .option_detail {
    font-size: 17px;
    margin-left: 15px;
  }
}
.view {
  // position: relative;
  margin-left: 600px;
  margin-right: 50px;
  font-size: 15px;
  text-align: right;
  color: #34373f;
  // font-weight: bold;
  padding-bottom: 8px;
  height: 30px;
  line-height: 30px;
  // width: 70px;
  text-align: center;
  text-decoration: underline;

  .content-text {
    float: left;
    background: #007fff;
    width: 64px;
    color: #fff;
    border-radius: 3px;
    font-weight: bold;
    font-size: 14px;
  }
  .question {
    background: #007fff;
    float: left;
    width: 64px;
    margin-left: 15px;
    color: #fff;
    border-radius: 3px;
    font-weight: bold;
    font-size: 14px;
  }
}
.content1 {
  overflow: hidden;
  font-size: 16px;
  color: #000;
  line-height: 30px;
  margin: 30px 50px 20px 0;
  background: #f5f5f5;
  padding: 10px;
  width: 900px;
}
.content2 {
  overflow: hidden;
  font-size: 16px;
  color: #000;
  line-height: 30px;
  background: #f5f5f5;
  padding: 10px;
  margin-top: 30px;
  width: 899px;
  height: 120px;
  color: #333;
  border-radius: 4px;
}
.post-question {
  overflow: hidden;
  // text-align: right;
  // margin-right: 50px;
  margin-top: 20px;
  margin-left: 770px;
  background-color: #007fff;
  width: 85px;
  height: 30px;
  line-height: 30px;
  text-align: center;
  color: #fff;
  font-size: 16px;
}
.integral {
  width: 280px;
  display: flex;
  justify-content: space-between;
  margin-top: 30px;
  .reward {
    font-size: 16px;
    color: #333;
  }
  .fen {
    width: 64px;
    text-align: center;
    font-size: 15px;
    border-radius: 50px;
    border: 1px solid #007fff;
  }
}
.fen-choosed {
  background: #007fff;
  width: 64px;
  color: #fff;
  text-align: center;
  border-radius: 50px;
  border: 1px solid #007fff;
}
</style>

