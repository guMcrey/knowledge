<template>
  <div class="root">
    <div class="insurance-wrap">
      <div class="insurance-top">
        <span>保险商城</span>
      </div>
      <div class="insurance-list">
        <ul>
          <li>
          </li>
          <li>
          </li>
          <li class="expected">
            <div class="content">敬请期待...</div>
            <div class="foot-bg"></div>
          </li>
        </ul>
      </div>
    </div>
      
  </div>
</template>
<style lang="less" scoped>
  body {
  background: #f7f7f7;
  margin: 0;
  font-family: "PingFang SC";
}

.insurance-wrap {
  background: #fff;
}

.insurance-top {
  height: 60px;
  background: #fff;
}

.insurance-top span {
  display: block;
  margin-left: 40px;
  font-size: 36px;
  width: 200px;
  height: 50px;
  color: #419bf9;
  text-align: center;
  line-height: 100px;
  font-weight: bold;
}

.insurance-list {
  width: 100%;
  margin-top: 40px;
  background: #fff;
  overflow: hidden;
  background: #d5eaff;
}

.insurance-list ul {
  display: box;
  display: -webkit-box;
  display: -moz-box;
  width: 100%;
  padding: 50px 40px;
}

.insurance-list ul li {
  width: 29%;
  border-bottom: 1px #fff solid;
  list-style: none;
  background: #fff;
  padding-bottom: 20px;
  margin-left: 28px;
}
.insurance-list ul li img {
  float: left;
  width: 100%;
  margin-bottom: 20px;
}
.insurance-list ul .expected {
  background: #f2f2f2;
}
.expected .content {
  width: 100%;
  float: left;
  height: 278px;
  text-align: center;
  color: #999;
  font-size: 20px;
  line-height: 340px;
}
 .foot-bg {
    background: #fff;
    text-align: left;
    margin-left: 5%;
    color: #333;
    font-weight: bold;
    font-size: 20px;
  }

.sd-footer {
  text-align: center;
  margin-top: 80px;
}
@media screen and (max-width: 750px) {
  .insurance-top span{
    font-size: 24px;
    margin-left: 0;
  }
  .insurance-list ul {
    display: inline-block;
  }
  .insurance-list ul li {
    width: 76%;
    margin-left: 0;
  }
  .expected{
    display: none;
  }
  .sd-footer {
    width: 80%;
    margin: 30px auto;
  }
}
</style>
