<template>
  <div class="box-comment border-box-content my-3">
    <review-score/>
    <div data-show="true" class="ant-alert ant-alert-info ant-alert-no-icon ant-alert-closable">
      <span class="ant-alert-message">
        Vui lòng
        <a href="#">đăng nhập</a> để đăng nhận xét!
      </span>
    </div>
    <a-comment>
      <a-avatar
        slot="avatar"
        size="large"
        src="https://zos.alipayobjects.com/rmsportal/ODTLcjxAfvqbxHnVXCYX.png"
        alt="Han Solo"
      />
      <div slot="content">
        <b-form-group
        label="Đánh giá về tour này"
        >
          <a-rate :defaultValue="3" />
        </b-form-group>
        <b-form-group
        label="Nhận xét của bạn"
        >
          <a-textarea :rows="4" @change="handleChange" :value="value"></a-textarea>
        </b-form-group>
        <b-form-group>
          <a-button
            htmlType="submit"
            :loading="submitting"
            @click="handleSubmit"
            type="primary"
          >Add Comment</a-button>
        </b-form-group>
      </div>
    </a-comment>
    <div class="comment-item mt-3">
      <div class="comment-item-head">
        <div class="media">
          <div class="media-left">
            <a-avatar
              size="large"
              icon="user"
              src="https://secure.gravatar.com/avatar/?s=50&amp;d=mm&amp;r=g"
            />
          </div>
          <div class="media-body">
            <h5 class="media-heading">
              <a href="#">Customer</a>
            </h5>
            <div class="date">16/01/2019</div>
          </div>
          <div class="ml-auto">
            <a-rate v-model="value"/>
          </div>
        </div>
      </div>
      <div class="comment-item-body">
        <div class="detail">
          <div
            class="st-description"
            data-show-all="st-description-235"
          >Very professional support system and serious support team all my questions answered</div>
        </div>
      </div>
    </div>
  </div>
</template>
<script>
import moment from "moment";
import ReviewScore from "./ReviewScore";
export default {
  name: "CommentBox",
  components: {
    ReviewScore
  },
  data() {
    return {
      comments: [],
      submitting: false,
      value: 4,
      moment
    };
  },
  methods: {
    handleSubmit() {
      if (!this.value) {
        return;
      }

      this.submitting = true;

      setTimeout(() => {
        this.submitting = false;
        this.comments = [
          {
            author: "Han Solo",
            avatar:
              "https://zos.alipayobjects.com/rmsportal/ODTLcjxAfvqbxHnVXCYX.png",
            content: this.value,
            datetime: moment().fromNow()
          },
          ...this.comments
        ];
        this.value = "";
      }, 1000);
    },
    handleChange(e) {
      this.value = e.target.value;
    }
  }
};
</script>
<style scoped>
.comment-item {
  border: 1px solid #dae1e7;
  padding: 0.75rem;
  border-radius: 3px;
}
.media {
  align-items: center;
  border-bottom: 1px dashed #eee;
  padding-bottom: 15px;
}
.media-heading {
  margin-bottom: 0;
}
.media-body {
  margin-left: 20px;
}
.date {
  font-size: 0.75rem;
  color: #b8c2cc !important;
}
.st-description {
  padding: 20px;
}
</style>
