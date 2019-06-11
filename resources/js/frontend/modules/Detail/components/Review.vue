<template>
  <div class="box-comment border-box-content my-3">
    <a-spin :spinning="spinning">
      <h3>Đánh giá</h3>
      <div class="review-box">
        <b-row>
          <b-col md="5" class="review-box-score">
            <div class="review-score">
              {{ CountReview && CountReview.NumberRating }}
              <span>/5</span>
            </div>

            <a-rate v-if="CountReview" :defaultValue="CountReview.NumberRating" disabled/>
            <p>Trên {{CountReview && CountReview.NumberReview}} nhận xét</p>
          </b-col>
          <b-col md="7">
            <div v-if="CountReview" class="counter-score">
              <p v-for="(item, index) in sumary" :key="index">
                {{item.label}}
                <a-progress :percent="item.percent || item.value" size="small" status="active"/>
              </p>
            </div>
          </b-col>
        </b-row>
      </div>

      <a-comment v-if="empty">
        <a-avatar slot="avatar" size="large" :src="/^https?:\/\//i.test(this.$store.state.user.user.photo) ? this.$store.state.user.user.photo : '/images/' + this.$store.state.user.user.photo"/>
        <div slot="content">
          <b-form-group label="Đánh giá về tour này">
            <a-rate :defaultValue="3" v-model="formData.Rating"/>
          </b-form-group>
          <b-form-group label="Nhận xét của bạn">
            <a-textarea :rows="4" @change="handleChange" v-model="formData.Contents"></a-textarea>
          </b-form-group>
          <b-form-group>
            <a-button
              htmlType="submit"
              :loading="submitting"
              @click="handleSubmit"
              type="primary"
            >Thêm nhận xét</a-button>
          </b-form-group>
        </div>
      </a-comment>
      <div
        v-else
        data-show="true"
        class="ant-alert ant-alert-info ant-alert-no-icon ant-alert-closable"
      >
        <span class="ant-alert-message">
          Vui lòng
          <a href="#">đăng nhập</a> để đăng nhận xét!
        </span>
      </div>
      <div class="comment-item mt-3" v-for="comment in comments" :key="comment.ReviewID">
        <div class="comment-item-head">
          <div class="media">
            <div class="media-left">
              <a-avatar size="large" icon="user" :src="/^https?:\/\//i.test(comment.user.photo) ? comment.user.photo : '/images/' + comment.user.photo"/>
            </div>
            <div class="media-body">
              <h5 class="media-heading">
                <a href="#">{{comment.user.name}}</a>
              </h5>
              <div class="date">{{comment.created_at | timeAgo}}</div>
            </div>
            <div class="ml-auto">
              <a-rate :defaultValue="comment.Rating" disabled/>
            </div>
          </div>
        </div>
        <div class="comment-item-body">
          <div class="detail">
            <div class="st-description" data-show-all="st-description-235">{{comment.Contents}}</div>
          </div>
        </div>
      </div>
    </a-spin>
  </div>
</template>
<script>
import moment from "moment";
import ReviewAPI from "../serviceDetailTour";
import DetailTourAPI from "../serviceDetailTour";
import _ from 'lodash'
export default {
  name: "CommentBox",
  props: {
    CountReview: Object,
    comments: Array,
    spinning: {
      type: Boolean,
      default: false
    }
  },
  data() {
    return {
      pageSizeOptions: ["10", "20", "30", "40", "50"],
      current: 1,
      pageSize: 10,
      total: 50,
      submitting: false,
      value: 4,
      formData: {
        Rating: 5,
        Contents: ""
      },
      sumary: [
        {
          label: "Rất tệ",
          Rating: 1,
          value: 0
        },
        {
          label: "Tệ",
          Rating: 2,
          value: 0
        },
        {
          label: "Bình thường",
          Rating: 3,
          value: 0
        },
        {
          label: "Tốt",
          Rating: 4,
          value: 0
        },
        {
          label: "Tuyệt vời",
          Rating: 5,
          value: 0
        }],
      user: null,
      empty: false,
      moment
    };
  },
  created() {
    this.user = this.$store.get("user/user");
  },
  watch: {
    user() {
      if (_.isEmpty(this.user)) {
        this.empty = false;
      } else {
        this.empty = true;
      }
    },
    CountReview (v) {
      if (v) {
        let data = _.cloneDeep(v)
        for(let item of this.sumary) 
        {
          for(let item2 of data.Score) 
          {
            if(item2.Rating === item.Rating) {
                item.percent = item2.percent
            }
          }
        }
      }
    }
  },
  methods: {
    onShowSizeChange(current, pageSize) {
      console.log(current)
      this.pageSize = pageSize;
    },
    handleSubmit() {
      if (!this.formData.Contents) {
        return;
      }
     
      this.submitting = true;
      let payload = {
        TourID: this.$route.query.tour,
        Rating: this.formData.Rating,
        Contents: this.formData.Contents
      };
       
      ReviewAPI.addReview(payload)
        .then(res => {
          this.submitting = false;
          let that = this;
          this.formData.Contents = ''
          this.$emit('ReloadDS',payload )
        })
        .catch(err => {
          this.submitting = false;
        });
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
.review-box {
  padding: 2rem;
}
.review-box-score {
  display: flex;
  flex-direction: column;
  align-items: center;
  justify-content: center;
  font-size: 1rem;
  border: 1px dashed #eee;
  background-color: #f0f8ff;
}
.review-score {
  font-size: 30px;
}
.review-score span {
  font-size: 1rem;
}
.counter-score p {
  margin-bottom: 0;
}
</style>
