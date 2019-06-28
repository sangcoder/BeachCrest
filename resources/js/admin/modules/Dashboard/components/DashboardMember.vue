<template>
  <div>
    <div class="card">
      <!-- ============================================================== -->
      <!-- Info Box -->
      <!-- ============================================================== -->
      <div class="card-body">
        <div class="row m-b-0">
          <!-- col -->
          <div class="col-lg-4 col-md-6">
            <div class="d-flex align-items-center">
              <div class="m-r-10">
                <span class="text-orange display-5">
                  <a-icon type="exception"  style="font-size: 45px;" />
                </span>
              </div>
              <div>
                <span>Tổng số Booking Booking</span>
                <h3 class="font-medium m-b-0">{{dataStat.NumberBooking}}</h3>
              </div>
            </div>
          </div>
          <!-- col -->
          <!-- col -->
          <div class="col-lg-4 col-md-6">
            <div class="d-flex align-items-center">
              <div class="m-r-10">
                <span class="text-cyan display-5">
                  <a-icon type="exception"  style="font-size: 45px;"/>
                </span>
              </div>
              <div>
                <span>Số Booking đã duyệt</span>
                <h3 class="font-medium m-b-0">
                  {{dataStat.AccepBooking}}
                </h3>
              </div>
            </div>
          </div>
          <!-- col -->
          <!-- col -->
          <div class="col-lg-4 col-md-6">
            <div class="d-flex align-items-center">
              <div class="m-r-10">
                <span class="text-info display-5">
                  <a-icon type="exception" style="font-size: 45px;" />
                </span>
              </div>
              <div>
                <span>Số tiền</span>
                <h3 class="font-medium m-b-0">
                  {{dataStat.TotalPrice | toCurrency}}</h3>
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
import DashboadAPI from '../serviceDashboard'
export default {
  data () {
    return {
      dataStat: {}
    }
  },
  created() {
    this.fetchDataStat()
  },
  methods: {
    fetchDataStat () {
      DashboadAPI.getstatBooking().then(res => {
        this.dataStat = res.data
      })
    }
  }
}
</script>
<style lang="css" scoped>
  
</style>