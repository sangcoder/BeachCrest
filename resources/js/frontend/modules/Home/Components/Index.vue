<template>
  <div class="main-index">
    <SearchTour :list-place="listPlace"/>
    <section class="mod-tour" id="listTour">
      <h2>Tour mới cập nhật</h2>
      <div class="row tour-r">
        <template v-if="loading">
          <div v-for="i in 8" :key="i" class="col-lg-3 col-md-4 col-sm-6 tour--item">
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
                  <a
                    @click="$router.push({name: 'booking', query: {tour: tour.TourID}})"
                    style="display:block;"
                    :title="tour.TourName"
                  >
                    <img src="/images/Tour.png">
                  </a>
                  <div
                    v-if="tour.TourExists > 0"
                    class="tour__tag bestseller green"
                  >Còn nhận {{tour.TourExists}}</div>
                  <div v-else class="tour__tag bestseller blue">Hết chổ</div>
                  <count-down v-if="tour.ExpiredDate.length > 0" :date="tour.ExpiredDate"></count-down>
                  <!-- <div :class="tour.TourExists > 0 ? 'tour__tag bestseller' : 'd-none'">{{tour.TourExistss > 0 ? tour.TourExistss : 'Hết chổ'}}</div> -->
                </div>
              </template>
              <template slot="tag">
                <a-icon type="tags"/>
                <span
                  class="tourName"
                  v-for="place in tour.listPlace"
                  :key="place.PlaceID"
                >{{place.PlaceName}}</span>
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
      </div>
      <div class="pagination-index d-flex justify-content-center mb-2">
        <a-pagination
          showQuickJumper
          :defaultCurrent="1"
          :pageSize.sync="pagination.pageSize"
          :total="pagination.total"
          @change="onChangePage"
        />
      </div>
    </section>

    <!-- List destination -->
    <section id="topDestination">
    <list-destination :titleHeader="'Top địa điểm'" :listDestinations="startPlace"/>
    </section>
    <section class="news-index" id="newsSection">
      <list-news
        :news-title="'Tin tức du lịch'"
        :list-news="listNews"
        :totalNews="paginationTour.total"
        @changpage="ChangePage"
      />
    </section>
  </div>
</template>
<script>
import SearchTour from "./SearchTour";
import ListTour from "./ListTour";
import ListDestination from "./ListDestination";
import ListNews from "./ListNews";
import CountDown from "../../../components/Countdown";

import HomeAPI from "./homeSerive";
export default {
  components: {
    SearchTour,
    ListTour,
    ListDestination,
    CountDown,
    ListNews
  },
  data() {
    return {
      loading: true,
      listPlace: [],
      startPlace: [],
      listNews: [],
      paginationTour: {
        total: 1
      },
      pagination: {
        total: 1,
        pageSize: 1,
        current: 1
      }
    };
  },
  created() {
    this.fetchListTour();
    this.fetchPlace();
    this.fetchStats();
    this.fetchNews();
  },
  computed: {
    listTour() {
      return this.$store.state.tour.listTour;
    }
  },
  methods: {
    fetchListTour(page) {
      this.loading = true;
      this.$store.dispatch("tour/getListTour", page).then(res => {
        this.loading = false;
        this.pagination.total = res.data.meta.total;
        this.pagination.pageSize = res.data.meta.per_page;
      });
    },
    fetchPlace() {
      HomeAPI.getListPlace().then(res => {
        this.listPlace = res.data.data;
      });
    },
    fetchStats() {
      HomeAPI.getStatsPlace().then(res => {
        this.startPlace = res.data;
      });
    },
    fetchNews(page) {
      HomeAPI.getListNews(page).then(res => {
        this.listNews = res.data.data;
        this.paginationTour.total = res.data.meta.total;
      });
    },
    onChangePage(value) {
      this.fetchListTour(value);
    },
    ChangePage(page) {
      console.log(page);
    }
  }
};
</script>
<style scoped>
.tour--item {
  margin-bottom: 20px;
}
.mod-tour {
  background: #fff;
  padding: 15px;
}
</style>
<style>
.tourName:not(:last-child):after {
  content: "/";
  margin-left: 4px;
}
.tourName:not(:last-child) {
  margin-right: 5px;
}
</style>

