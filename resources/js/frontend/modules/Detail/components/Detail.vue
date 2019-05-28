<template>
  <div class="section section-detail">
    <h2>{{dataTour.TourName}}</h2>
    <b-row>
      <b-col md="8">
        <div class="tourContent" ref="tourContent">
          <detail-content :image-url="dataTour.ImageUrl" :Schedules="dataTour.Schedule"></detail-content>
          <comment-box :CountReview="dataTour.Rating" :comments="comments"></comment-box>
        </div>
      </b-col>
      <b-col md="4">
        <div class="sidebar-content" :class="sidebarStyle" ref="sidebarContent">
          <box-booking/>
          <list-promotion/>
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
// import service
import DetailTourAPI from "../serviceDetailTour";
export default {
  components: {
    BoxBooking,
    DetailContent,
    CommentBox,
    ListPromotion
  },
  data() {
    return {
      dataTour: [],
      comments: [],
      mainContent: {
        height: 0
      },
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
    window.addEventListener("resize", this.handleResize);
    window.addEventListener("scroll", this.handleScroll);
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
      DetailTourAPI.getTourId(id)
        .then(res => {
          if (res.data.status === "404") {
            console.log("Không tìm thấy tour này");
          } else {
            let tempArray = res.data.data;
            tempArray.ImageUrl = JSON.parse(tempArray.ImageUrl);
            this.dataTour = tempArray;
          }
        })
        .catch(err => {
          console.log(err);
        });
    },
    fetchComment(id) {
      DetailTourAPI.getCommentByTourID(id).then(res => {
        this.comments = res.data.data;
      });
    },
    handleResize: _.throttle(function() {
      this.calculateSidebar();
    }, 100),
    handleScroll: _.throttle(function() {
      this.sidebar.windowScrollTop =
        window.pageYOffset || window.document.documentElement.scrollTop;
    }, 100),

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
