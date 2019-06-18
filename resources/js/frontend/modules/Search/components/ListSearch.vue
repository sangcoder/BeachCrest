<template>
  <div class="main-content">
    <div>
      <a-input-search placeholder="Nhập tên tour cần tìm kiếm" @search="searchTour" enterButton/>
    </div>
    <p class="mt-2">
      <a-alert :message="`Có ${total} kết quả được tìm thấy`" banner/>
    </p>
    <div class="result-search">
      <b-row class="tour-r">
        <template v-if="loading">
          <div v-for="i in 6" :key="i" class="col-lg-4 col-md-4 col-sm-6 tour--item">
            <list-tour loading/>
          </div>
        </template>
        <template v-else>
          <div
            v-for="tour in listTourSearch"
            :key="tour.TourID"
            class="col-lg-4 col-md-4 col-sm-6 tour--item"
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
                  <a
                    @click="$router.push({name: 'booking', query: {tour: tour.TourID}})"
                    style="display:block;"
                    :title="tour.TourName"
                  >
                    <img src="/images/Tour.png">
                  </a>
                  <!-- <div class="tour__tag bestseller">Featured</div> -->
                </div>
              </template>
              <template slot="tag">
                <a-icon type="tags"/><span  class="tourName" v-for="place in tour.listPlace" :key="place.PlaceID">{{place.PlaceName}}</span>
              </template>
              <template slot="heading">
                <a
                  @click="$router.push({name: 'booking', query: {tour: tour.TourID}})"
                  :title="tour.TourName"
                >{{tour.TourName | truncate(50)}}</a>
              </template>
              <template slot="rating">
                <a-rate :defaultValue="tour.Rating.NumberRating" allowHalf disabled/>
              </template>
              <template slot="review">
                <span>{{tour.Rating.NumberReview}} Review</span>
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
                    <span>{{ tour.Discount === 0 ? tour.PriceAdult : tour.OnsaleAdult | toCurrency}}</span>
                  </span>
                </div>
              </template>
            </list-tour>
          </div>
        </template>
      </b-row>
      <p class="mt-2">
          <a-pagination :defaultCurrent="6" :total="total" />
      </p>
    </div>
  </div>
</template>
<script>
import VerticalTour from "../../Booking/components/VerticalTour";
import ListTour from "../../Home/Components/ListTour";

export default {
  name: "ListSearch",
  components: {
    VerticalTour,
    ListTour
  },
  props: {
    listTourSearch: Array,
    loading: {
      type: Boolean,
      default: false
    },
    total: {
      type: Number,
      default: 0
    }
  },
  data() {
    return {
    };
  },
  methods: {
    searchTour (value) {
      this.$emit('search-name', value)
    }
  }  
};
</script>
<style scoped>
.tour--item {
  margin-bottom: 20px;
}
.main-content {
  background: #fff;
  padding: 1em;
  border-radius: 5px;
}
</style>
