<template>
  <div class="booking">
    <div class="card">
      <div class="card-body">
        <a-steps :current="1">
          <a-step>
            <template slot="title">Xem tour</template>
          </a-step>
          <a-step>
            <template slot="title">Tiến hành đặt Tour</template>
          </a-step>
          <a-step>
            <template slot="title">Hoàn tất</template>
          </a-step>
        </a-steps>
        <div class="steps-content">
          <h4 class="card-title">Thông tin Tour</h4>
            <vertical-tour :tour-info="tourInfo" />
          <h4 class="card-title">Thông tin liên lạc</h4>
            <list-customer :tour-info="tourInfo" />
        </div>
      </div>
    </div>
  <loading :loading="isloading" />
  </div>
</template>
<script>
import Loading from '../../components/Loading'
import VerticalTour from './components/VerticalTour'
import ListCustomer from './components/ListCustomer'
import TourAPI from './bookingService'
export default {
  components: {
    Loading,
    VerticalTour,
    ListCustomer
  },
  data() {
    return  {
      isloading: false,
      tourInfo: {}
    }
  },
  created() {
    this.fetchTourId(this.$route.query.tour)
  },
  methods: {
    fetchTourId(id) {
      this.isloading = true
      TourAPI.getTourById(id).then(res => {
        let tmp = res.data.data
        // this.tourInfo = res.data.data
        tmp.ImageUrl = JSON.parse(tmp.ImageUrl)
        this.tourInfo = tmp
        this.isloading = false
      })
    }
  }
}
</script>
<style scoped>
.steps-content {
  margin-top: 16px;
  border: 1px dashed #e9e9e9;
  border-radius: 6px;
  background-color: #fafafa;
  min-height: 200px;
    padding: 12px;
}
.card-title {
  margin-top: 10px;
}

</style>
