<template>
  <div class="box-booking border-box-content">
    <template v-if="loading">
      <skeleton-box width="100%" height="56px"/>
      <skeleton-box width="100%" height="56px"/>
    </template>
    <div v-else class="booking-head">
      <p class="price"><a-icon type="user" />{{priceTour | toCurrency}}</p>
      <p class="price"><a-icon type="user" />{{priceKid | toCurrency}}</p>
    </div>
    <a-divider dashed>Thông tin</a-divider>
    <div class="booking-body">
      <b-form-group>
        <a-date-picker
          placeholder="Chọn ngày"
          format="DD-MM-YYYY"
          v-model="dataBooking.dateBooking"
          :disabledDate="disabledDate"
          size="large"
          style="width: 100%;"
        />
      </b-form-group>
      <b-row>
        <b-col md="6">
          <b-form-group label="Người lớn">
            <a-input-number size="large" :min="1" :max="10" v-model="dataBooking.numberAdult" :defaultValue="2" style="width: 100%;"/>
          </b-form-group>
        </b-col>
        <b-col md="6">
          <b-form-group label="Trẻ em">
            <a-input-number size="large" :min="1" :max="10" v-model="dataBooking.numberKid" :defaultValue="0" style="width: 100%;"/>
          </b-form-group>
        </b-col>
      </b-row>
      <b-form-group>
        <a-button size="large" type="primary" @click="toBooking" block>Đặt ngay</a-button>
      </b-form-group>
    </div>
  </div>
</template>
<script>
import moment from "moment";
import SkeletonBox from "../../../components/Effects/SkeletonBox";
export default {
  name: "BoxBooking",
  props: {
    priceTour: {
      type: Number
    },
    priceKid: Number,
    loading: {
      default: false,
      type: Boolean
    }
  },
  components: {
    SkeletonBox
  },
  data() {
    return {
      dataBooking: {
        dateBooking: moment(),
        numberKid: 0,
        numberAdult: 1
      }
    }
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
      return current && current < moment().startOf("day");
    },

    disabledDateTime() {
      return {
        // disabledHours: () => this.range(0, 24).splice(4, 20),
        // disabledMinutes: () => this.range(30, 60),
        // disabledSeconds: () => [55, 56],
      };
    },
    toBooking () {
      this.$router.push({name: 'bookingTour', query: {tour: this.$route.query.tour, dateBooking: moment(this.dataBooking.dateBooking).format('DD-MM-YYYY'), numberAdult: this.dataBooking.numberAdult, numberKid: this.dataBooking.numberKid}})
    }
  }
};
</script>
<style scoped>
.booking-head {
  font-size: 1.25rem;
  text-align: center;
  display: flex;
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
  flex: 1;
  background: #02af8e;
  padding: 0.835rem;
  color: #fff;
}
</style>
