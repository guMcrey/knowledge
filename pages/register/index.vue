<template>
  <div>
    <sd-header :activeTab="0"></sd-header>
    <div class="login-bg">
      <div class="login">
        <div class="message">注册账号</div>
        <div class="darkbannerwrap"></div>
        <el-form :model="form" status-icon :rules="rules" ref="form">
          <el-form-item label="用户名" prop="username">
            <el-input type="text" v-model="form.username" placeholder="请输入用户名"></el-input>
          </el-form-item>

          <el-form-item label="密码" prop="password">
            <el-input
              type="password"
              v-model="form.password"
              auto-complete="off"
              placeholder="请输入密码"
            ></el-input>
          </el-form-item>

          <el-form-item label="确认密码" prop="rePassword">
            <el-input
              type="password"
              v-model="form.rePassword"
              auto-complete="off"
              placeholder="请输入确认密码"
            ></el-input>
          </el-form-item>

          <el-form-item>
            <el-button
              style="width:100%; background: rgba(245,173,27,.8); border: none"
              type="primary"
              @click="submitForm('form')"
            >注册</el-button>
          </el-form-item>
          <div class="to-register">
            <a class="to-register" href="/login">已有账号？直接登录</a>
          </div>
        </el-form>
      </div>
    </div>
    <page-footer></page-footer>
  </div>
</template>
<script>
import PageFooter from "~/components/pageFooter";
import SdHeader from "~/components/navBar";
import { apiRegister } from "~/servers/api/user";

export default {
  data() {
    const validateCompare = (rule, value, callback) => {
      if (value !== this.form.password) {
        callback(Error("两次输入密码不一致"));
      } else {
        callback();
      }
    };
    return {
      form: {
        username: "",
        password: "",
        rePassword: ""
      },
      rules: {
        username: [
          { required: true, message: "请输入用户名", trigger: "blur" }
        ],
        password: [
          { required: true, message: "请输入密码" },
          { min: 6, max: 16, message: "请输入 6 至 16 位密码" }
        ],
        rePassword: [
          { required: true, message: "请输入确认密码" },
          { validator: validateCompare }
        ]
      }
    };
  },
  methods: {
    async singIn() {
      const { username, password } = this.form;
      const data = await apiRegister(username, password);
      this.$message('注册成功，请登录~');
      this.$router.push("/login");
    },
    submitForm(formName) {
      this.$refs[formName].validate(valid => {
        if (valid) {
          this.singIn();
        } else {
          this.$message("操作有误,请重试！！");
          return false;
        }
      });
    }
  },
  components: {
    PageFooter,
    SdHeader
  }
};
</script>
<style lang="less" scoped>
.login-bg {
  background: url(../imgs/bg.png) no-repeat center;
  background-size: cover;
  overflow: hidden;
  padding-bottom: 0px;
  height: 917px;
}
.login {
  margin: 220px auto;
  min-height: 420px;
  max-width: 420px;
  padding: 40px;
  background-color: #ffffff;
  border-radius: 4px;
  box-sizing: border-box;
}
.login a.logo {
  display: block;
  height: 58px;
  width: 167px;
  margin: 0 auto 30px auto;
  background-size: 167px 42px;
}
.login .message {
  margin: 10px 0 0 -58px;
  padding: 18px 10px 18px 60px;
  background: rgba(245, 173, 27, 0.8);
  position: relative;
  color: #fff;
  font-size: 18px;
}
.login .darkbannerwrap {
  width: 18px;
  height: 10px;
  margin: 0 0 20px -58px;
  position: relative;
  background: url(../imgs/aiwrap.png)
}

.login input[type="text"],
.login input[type="file"],
.login input[type="password"],
.login input[type="email"],
select {
  border: 1px solid #dcdee0;
  vertical-align: middle;
  border-radius: 3px;
  height: 50px;
  padding: 0px 16px;
  font-size: 14px;
  color: #555555;
  outline: none;
  width: 100%;
  box-sizing: border-box;
}
.login input[type="text"]:focus,
.login input[type="file"]:focus,
.login input[type="password"]:focus,
.login input[type="email"]:focus,
select:focus {
  border: 1px solid #27a9e3;
}
.login input[type="submit"],
.login input[type="button"] {
  display: inline-block;
  vertical-align: middle;
  padding: 12px 24px;
  margin: 0px;
  font-size: 18px;
  line-height: 24px;
  text-align: center;
  white-space: nowrap;
  vertical-align: middle;
  cursor: pointer;
  color: #ffffff;
  background-color: rgba(245, 173, 27, 0.8);
  border-radius: 3px;
  border: none;
  -webkit-appearance: none;
  outline: none;
  width: 100%;
}
.login hr.hr15 {
  height: 15px;
  border: none;
  margin: 0px;
  padding: 0px;
  width: 100%;
}
.login hr.hr20 {
  height: 20px;
  border: none;
  margin: 0px;
  padding: 0px;
  width: 100%;
}
</style>