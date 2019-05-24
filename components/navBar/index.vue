<template>
  <div class="nav-root">
    <div class="content">
      <div class="content__logo">
        <div class="logo"></div>
        <div class="line"></div>
        <div class="slogan">
          知学平台
          <a class="kufu" href="www.zxpt.com">
            <em class="phone-icon"></em>zxpt.com
          </a>
        </div>
      </div>
      <div class="content__tab">
        <div class="item" v-for="(item, index) in tabList" :key="index">
          <a class="link" :class="{active: activeTab === index}" :href="item.path">{{item.text}}</a>
        </div>
      </div>
      <div class="content__user">
        <div class="content__user" v-if="!hasToken">
          <div class="login">
            <a class="link" href="/register">注册 /</a>
          </div>
          <div class="login">
            <a class="link" href="/login">登录</a>
          </div>
        </div>
        <el-dropdown v-if="hasToken" @command="handleCommand">
          <el-button type="primary" class="content__user">
            您好
            <i class="el-icon-arrow-down el-icon--right"></i>
          </el-button>
          <el-dropdown-menu slot="dropdown">
            <el-dropdown-item command="a">个人详情</el-dropdown-item>
            <el-dropdown-item command="b">注销</el-dropdown-item>
          </el-dropdown-menu>
        </el-dropdown>
      </div>
    </div>
  </div>
</template>
<script>
import { mapMutations, mapActions } from "vuex";
import { getCookie, setCookie } from "~/assets/js/cookie.js";
export default {
  name: "NavBar",
  props: {
    activeTab: {
      default: 0
    }
  },
  data() {
    return {
      tabList: [
        {
          text: "首页",
          path: "/",
          flag: true
        },
        {
          text: "项目概况",
          path: "/aboutUs",
          falg: false
        },
        {
          text: "题库中心",
          path: "/questoins",
          flag: false
        },
        {
          text: "信息广场",
          path: "/information",
          falg: false
        },
        {
          text: "讨论区",
          path: "/discuss",
          flag: false
        },
        {
          text: "寻师",
          path: "/findTeacher",
          falg: false
        },
        {
          text: "荣誉榜",
          path: "/honorsList",
          falg: false
        }
      ],
      hasToken: ""
    };
  },
  mounted() {
    this.hasToken = getCookie("token");
    console.log('token', this.hasToken)
    if (!this.hasToken) {
      // this.$router.push('/login')
    }
  },
  methods: {
    handleCommand(command) {
      if(command === 'a') {
        this.$router.push("./myDetail");
      } else {
        // 清空token
        this.hasToken = ''
        setCookie('token', '', 0)
        this.$router.push('./login')
      }
    }
  },
  ...mapMutations(["TOGGLE_LOADING_STATUS", "CHECKOUT_LOGIN_STATUS"])
};
</script>

<style lang="less" scoped>
.user-info {
  color: #000;
}
.nav-root {
  // background:rgba(18,110,248,0.90);
  background: #34373f;
  height: 70px;
  position: fixed;
  top: 0;
  left: 0;
  right: 14px;
  z-index: 301;
  .content {
    width: 1200px;
    margin: auto;
    height: 100%;
    display: flex;
    align-items: center;
    justify-content: space-between;
    &__logo {
      display: flex;
      align-items: center;
      .logo {
        width: 65px;
        height: 65px;
        background: url(./img/logo78-78.png) 0 0 no-repeat;
        background-size: 100%;
        background-color: #fff;
        border-radius: 100%;
      }
      .line {
        height: 20px;
        width: 2px;
        background: #fff;
        margin: 0 10px;
        opacity: 0.4;
        transform: translateY(3px);
      }
      .slogan {
        font-size: 18px;
        color: #ffffff;
        transform: translateY(3px);
        font-weight: bold;
        .kufu {
          margin-left: -10px;
          font-size: 16px;
          color: #ffffff;
          .phone-icon {
            display: inline-block;
            width: 16px;
            height: 17px;
            margin-right: 4px;
            background: url() 0 0 no-repeat;
            background-size: 100%;
            vertical-align: -4px;
          }
        }
      }
    }
  }
}

.content__tab {
  display: flex;
  align-items: center;
  .item {
    text-align: center;
    margin: 0 20px;
    .link {
      opacity: 0.6;
      font-size: 16px;
      color: #ffffff;
      display: block;
      height: 70px;
      line-height: 70px;
      box-sizing: border-box;
    }
    .active {
      opacity: 1;
      border-bottom: 8px solid #f5ad1b;
    }
  }
}

.content__user {
  display: flex;
  align-items: center;
  justify-content: center;
  font-size: 16px;
  background-color: #f5ad1b;
  border-radius: 30px;
  padding: 5px;
  color: #fff;
  border: none;
  .link {
    color: #fff;
    //  margin: 10px;
    padding: 5px;
    //  border: 1px solid #f5ad1b;
  }
}
</style>
