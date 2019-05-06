<template>
  <section class="banner-root">
    <div class="shade">
      <div class="animation-fade">
        <h1 class="slogan">基于vue的知学平台的设计与实现</h1>
        <h2 class="desc">&nbsp;</h2>
      </div>
    </div>
    <div class="banner">
      <img class="banner__pic" src="./img/bg.jpg" alt>
    </div>
    <slot></slot>
  </section>
</template>

<style lang="less" scoped>
.position() {
  position: absolute;
  left: 0;
  right: 0;
  top: 0;
}
.banner-root {
  position: relative;
  height: 100vh;
  overflow: hidden;
  .banner {
    .position();
    z-index: 1;
    &__pic {
      width: 100%;
      display: block;
    }
  }
  .shade {
    margin-top: 40px;
    .position();
    z-index: 2;
    height: 100%;
    background: rgba(0, 0, 0, 0.3);
    text-align: center;
    .animation-fade {
      animation: fade 1s ease 1 forwards;
      opacity: 0;
      .emphasize-info {
        margin: 60px auto;
        font-size: 16px;
        color: #ffffff;
        letter-spacing: 0;
      }
    }
    .slogan {
      padding-top: 15%;
      font-size: 54px;
      color: #ffffff;
      letter-spacing: 8.89px;
      font-weight: 800;
      letter-spacing: 12.5px;
    }
    .desc {
      font-size: 28px;
      color: #ffffff;
      letter-spacing: 54px;
      font-weight: 400;
    }
  }
}

@keyframes fade {
  0% {
    opacity: 0;
    transform: translateY(30px);
  }
  100% {
    opacity: 1;
    transform: translateY(0);
  }
}
</style>

