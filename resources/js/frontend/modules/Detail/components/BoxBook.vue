<template>
  <div class="box-booking border-box-content">
    <div class="booking-head">
      <p class="price">
        {{priceTour | toCurrency}}/Lớn
        </p>
      <p class="price">{{priceKid | toCurrency}}/Trẻ em</p>
      <img src="/images/price.svg">
    </div>
    <a-divider dashed>Thông tin</a-divider>
    <div class="booking-body">
      <b-form-group>
        <a-date-picker
          placeholder="Chọn ngày"
          format="YYYY-MM-DD HH:mm:ss"
          :disabledDate="disabledDate"
          :disabledTime="disabledDateTime"
          size="large"
          :showTime="{ defaultValue: moment('00:00:00', 'HH:mm:ss') }"
          style="width: 100%;"
        />
      </b-form-group>
      <b-row>
        <b-col md="6">
          <b-form-group label="Người lớn">
            <a-input-number size="large" :min="1" :max="10" :defaultValue="2" style="width: 100%;"/>
          </b-form-group>
        </b-col>
        <b-col md="6">
          <b-form-group label="Trẻ em">
            <a-input-number size="large" :min="1" :max="10" :defaultValue="0" style="width: 100%;"/>
          </b-form-group>
        </b-col>
      </b-row>
      <b-form-group>
        <a-button size="large" type="primary" block>Đặt ngay</a-button>
      </b-form-group>
    </div>
  </div>
</template>
<script>
import moment from 'moment'
export default {
  name: "BoxBooking",
  props: {
    priceTour: {
      type: Number
    },
    priceKid: Number
  },
  date() {
    return {};
  },
  methods: {
     moment,
         range(start, end) {
      const result = [];
      for (let i = start; i < end; i++) {
        result.push(i);
      }
      return result;
    },

    disabledDate(current) {
      // Can not select days before today and today
      return current && current < moment().startOf('day');
    },

    disabledDateTime() {
      return {
        // disabledHours: () => this.range(0, 24).splice(4, 20),
        // disabledMinutes: () => this.range(30, 60),
        // disabledSeconds: () => [55, 56],
      };
    },

  }
};
</script>
<style scoped>
.booking-head {
  font-size: 1.25rem;
  text-align: center;
}
.ant-divider-horizontal {
  margin: 16px 0 !important;
}
.booking-head {
  border-radius: 5px;
  position: relative;
}
.booking-head img {
  width: 40px;
  position: absolute;
  right: 0;
}
.price {
  background: #02af8e;
  padding: 0.835rem;
  color: #fff;
}
</style>
