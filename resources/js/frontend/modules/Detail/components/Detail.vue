<template>
  <div class="section section-detail" >
    <h2>Du Lịch Quy Nhơn - Phú Yên - Nha Trang {{ $route.query.tour}}</h2>
    <b-row>
      <b-col md="8" ref="tourContent">
        <detail-content></detail-content>
        <comment-box/>
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
export default {
  components: {
    BoxBooking,
    DetailContent,
    CommentBox,
    ListPromotion
  },
  data() {
    return {
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
    window.addEventListener("resize", this.handleResize);
    window.addEventListener("scroll", this.handleScroll);
  },
  computed: {
    sidebarStyle() {
      if (this.sidebar.height <= this.sidebar.windowHeight) {
        return { 'fixed-top': false };
      }
      if ((this.sidebar.windowScrollTop + this.sidebar.windowHeight) > this.sidebar.height )
        return {'fixed-bottom-sidebar': false}
      else {
        return {'fixed-bottom-sidebar': false}
      }
    }
  },
  methods: {
    handleResize: _.throttle(function() {
      this.calculateSidebar();
      console.log(window.innerWidth)
    }, 100),
    handleScroll: _.throttle(function() {
      this.sidebar.windowScrollTop = window.pageYOffset || window.document.documentElement.scrollTop 
    }, 100),

    // Tính toán sidebar
    calculateSidebar() {
      this.sidebar.height = this.$refs.sidebarContent.offsetHeight;
      this.sidebar.windowHeight = window.innerHeight;
      this.mainContent.height = this.$refs.tourContent.offsetHeight
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
