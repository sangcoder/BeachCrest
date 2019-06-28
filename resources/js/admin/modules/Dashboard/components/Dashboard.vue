<template>
  <div>
    <div class="card">
      <!-- ============================================================== -->
      <!-- Info Box -->
      <!-- ============================================================== -->
      <div class="card-body">
        <div class="row m-b-0">
          <!-- col -->
          <div class="col-lg-3 col-md-6">
            <div class="d-flex align-items-center">
              <div class="m-r-10">
                <span class="text-orange display-5">
                  <a-icon type="exception"  style="font-size: 45px;" />
                </span>
              </div>
              <div>
                <span>Doanh thu tháng này</span>
                <h3 class="font-medium m-b-0">{{dataDash.MonthTotal | toCurrency}}</h3>
              </div>
            </div>
          </div>
          <!-- col -->
          <!-- col -->
          <div class="col-lg-3 col-md-6">
            <div class="d-flex align-items-center">
              <div class="m-r-10">
                <span class="text-cyan display-5">
                  <a-icon type="exception"  style="font-size: 45px;"/>
                </span>
              </div>
              <div>
                <span>Doanh thu hôm nay</span>
                <h3 class="font-medium m-b-0">{{dataDash.TotalPriceToday | toCurrency}}</h3>
              </div>
            </div>
          </div>
          <!-- col -->
          <!-- col -->
          <div class="col-lg-3 col-md-6">
            <div class="d-flex align-items-center">
              <div class="m-r-10">
                <span class="text-info display-5">
                  <a-icon type="exception" style="font-size: 45px;" />
                </span>
              </div>
              <div>
                <span>Tổng số Booking</span>
                <h3 class="font-medium m-b-0">{{dataDash.TotalBooking}}</h3>
              </div>
            </div>
          </div>
          <!-- col -->
          <!-- col -->
          <div class="col-lg-3 col-md-6">
            <div class="d-flex align-items-center">
              <div class="m-r-10">
                <span class="text-primary display-5">
                  <a-icon type="exception" style="font-size: 45px;"/>
                </span>
              </div>
              <div>
                <span>Số Booking chưa duyệt</span>
                <h3 class="font-medium m-b-0">{{dataDash.NotAccept}}</h3>
              </div>
            </div>
          </div>
          <!-- col -->
        </div>
      </div>
    </div>
    
  </div>
</template>
<script>
import DashAPI from '../serviceDashboard'
export default {
  data () {
    return {
      dataDash: {}
    }
  },
  created () {
    this.fetchDashboard()
  },
  methods: {
    fetchDashboard () {
      DashAPI.getBookingAdmin().then(res => {
        this.dataDash = res.data.data
      })
    }
  }
}
</script>
<style lang="css" scoped>
  
</style>