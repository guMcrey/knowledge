
<template>
  <div class="root">
    <sd-header :activeTab="2"></sd-header>
    <div class="question">
      <div class="famous_teacher_classroom">
        <div class="famous_teacher_classroom_title">
          <img src="./img/famousSchoolPaper.png">
        </div>
        <div class="famous_teacher_classroom_content">
          <ul>
            <li v-for="(item, index) in questionList" :key="index" @click="routeTo(item, index)">
              <div class="famous_teacher_classroom_title_01">
                <div class="famous_teacher_classroom_title_01_top">
                  <img :src="item.img">
                </div>
                <div class="famous_teacher_classroom_title_01_bottom">
                  <p>
                    <span class="teacher">{{item.questionTitle}}</span>
                    <span class="number">共{{item.questionNumber}}题</span>
                  </p>
                </div>
              </div>
              <div>
                <p class="videotitle">题型：{{item.questionType}}</p>
              </div>
            </li>
            <div class="clearfix"></div>
          </ul>
        </div>
      </div>
    </div>
    <div class="slide-item"></div>
    <div class="pages">
      <a :href="prevUrl" v-if="hasPrev" class="prev-page">上一页</a>
      <!-- <a :href="nextUrl" v-if="hasNext" class="next-page">下一页</a> -->
    </div>
    <page-footer></page-footer>
  </div>
</template>

<script>
import SdHeader from '~/components/navBar'
import PageFooter from '~/components/pageFooter'
import { mapGetters } from 'vuex'
import img4 from './img/philosophy.jpg'
import img2 from './img/history.jpg'
import img3 from './img/medicine1.jpg'
import img1 from './img/problemset_computer.jpg'
import img5 from './img/physics.jpg'
import img6 from './img/biology.jpg'
import img7 from './img/problemset_graphic.jpg'
import img8 from './img/problemset_java.jpg'
import img9 from './img/problemset_networld.jpg'
import img10 from './img/problemset_python.jpg'
import img11 from './img/problemset_softwareTest.jpg'
import img12 from './img/problemset_os.jpg'
export default {
  data() {
    return {
      hasPrev: false,
      hasNext: true,
      questionList: [
        {id: 1, questionTitle: '计算机基础', questionNumber: '15', questionType:'顺序答题/乱序答题/文本题', img: img1},
        {id: 2, questionTitle: '人文历史（文类）', questionNumber: '15', questionType:'顺序答题/乱序答题/文本题', img: img2},
        {id: 3, questionTitle: '药理学（文类）', questionNumber: '15', questionType:'顺序答题/乱序答题/文本题', img: img3},
        {id: 4, questionTitle: '哲学（文类）', questionNumber: '15', questionType:'顺序答题/乱序答题/文本题', img: img4},
        {id: 5, questionTitle: '应用物理学', questionNumber: '15', questionType:'顺序答题/乱序答题/文本题', img: img5},
        {id: 6, questionTitle: '生物科学类', questionNumber: '15', questionType:'顺序答题/乱序答题/文本题', img: img6},
        {id: 7, questionTitle: '图像图形设计', questionNumber: '15', questionType:'顺序答题/乱序答题/文本题', img: img7},
        {id: 8, questionTitle: 'Java程序设计', questionNumber: '15', questionType:'顺序答题/乱序答题/文本题', img: img8},
        {id: 9, questionTitle: '计算机网络', questionNumber: '15', questionType:'顺序答题/乱序答题/文本题', img: img9},
        {id: 10, questionTitle: 'Python编程基础', questionNumber: '15', questionType:'顺序答题/乱序答题/文本题', img: img10},
        {id: 11, questionTitle: '软件测试', questionNumber: '15', questionType:'顺序答题/乱序答题/文本题', img: img11},
        {id: 12, questionTitle: 'OS编程基础', questionNumber: '15', questionType:'顺序答题/乱序答题/文本题', img: img12},
      ],
      type: ''
    }
  },
  mounted() {
  },
  methods: {
    routeTo(item, index) {
      // api.getSelectInfo({type: index + 1}).then(res => {
      //   console.log(res.data.result)
      // })
      this.$router.push(`/exercise?type=${item.id}&channel=${item.questionTitle}&id=${item.questionNumber}`)
    }
  },
  components: {
    SdHeader,
    PageFooter
  }
}
</script>
<style scoped>
.root {
  background: #f5f5f5;
  height: 100vh;
}
.pages {
  text-align: right;
  font-size: 15px;
}
.question {
  box-shadow: 0 2px 10px #d9d9d9, inset 0 10px 1px #f1f1f1;
  display: flex;
  justify-content: space-around;
  max-width: 1240px;
  margin: 0px auto;
  background: #fff;
  box-shadow: 0 1px 1px #d9d9d9, inset 0 1px 1px #f1f1f1;
}
/* .slide-item {
  margin-top: -120px;
  height: 100vh;
  overflow: hidden;
} */
.famous_teacher_classroom {
  width: 100%;
  background: rgba(247, 250, 252, 1);
  box-shadow: 0px 4px 4px 0px rgba(232, 232, 232, 0.5);
  margin-top: 4px;
  border: 1px solid #f5f9fb;
  padding-bottom: 50px;
}
.famous_teacher_classroom_title {
  text-align: center;
  margin-top: 130px;
}
.famous_teacher_classroom_title img {
  width: 168px;
}
.famous_teacher_classroom_content {
  width: 1200px;
  margin: 0 auto;
  padding-bottom: 60px;
}
.famous_teacher_classroom_content ul li {
  float: left;
  margin: 28px;
}
.famous_teacher_classroom_title_01,
.famous_teacher_classroom_title_02,
.famous_teacher_classroom_title_03,
.famous_teacher_classroom_title_04,
.famous_teacher_classroom_title_05,
.famous_teacher_classroom_title_06,
.famous_teacher_classroom_title_07,
.famous_teacher_classroom_title_08,
.famous_teacher_classroom_title_09 {
  /* width:240px;
	height:130px; */
  background: rgba(255, 255, 255, 1);
  box-shadow: 0px 2px 6px 0px rgba(184, 184, 184, 0.5);
  border-radius: 5px;
  background-size: cover;
  background-repeat: no-repeat;
}
.famous_teacher_classroom_title_01 {
  /* background: url(./img/problemset_c.jpg); */
  background-size: cover;
  background-repeat: no-repeat;
}
.famous_teacher_classroom_title_02 {
  background: url(./img/problemset_c++.jpg);
  background-size: cover;
  background-repeat: no-repeat;
}
.famous_teacher_classroom_title_03 {
  background: url(./img/problemset_bigdata.jpg);
  background-size: cover;
  background-repeat: no-repeat;
}
.famous_teacher_classroom_title_04 {
  background: url(./img/problemset_computer.jpg);
  background-size: cover;
  background-repeat: no-repeat;
}
.famous_teacher_classroom_title_05 {
  background: url(./img/problemset_database.jpg);
  background-size: cover;
  background-repeat: no-repeat;
}
.famous_teacher_classroom_title_06 {
  background: url(./img/problemset_datastructures.jpg);
  background-size: cover;
  background-repeat: no-repeat;
}
.famous_teacher_classroom_title_07 {
  background: url(./img/problemset_graphic.jpg);
  background-size: cover;
  background-repeat: no-repeat;
}
.famous_teacher_classroom_title_08 {
  background: url(./img/problemset_java.jpg);
  background-size: cover;
  background-repeat: no-repeat;
}
.famous_teacher_classroom_title_09 {
  background: url(./img/problemset_networld.jpg);
  background-size: cover;
  background-repeat: no-repeat;
}
.famous_teacher_classroom_title_10 {
  background: url(./img/problemset_python.jpg);
  background-size: cover;
  background-repeat: no-repeat;
}
.famous_teacher_classroom_title_11 {
  background: url(./img/problemset_softwareTest.jpg);
  background-size: cover;
  background-repeat: no-repeat;
}
.famous_teacher_classroom_title_12 {
  background: url(./img/problemset_os.jpg);
  background-size: cover;
  background-repeat: no-repeat;
}
.famous_teacher_classroom_title_01_top {
  width: 240px;
  height: 126px;
}
.famous_teacher_classroom_title_01_top img{
  width: 240px;
  height: 126px;
}
.famous_teacher_classroom_title_01_bottom {
  width: 240px;
  height: 24px;
  background-color: rgba(0, 0, 0, 0.8);
}
.famous_teacher_classroom_title_01_bottom p .teacher {
  color: white;
  font-size: 12px;
  font-weight: normal;
  line-height: 24px;
  margin-left: 4px;
}
.famous_teacher_classroom_title_01_bottom p .number {
  color: white;
  font-size: 12px;
  font-weight: normal;
  line-height: 24px;
  margin-left: 100px;
}
</style>
