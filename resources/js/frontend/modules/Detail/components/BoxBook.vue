<template>
  <div>
    <template v-if="loading">
      <skeleton-box width="100%" height="56px"/>
    </template>
    <div v-else class="booking-head">
      <p class="price">
        <a-icon type="user"/>
        {{priceTour | toCurrency}}
      </p>
      <p class="price">
        <a-icon type="user"/>
        {{priceKid | toCurrency}}
      </p>
    </div>
    <div class="box-booking border-box-content">
      <a-divider dashed>Thông tin Tour</a-divider>
      <div class="booking-body">
        <b-row class="mb-2">
          <b-col cols="6">Ngày khởi hành</b-col>
          <b-col cols="6">{{DateDeparture}}</b-col>
        </b-row>
        <b-row class="mb-2">
          <b-col cols="6">Ngày kết thúc</b-col>
          <b-col cols="6">{{DateBack}}</b-col>
        </b-row>
        <b-row class="mb-2">
          <b-col cols="6">Thời gian</b-col>
          <b-col cols="6">{{TourTime}}</b-col>
        </b-row>
        <b-row class="mb-2">
          <b-col cols="6">Số chổ còn lại</b-col>
          <b-col cols="6">{{maxPerson}}</b-col>
        </b-row>
        <b-row>
          <b-col md="6">
            <b-form-group label="Người lớn">
              <a-input-number
                size="large"
                :min="1"
                :max="maxPerson"
                v-model="dataBooking.numberAdult"
                :defaultValue="2"
                style="width: 100%;"
              />
            </b-form-group>
          </b-col>
          <b-col md="6">
            <b-form-group label="Trẻ em">
              <a-input-number
                size="large"
                :min="1"
                :max="maxPerson - dataBooking.numberAdult"
                v-model="dataBooking.numberKid"
                :defaultValue="0"
                style="width: 100%;"
              />
            </b-form-group>
          </b-col>
        </b-row>
        <b-form-group>
          <a-button v-if="maxPerson > 0" size="large" type="primary" @click="toBooking" block>Đặt ngay</a-button>
          <a-button v-else size="large" type="primary" block disabled>Đặt ngay</a-button>

        </b-form-group>
      </div>
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
    },
    maxPerson: Number,
    TourTime : String,
    DateDeparture: String,
    DateBack: String
  },
  components: {
    SkeletonBox
  },
  data() {
    return {
      dataBooking: {
        numberKid: 0,
        numberAdult: 1
      }
    };
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
    toBooking() {
      this.$router.push({
        name: "bookingTour",
        query: {
          tour: this.$route.query.tour,
          numberAdult: this.dataBooking.numberAdult,
          numberKid: this.dataBooking.numberKid
        }
      });
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
