<template>
  <div class="header-static">
    <div>
      <b-row>
        <b-col>
          <div class="card">
            <div class="card-body">
              <h4>Thống kê doanh thu</h4>
              <b-form-group>
                <a-range-picker
                  size="large"
                  v-model="form.Datestat"
                  :format="dateFormat"
                  :ranges="{ 'Hôm Nay': [moment(), moment()], 'Tháng này': [moment().startOf('month'), moment().endOf('month')] }"
                />
                <a-button type="primary" size="large" @click="submitStatic">Thống kê</a-button>
              </b-form-group>
            </div>
          </div>
        </b-col>
        <b-col>
          <div class="card">
            <div class="card-body">
              <b-row>
                <b-col md="12">
                  <h4>Thông tin thống kê booking</h4>
                  <p>
                    Số lượng booking:
                    <strong>{{numberBooking}}</strong>
                  </p>
                  <p v-if="form.Datestat">
                    Doanh thu từ ngày:
                    <strong>{{form.Datestat[0] | birthDay }}</strong> -
                    <strong>{{form.Datestat[1] | birthDay}}</strong>
                  </p>
                </b-col>
              </b-row>
            </div>
          </div>
        </b-col>
      </b-row>
    </div>
  </div>
</template>
<script>
import moment from "moment";
import StaticService from "../staticServices";
import { required } from "vuelidate/lib/validators";

export default {
  name: "HeaderStatics",
  data() {
    return {
      dateFormat: "DD/MM/YYYY",
      numberBooking: 0,
      form: {
        Datestat: [moment(), moment()]
      }
    };
  },
  validations() {
    return {
      form: {
        Datestat: {
          required
        }
      }
    };
  },
  methods: {
    moment,
    submitStatic() {
      let that = this;
      if (this.form.Datestat.length === 0) {
        that.$notification["warning"]({
          message: "Có lỗi xảy ra",
          description: "Vui lòng chọn ngày để thống kê."
        });
      } else {
        let payloadDate = {
          dateStart: this.form.Datestat[0].format("YYYY-MM-DD"),
          dateEnd: this.form.Datestat[1].format("YYYY-MM-DD")
        };
        StaticService.getStactic(payloadDate).then(res => {
          this.numberBooking = res.data.numberCount;
          this.$emit("list-payment", res.data);
          this.$emit('get-date', payloadDate)
        });
      }
    }
  }
};
</script>
<style scoped>
</style>
