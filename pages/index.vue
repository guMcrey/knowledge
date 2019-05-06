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
                      <h4 class="title">已提供学习试题(套)</h4>
                      <div class="number">{{totalAllocationPatient}}</div>
                      <!-- {{Number(totalAllocationAmountInYuan).toLocaleString()}} -->
                    </div>
                  </div>
                  <div class="item">
                    <div class="item__icon member"></div>
                    <div class="item__type">
                      <h4 class="title">已拥有知友(人)</h4>
                      <div class="number">{{Number(totalMember).toLocaleString()}}</div>
                    </div>
                  </div>
                  <div class="item comments">
                    <member-list></member-list>
                  </div>
                </div>
              </div>
            </div>
          </first-screen>
        </section>

        <section class="slide-item">
          <plans-intro></plans-intro>
        </section>

        <!-- <section class="slide-item">
          <reliable-intro></reliable-intro>
        </section>-->

        <!-- <section class="slide-item">
          <news-list></news-list>
        </section>-->

        <section class="slide-item">
          <investor></investor>
          <page-footer></page-footer>
        </section>
      </div>
    </div>

    <qr></qr>
  </div>
</template>
<style lang="less" scoped src="./style.less"></style>
<script>
import NavBar from "~/components/navBar";
import FirstScreen from "~/components/indexSection/firstScreen.vue";
import PlansIntro from "~/components/indexSection/plansIntro";
import ReliableIntro from "~/components/indexSection/reliableIntro";
import NewsList from "~/components/indexSection/newsList";
import Investor from "~/components/indexSection/investor";
import PageFooter from "~/components/pageFooter";
import SvgAnimation from "~/components/indexSection/svgAnimation";
import MemberList from "~/components/indexSection/memberList";
import SvgWave from "~/components/indexSection/svgWave";
import Qr from "~/components/indexSection/qr";

import * as api from "~/assets/api";

export default {
  name: "index-page",
  components: {
    NavBar,
    FirstScreen,
    PlansIntro,
    ReliableIntro,
    NewsList,
    Investor,
    PageFooter,
    SvgAnimation,
    MemberList,
    SvgWave,
    Qr
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


