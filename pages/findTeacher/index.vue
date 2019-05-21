<template>
  <div>
    <sd-header :activeTab="5"></sd-header>
    <div class="root">
      <div class="wrap">
        <div class="table">
          <div class="add">
            <input type="text" v-model="addDetail.title" name="title" value placeholder="预约标题">
            <input type="text" v-model="addDetail.content" name="content" value placeholder="发布人">
            <input type="text" v-model="addDetail.room" name="room" value placeholder="上课房间">
            <input type="text" v-model="addDetail.score" name="score" vlaue placeholder="积分">
            <br>
            <span>预约开始时间:</span>
            <el-date-picker v-model="addDetail.interview_time" type="datetime" placeholder="选择开始时间"></el-date-picker>
            <span>预约结束时间:</span>
            <el-date-picker v-model="addDetail.end_time" type="datetime" placeholder="选择结束时间"></el-date-picker>
            <button class="create-invite" @click="adddetail">创建预约</button>
          </div>
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
                <th>状态</th>
              </tr>
            </thead>
            <tbody v-loading="loading">
              <tr v-for="(item,index) in newsList" :key="index">
                <td width="6%">{{index+1}}</td>
                <td>{{item.title}}</td>
                <td width="10%">{{item.content}}</td>
                <td width="10%">{{item.room}}</td>
                <td width="6%">{{item.score}}</td>
                <td width="12%">{{item.interview_time}}</td>
                <td width="12%">{{item.end_time}}</td>
                <!-- 如果是学生 -->
                <td width="15%" v-if="!typeUser">
                  <span class="edit" @click="commitInvite(item)">{{item.statusName}}</span>
                </td>
              </tr>
            </tbody>
          </table>
        </div>
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
  apiInviteList
} from "~/servers/api/findTeacher";
import { get } from "http";

const statusMap = {
  1: "点击预约",
  0: "已预约"
};
export default {
  data() {
    return {
      addDetail: {
        title: "",
        content: "",
        status: 1,
        room: "",
        score: "",
        interview_time: "",
        end_time: ""
      },
      editlist: false,
      editDetail: {},
      newsList: [],
      editid: "",
      loading: false,
      statusName: "点击预约",
      typeUser: "" // 用户身份
    };
  },
  created() {
    this.inviteList();
    this.userInfo();
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
      const inviteList = await apiGetInvite("get");
      this.newsList = inviteList.results;
      this.newsList.forEach(res => {
        this.$set(res, "statusName", "点击预约");
      });
      this.statusName = statusMap[this.status];
    },
    // 创建预约列表
    async adddetail(item) {
      //这里的思路应该是把this.addDetail传给服务端，然后加载列表this.newsList
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
        interview_time,
        end_time
      } = item;
      const data = await apiClickInvite(
        selector_id,
        teacher_id,
        status,
        room,
        score,
        interview_time,
        end_time
      );
      item.statusName = statusMap[item.status];
      this.$message("预约成功！记录信息请到个人详情页查看~");
      // 点击预约后，老师显示已预约列表，学生显示预约列表，放到个人信息页中，最后调
      const clickList = await apiInviteList("get");
    }
    //删除
    // deletelist(id, i) {
    //   this.newsList.splice(i, 1);
    //这边可以传id给服务端进行删除  ID = id
    //axios.get('url',{ID:id}).then((res) =>{
    //			加载列表
    //})
    // },
    //编辑
    // edit(item) {
    //   this.editDetail = {
    //     title: item.title,
    //     user: item.user,
    //     dates: item.dates,
    //     id: item.id
    //   };
    //   this.editlist = true;
    //   this.editid = item.id;
    // },
    //确认更新
    // update() {
    //编辑的话，也是传id去服务端
    //axios.get('url',{ID:id}).then((res) =>{
    //			加载列表
    //})
    // let _this = this;
    // for (let i = 0; i < _this.newsList.length; i++) {
    //   if (_this.newsList[i].id == this.editid) {
    //     _this.newsList[i] = {
    //       title: _this.editDetail.title,
    //       user: _this.editDetail.user,
    //       dates: _this.editDetail.dates,
    //       id: this.editid
    //     };
    //     this.editlist = false;
    //   }
    // }
    // }
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
.root {
  background: #f5f5f5;
  min-height: 100vh;
  padding-top: 60px;
}
.wrap {
  box-shadow: 0 2px 10px #d9d9d9, inset 0 10px 1px #f1f1f1;
  display: flex;
  justify-content: space-around;
  max-width: 1140px;
  margin: 0px auto;
  background: #fff;
  padding: 40px;
  overflow: auto;
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
.create-invite {
  margin-left: 20px;
  width: 100px;
  height: 35px;
}

input {
  border: 1px solid #ccc;
  padding: 5px;
  border-radius: 3px;
  margin-right: 15px;
}

button {
  background: #f5ad1b;
  border: 0;
  padding: 4px 15px;
  border-radius: 3px;
  color: #fff;
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