<template>
  <div class="section section-detail">
    <b-row class="flex-column-reverse flex-lg-row">
      <b-col md="8">
        <template v-if="loading">
          <skeleton-box width="90%" height="20px"/>
          <skeleton-box width="40%" height="15px"/>
        </template>
        <h2 v-else class="heading-title">{{dataTour.TourName}}</h2>
        <div class="tourContent" ref="tourContent">
          <detail-content
            v-if="loading"
            loading
            :image-url="dataTour.ImageUrl"
            :Schedules="dataTour.Schedule"
          ></detail-content>
          <detail-content v-else :image-url="dataTour.ImageUrl" :Schedules="dataTour.Schedule"></detail-content>
          <list-culture :listCultures="dataTour.listCultures"  />
          <comment-box @ReloadDS="ReloadDSComment" :spinning="spinning" :CountReview="dataTour.Rating" :comments="comments"></comment-box>
          <!-- <comment-box :CountReview="dataTour.Rating" /*v-on="ReloadDS(item)" :comments="comments"></comment-box> -->
        </div>
      </b-col>
      <b-col md="4">
        <div class="sidebar-content" :class="sidebarStyle" ref="sidebarContent">
          <box-booking
            v-if="loading"
            loading
            :price-tour="dataTour.OnsaleAdult"
            :price-kid="dataTour.OnsaleKid"
          ></box-booking>
          <box-booking v-else 
          :max-person="dataTour.TourExists" 
          :price-tour="dataTour.OnsaleAdult" 
          :price-kid="dataTour.OnsaleKid"
          :tour-time="dataTour.TourTime"
          :date-departure="dataTour.DateDeparture"
          :date-back="dataTour.DateBack"
          ></box-booking>
          <list-promotion
            :title-promotion="'Tour có khuyến mãi'"
            :list-promotion="listPromotion"
            v-if="loadingPromotion"
            :loading="loadingPromotion"
          ></list-promotion>
          <list-promotion v-else :title-promotion="'Tour có khuyến mãi'" :list-promotion="listPromotion"></list-promotion>
        </div>
      </b-col>
    </b-row>
  </div>
</template>
<script>
import _ from "lodash";
import BoxBooking from "./BoxBook";
import DetailContent from "./DetailContent";
import CommentBox from "./Review";
import ListPromotion from "../../../components/ListPromotion";
import SkeletonBox from "../../../components/Effects/SkeletonBox";
import ListCulture from './ListCulture'
// import service
import DetailTourAPI from "../serviceDetailTour";
export default {
  components: {
    BoxBooking,
    DetailContent,
    CommentBox,
    ListPromotion,
    SkeletonBox,
    ListCulture
  },
  data() {
    return {
      loading: false,
      loadingPromotion: false,
      dataTour: [],
      comments: [],
      listPromotion: [],
      mainContent: {
        height: 0
      },
      spinning: false,
      sidebar: {
        height: 0,
        width: 0,
        windowHeight: 0,
        windowScrollTop: 0
      }
    };
  },
  mounted() {
    this.calculateSidebar();
  },

  created() {
    this.fetchTour(this.$route.query.tour);
    this.fetchComment(this.$route.query.tour);
    this.fetchPromotion();
    window.addEventListener("resize", this.handleResize);
    window.addEventListener("scroll", this.handleScroll);
  },
  watch: {
    "$route.query.tour"() {
      this.fetchTour(this.$route.query.tour);
      this.fetchComment(this.$route.query.tour);
      this.fetchPromotion();
    }
  },
  computed: {
    sidebarStyle() {
      if (this.sidebar.height <= this.sidebar.windowHeight) {
        return { "fixed-top": false };
      }
      if (
        this.sidebar.windowScrollTop + this.sidebar.windowHeight >
        this.sidebar.height
      )
        return { "fixed-bottom-sidebar": false };
      else {
        return { "fixed-bottom-sidebar": false };
      }
    }
  },
  methods: {
    // Fetch Tour by query ID
    fetchTour(id) {
      this.loading = true;
      DetailTourAPI.getTourId(id)
        .then(res => {
          if (res.data.status === "404") {
            this.$notification['info']({
              message: "Tour này không có hoặc đã hết hạn",
              description:
                "Xin lỗi vì bất tiện này, chúng tôi sẽ chuyến hướng bạn đến trang chủ",
              duration: 5,
            });
           this.$router.push({name: 'Index'}) 
          } else {
            let tempArray = res.data.data;
            tempArray.ImageUrl = JSON.parse(tempArray.ImageUrl);
            this.dataTour = tempArray;
            this.loading = false;
          }
        })
        .catch(err => {
          console.log(err);
        });
    },
    fetchComment(id) {
      this.loading = true;
      this.spinning = true
      DetailTourAPI.getCommentByTourID(id).then(res => {
        this.comments = res.data.data;
        this.loading = false;
        this.spinning = false
      });
    },  
    fetchPromotion() {
      this.loadingPromotion = true;
      DetailTourAPI.getListPromotion().then(res => {
        let tempArray = res.data;
        tempArray.forEach(ele => {
          let tmp = (ele.ImageUrl = JSON.parse(ele.ImageUrl));
          ele.ImageUrl = tmp;
        });
        this.listPromotion = tempArray;
        this.loadingPromotion = false;
      });
    },
    ReloadDSComment (payload) {
      this.fetchComment(this.$route.query.tour);
      this.fetchTour(this.$route.query.tour)
      
    },
    handleResize: _.throttle(function() {
      this.calculateSidebar();
    }, 100),
    handleScroll: _.throttle(function() {
      this.sidebar.windowScrollTop =
        window.pageYOffset || window.document.documentElement.scrollTop;
    }, 100),
    // ReloadDS (item) {
    //   this.comments.push(item)
    // },
    // Tính toán sidebar
    calculateSidebar() {
      // this.sidebar.height = this.$refs.sidebarContent.offsetHeight;
      this.sidebar.windowHeight = window.innerHeight;
      // this.mainContent.height = this.$refs.tourContent.offsetHeight;
    }
  }
};
</script> 
<style scoped>
.sidebar-content.fixed-top-sidebar {
  position: fixed;
  width: 350px;
  top: 0;
}
.sidebar-content.fixed-bottom-sidebar {
  position: fixed;
  width: 350px;
  bottom: 0;
}
</style>
