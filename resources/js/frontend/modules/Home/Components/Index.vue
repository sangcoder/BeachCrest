<template>
  <div class="main-index">
    <SearchTour/>
    <section class="mod-tour">
      <h2>Tour mới cập nhật</h2>
      <div class="row tour-r">
        <template v-if="loading">
          <div v-for="i in 4" :key="i" class="col-lg-3 col-md-4 col-sm-6 tour--item">
            <list-tour loading/>
          </div>
        </template>
        <template v-else>
          <div
            v-for="tour in listTour"
            :key="tour.TourID"
            class="col-lg-3 col-md-4 col-sm-6 tour--item"
          >
            <list-tour>
              <template slot="tour_image">
                <div
                  class="tour__img"
                  :style="{backgroundImage: 'url('+ '/images/tour/'+ tour.ImageUrl[0] +')'}"
                >
                  <span
                    :class="tour.Discount === 0 ? 'text-white d-none' : 'text-white d-block'"
                  >{{tour.Discount}}%</span>
                  <a href="#" style="display:block;" :title="tour.TourName">
                    <img src="/images/Tour.png">
                  </a>
                  <!-- <div class="tour__tag bestseller">Featured</div> -->
                </div>
              </template>
              <template slot="tag">
                <a-icon type="tags"/>Nha Trang
              </template>
              <template slot="heading">
                <a href="#" :title="tour.TourName">{{tour.TourName | truncate(50)}}</a>
              </template>
              <template slot="rating">
                <a-rate :defaultValue="tour.Rating" allowHalf disabled/>
              </template>
              <template slot="review">
                <span>{{tour.NumberReview}} Review</span>
              </template>
              <template slot="duration">
                <div class="tour__duration">
                  <a-icon type="clock-circle" class="mr-1"/>
                  {{ tour.TourTime }}
                </div>
              </template>
              <template slot="price">
                <div class="tour__price">
                  <span class="price">
                    <span
                      :class="tour.Discount === 0 ? 'd-none' : 'onsale'"
                    >{{tour.PriceAdult | toCurrency}}</span>
                    <span>{{ tour.Discount === 0 ? tour.PriceAdult : tour.Onsale | toCurrency}}</span>
                  </span>
                </div>
              </template>
            </list-tour>
          </div>
        </template>
      </div>
    </section>
  </div>
</template>
<script>
import SearchTour from "./SearchTour";
import ListTour from "./ListTour";
export default {
  components: {
    SearchTour,
    ListTour
  },
  data() {
    return {
      loading: true
    };
  },
  mounted() {
    this.$store.dispatch("tour/getListTour").then(res => {
      this.loading = false;
    });
  },
  computed: {
    listTour() {
      return this.$store.state.tour.listTour;
    }
  }
};
</script>
<style scoped>
.tour--item {
  margin-bottom: 20px;
}
</style>
