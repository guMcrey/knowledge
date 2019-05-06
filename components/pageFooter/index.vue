<template>
  <section class="footer-root">
    <div class="info">
      <div class="max-wid">
        <div class="contact-info">
          <div class="contact">
            <div class="item" href="mailto:943383098@qq.com">
              <span>联系邮箱：</span><a href="mailto:943383098@qq.com">943383098@qq.com</a>
            </div>
            <div class="item">
              <span>合作伙伴：</span>xxx
            </div>
            <div class="item">
              <span>联系地址：</span>xxx
            </div>
          </div>
          <div class="tel">
            <div class="tel__icon"></div>
            <div class="tel__num">
              <div class="tel__num-name">友情链接</div>
              <a href="" class="tel__num-num">xxxzzzz</a><br>
              <a href="" class="tel__num-num">xxxzzzz</a><br>
              <a href="" class="tel__num-num">xxxzzzz</a>
              <div class="tel__work-time">
                工作日 9:30-21:30
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
    <div class="bottom">
      <div class="max-wid">
        <div class="company-info">
          <div class="copyright">版权所有 ©2019 {{companyInfo.name}}
            <a href="" target="_blank">{{companyInfo.code}}</a>
          </div>
          <div class="case-number">
            <a target="_blank" href="">
              <img src="./img/record-icon.png" class="record-icon"/>
              京公网安备 xxxx号
            </a>
          </div>
        </div>
      </div>
    </div>
  </section>
</template>
<script>
export default {
  name: 'page-footer',
  data() {
    return {
      companyInfo: {
        code: '京ICP备xxxxx号-1',
        name: '知学平台'
      }
    }
  },
  mounted () {
    const info = {
      cn: {
        code: '京ICP备xxx号-1',
        name: '知学平台'
      },
      com: {
        code: '京ICP备xxxx号-1',
        name: '知学平台'
      }
    }
    this.companyInfo = document.domain.indexOf('com') > 0 ? info.com : info.cn
  },
  serverCacheKey() {
    return 1
  }
}
</script>

<style lang="less" scoped>
.footer-root {
  .max-wid {
    width: 900px;
    margin: auto;
  }
  .info {
    background:#34373f;
    height: 187px;
  }
  .bottom {
    background:#20252d;
    height:48px;
  }
}

.contact-info {
  display: flex;
  align-items: center;
  justify-content: center;
  height: 187px;
  .qr {
    display: flex;
    align-items: center;
    &__box {
      width: 176px;
      margin-right: 26px;
      .img {
        width: 176px;
      }
      img {
        width: 100%;
      }
    }
    &__tips {
      font-size:16px;
      color:#767884;
      text-align: center;
    }
  }

  .contact {
    flex: 1;
    font-size:14px;
    color: #fff;
    margin-left: 120px;
    span {
      color:#767884;
    }
    .item {
      display: block;
      margin-bottom: 13px;
      a {
        color: #fff;
        &:hover {
          color: #fff;
        }
      }
    }
  }

  .tel {
    margin-right: 120px;
    display: flex;
    align-items: center;
    // margin-top: -20px;   
    // &__icon {
    //   width:20px;
    //   height:20px;
    //   margin-top: -50px;
    //   background: url(./img/icon-tel.png) no-repeat center/cover;
    // }
    &__num {
      // margin-left: 10px;
      &-name {
        font-size:14px;
        color:#737582;
        padding-bottom: 5px;
        margin-top: -20px;
      }
      &-num {
        font-size:14px;
        color:#f1f1f1;
        line-height: 25px;
        // font-weight: 800;
      }
    }
    &__online {
      display: block;
      border:1px solid #6c6e73;
      border-radius:100px;
      width:152px;
      height:30px;
      margin:10px 0 0 -24px;
      line-height:28px;
      color: #ffffff;
      font-size:14px;
      color:#ffffff;
      letter-spacing:4px;
      text-align: center;
    }
    &__work-time {
      width:120px;
      height:20px;
      line-height:20px;
      margin-top:10px;
      // margin-left:-8px;
      font-weight: 700;
      color:#fff;
      background-color: #4D91FD;
      text-align:center;
    }
  }
}

.company-info {
  text-align: center;
  line-height: 48px;
  font-size:12px;
  color:#767884;
  .copyright {
    margin-right: 60px;
    display: inline-block;
    color:#767884;
    a {
      color:#767884;
    }
    :hover {
      color: #0092ff;
    }
  }
  .case-number {
    display: inline-block;
    a {
      display:inline-block;
      text-decoration:none;
      height:20px;
      line-height:20px;
      color:#767884;
      .record-icon {
        float: left;
        margin-right: 5px;
      }
    }
  }
}
</style>
