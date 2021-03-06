<template>
  <div>
    <sd-header :activeTab="5"></sd-header>
    <div class="root">
      <div class="wrap">
        <!-- 创建预约只对小老师开放 -->
        <el-card v-if="typeUser == 1">
          <el-form :model="addDetail" ref="addDetail" label-width="100px" :rules="rules">
            <el-form-item label="预约标题：" prop="title">
              <el-input type="text" v-model="addDetail.title" placeholder="请输入预约标题"></el-input>
            </el-form-item>
            <el-form-item label="发布人：" prop="content">
              <el-input type="text" v-model="addDetail.content" placeholder="请输入教师/小老师姓名"></el-input>
            </el-form-item>
            <el-form-item label="上课房间：" prop="room">
              <el-input type="text" v-model="addDetail.room" placeholder="请输入上课教室"></el-input>
            </el-form-item>
            <el-form-item label="积分：" prop="score">
              <el-input type="text" v-model="addDetail.score" placeholder="请输入奖励积分"></el-input>
            </el-form-item>
            <el-form-item label="预约科目：" prop="item">
              <el-select class="inputStyle" placeholder="请选择预约科目" v-model="addDetail.item">
                <el-option
                  v-for="item in subjectOptions"
                  :key="item.id"
                  :label="item.type_name"
                  :value="item.id"
                ></el-option>
              </el-select>
            </el-form-item>
            <el-form-item label="开始时间：" prop="interview_time">
              <el-date-picker v-model="addDetail.interview_time" type="date" placeholder="选择开始时间"></el-date-picker>
            </el-form-item>
            <el-form-item label="结束时间：" prop="end_time">
              <el-date-picker v-model="addDetail.end_time" type="date" placeholder="选择结束时间"></el-date-picker>
            </el-form-item>
          </el-form>
          <el-button type="primary" @click="adddetail('addDetail')">创建预约</el-button>
        </el-card>
        <el-card>
          <el-table :data="newsList" style="width: 100%">
            <el-table-column prop="title" label="课程标题" width="100"></el-table-column>
            <el-table-column prop="type_name" label="课程类别" width="100"></el-table-column>
            <el-table-column prop="room" label="上课房间" width="100"></el-table-column>
            <el-table-column prop="score" label="积分" width="100"></el-table-column>
            <el-table-column prop="created_time" label="开始时间"></el-table-column>
            <el-table-column prop="end_time" label="更新时间"></el-table-column>
            <el-table-column prop="statusStr" label="状态" width="100"></el-table-column>
            <!-- 只对学生开放点击预约按钮 -->
            <el-table-column label="操作" v-if="typeUser== 0">
              <template slot-scope="scope">
                <el-button size="mini" type="danger" @click="commitInvite(scope.row)">点击预约</el-button>
              </template>
            </el-table-column>
          </el-table>
          <el-pagination
            @current-change="inviteList"
            :current-page.sync="pagination.current"
            :page-size="pagination.pageSize"
            layout="total, prev, pager, next"
            :total="pagination.total"
            class="pagination-content"
          ></el-pagination>
        </el-card>
      </div>
    </div>
    <page-footer></page-footer>
  </div>
</template>
<script>
import SdHeader from "~/components/navBar";
import PageFooter from "~/components/pageFooter";
import { apiUserDetail } from "~/servers/api/user";
import {
  apiCreateInvite,
  apiGetInvite,
  apiClickInvite,
  apiInviteList,
  apiSubjectList
} from "~/servers/api/findTeacher";
import { get } from "http";

// 状态
const statusMap = {
  0: "已失效",
  1: "已生效",
  2: "已完成",
  3: "已评价"
};

export default {
  data() {
    return {
      addDetail: {
        title: "",
        content: "",
        status: "",
        room: "",
        score: "",
        item: null,
        interview_time: "",
        end_time: ""
      },
      editlist: false,
      editDetail: {},
      newsList: [],
      editid: "",
      loading: false,
      statusName: "",
      typeUser: "", // 用户身份
      subjectOptions: [], // 课程列表
      rules: {
        title: [{ required: true, message: "请输入课程标题", trigger: "blur" }],
        content: [
          { required: true, message: "请输入教师/小老师姓名", trigger: "blur" }
        ],
        room: [{ required: true, message: "请输入上课教室", trigger: "blur" }],
        score: [{ required: true, message: "请输入奖励积分", trigger: "blur" }],
        item: [{ required: true, message: "请选择预约科目", trigger: "blur" }],
        interview_time: [
          { required: true, message: "请输入课程开始时间", trigger: "blur" }
        ],
        end_time: [
          { required: true, message: "请输入课程结束时间", trigger: "blur" }
        ]
      },
      pagination: {
        current: 1,
        total: 0,
        pageSize: 10
      }
    };
  },
  created() {
    this.inviteList();
    this.userInfo();
  },
  mounted() {
    this.getSubject();
  },
  methods: {
    // 获取用户信息
    async userInfo() {
      const data = await apiUserDetail("get");
      this.typeUser = data.type;
      console.log("data", data);
    },
    // 获取邀约列表
    async inviteList() {
      const inviteList = await apiGetInvite(
        this.pagination.pageSize,
        this.pagination.pageSize * (this.pagination.current - 1),
        "get"
      );
      this.newsList = inviteList.results;
      this.pagination.total = inviteList.count;
      this.newsList.map(val => {
        val.statusStr = statusMap[val.status];
      });
    },
    // 创建预约列表校验
    adddetail(item) {
      this.$refs[item].validate(val => {
        if (val) {
          this.createCourse();
        } else {
          return false;
        }
      });
    },
    async createCourse() {
      const {
        title,
        content,
        room,
        score,
        interview_time,
        end_time
      } = this.addDetail;
      const data = await apiCreateInvite(
        title,
        content,
        room,
        score,
        interview_time,
        end_time
      );
      this.$notify({
        title: "创建成功",
        message: "创建课程成功~",
        type: "success"
      });
      // 清空输入
      (this.addDetail = {
        title: "",
        content: "",
        status: "",
        room: "",
        score: "",
        item: null,
        interview_time: "",
        end_time: ""
      }),
        // 刷新列表
        this.inviteList();
    },
    // 点击预约
    async commitInvite(item) {
      const {
        id: selector_id,
        owner: teacher_id,
        status,
        room,
        score,
        id: course_id,
        interview_time,
        end_time
      } = item;
      const data = await apiClickInvite(
        selector_id,
        teacher_id,
        status,
        room,
        score,
        course_id,
        interview_time,
        end_time
      );
      this.$notify({
        title: "成功",
        message: "预约成功，具体详情请到个人中心查看~",
        type: "success"
      });
      this.inviteList();
    },
    // 获取科目选项列表
    async getSubject() {
      const data = await apiSubjectList("get");
      this.subjectOptions = data.results;
    }
  },
  components: {
    SdHeader,
    PageFooter
  }
};
</script>
<style scoped>
* {
  font-size: 15px;
}
.pagination-content {
  display: flex;
  justify-content: center;
  margin-top: 30px;
}
.root {
  background: #f5f5f5;
  min-height: 100vh;
  padding-top: 60px;
}
.wrap {
  box-shadow: 0 2px 10px #d9d9d9, inset 0 10px 1px #f1f1f1;
  max-width: 1140px;
  background: #fff;
  padding: 40px;
  height: 100vh;
}
.table table {
  width: 996px;
  font-size: 15px;
  border: 1px solid #eee;
}

.table {
  padding-bottom: 100px;
}

table thead th {
  background: rgba(76, 103, 232, 0.1);
  padding: 10px;
  text-align: left;
}

table tbody td {
  padding: 10px;
  text-align: left;
  border-bottom: 1px solid #eee;
  border-right: 1px solid #eee;
}

table tbody td span {
  margin: 0 10px;
  cursor: pointer;
}

.delete {
  color: red;
}

.edit {
  color: #008cd5;
}

.add {
  border: 1px solid #eee;
  margin: 10px 0;
  padding: 15px;
  line-height: 50px;
}
/* .create-invite {
  margin-left: 20px;
  width: 100px;
  height: 35px;
} */

input {
  border: 1px solid #ccc;
  padding: 5px;
  border-radius: 3px;
  margin-right: 15px;
}

button {
  margin-left: 20px;
}

#mask {
  background: rgba(0, 0, 0, 0.5);
  width: 100%;
  height: 100%;
  position: fixed;
  z-index: 4;
  top: 0;
  left: 0;
}

.mask {
  width: 600px;
  height: 300px;
  background: rgba(255, 255, 255, 1);
  position: absolute;
  left: 0;
  top: 0;
  right: 0;
  bottom: 0;
  margin: auto;
  z-index: 47;
  border-radius: 5px;
}

.title {
  padding: 10px;
  border-bottom: 1px solid #eee;
}

.title span {
  float: right;
  cursor: pointer;
}

.content {
  display: flex;
  align-content: center;
  justify-content: center;
  flex-direction: column;
  padding: 30px;
}

.content input {
  width: 540px;
  margin-bottom: 15px;
}
.content button {
}
.update {
  margin-right: 20px;
}
.cancel {
  background: #999;
}
</style>