<style lang="less" scoped>
.title {
  text-align: center;
  position: relative;
  h1 {
    color: #333333;
    font-size: 24px !important;
    height: 70px;
    line-height: 70px;
    font-weight: 300;
    border-bottom: 1px #dadada solid;
  }
}

.overlay {
  display: flex;
  position: fixed;
  top: 0;
  left: 0;
  width: 100%;
  height: 100%;
  z-index: 101;
  opacity: 0;
  align-items: center;
  justify-content: center;
  background-color: rgba(0, 0, 0, 0.5);
  transition: opacity .3s;
}

.fade-transition {}

.fade-enter,
.fade-leave {
  opacity: 0;
}

.dialog {
  width: 90%;
  max-width: 700px;
  border-radius: 5px;
  background-color: #fff;
  overflow: hidden;
  box-sizing: border-box;
  border-radius: 12px;
}

.dialog-enter-active,
.dialog-leave-active {
  opacity: 1;
  transform: scale(1);
  transition: transform .4s, opacity .4s;
}

.dialog-enter,
.dialog-leave {
  opacity: 0;
  transform: scale(1.2);
}
.close-dialog {
  position: absolute;
  top: 26px;
  background: url(./imgs/tip-close.png) 0 0 no-repeat;
  right: 30px;
  background-size: 100%;
  width: 14px;
  height: 28px;
}

</style>
<template>
  <transition name="dialog" mode="in-out">
    <div class="overlay" v-show="visible" transition="fade">
      <div class="dialog" v-show="visible">
        <div class="title" v-if="title">
          <h1 v-text="title"></h1>
          <a href="javascript:;" class="close-dialog" @click="onHide"></a>
        </div>
        <slot></slot>
      </div>
    </div>
  </transition>
</template>
<script>
export default {
  props: {
    visible: {
      type: Boolean
    },
    title: {
      type: String,
      default: ''
    },
    onShow: {
      type: Function,
      default: function() {}
    },
    onHide: {
      type: Function,
      default: function() {}
    }
  },
  watch: {
    visible(val) {
      if (val) {
        this.onShow()
        setTimeout(() => {
          this.$el.style.opacity = 1
        })
      } else {
        this.onHide(this.visible)
        this.$el.style.opacity = 0
      }
    }
  }
}
</script>
