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
                <div class="grade">性别: {{gender}}</div>
                <div class="score">积分: {{score}}</div>
              </div>
            </div>

            <div class="user-info">
              <div class="nick-level">
                <div class="nick"></div>
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
          <!-- <div v-for="(m,index) in tabMain" v-show="cur==index" :key="index">
            <table cellpadding="0" cellspacing="0">
              <thead>
                <tr>
                  <th>序号</th>
                  <th>标题</th>
                  <th>发布人</th>
                  <th>上课房间</th>
                  <th>积分</th>
                  <th>开始时间</th>
                  <th>结束时间</th>
                  <th>操作</th>
                </tr>
              </thead>
              <tbody>
                <tr>
                  <td width="6%">{{index+1}}</td>
          <td>{{m.title}}</td>-->
          <!-- <td width="10%">{{m.content}}</td>
                <td width="10%">{{item.room}}</td>
                <td width="6%">{{item.score}}</td>
                <td width="12%">{{item.interview_time}}</td>
                <td width="12%">{{item.end_time}}</td>
                <td width="15%">
                  <span class="edit" @click="commitInvite(item)" v-if="item.status == 0">点击预约</span>
                  <span class="edit" @click="commitInvite(item)" v-else>{{item.status}}</span>
          </td>-->
          <!-- </tr>
              </tbody>
            </table>
            <div id="table">{{m.id}}</div>
          </div>-->
          <!-- 我的预约 -->
          <div v-for="(m,index) in tabMain" v-show="cur==index" :key="index">
            <div>{{m.title}}</div>
            <!-- 修改密码 -->
            <div v-if="m.checkFlag==7" class="rechangePaw">
              <el-breadcrumb separator-class="el-icon-arrow-right">
                <el-breadcrumb-item>个人详情页</el-breadcrumb-item>
                <el-breadcrumb-item>修改密码</el-breadcrumb-item>
              </el-breadcrumb>
              <el-form :model="changePawForm" status-icon :rules="rules" ref="changePawForm">
                <el-form-item class="inputWrap" prop="nickname">
                  <el-label>用户名：</el-label>
                  <el-input type="text" class="inputStyle" v-model="nickname" :disabled="true"></el-input>
                </el-form-item>
                <el-form-item class="inputWrap" prop="oldPaw">
                  <el-label>旧密码：</el-label>
                  <el-input
                    type="password"
                    class="inputStyle"
                    placeholder="请输入旧密码"
                    v-model="changePawForm.oldPaw"
                  ></el-input>
                </el-form-item>
                <el-form-item class="inputWrap" prop="newPaw">
                  <el-label>新密码：</el-label>
                  <el-input
                    type="password"
                    class="inputStyle"
                    placeholder="请输入新密码"
                    v-model="changePawForm.newPaw"
                  ></el-input>
                </el-form-item>
                <el-form-item class="inputButton">
                  <el-button type="danger" @click="changePaw('changePawForm')">确认修改</el-button>
                </el-form-item>
              </el-form>
            </div>
            <!-- 完善个人信息 -->
            <div v-if="m.checkFlag==6" class="rechangePaw">
              <el-breadcrumb separator-class="el-icon-arrow-right">
                <el-breadcrumb-item>个人详情页</el-breadcrumb-item>
                <el-breadcrumb-item>完善个人信息</el-breadcrumb-item>
              </el-breadcrumb>
              <el-form class="inputWrap" :model="compliteInfoForm" status-icon :rules="rules">
                <el-form-item prop="realName">
                  <el-label>姓名：</el-label>
                  <el-input
                    class="inputStyle"
                    type="text"
                    placeholder="请输入姓名"
                    v-model="compliteInfoForm.realName"
                  ></el-input>
                </el-form-item>
                <el-form-item prop="mobile">
                  <el-label>手机：</el-label>
                  <el-input
                    class="inputStyle"
                    type="number"
                    placeholder="请输入联系方式"
                    v-model="compliteInfoForm.mobile"
                  ></el-input>
                </el-form-item>
                <el-form-item prop="email">
                  <el-label>邮箱：</el-label>
                  <el-input
                    class="inputStyle"
                    type="text"
                    placeholder="请输入邮箱"
                    v-model="compliteInfoForm.email"
                  ></el-input>
                </el-form-item>
                <el-form-item prop="major">
                  <el-label>院系：</el-label>
                  <el-select
                    class="inputStyle"
                    placeholder="请输入院系"
                    v-model="compliteInfoForm.major"
                  >
                    <el-option
                      v-for="item in majorOptions"
                      :key="item.value"
                      :label="item.label"
                      :value="item.value"
                    ></el-option>
                  </el-select>
                </el-form-item>
                <!-- <el-form-item prop="subject">
                  <el-label>科目：</el-label>
                  <el-select
                    class="inputStyle"
                    placeholder="请输入科目"
                    v-model="compliteInfoForm.subject"
                  >
                    <el-option
                      v-for="item in subjectOptions"
                      :key="item.value"
                      :label="item.label"
                      :value="item.value"
                    ></el-option>
                  </el-select>
                </el-form-item> -->
                <!-- <el-form-item prop="desc">
                  <el-label class="desc">自我评价：</el-label>
                  <el-input
                    class="inputStyle"
                    type="textarea"
                    rows="3"
                    placeholder="请输入自我描述..."
                    v-model="compliteInfoForm.descContent"
                  ></el-input>
                </el-form-item> -->
                <el-form-item>
                  <el-button
                    class="inputButton"
                    type="info"
                    @click="resetInfo('compliteInfoForm')"
                  >重置</el-button>
                  <el-button
                    class="inputButton"
                    type="primary"
                    @click="submitInfo('compliteInfoForm')"
                  >提交</el-button>
                </el-form-item>
              </el-form>
            </div>
            <!-- 申请小老师 -->
            <div v-if="m.checkFlag==5" class="rechangePaw">
              <el-breadcrumb separator-class="el-icon-arrow-right">
                <el-breadcrumb-item>个人详情页</el-breadcrumb-item>
                <el-breadcrumb-item>申请小老师</el-breadcrumb-item>
              </el-breadcrumb>
              <el-form class="inputWrap" :model="compliteInfoForm" status-icon :rules="rules">
                <el-form-item prop="realName">
                  <el-label>姓名：</el-label>
                  <el-input
                    class="inputStyle"
                    type="text"
                    placeholder="请输入姓名"
                    v-model="compliteInfoForm.realName"
                  ></el-input>
                </el-form-item>
                <el-form-item prop="mobile">
                  <el-label>手机：</el-label>
                  <el-input
                    class="inputStyle"
                    type="number"
                    placeholder="请输入联系方式"
                    v-model="compliteInfoForm.mobile"
                  ></el-input>
                </el-form-item>
                <el-form-item prop="email">
                  <el-label>邮箱：</el-label>
                  <el-input
                    class="inputStyle"
                    type="text"
                    placeholder="请输入邮箱"
                    v-model="compliteInfoForm.email"
                  ></el-input>
                </el-form-item>
                <el-form-item prop="major">
                  <el-label>院系：</el-label>
                  <el-select
                    class="inputStyle"
                    placeholder="请输入院系"
                    v-model="compliteInfoForm.major"
                  >
                    <el-option
                      v-for="item in majorOptions"
                      :key="item.value"
                      :label="item.label"
                      :value="item.value"
                    ></el-option>
                  </el-select>
                </el-form-item>
                <el-form-item prop="subject">
                  <el-label>科目：</el-label>
                  <el-select
                    class="inputStyle"
                    placeholder="请输入科目"
                    v-model="compliteInfoForm.subject"
                  >
                    <el-option
                      v-for="item in subjectOptions"
                      :key="item.value"
                      :label="item.label"
                      :value="item.value"
                    ></el-option>
                  </el-select>
                </el-form-item>
                <el-form-item prop="desc">
                  <el-label class="desc">自我评价：</el-label>
                  <el-input
                    class="inputStyle"
                    type="textarea"
                    rows="3"
                    placeholder="请输入自我描述..."
                    v-model="compliteInfoForm.descContent"
                  ></el-input>
                </el-form-item>
                <el-form-item>
                  <el-button
                    class="inputButton"
                    type="info"
                    @click="resetInfo('compliteInfoForm')"
                  >重置</el-button>
                  <el-button
                    class="inputButton"
                    type="primary"
                    @click="submitInfo('compliteInfoForm')"
                  >提交</el-button>
                </el-form-item>
              </el-form>
            </div>

            <table cellpadding="0" cellspacing="0" v-if="m.checkFlag==2">
              <thead>
                <tr>
                  <th>序号</th>
                  <th>发布人</th>
                  <th>上课房间</th>
                  <th>预约人</th>
                  <th>状态</th>
                </tr>
              </thead>
              <tbody v-for="(item,index) in myReadList" :key="index">
                <tr>
                  <td>{{index+1}}</td>
                  <td>{{item.teacher_name}}</td>
                  <td>{{item.room}}</td>
                  <td>{{item.selector_name}}</td>
                  <td>{{item.status}}</td>
                </tr>
              </tbody>
            </table>
            <table cellpadding="0" cellspacing="0" v-if="m.checkFlag==1">
              <thead>
                <tr>
                  <th>序号</th>
                  <th>问题id</th>
                  <th>回答id</th>
                  <th>奖励积分</th>
                </tr>
              </thead>
              <tbody v-for="(item,index) in normalList" :key="index">
                <tr>
                  <td>{{index+1}}</td>
                  <td>{{item.question_id}}</td>
                  <td>{{item.answer_id}}</td>
                  <td>{{item.score}}</td>
                </tr>
              </tbody>
            </table>
            <table cellpadding="0" cellspacing="0" v-if="m.checkFlag==0">
              <thead>
                <tr>
                  <th>序号</th>
                  <th>问题id</th>
                  <th>回答id</th>
                  <th>奖励积分</th>
                </tr>
              </thead>
              <tbody v-for="(item,index) in normalList" :key="index">
                <tr>
                  <td>{{index+1}}</td>
                  <td>{{item.question_id}}</td>
                  <td>{{item.answer_id}}</td>
                  <td>{{item.score}}</td>
                </tr>
              </tbody>
            </table>
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
import {
  apiUserDetail,
  apiGetSelectRecord,
  apiGetNomalRecord
} from "~/servers/api/user";
import { apiInviteList } from "~/servers/api/findTeacher";

// 状态
const statusMap = {
  0: "已预约",
  1: "可预约"
};

export default {
  data() {
    return {
      tabTitle: [
        "我的试卷",
        "我的预约",
        "我的课程",
        "我发布的课程",
        "我的评价",
        "申请小老师",
        "完善个人信息",
        "修改密码"
      ],
      tabMain: [
        { title: "内容一", checkFlag: 0 },
        { title: "内容二", checkFlag: 1 },
        { title: "内容三", checkFlag: 2 },
        { title: "内容四", checkFlag: 3 },
        { title: "内容五", checkFlag: 4 },
        { title: "内容六", checkFlag: 5 },
        { title: "内容七", checkFlag: 6 },
        { title: "内容八", checkFlag: 7 },
      ],
      cur: 0, //默认选中第一个tab
      addDetail: {},
      editlist: false,
      editDetail: {},
      newsList: [],
      editid: "",
      nickname: "", // 用户账号
      score: "", // 用户积分
      gender: {
        female: "女",
        male: "男"
      }, // 用户性别
      myReadList: [], // 我的预约
      normalList: [], // 我发布的帖子
      // 修改密码
      changePawForm: {
        oldPaw: "",
        newPaw: ""
      },
      // 完善个人信息
      compliteInfoForm: {
        realName: "",
        mobile: "",
        email: "",
        major: "",
        subject: "",
        descContent: ""
      },
      // 院系列表
      majorOptions: [
        { value: "1", label: "机械工程系" },
        { value: "2", label: "信息工程系" },
        { value: "3", label: "计算机科学与技术系" },
        { value: "4", label: "建筑系" },
        { value: "5", label: "管理系" },
        { value: "6", label: "社会科学与外国语系" },
        { value: "7", label: "建筑工程系" },
        { value: "8", label: "化工系" },
        { value: "9", label: "艺术系" }
      ],
      subjectOptions: [
        { value: "1", label: "机械工程系" },
        { value: "2", label: "信息工程系" },
        { value: "3", label: "计算机科学与技术系" },
        { value: "4", label: "建筑系" },
        { value: "5", label: "管理系" },
        { value: "6", label: "社会科学与外国语系" },
        { value: "7", label: "建筑工程系" },
        { value: "8", label: "化工系" },
        { value: "9", label: "艺术系" }
      ],
      rules: {
        oldPaw: [{ required: true, message: "请输入旧密码", trigger: "blur" }],
        newPaw: [{ required: true, message: "请输入新密码", trigger: "blur" }],
        realName: [{ required: true, message: "请输入姓名", trigger: "blur" }],
        mobile: [
          { required: true, message: "请输入联系方式", trigger: "blur" },
          {
            validator: (rule, value, callback) => {
              if (!this.$regex.mobile.test(this.compliteInfoForm.mobile)) {
                callback(new Error("请输入正确的手机号"));
              } else {
                callback();
              }
            }
          }
        ],
        email: [{ required: true, message: "请输入邮箱", trigger: "blur" }],
        major: [{ required: true, message: "请选择院系", trigger: "blur" }],
        subject: [{ required: true, message: "请选择院系", trigger: "blur" }]
      }
    };
  },
  mounted() {
    this.getUserInfo();
    this.selectQuesiotn();
    this.normalRecord();
    // 我的预约
    this.inviteList();
  },
  methods: {
    // 获取用户信息
    async getUserInfo() {
      const data = await apiUserDetail("get");
      console.log(data);
      this.nickname = data.username;
      this.score = data.score;
      this.gender = data.gender;
    },
    // 我的试卷
    async selectQuesiotn() {
      const data = await apiGetSelectRecord("get");
      console.log(data);
    },
    // 我的回复
    async normalRecord() {
      const normal = await apiGetNomalRecord("get");
      this.normalList = normal.results;
    },
    // 我的预约
    async inviteList() {
      const clickList = await apiInviteList("get");
      this.myReadList = clickList.results;
      this.myReadList.forEach(res => {
        res.status = statusMap[res.status];
      });
    },
    // 修改密码
    changePaw(formName) {
      this.$refs[formName].validate(valid => {
        if (valid) {
          // 修改密码
        } else {
          this.$notify({
            title: "失败",
            message: "操作有误，请重试！",
            type: "warning"
          });
        }
      });
    },
    // 修改密码传参
    async submitChange() {
      const { oldPaw, newPaw } = this.changePawForm;
    },
    // 完善个人信息
    // 提交
    submitInfo(formName) {
      const {
        realName,
        mobile,
        email,
        major,
        subject,
        descContent
      } = this.compliteInfoForm;
    },
    // 重置
    resetInfo(formName) {
      this.compliteInfoForm = {
        realName: "",
        mobile: "",
        email: "",
        major: "",
        subject: "",
        descContent: ""
      };
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
/* 修改密码 */
.rechangePaw {
  margin: 25px;
}
.inputWrap {
  margin: 25px 40px;
}
.inputStyle {
  width: 80%;
  margin-left: 10px;
}
.inputButton {
  margin-top: 40px;
  text-align: center;
}

/* 完善个人信息 */

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
  /* height: 490px; */
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
  min-height: 780px;
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
table thead th {
  width: 806px;
  font-size: 15px;
  border: 1px solid #eee;
  background: rgba(76, 103, 232, 0.1);
  padding: 10px;
  text-align: center;
}
tbody td {
  border-bottom: 1px solid #eee;
  border-right: 1px solid #eee;
  text-align: center;
}
table thead th {
  background: rgba(76, 103, 232, 0.1);
  padding: 10px;
}

table tbody td {
  padding: 10px;
  border-bottom: 1px solid #eee;
  border-right: 1px solid #eee;
}

table tbody td span {
  margin: 0 10px;
  cursor: pointer;
}
</style>