<style src="./index.css"></style>

<template>
<div class="root">
  <sd-header :activeTab="1"></sd-header>
<div class="container">
  <div class="wrapper clearfix">
    <div class="wrapper-cont">
      <ul class="aboutus-nav">
        <li class="aboutus-tab" data-id="media">
          <a href="/aboutUs" class="bule-color report"><em class="sign-report media-default"></em>关于我们</a></li>
        <li class="aboutus-tab joinus-link joinus" data-id="join"><a href=""><em class="sign-report"></em>产学研</a></li>
      </ul>
      </div>
      <div class="aboutus-details">
        <div class="details-content">
          <!-- 媒体报道区域 -->
          <div id="media" class="media-area">
            <ul>
              <li>
                  <h2 class="media-title"> 技术选型，服务端采用那种技术?
</h2>
                </a>
                <a class="media-list">
                  <p class="media-link-msg">技术选型，服务端采用那种技术？前端采用那种技术？服务端和前端如何配合？服务端界面是否需要像前端一样设计？用模板行不行？
2、  主要功能大致是这样的。新用户邮箱注册（10积分），完成个人信息认证加20积分。密码找回通过邮箱实现。登陆后可看到自己的新消息、新任务等，可实现签到，签到一次获取5个积分。首页主要实现导航和主要功能的展示和链接。预约、邀约、通知分类集中显示（缺少二级、三级设计页面），预约、邀约、通知根据标签区分内容类型。比如邀约，是邀约讲解还是邀约辅导？概况里面的内容我已经写好了，设计图也做好了，到时动态在前端展示就行。
预约辅导（互助学习），功能主要为申请辅导（根据后台事先导入的名单匹配，如果匹配上直接成功，如果没有可以提申请等待批准）。邀约辅导，可以查找所有没有发布学习计划的小老师并邀请她给自己辅导（需要支付一定的积分）应答小老师辅导完毕，可结算获取相应积分。预约辅导（不需要支付积分），只能查找和显示发布辅导计划的小老师，查看他的辅导计划进行提前预约（一般有名额限制，如果不预约不能参加此次辅导计划，如果名额满，可申请挤课，等待小老师审批。这里的辅导计划包括老师，小老师和组织机构发布的计划，组织机构可以理解为科研课题组什么，完成辅导计划老师和学生均可以获得相应积分，等级也会提升）。
强化学习（改为巅峰训练），主要针对不同的学科进行学习训练，分四部分：仿真学习（实验讲义，主要是文本显示；操作帮助，主要是文本显示；实拍实验操作，主要是视频播放；仿真实验，主要是3D展示和操作，暂时咱们先不做）。捉对PK（主要是和不同级别的学生比赛答题，通过成绩获取相应的积分）。闯关答题（主要是选择题和主观题，这个里面包含了答题时间控制，收藏，笔记，试题解析，重新答题等内容。目前可以只考虑从后台上传试题即可，后续可以能需要给出一个题目或者文章，计算机自己出题，具体出题策略，咱们再和天大老师碰。每一道试题都可以以邀约讲解，需要支付一定的积分，讲解者获取一定的积分，不同级别的人刷的试题难度不一样，通过刷试题测试可以提升等级，通过刷课题组试题，可以获取课题组面试机会并加入课题组，或者是获取导师的面试机会[注：这些是高阶的，主要是985类的科研院校]。）
研讨社区（待下次讨论）
产学研（待下次讨论）
3、  命名规范问题，主要包括数据库，前端和后端。大家讨论一下，尽量使用所表达意思的英文字母或缩写字母。需要做好主要代码注释，方便后续迭代。
4、  设计，整体界面以简洁为主，主色调是白，黑，蓝，紫，绿，报错提示为红（</p>
                </a>
              </li>
              </ul>
          </div>
        </div>
      </div>
    </div>
  </div>
  <page-footer></page-footer>
</div>
</template>

<script>
import SdHeader from '~/components/navBar'
import PageFooter from '~/components/pageFooter'
import { mapGetters } from 'vuex'
export default {
  data() {
    return {
      mediaDetailUrl: '/aboutUs/media/',
      hasPrev: false,
      hasNext: true
    }
  },
  components: {
    SdHeader,
    PageFooter
  }
}
</script>