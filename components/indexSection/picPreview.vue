<template>
<div class="preview-root">
  <div class="layout">
    <div class="btn-box btn-left">
      <div v-if="picData.length > 1" class="btn notice__btn-prev" @click="setPrevPic"></div>
    </div>

    <div class="img-sc">
      <div class="img-box">
        <img :key="n" v-for="(n, index) in picData" :src="n" v-show="index === picIndex" alt="">
      </div>
    </div>

    <div class="btn-box">
      <div class="btn-right-up btn notice__btn-close" @click="toogleMessagePic"></div>
      <div v-if="picData.length > 1" class="btn-right-down btn notice__btn-next have-more" @click="setNextPic"></div>
    </div>
  </div>
</div>
</template>

<script>
export default {
  name: 'pic-preview',
  props: {
    picData: Array,
    toogleMessagePic: Function
  },
  data () {
    return {
      picIndex: 0
    }
  },
  methods: {
    setPrevPic () {
      if (this.picIndex > 0) {
        this.picIndex--
      }
    },
    setNextPic () {
      if (this.picIndex < this.picData.length - 1) {
        this.picIndex++
      }
    }
  }
}
</script>

<style lang="less" scoped>
.preview-root {
  position: fixed;
  left: 0;
  right: 0;
  top: 0;
  bottom: 0;
  z-index: 334;
  background: rgba(0, 0, 0, 0.7);
}

.layout {
  display: flex;
  align-items: center;
  width: 1200px;
  margin: auto;
}

.btn-box {
  // display: flex;
  // align-items: center;
  // justify-content: center;
  outline: none;
}
.btn-left {
  position: absolute;
  left: 100px;
  top: 500px;
}
.btn-right-down {
  position: absolute;
  right: 100px;
  top: 500px;
}
.btn-right-up {
  position: absolute;
  right: 150px;
  top: 80px;
}
.btn {
  cursor: pointer;
  outline: none;
  width: 100px;
  height: 100px;
  margin: 60px 200px 0 0;
  border-radius: 100px;
  border:1px solid #e5e5e5;
  display: flex;
  align-items: center;
  justify-content: center;
  &:after {
    content: '';
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
.notice__btn-prev {
  &:after {
    transform: rotate(-135deg);
  }
}
.notice__btn-next {
  &:after {
    transform: rotate(45deg);
  }
}
.have-more {
  border: none;
  background:rgba(18,110,248,0.90);
  // box-shadow: 0 20px 30px rgba(18,110,248,0.20);
  &:after {
    content: '';
    display: block;
    width: 17px;
    height: 17px;
    border-top: 4px #fff solid;
    border-right: 4px #fff solid;
  }
}

.img-sc {
  overflow: hidden;
  height: 100vh;
  width: 800px;
  margin: auto;
  overflow: scroll;
}
.img-sc::-webkit-scrollbar {
  display: none;
}
.img-box {
  padding: 150px;
  img {
    display: block;
    width: 80%;
    box-shadow: 0px 10px 10px rgba(0, 0, 0, 0.8);
  }
}
</style>

