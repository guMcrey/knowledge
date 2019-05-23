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
                v-for="(title,index) in entryDisplay"
                @click="cur=title.id"
                :class="{active:cur==index}"
                :key="index"
              >{{title.tab}}</li>
            </ul>
          </div>
        </div>
        <div class="tab-content">
          <!-- 我的讨论区发布 -->
          <div v-if="cur==8" class="rechangePaw">
            <el-table :data="discussData" style="width: 100%" :row-class-name="tableRowClassName">
              <el-table-column prop="title" label="标题" width="180"></el-table-column>
              <el-table-column prop="score" label="积分" width="180"></el-table-column>
              <el-table-column prop="created_time" label="创建时间"></el-table-column>
              <el-table-column prop="updated_time" label="更新时间"></el-table-column>
            </el-table>
          </div>

          <!-- 修改密码 -->
          <div v-if="cur==7" class="rechangePaw">
            <el-breadcrumb separator-class="el-icon-arrow-right">
              <el-breadcrumb-item>个人详情页</el-breadcrumb-item>
              <el-breadcrumb-item>修改密码</el-breadcrumb-item>
            </el-breadcrumb>
            <el-form :model="changePawForm" status-icon :rules="rules" ref="changePawForm">
              <el-form-item class="inputWrap" prop="nickname">
                <span class="labelStyle">用户名：</span>
                <el-input type="text" class="inputStyle" v-model="nickname" :disabled="true"></el-input>
              </el-form-item>
              <el-form-item class="inputWrap" prop="password">
                <span class="labelStyle">旧密码：</span>
                <el-input
                  type="password"
                  class="inputStyle"
                  placeholder="请输入旧密码"
                  v-model="changePawForm.password"
                ></el-input>
              </el-form-item>
              <el-form-item class="inputWrap" prop="new_password">
                <span class="labelStyle">新密码：</span>
                <el-input
                  type="password"
                  class="inputStyle"
                  placeholder="请输入新密码"
                  v-model="changePawForm.new_password"
                ></el-input>
              </el-form-item>
              <el-form-item class="inputButton">
                <el-button type="danger" @click="changePaw('changePawForm')">确认修改</el-button>
              </el-form-item>
            </el-form>
          </div>

          <!-- 完善个人信息 -->
          <div v-if="cur==6" class="rechangePaw">
            <el-breadcrumb separator-class="el-icon-arrow-right">
              <el-breadcrumb-item>个人详情页</el-breadcrumb-item>
              <el-breadcrumb-item>完善个人信息</el-breadcrumb-item>
            </el-breadcrumb>
            <el-form
              class="inputWrap"
              :model="compliteInfoForm"
              status-icon
              :rules="rules"
              ref="compliteInfoForm"
            >
              <el-form-item prop="realName">
                <span class="labelStyle">姓名:</span>
                <el-input
                  class="inputStyle"
                  type="text"
                  placeholder="请输入姓名"
                  v-model="compliteInfoForm.realName"
                ></el-input>
              </el-form-item>
              <el-radio-group v-model="compliteInfoForm.gender" class="redioStyle">
                <span class="redioStyle">性别:</span>
                <el-radio :label="1">男</el-radio>
                <el-radio :label="0">女</el-radio>
              </el-radio-group>
              <el-form-item prop="birthday" class="redioStyle">
                <span class="labelStyle">生日：</span>
                <el-date-picker
                  v-model="compliteInfoForm.birthday"
                  type="date"
                  placeholder="选择日期时间"
                ></el-date-picker>
              </el-form-item>
              <el-form-item prop="mobile">
                <span>手机：</span>
                <el-input
                  class="inputStyle"
                  type="number"
                  placeholder="请输入联系方式"
                  v-model="compliteInfoForm.mobile"
                ></el-input>
              </el-form-item>
              <el-form-item prop="email">
                <span class="labelStyle">邮箱:</span>
                <el-input
                  class="inputStyle"
                  type="text"
                  placeholder="请输入邮箱"
                  v-model="compliteInfoForm.email"
                ></el-input>
              </el-form-item>
              <el-form-item>
                <el-button class="inputButton" type="info" @click="resetInfo()">重置</el-button>
                <el-button
                  class="inputButton"
                  type="primary"
                  @click="submitInfo('compliteInfoForm')"
                >提交</el-button>
              </el-form-item>
            </el-form>
          </div>

          <!-- 申请小老师 (需完善个人信息后才展示)-->
          <div v-if="cur==5" class="rechangePaw">
            <el-breadcrumb separator-class="el-icon-arrow-right">
              <el-breadcrumb-item>个人详情页</el-breadcrumb-item>
              <el-breadcrumb-item>申请小老师</el-breadcrumb-item>
            </el-breadcrumb>
            <el-form
              class="inputWrap"
              :model="applyTeacherForm"
              status-icon
              :rules="rules"
              ref="applyTeacherForm"
            >
              <el-form-item prop="realName">
                <span class="labelStyle">姓名：</span>
                <el-input
                  class="inputStyle"
                  type="text"
                  placeholder="请输入姓名"
                  v-model="applyTeacherForm.realName"
                ></el-input>
              </el-form-item>
              <el-form-item prop="mobile">
                <span class="labelStyle">手机：</span>
                <el-input
                  class="inputStyle"
                  type="number"
                  placeholder="请输入联系方式"
                  v-model="applyTeacherForm.mobile"
                ></el-input>
              </el-form-item>
              <el-form-item prop="email">
                <span class="labelStyle">邮箱：</span>
                <el-input
                  class="inputStyle"
                  type="text"
                  placeholder="请输入邮箱"
                  v-model="applyTeacherForm.email"
                ></el-input>
              </el-form-item>
              <el-form-item prop="major">
                <span class="labelStyle">院系：</span>
                <el-select class="inputStyle" placeholder="请输入院系" v-model="applyTeacherForm.major">
                  <el-option
                    v-for="item in majorOptions"
                    :key="item.value"
                    :label="item.label"
                    :value="item.value"
                  ></el-option>
                </el-select>
              </el-form-item>
              <el-form-item prop="subject">
                <span class="labelStyle">科目：</span>
                <el-select
                  class="inputStyle"
                  placeholder="请输入科目"
                  v-model="applyTeacherForm.subject"
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
                <span class="labelStyle desc">自我评价：</span>
                <el-input
                  class="inputStyle"
                  type="textarea"
                  rows="3"
                  placeholder="请输入自我描述..."
                  v-model="applyTeacherForm.descContent"
                ></el-input>
              </el-form-item>
              <el-form-item>
                <el-button class="inputButton" type="info" @click="resetInfo()">重置</el-button>
                <el-button
                  class="inputButton"
                  type="primary"
                  @click="submitApply('applyTeacherForm')"
                >提交</el-button>
              </el-form-item>
            </el-form>
          </div>

          <!-- <table cellpadding="0" cellspacing="0" v-if="m.checkFlag==2">
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
          </table>-->
        </div>
      </div>
      <!-- </div> -->
    </div>
    <page-footer></page-footer>
  </div>
</template>
<script>
import SdHeader from "~/components/navBar";
import PageFooter from "~/components/pageFooter";
import * as api from "~/assets/api";
import formatDate from "~/assets/utils/formatDate";

import {
  apiUserDetail,
  apiGetSelectRecord,
  apiGetNomalRecord,
  apiCompleteInfo,
  apiUpdatePaw,
  apiApplySmallTeacher,
  apiMyDiscussList
} from "~/servers/api/user";
import { apiInviteList } from "~/servers/api/findTeacher";
import { format } from "path";

// 状态
const statusMap = {
  0: "已预约",
  1: "可预约"
};

export default {
  data() {
    // 校验手机号
    const mobileValidator = (rule, value, callback) => {
      if (value && !/^((\+?86)|(\(\+86\)))?(1\d{10}$)$/.test(value)) {
        callback(new Error("请输入正确的手机号"));
      } else {
        callback();
      }
    };
    // 校验邮箱
    const emailValidator = (rule, value, callback) => {
      if (
        value &&
        !/^[A-Za-z0-9\u4e00-\u9fa5]+@[a-zA-Z0-9_-]+(\.[a-zA-Z0-9_-]+)+$/.test(
          value
        )
      ) {
        callback(new Error("邮箱格式不正确"));
      } else {
        callback();
      }
    };
    return {
      tabTitle: [
        { id: 0, tab: "我的试卷" },
        { id: 1, tab: "我的预约" },
        { id: 2, tab: "我的课程" },
        { id: 3, tab: "我发布的课程" },
        { id: 4, tab: "我的评价" },
        { id: 5, tab: "申请小老师" },
        { id: 6, tab: "完善个人信息" },
        { id: 7, tab: "修改密码" },
        { id: 8, tab: "我的讨论区发布" }
      ],
      tabMain: [
        { title: "内容一", checkFlag: 0 },
        { title: "内容二", checkFlag: 1 },
        { title: "内容三", checkFlag: 2 },
        { title: "内容四", checkFlag: 3 },
        { title: "内容五", checkFlag: 4 },
        { title: "内容六", checkFlag: 5 },
        { title: "内容七", checkFlag: 6 },
        { title: "内容八", checkFlag: 7 }
      ],
      cur: 0, //默认选中第一个tab
      addDetail: {},
      editlist: false,
      editDetail: {},
      newsList: [],
      editid: "",
      userType: "", // 用户类型
      nickname: "", // 用户账号
      score: "", // 用户积分
      gender: "", // 用户性别
      myReadList: [], // 我的预约
      normalList: [], // 我发布的帖子
      // 修改密码
      changePawForm: {
        password: "",
        new_password: ""
      },
      // 完善个人信息
      compliteInfoForm: {
        realName: "",
        gender: 1,
        birthday: "",
        mobile: "",
        email: ""
      },
      // 判断用户是否完善个人信息
      isCompleteInfo: false,
      // 申请小老师
      applyTeacherForm: {
        realName: "",
        mobile: "",
        email: "",
        major: "",
        subject: "",
        descContent: ""
      },
      birthday: "",
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
      subjectOptions: [{ value: "1", label: "机械工程系" }],
      // 我的讨论区发布
      discussData: [],
      rules: {
        password: [
          { required: true, message: "请输入旧密码", trigger: "blur" }
        ],
        new_password: [
          { required: true, message: "请输入新密码", trigger: "blur" }
        ],
        realName: [{ required: true, message: "请输入姓名", trigger: "blur" }],
        mobile: [
          { required: true, message: "请输入联系方式", trigger: "blur" },
          { validator: mobileValidator, trigger: "blur" }
        ],
        email: [
          { required: true, message: "请输入邮箱", trigger: "blur" },
          { validator: emailValidator, trigger: "blur" }
        ],
        major: [{ required: true, message: "请选择院系", trigger: "blur" }],
        subject: [{ required: true, message: "请选择院系", trigger: "blur" }],
        birthday: [{ required: true, message: "请选择生日", trigger: "blur" }]
      }
    };
  },
  computed: {
    // 根据cur当前选项与索引判断显示对应模块（tab栏）
    checkIndex() {
      return this.tabMain.filter(item => {
        if (this.cur == item.checkFlag) {
          return item.checkFlag;
        } else {
          return false;
        }
      });
    },
    // 根据用户状态显示tab栏入口
    /**
     * 0 普通用户
     * 1 小老师
     * 2 已完善信息
     */
    entryDisplay() {
      // 对学生隐藏“申请小老师”入口
      return this.tabTitle.filter(item => {
        if (this.userType === 0 && item.id === 4) {
          this.tabTitle.splice(item.id, 1);
        }
        return item;
      });
    }
  },
  mounted() {
    this.getUserInfo();
    this.selectQuesiotn();
    this.normalRecord();
    // 我的预约
    this.inviteList();
    // 我的讨论区发布
    this.discussList();
  },
  methods: {
    // 获取用户信息
    async getUserInfo() {
      const data = await apiUserDetail("get");
      console.log(data);
      this.nickname = data.username;
      this.score = data.score;
      this.gender = data.gender;
      this.userType = data.type;
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
          this.submitChange();
          this.$notify({
            title: "修改成功",
            message: "修改密码成功，请重新登录！",
            type: "success"
          });
          this.$router.push("/login");
        } else {
          return false;
        }
      });
    },
    // 修改密码传参
    async submitChange() {
      const { password, new_password } = this.changePawForm;
      const data = await apiUpdatePaw(
        this.nickname,
        password,
        new_password,
        "put"
      );
      console.log("data", data);
    },
    // 完善个人信息传参
    async inforContent() {
      // 将时间转换成YY-MM-DD
      this.birthday = formatDate.unixToTime(this.compliteInfoForm.birthday);
      const {
        realName,
        gender,
        birthday,
        mobile,
        email
      } = this.compliteInfoForm;
      const data = await apiCompleteInfo(
        realName,
        this.gender,
        this.birthday,
        mobile,
        email,
        "put"
      );
      // 判断用户是否完善个人信息
      this.isCompleteInfo = data.status;
    },
    // 完善个人信息提交
    submitInfo(formName) {
      this.$refs[formName].validate(val => {
        if (val) {
          this.inforContent();
          this.$notify({
            title: "更新成功",
            message: "恭喜您，获得了10积分！",
            type: "success"
          });
        } else {
          this.$notify({
            title: "更新失败",
            message: "操作有误，请重新输入！",
            type: "success"
          });
          return false;
        }
      });
    },
    // 申请小老师提交
    submitApply(formName) {
      this.$refs[formName].validate(valid => {
        if (valid && this.score >= 500) {
          this.applyContent();
          this.$notify({
            title: "提交成功",
            message: "您的申请已收到，我们会尽快审核~~",
            type: "warning"
          });
        } else if (valid && this.score < 500) {
          this.$notify({
            title: "申请失败",
            message: "抱歉，500积分以上才可以申请小老师哦~",
            type: "error"
          });
        } else {
          return false;
        }
      });
    },
    // 申请小老师传参
    async applyContent() {
      const data = await apiApplySmallTeacher("put");
    },
    // 重置
    resetInfo() {
      this.compliteInfoForm = {
        realName: "",
        mobile: "",
        email: "",
        gender: 1,
        birthday: ""
      };
      this.applyTeacherForm = {
        realName: "",
        mobile: "",
        email: "",
        major: "",
        subject: "",
        descContent: ""
      };
    },
    // 我的讨论区发布
    async discussList() {
      const data = await apiMyDiscussList("get");
      this.discussData = data.results;
      // 格式化返回时间
      this.discussData.forEach(val => {
        val.created_time = formatDate.unixToTime(val.created_time);
        val.updated_time = formatDate.unixToTime(val.updated_time);
      });
    },
    // 控制偶行样式
    tableRowClassName({ row, rowIndex }) {
      console.log("22222222222", row);
      if (rowIndex % 2) {
        return "warning-row";
      }
      return "";
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

/* 我的讨论区发布 */
.el-table .warning-row {
  background: oldlace;
}

.el-table .success-row {
  background: #f0f9eb;
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
  margin-top: 10px;
}
.inputButton {
  margin-top: 40px;
  text-align: center;
}

/* 完善个人信息 */
.labelStyle {
  font-size: 16px;
  margin-right: 10px;
}

.redioStyle {
  margin-right: 20px;
  margin-bottom: 20px;
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
  min-height: 840px;
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