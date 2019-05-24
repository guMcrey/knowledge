<template>
  <div class="index-root">
    <nav-bar></nav-bar>
    <div id="indexSwiper" class="swiper">
      <div class="wave">
        <svg-wave></svg-wave>
      </div>

      <div class="slide-box">
        <section class="slide-item">
          <first-screen>
            <div class="slot-root height-animation">
              <svg-animation slot="svg"></svg-animation>
              <div class="stat-root" slot="stat">
                <div class="stat">
                  <div class="item">
                    <div class="item__icon family"></div>
                    <div class="item__type">
                      <h4 class="title">真题练习、专项练习</h4>
                      <div class="number">多样的试题分类,提出引导式学习的方案。</div>
                    </div>
                  </div>
                  <div class="item">
                    <div class="item__icon member"></div>
                    <div class="item__type">
                      <h4 class="title">在线交流、即问即答</h4>
                      <div class="number">遇到难题？发布到信息广场和交流区吧</div>
                    </div>
                  </div>
                  <div class="item">
                    <div class="item__icon family"></div>
                    <div class="item__type">
                      <h4 class="title">线上预约、线下辅导</h4>
                      <div class="number">人性化的预约体系设计，人人当小老师</div>
                    </div>
                  </div>
                </div>
              </div>
            </div>
          </first-screen>
        </section>

        <section class="slide-item">
          <plans-intro></plans-intro>
        </section>

        <section class="slide-item">
          <investor></investor>
          <page-footer></page-footer>
        </section>
      </div>
    </div>
  </div>
</template>
<style lang="less" scoped src="./style.less"></style>
<script>
import NavBar from "~/components/navBar";
import FirstScreen from "~/components/indexSection/firstScreen.vue";
import PlansIntro from "~/components/indexSection/plansIntro";
import Investor from "~/components/indexSection/investor";
import PageFooter from "~/components/pageFooter";
import SvgAnimation from "~/components/indexSection/svgAnimation";
import MemberList from "~/components/indexSection/memberList";
import SvgWave from "~/components/indexSection/svgWave";


export default {
  name: "index-page",
  components: {
    NavBar,
    FirstScreen,
    PlansIntro,
    Investor,
    PageFooter,
    SvgAnimation,
    MemberList,
    SvgWave,
  },
  data() {
    return {
      totalMember: 0,
      swiperOption: {
        direction: "vertical",
        keyboard: true,
        mousewheel: true
      }
    };
  },
  mounted() {
    // this.loadData();
    // this.getUserInfo()
  },
  methods: {
    clientHeight() {
      const { document } = window;
      let ch = 0;
      if (document.body.clientHeight && document.documentElement.clientHeight) {
        ch =
          document.body.clientHeight < document.documentElement.clientHeight
            ? document.body.clientHeight
            : document.documentElement.clientHeight;
      } else {
        ch =
          document.body.clientHeight > document.documentElement.clientHeight
            ? document.body.clientHeight
            : document.documentElement.clientHeight;
      }

      return ch;
    },
    loadData() {
      api
        .getStatCount()
        .then(res => {
          this.totalMember = res.data.data.totalMember;

          setTimeout(() => {
            this.loadData();
          }, 2000);
        })
        .catch(() => {
          setTimeout(() => {
            this.loadData();
          }, 2000);
        });
    }
  },
  async asyncData() {
    const fakeData = {
      totalMember: "39618620",
      totalAllocationPatient: "964",
      totalAllocationAmount: "11832.8",
      totalAllocationAmountInYuan: 118327560
    };

    try {
      let { data } = await api.getStatCount();
      return {
        ...data.data
      };
    } catch (e) {
      return fakeData;
    }
  }
};
</script>


