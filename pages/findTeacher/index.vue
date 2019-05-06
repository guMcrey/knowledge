<template>
  <div>
    <sd-header :activeTab="5"></sd-header>
    <div class="root">
      <div class="wrap">
        <div id="table">
          <div class="add">
            <input type="text" v-model="addDetail.title" name="title" value placeholder="预约标题">
            <input type="text" v-model="addDetail.content" name="content" value placeholder="发布人">
            <input type="text" v-model="addDetail.room" name="room" value placeholder="上课房间">
            <input type="text" v-model="addDetail.score" name="score" vlaue placeholder="积分">
            <br>
            <span>预约开始时间:</span>
            <input type="date" v-model="addDetail.start" name="date" value placeholder="结束时间">
            <span>预约结束时间:</span>
            <input type="date" v-model="addDetail.end" name="date" value placeholder="结束时间">
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
                <th>操作</th>
              </tr>
            </thead>
            <tbody>
              <tr v-for="(item,index) in newsList" :key="index">
                <td width="6%">{{index+1}}</td>
                <td>{{item.title}}</td>
                <td width="10%">{{item.content}}</td>
                <td width="10%">{{item.room}}</td>
                <td width="6%">{{item.score}}</td>
                <td width="12%">{{item.interview_time}}</td>
                <td width="12%">{{item.end_time}}</td>
                <!-- 如果是教师 -->
                <!-- <td width="15%">
                  <span @click="deletelist(item.id,index)" class="delete">删除</span>
                  <span class="edit" @click="edit(item)">编辑</span>
                </td> -->
                <!-- 如果是学生 -->
                <td width="15%">
                  <span class="edit" @click="edit(item)">点击预约</span>
                </td>
              </tr>
            </tbody>
          </table>
          <!-- <div id="mask" v-if="editlist">
            <div class="mask">
              <div class="title">
                编辑
                <span @click="editlist=false">X</span>
              </div>
              <div class="content">
                <input type="text" v-model="editDetail.title" name="title" value placeholder="标题">
                <input type="text" v-model="editDetail.user" name="user" value placeholder="发布人">
                <input type="date" v-model="editDetail.dates" name="date" value placeholder="发布时间">
                <br>
                <div>
                  <button class="update" @click="update">更新</button>
                  <button class="cancel" @click="editlist=false">取消</button>
                </div>
              </div>
            </div>
          </div> -->
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

export default {
  data() {
    return {
      addDetail: {},
      editlist: false,
      editDetail: {},
      newsList: [
        {
          title: "在移动设备开发",
          content: "张若昀",
          interview_time: "2018-02-09",
          room: "45211546",
          end_time: "2019-01-01",
          score: "10"
        }
      ],
      editid: ""
    };
  },
  mounted() {
    this.inviteList();
  },
  methods: {
    // 获取邀约列表
    inviteList() {
      api.getInviteList().then(res => {});
    },
    // 创建预约列表
    adddetail() {
      //这里的思路应该是把this.addDetail传给服务端，然后加载列表this.newsList
      let data = {
        title: this.addDetail.title,
        content: this.addDetail.content,
        interview_time: this.addDetail.start,
        room: this.addDetail.room,
        end_time: this.addDetail.end,
        score: this.addDetail.score
      };
      api.createInvite({ ...data }).then(res => {
      // this.newsList.push({
      //   title: this.addDetail.title,
      //   content: this.addDetail.content,
      //   interview_time: this.addDetail.start,
      //   room: this.addDetail.room,
      //   end_time: this.addDetail.end,
      //   score: this.addDetail.score
      // });
      });

      //axios.post('url',this.addDetail).then((res) =>{
      //若返回正确结果，清空新增输入框的数据
      //this.addDetail.title = ""
      //this.addDetail.user = ""
      //this.addDetail.dates = ""
      //})
    },
    //删除
    deletelist(id, i) {
      this.newsList.splice(i, 1);
      //这边可以传id给服务端进行删除  ID = id
      //axios.get('url',{ID:id}).then((res) =>{
      //			加载列表
      //})
    },
    //编辑
    edit(item) {
      this.editDetail = {
        title: item.title,
        user: item.user,
        dates: item.dates,
        id: item.id
      };
      this.editlist = true;
      this.editid = item.id;
    },
    //确认更新
    update() {
      //编辑的话，也是传id去服务端
      //axios.get('url',{ID:id}).then((res) =>{
      //			加载列表
      //})
      let _this = this;
      for (let i = 0; i < _this.newsList.length; i++) {
        if (_this.newsList[i].id == this.editid) {
          _this.newsList[i] = {
            title: _this.editDetail.title,
            user: _this.editDetail.user,
            dates: _this.editDetail.dates,
            id: this.editid
          };
          this.editlist = false;
        }
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
* {
  font-size: 15px;
}
.root {
  background: #f5f5f5;
  height: 90vh;
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
}
#table table {
  width: 996px;
  font-size: 15px;
  border: 1px solid #eee;
}

#table {
  padding: 0 10px;
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