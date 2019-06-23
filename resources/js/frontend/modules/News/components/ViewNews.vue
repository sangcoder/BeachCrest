<template>
  <div class="main-view">
    <b-row>
      <b-col md="8" class="main-content">
        <div class="header-news">
          <h2>{{infoNews.Title}}</h2>
          <p>
            <small>Đăng bởi:</small>
            <strong v-if="infoNews && infoNews.info">{{infoNews.info.name}}</strong>
          </p>
        </div>
        <div class="feather-img">
          <img class="img-responsive" :src="infoNews.ImgUrl" :alt="infoNews.Title">
        </div>
        <div class="content-news" v-html="infoNews.Contents"></div>
      </b-col>
      <b-col md="4">
        <list-promotion
          :title-promotion="'Tour có khuyến mãi'"
          :list-promotion="listPromotion"
          v-if="loadingPromotion"
          :loading="loadingPromotion"
        ></list-promotion>
        <list-promotion
          v-else
          :title-promotion="'Tour có khuyến mãi'"
          :list-promotion="listPromotion"
        ></list-promotion>
      </b-col>
    </b-row>
  </div>
</template>
<script>
import NewsAPI from "../serviceNews";
import ListPromotion from '../../../components/ListPromotion'
export default {
  name: "ViewNews",
  components: {
    ListPromotion
  },
  created() {
    this.fetchNewsById(this.$route.query.view);
    this.fetchPromotion();
  },
  data() {
    return {
      infoNews: {},
      loadingPromotion: false,
      listPromotion: []
    };
  },
  methods: {
    fetchNewsById(id) {
      NewsAPI.getNewsById(id).then(res => {
        this.infoNews = res.data.data;
      });
    },
    fetchPromotion() {
      this.loadingPromotion = true;
      NewsAPI.getListPromotion().then(res => {
        let tempArray = res.data;
        tempArray.forEach(ele => {
          let tmp = (ele.ImageUrl = JSON.parse(ele.ImageUrl));
          ele.ImageUrl = tmp;
        });
        this.listPromotion = tempArray;
        this.loadingPromotion = false;
      });
    }
  }
};
</script>
<style lang="css" scoped>
.main-view {
  padding: 15px;
  background: #fff;
}
.header-news h2 {
  margin-top: 0px;
  font-size: 20px;
  line-height: 25px;
  margin-bottom: 0;
  font-weight: 500;
  max-height: 75px;
  margin-bottom: 20px;
}

</style>
<style>
.content-news img {
  width: 100% !important;
}
</style>
