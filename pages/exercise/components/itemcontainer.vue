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
            <div class="item_list_container" v-if="itemDetail.length > 0">
              <header class="item_title">{{itemDetail[itemNum-1].topic_name}}：</header>
              <div class="view">
                <p class="content-text" @click="viewContent()">查看解析</p>
                <p class="question" @click="haveQuestion()">重答</p>
                <p class="question" @click="invite()">邀约讲解</p>
              </div>
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
                <p class="content1" v-if="getContent">{{itemDetail[itemNum-1].view_content}}</p>
                <div v-if="showInvite">
                  <textarea class="content2" placeholder="请将疑惑用简短的话描述下吧~~" v-model="textContent"></textarea>
                  <div class="integral">
                    <span class="reward">悬赏积分:</span>
                    <span class="fen" v-for="(item, index) in reward" :key="index">
                      <span :class="{'fen-choosed':choosedFen==index}">{{item.jifen}}</span>
                    </span>
                  </div>
                  <div class="post-question" @click="postInvite">发布邀约</div>
                </div>
              </ul>
            </div>
          </div>
        </div>
      </div>
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
      choosedFen: null, // 选中积分的索引
      // 悬赏积分列表
      reward: [{ id: 1, jifen: 1 }, { id: 1, jifen: 5 }, { id: 1, jifen: 10 }]
    };
  },
  props: ["fatherComponent"],
  computed: mapState([
    "itemNum", //第几题
    "level", //第几周
    "itemDetail", //题目详情
    "timer" //计时器
  ]),
  methods: {
    ...mapActions(["addNum", "initializeData"]),
    //点击下一题
    nextItem() {
      this.showInvite = false;
      this.getContent = false;
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
      if (this.choosedNum != 1) {
        this.$message("哎呀~，回答错误啦😝");
      } else {
        this.$message("真聪明，回答正确!");
      }
    },
    // 查看解析
    viewContent() {
      this.getContent = !this.getContent;
    },
    // 重答
    haveQuestion() {
      this.choosedNum = null;
    },
    // 邀约讲解
    invite() {
      this.showInvite = !this.showInvite;
    },
    // 发布邀约
    postInvite() {
      if (this.textContent == "") {
        alert("请输入邀约内容");
        return;
      } else {
        alert("发布邀约成功");
      }
      console.log(this.textContent);
      const itemObj = {
        textContent: this.textContent
      };
    },
    //到达最后一题，交卷，请空定时器，跳转分数页面
    submitAnswer() {
      if (this.choosedNum !== null) {
        this.addNum(this.choosedId);
        clearInterval(this.timer);
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
.heigh {
  // position: relative;
  margin-top: 165px;
}
.topic {
  box-shadow: 0 2px 10px #d9d9d9, inset 0 10px 1px #f1f1f1;
  display: flex;
  justify-content: space-around;
  max-width: 1080px;
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
  width: 859px;
}
.content2 {
  overflow: hidden;
  font-size: 16px;
  color: #000;
  line-height: 30px;
  background: #f5f5f5;
  padding: 10px;
  margin-top: 30px;
  width: 859px;
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
  margin-top: 10px;
  .reward {
    font-size: 16px;
    color: #333;
  }
  .fen {
    // background: #007FFF;
    width: 64px;
    text-align: center;
    font-size: 15px;
    border-radius: 50px;
    border: 1px solid #007fff;
  }
  .fen-choosed {
    background: #007fff;
    width: 64px;
    color: #fff;
    text-align: center;
    font-size: 15px;
    border-radius: 50px;
    border: 1px solid #007fff;
  }
}
</style>


// 1. sort
var arr = [1,2,3,4,5];
arr.sort(function(a,b) {
  return a-b;
})
var min = arr[0];
var max = arr[arr.length - 1]

// 2. 假设法
var arr = [1,5,3,2,4]
var max = arr[0];
for(var i=0;i<arr.length;i++){
  var cur = arr[i];
  cur>max?max=cur:null;
}
console.log(max)

// 3. 使用Math中的min，max方法
var arr = [1,5,3,2,4];
var max = Math.max.apply(null, arr);
var min = Math.min.apply(null, arr);
console.log(max,min)

// 快排
function quickSort(arr) {
  if (arr.length <= 1) {
    return arr;
  }
  var left = [];
  var base = arr[0];
  var right = [];
  for(var i=1;i<arr.length;i++) {
    if (arr[i]>base) {
      right.push(arr[i]);
    } else {
      left.push(arr[i]);
    }
  }
  return quickSort(left).concat(base,quick(right));
}
quickSort([1,3,2,4])

// 深拷贝
function deepClone(src) {
   var ret = {}
  for(var k in src) {
    ret[key] = typeof src[key] ==='object' ? deepClone(src[key]) : src[key]
  }
  return ret
}

