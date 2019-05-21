<template>
  <div class="root">
    <section>
      <sd-header :activeTab="2"></sd-header>
      <div class="wrap">
        <div class="aside" v-if="fatherComponent == 'home'">
          <ul class="menu">
            <li class="menu-li" v-for="(title,index) in menuList" @click="cur=index"
                :class="{active:cur==index}"
                :key="index">{{title}}</li>
          </ul>
        </div>
        <div class="bigbox" v-for="(m,index) in tab" v-show="cur==index" :key="index">
          <div class="begin" v-if="fatherComponent == 'home'" >
            <div >{{m.title}}</div>
            <div class="topic">
              <div class="topic-title">课程题目：{{m.channel}}</div>
              <div class="topic-number">题型：<span class="grade">{{m.exam}}</span></div>
              <div class="topic-number">（共{{m.type}}题）</div>
              <div class="topic-star">题目难度：<span class="grade">{{desc}}</span>（积分：<span class="grade">{{score}}</span>）</div>
            </div>
            <!-- <h2>请认真完成测试题。准备好了吗？</h2> -->
            <!-- <a href="/exercise/item" class="start button_style" @click="getQuestionList()"></a> -->
            <a class="start button_style" @click="getSelectQuestion()"></a>
          </div>
        </div>
      </div>

      <div v-if="fatherComponent == 'home'">
        <div class="home_logo item_container_style"></div>
      </div>
      <div v-if="fatherComponent == 'item'">
        <div class="item_back item_container_style">
          <div class="item_list_container" v-if="itemDetail.length > 0">
            <header class="item_title">{{itemDetail[itemNum-1].title}}</header>
            <ul>
              <li
                v-for="(item, index) in itemDetail[itemNum-1].topic_answer"
                @click="choosed(index, item.topic_answer_id)"
                class="item_list"
                :key="index"
              >
                <span
                  class="option_style"
                  v-bind:class="{'has_choosed':choosedNum==index}"
                >{{chooseType(index)}}</span>
                <span class="option_detail">{{item.answer_name}}</span>
              </li>
            </ul>
          </div>
        </div>
        <span class="next_item button_style" @click="nextItem" v-if="itemNum < itemDetail.length"></span>
        <span class="submit_item button_style" v-else @click="submitAnswer"></span>
      </div>
    </section>
    <page-footer class="heigh"></page-footer>
  </div>
</template>

<script>
import PageFooter from "~/components/pageFooter";
import { mapState, mapActions } from "vuex";
import SdHeader from "~/components/navBar";
import * as api from "~/assets/api";
import { apiSelectQuestion } from "~/servers/api/questions";
import { apiUserDetail } from "~/servers/api/user";
import img from '../images/icons.jpg'

export default {
  name: "itemcontainer",
  data() {
    return {
      itemId: null, //题目ID
      choosedNum: null, //选中答案索引
      choosedId: null, //选中答案id
      menuList: [
        "顺序答题", "乱序答题", "文本题"
      ],
      cur: 0,  // 默认选中第一个
      tab: [{title: "内容一", checkFlag: 0, channel: this.$route.query.channel, type: this.$route.query.id, exam: '顺序答题（选择题）'}, {title: "内容二", checkFlag: 1, channel: this.$route.query.channel, type: this.$route.query.id,  exam: '乱序答题（选择题）'}, {title: "内容三", checkFlag: 2, channel: this.$route.query.channel, type:this.$route.query.id,  exam: '文本题'}],
      score: '', // 用户积分
      desc: ''  // 题目描述
    };
  },
  props: ["fatherComponent"],
  computed: mapState([
    "itemNum", //第几题
    "level", //第几周
    "itemDetail", //题目详情
  ]),
  methods: {
    ...mapActions(["addNum", "initializeData"]),
    // 获取用户信息
    async getUserInfo() {
      const userInfo = await apiUserDetail("get");
      this.score = userInfo.score
      // 分数对应不同等级
      switch (parseInt(this.score/1000)) {
        case 0:
        this.desc = '简单'
         break
        case 1:
        case 2:
        case 3:
        case 4:
        this.desc = '容易'
         break
        case 5:
        case 6:
        case 7:
        case 8:
        case 9:
        this.desc ='一般'
         break
        case 10:
        this.desc = '较难'
         break
        default:
        this.desc = '极难'
        break
      }
      console.log('userInfo', this.score / 1000)
    },
    // 点击开始
    async getSelectQuestion() {
      const data = await apiSelectQuestion(this.$route.query.type, "get");
      this.itemDetail = data.results;
      window.location.href = `/exercise/item/?type=${this.$route.query.type}&exam=${this.tab[this.cur].exam}`;
      console.log("data9999", this.itemDetail);
    },
    //点击下一题
    nextItem() {
      if (this.choosedNum !== null) {
        this.choosedNum = null;
        //保存答案, 题目索引加一，跳到下一题
        this.addNum(this.choosedId);
      } else {
        alert("您还没有选择答案哦");
      }
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
    choosed(type, id) {
      this.choosedNum = type;
      this.choosedId = id;
    },
    //到达最后一题，交卷，请空定时器，跳转分数页面
    submitAnswer() {
      if (this.choosedNum !== null) {
        this.addNum(this.choosedId);
        this.$router.push("score");
      } else {
        alert("您还没有选择答案哦");
      }
    }
  },
  created() {
    //初始化信息
    this.initializeData();
    // document.body.style.backgroundImage = 'url(./static/img/1-1.jpg)';
  },
  mounted() {
    this.getUserInfo()
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
.grade {
  color: #A31E31;
}
.menu {
  padding-top: 140px;
}
.menu-li {
  font-size: 17px;
  color: #A31E31;
  font-weight: bold;
  list-style-type: none;
  text-align: center;
  cursor: pointer;
  line-height: 80px;
  transition: all 0.4s;
  border-bottom: 1px solid #f5f5f5;
}
.menu-li:hover {
  background: rgba(245, 173, 27, 0.6);
  color: #fff;
}
.aside {
  width: 160px;
  height: 450px;
  // background: rgba(245,173,27,.5);
  background: url(../images/aside-bg.jpg);
  background-position: 0px -245px;
  // background: #fff;
  float:left;
  margin-left: 120px;
  box-shadow: 0 2px 2px #d9d9d9, inset 0 2px 2px #f1f1f1;
}
.topic {
  margin-top: 190px;
  display: flex;
  align-items: center;
  justify-content: center;
  flex-direction: column;
  height: 300px;
  line-height: 40px;
  background: #f5f5f5;
  border-radius: 10px;
}
.topic-title {
  font-size: 18px;
  color: #6c6c6c;
  font-size: 22px;
  font-weight: bold;
}
.topic-number {
  font-size: 18px;
  color: #6c6c6c;
  font-size: 18px;
}
.topic-star {
  font-size: 18px;
  color: #6c6c6c;
  // width: 230px;
  // height: 55px;
  cursor: pointer;
  // background-image: url(../images/icons.jpg);
  background-repeat: no-repeat;
  // background-position: 70px -1px;
}
.bigbox {
  display: flex;
  justify-content: space-around;
  max-width: 1020px;
  // margin: 0px auto;
  background: #fff;
  box-shadow: 0 1px 1px #d9d9d9, inset 0 1px 1px #f1f1f1;
  .begin {
    width: 680px;
    height: 778px;
    border-radius: 20px;
    h2 {
      margin-top: 20px;
      text-align: center;
      font-family: "Microsoft yahei", sans-serif;
      color: #6c6c6c;
      line-height: 32px;
      font-size: 18px;
      font-weight: bold;
    }
  }
}
.top_tips {
  position: absolute;
  height: 7.35rem;
  width: 3.25rem;
  top: 1.3rem;
  right: 1.6rem;
  background-size: 100% 100%;
  z-index: 10;
  .num_tip {
    position: absolute;
    // left: 0.48rem;
    // bottom: 1.1rem;
    // height: 0.7rem;
    // width: 2.5rem;
    font-size: 0.6rem;
    font-family: "黑体";
    font-weight: 600;
    color: #a57c50;
    text-align: center;
  }
}
.item_container_style {
  height: 11.625rem;
  width: 13.15rem;
  background-repeat: no-repeat;
  position: absolute;
  top: 0.1rem;
  left: 18rem;
}
.home_logo {
  // background-image: url(../images/1-2.png);
  // background-size: 14.142rem 100%;
  // background-position: left center;
}
.item_back {
  padding-top: 195px;
  background-image: url(../images/2-1.png);
  background-size: 100% 100%;
}
.button_style {
  display: block;
  height: 2.1rem;
  width: 4.35rem;
  background-size: 100% 100%;
  position: absolute;
  // top: 16.5rem;
  left: 50%;
  background-repeat: no-repeat;
}
.start {
  margin-top: 50px;
  width: 120px;
  height: 60px;
  background-image: url(../images/1-4.png);
}
.next_item {
  background-image: url(../images/2-2.png);
}
.submit_item {
  background-image: url(../images/3-1.png);
}
.item_list_container {
  position: absolute;
  height: 7rem;
  width: 8rem;
  top: 2.4rem;
  left: 3rem;
  -webkit-font-smoothing: antialiased;
}
.item_title {
  font-size: 45px;
  color: #000;
  font-size: 0.65rem;
  line-height: 2.7rem;
}
.item_list {
  font-size: 0;
  margin-top: 0.4rem;
  width: 10rem;
  span {
    display: inline-block;
    font-size: 0.6rem;
    vertical-align: middle;
  }
  .option_style {
    height: 0.725rem;
    width: 0.725rem;
    border-radius: 50%;
    line-height: 0.725rem;
    text-align: center;
    margin-right: 0.3rem;
    font-size: 0.5rem;
    font-family: "Arial";
  }
  .has_choosed {
    background-color: #ffd400;
    color: #575757;
    border-color: #ffd400;
  }
  .option_detail {
    width: 7.5rem;
    padding-top: 0.11rem;
  }
}
</style>
