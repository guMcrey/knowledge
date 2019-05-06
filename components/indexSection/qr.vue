<template>
  <div class="qr-root">
    <div class="icon" @click="showQr = true"></div>
    <div class="dialog" v-show="showQr">
      <div class="btn-right-up btn notice__btn-close" @click="showQr = false"></div>
      <div class="qr-pic"></div>
    </div>
  </div>
</template>

<script>
export default {
  data() {
    return {
      showQr: false
    };
  }
};
</script>

<style lang="less" scoped>
.icon {
  // background:rgba(18,110,248,0.90);
  width: 80px;
  height: 80px;
  border-radius: 80px 0 80px 80px;
  position: fixed;
  right: 40px;
  bottom: 300px;
  z-index: 301;
  display: flex;
  align-items: center;
  justify-content: center;
  cursor: pointer;
  &:after {
    content: "";
    display: block;
    width: 77px;
    height: 83px;
  }
}

.dialog {
  position: fixed;
  z-index: 999;
  top: 0;
  right: 0;
  left: 0;
  bottom: 0;
  background: rgba(0, 0, 0, 0.8);
}
.btn-right-up {
  position: absolute;
  right: 20%;
  top: 20%;
}
.btn {
  cursor: pointer;
  outline: none;
  width: 100px;
  height: 100px;
  border-radius: 100px;
  border: 1px solid #e5e5e5;
  display: flex;
  align-items: center;
  justify-content: center;
  &:after {
    content: "";
    display: block;
    width: 17px;
    height: 17px;
    border-top: 4px #fff solid;
    border-right: 4px #fff solid;
  }
  cursor: pointer;
}
.notice__btn-close {
  &:after {
    border: none;
    background: url(./img/icon-close.png) no-repeat center/cover;
  }
}

.qr-pic {
  position: absolute;
  top: 50%;
  left: 50%;
  transform: translate(-50%, -50%);
  width: 430px;
  img {
    width: 100%;
  }
}
</style>
