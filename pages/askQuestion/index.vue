<template>
  <div>
    <sd-header :activeTab="4"></sd-header>
    <div class="root">
      <div class="AnswerQuestions">
        <el-form :model="form" status-icon :rules="rules" ref="form">
          <el-form-item prop="title">
            <el-input
              type="text"
              v-model="form.title"
              placeholder="标题：一句话描述清楚问题（最多可输入60个中文字）"
              required
            ></el-input>
          </el-form-item>
          <el-form-item prop="type">
            <el-select v-model="form.type" placeholder="请选择问题类型">
              <el-option
                v-for="item in options"
                :key="item.value"
                :label="item.label"
                :value="item.value"
              ></el-option>
            </el-select>
          </el-form-item>
          <el-form-item prop="content">
            <el-input
              type="textarea"
              :rows="9"
              placeholder="清楚的描述问题细节，让回答员清楚的了解原因（请勿发布违规内容）"
              v-model="form.content"
            ></el-input>
          </el-form-item>
          <el-form-item prop="score">
            <el-select v-model="form.score" placeholder="请选择悬赏积分">
              <el-option
                v-for="item in jifen"
                :key="item.value"
                :label="item.label"
                :value="item.value"
              ></el-option>
            </el-select>
          </el-form-item>

          <div class="text">
            <h2>
              <span>悬赏会提高问题的曝光度和获取答案的速度.</span>
            </h2>
          </div>

          <el-form-item>
            <div class="tijiao" @click="submitDiscuss('form')">
              <el-button class="button1" value="确定提问">确认提交</el-button>
            </div>
          </el-form-item>
          <div class="text">
            <h3></h3>
          </div>
        </el-form>
      </div>
    </div>

    <page-footer class="heigh"></page-footer>
  </div>
</template>
<script>
import SdHeader from "~/components/navBar";
import PageFooter from "~/components/pageFooter";
import { apiCreateQuestion } from "~/servers/api/discuss";

export default {
  data() {
    return {
      form: {
        title: "",
        type: "",
        content: "",
        score: ""
      },
      options: [
        {
          value: "1",
          label: "社会民生"
        },
        {
          value: "2",
          label: "健康生活"
        },
        {
          value: "3",
          label: "文化艺术"
        },
        {
          value: "4",
          label: "电脑网络"
        },
        {
          value: "5",
          label: "科学教育"
        },
        {
          value: "6",
          label: "经济金融"
        },
        {
          value: "7",
          label: "医疗卫生"
        },
        {
          value: "8",
          label: "电子数码"
        },
        {
          value: "9",
          label: "心理分析"
        }
      ],
      jifen: [
        {
          value: "1",
          label: "5分"
        },
        {
          value: "2",
          label: "10分"
        },
        {
          value: "3",
          label: "15分"
        },
        {
          value: "4",
          label: "20分"
        }
      ],
      rules: {
        title: [{ required: true, message: "该字段不能为空", trigger: "blur" }],
        type: [{ required: true, message: "该字段不能为空", trigger: "blur" }],
        content: [
          { required: true, message: "该字段不能为空", trigger: "blur" }
        ],
        score: [{ required: true, message: "该字段不能为空", trigger: "blur" }]
      }
    };
  },
  methods: {
    // 创建讨论区问题
    async createDiscuss() {
      const { title, content, score, type } = this.form;
      const data = await apiCreateQuestion(title, content, score, type);
    },
    // 点击确认提交
    submitDiscuss(formName) {
      this.$refs[formName].validate(valid => {
        if (valid) {
          this.createDiscuss();
          this.$router.push("./discuss");
        } else {
          return false;
        }
      });
    }
  },
  components: {
    SdHeader,
    PageFooter
  }
};
</script>
<style>
.root {
  background: #f5f5f5;
  padding-top: 60px;
}
.form {
  display: flex;
  justify-content: center;
  flex-direction: column;
}
/*发布提问*/
.AnswerQuestions {
  box-shadow: 0 2px 10px #d9d9d9, inset 0 10px 1px #f1f1f1;
  display: flex;
  justify-content: space-around;
  max-width: 1140px;
  margin: 0px auto;
  background: #fff;
  padding: 60px;
}
.text {
  width: 916px;
  line-height: 60px;
}
.text h2 {
  margin-left: 4px;
  height: 32px;
  font: 16px/32px "microsoft yahei";
  color: #666;
}
.AnswerQuestions .text h3 {
  display: block;
  float: right;
  height: 32px;
  font: 15px/32px "microsoft yahei";
  color: #666;
}
.AnswerQuestions .text h3 span {
  display: block;
  float: left;
  height: 32px;
  font: 15px/32px "microsoft yahei";
  color: #666;
}
.AnswerQuestions .text h3 a {
  display: block;
  float: left;
  height: 32px;
  font: 15px/32px "microsoft yahei";
  color: #09f;
}
.AnswerQuestions .text h2 span {
  color: #4c67e8;
  font: 14px/32px "microsoft yahei";
}
.AnswerQuestions .text .input {
  border: 0;
  outline: none;
  border: 1px solid #ccc;
  border-radius: 2px;
  padding: 0 8px;
  width: 80%;
  height: 40px;
  font: 15px/40px "microsoft yahei";
  color: #666;
  border-radius: 6px;
}
.AnswerQuestions .text select {
  border: 0;
  outline: none;
  border: 1px solid #ccc;
  border-radius: 2px;
  padding: 0 8px;
  float: left;
  height: 40px;
  font: 15px/40px "microsoft yahei";
  color: #666;
  margin-bottom: 20px;
  border-radius: 6px;
}
.AnswerQuestions .xuans {
  width: 90%;
  height: 30px;
  margin: 15px 0 5px 4px;
}
.AnswerQuestions .xuans span {
  display: block;
  height: 30px;
  float: left;
  font: 16px/30px "microsoft yahei";
  color: #666;
}
.AnswerQuestions .xuans select {
  display: block;
  height: 30px;
  float: left;
  margin-left: 15px;
  padding: 0 6px;
  margin-right: 6px;
  font: 16px/30px "microsoft yahei";
  color: #666;
  border-radius: 6px;
}
.AnswerQuestions .tijiao {
  width: 100%;
  height: 50px;
}
.AnswerQuestions .tijiao .button1 {
  -webkit-appearance: none;
  border: none;
  display: block;
  width: 140px;
  height: 46px;
  font: 16px/46px "microsoft yahei";
  color: #fff;
  background-color: #f5ad1b;
  float: right;
  cursor: pointer;
  text-align: center;
  border-radius: 3px;
  line-height: 16px;
}
</style>