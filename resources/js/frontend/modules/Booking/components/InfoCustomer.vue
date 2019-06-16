<template>
  <div>
    <div class="list-customer">
      <div class="card info-customer" v-for="(adult, index) in listAdult" :key="index">
        <div
          class="card-body fail"
          
        >
          <div class="d-md-flex align-items-center">
            <div>
              <h4 class="card-title">Khách hàng người lớn #{{index + 1}}</h4>
            </div>
          </div>
        </div>
        <div class="failure">
          <b-row>
            <b-col md="4">
              <b-form-group class="margin-top" label="Họ và tên" :class="validation.errors[`listCustomer.0.${index}.NameCustomner`] ? 'has-error' : ''">
                <a-input size="large" placeholder="Họ và tên" v-model="adult.NameCustomner"/>
                <div
                  v-if="validation.errors[`listCustomer.0.${index}.NameCustomner`]"
                  class="invalid-feedback d-block"
                >{{validation.errors[`listCustomer.0.${index}.NameCustomner`][0]}}</div>
              </b-form-group>
            </b-col>
            <b-col md="2">
              <b-form-group class="margin-top" label="Giới tính">
                <a-radio-group
                  size="large"
                  defaultValue="1"
                  buttonStyle="solid"
                  v-model="adult.Gender"
                >
                  <a-radio-button value="1">Nam</a-radio-button>
                  <a-radio-button value="0">Nữ</a-radio-button>
                </a-radio-group>
                <div
                  v-if="validation.errors[`listCustomer.0.${index}.Gender`]"
                  class="invalid-feedback d-block"
                >{{validation.errors[`listCustomer.0.${index}.Gender`][0]}}</div>
              </b-form-group>
            </b-col>
            <b-col md="2">
              <b-form-group class="margin-top" label="Ngày sinh">
                <a-date-picker
                  size="large"
                  :format=" 'DD/MM/YYYY'"
                  :disabledDate="disabledDate"
                  v-model="adult.BirthDay"
                />
              </b-form-group>
            </b-col>
            <b-col md="2">
              <b-form-group class="margin-top" label="Độ tuổi">
                <a-select
                  size="large"
                  defaultValue="adult"
                  style="width: 100%"
                  v-model="adult.CustomType"
                >
                  <a-select-option value="adult">Người lớn</a-select-option>
                </a-select>
              </b-form-group>
            </b-col>
            <b-col md="2" class="footer-price d-flex align-items-md-center">
              <b-form-group class="margin-top" label="Trị giá">
                <span>{{priceAdult | toCurrency}}</span>
              </b-form-group>
            </b-col>
          </b-row>
        </div>
      </div>
      <div v-if="listkid.length > 0">
        <div class="card info-customer" v-for="(kid ,index) in listkid" :key="index">
          <div class="card-body fail">
            <div class="d-md-flex align-items-center">
              <div>
                <h4 class="card-title">Khách hàng trẻ nhỏ #{{NumberAdult + index + 1}}</h4>
              </div>
            </div>
          </div>
          <div class="failure">
            <b-row>
              <b-col md="4">
                <b-form-group class="margin-top" label="Họ và tên" :class="validation.errors[`listCustomer.1.${index}.NameCustomner`] ? 'has-error' : ''">
                  <a-input size="large" placeholder="Họ và tên" v-model="kid.NameCustomner"/>
                  <div
                    v-if="validation.errors[`listCustomer.1.${index}.NameCustomner`]"
                    class="invalid-feedback d-block"
                  >{{validation.errors[`listCustomer.1.${index}.NameCustomner`][0]}}</div>
                </b-form-group>
              </b-col>
              <b-col md="2">
                <b-form-group class="margin-top" label="Giới tính">
                  <a-radio-group
                    size="large"
                    defaultValue="1"
                    buttonStyle="solid"
                    v-model="kid.Gender"
                  >
                    <a-radio-button value="1">Nam</a-radio-button>
                    <a-radio-button value="0">Nữ</a-radio-button>
                  </a-radio-group>
                  <div
                    v-if="validation.errors[`listCustomer.1.${index}.Gender`]"
                    class="invalid-feedback d-block"
                  >{{validation.errors[`listCustomer.1.${index}.Gender`][0]}}</div>
                </b-form-group>
              </b-col>
              <b-col md="2">
                <b-form-group class="margin-top" label="Ngày sinh">
                  <a-date-picker
                    size="large"
                    v-model="kid.BirthDay"
                    :disabledDate="disabledDateKid"
                    :defaultValue="moment('01/01/2000',  'DD/MM/YYYY')"
                    :format=" 'DD/MM/YYYY'"
                  />
                </b-form-group>
              </b-col>
              <b-col md="2">
                <b-form-group class="margin-top" label="Độ tuổi">
                  <a-select
                    size="large"
                    defaultValue="kid"
                    style="width: 100%"
                    v-model="kid.CustomType"
                  >
                    <a-select-option value="kid">Trẻ em</a-select-option>
                  </a-select>
                </b-form-group>
              </b-col>
              <b-col md="2" class="footer-price d-flex align-items-md-center">
                <b-form-group class="margin-top" label="Trị giá">
                  <span>{{priceKid | toCurrency}}</span>
                </b-form-group>
              </b-col>
            </b-row>
          </div>
        </div>
      </div>
    </div>
    <div>
      <b-row>
        <b-col cols="12">
          <div class="total-price">
            <span>Tổng cộng</span>
            <span class="price-bold">{{calcTotal | toCurrency}}</span>
          </div>
        </b-col>
      </b-row>

      <b-row>
        <b-col cols="12">
          <div class="text-center" style="padding: 20px;">
            <a-button size="large" type="primary" icon="bell" @click="handleBooking">Gửi yêu cầu</a-button>
          </div>
        </b-col>
      </b-row>
    </div>
    <loading :loading="isloading"/>
  </div>
</template>
<script>
import moment from "moment";
import BookingAPI from "../bookingService";

import Loading from "../../../components/Loading";
export default {
  name: "InfoCustomer",
  props: {
    NumberKid: {
      type: Number,
      default: 0
    },
    NumberAdult: {
      type: Number,
      default: 1
    },
    priceKid: {
      type: Number,
      default: 0
    },
    priceAdult: {
      type: Number,
      default: 0
    },
    infoContact: {
      type: Object
    }
  },
  components: {
    Loading
  },
  data() {
    return {
      listAdult: [],
      listkid: [],
      isloading: false,
      validation: {
        errors: {}
      }
    };
  },
  created() {
    this.disabledDateKid();
    if (this.$route.query.numberAdult) {
      for (let i = 0; i < parseInt(this.$route.query.numberAdult); i++) {
        this.listAdult.push({
          NameCustomner: "",
          Gender: null,
          BirthDay: moment(this.dateAdult, "DD-MM-YYYY"),
          BirthDayFomat: "",
          CustomType: "adult"
        });
      }
    }
    if (this.$route.query.numberKid) {
      for (let i = 0; i < parseInt(this.$route.query.numberKid); i++) {
        this.listkid.push({
          NameCustomner: "",
          Gender: null,
          BirthDay: moment(this.dateKid, "DD-MM-YYYY"),
          BirthDayFomat: "",
          CustomType: "kid"
        });
      }
    }
  },

  watch: {
    NumberKid(v) {
      this.listkid = [];
      for (let i = 0; i < v; i++) {
        this.listkid.push({
          NameCustomner: "",
          Gender: null,
          BirthDay: moment(this.dateKid, "DD-MM-YYYY"),
          BirthDayFomat: "",
          CustomType: "kid"
        });
      }
    },
    NumberAdult(v) {
      this.listAdult = [];
      for (let i = 0; i < v; i++) {
        this.listAdult.push({
          NameCustomner: "",
          Gender: null,
          BirthDay: moment(this.dateAdult, "DD-MM-YYYY"),
          BirthDayFomat: "",
          CustomType: "adult"
        });
      }
    }
  },
  computed: {
    calcTotal() {
      return (
        this.NumberKid * this.priceKid + this.priceAdult * this.NumberAdult
      );
    },
    dateAdult() {
      let today_date = new Date();
      let today_year = today_date.getFullYear();
      let today_month = today_date.getMonth() + 1;
      let today_day = today_date.getDate();
      let disableYear = today_year - 15;
      let disableMonth = 12 - today_month;
      let disableDate = this.daysInMonth(today_month, today_year) - today_day;
      let full = `${disableDate}-${disableMonth}-${disableYear}`;
      return full;
    },
    dateKid() {
      let today_date = new Date();
      let today_year = today_date.getFullYear();
      let today_month = today_date.getMonth() + 1;
      let today_day = today_date.getDate();
      let disableYear = today_year - 12;
      let disableMonth = 12 - today_month;
      let disableDate = this.daysInMonth(today_month, today_year) - today_day;
      let full = `${disableDate}-${disableMonth}-${disableYear}`;
      return full;
    }
  },
  methods: {
    moment,
    range: function(start, end) {
      return Array(end - start + 1)
        .fill()
        .map((_, idx) => start + idx);
    },
    daysInMonth(month, year) {
      return new Date(year, month, 0).getDate();
    },

    disabledDate(current) {
      let today_date = new Date();
      let today_year = today_date.getFullYear();
      let today_month = today_date.getMonth() + 1;
      let today_day = today_date.getDate();
      let disableYear = today_year - 15;
      let disableMonth = 12 - today_month;
      let disableDate = this.daysInMonth(today_month, today_year) - today_day;
      let full = `${disableMonth}-${disableDate}-${disableYear}`;
      // return (new Date(full)) ;
      return current && current > moment(new Date(full)).endOf("day");
    },
    disabledDateKid(current) {
      let today_date = new Date();
      let today_year = today_date.getFullYear();
      let today_month = today_date.getMonth() + 1;
      let today_day = today_date.getDate();

      let disableYearKid = today_year - 6;
      let disableMonthKid = 12 - today_month;
      let disableDateKid =
        this.daysInMonth(today_month, today_year) - today_day;
      let fullKid = `${disableYearKid}-${disableMonthKid}-${disableDateKid}`;
      let disKid = `${disableMonthKid}-${disableDateKid}-${disableYearKid}`;
      let disableYear = today_year - 18;
      let disableMonth = 12 - today_month;
      let disableDate = this.daysInMonth(today_month, today_year) - today_day;
      let full = `${disableMonth}-${disableDate}-${disableYear}`;
      // return (new Date(full)) ;
      // console.log(full, fullKid)
      // return current && current > moment(new Date(full)).endOf("day");
      return current && current < moment(new Date(full)).endOf("day");
    },
    handleBooking() {
      this.isloading = true;
      // console.log(this.listAdult)
      this.listAdult.forEach(item => {
        item.BirthDayFomat = item.BirthDay.format("YYYY-MM-DD");
      });
      this.listkid.forEach(item => {
        item.BirthDayFomat = item.BirthDay.format("YYYY-MM-DD");
      });

      let payload = {
        TourID: this.$route.query.tour,
        infoContact: this.infoContact,
        payment: this.value,
        listCustomer: [this.listAdult, this.listkid]
      };
      BookingAPI.addBooking(payload)
        .then(res => {
          this.$emit("BookingSuccess", res.data);
          this.isloading = false;
        })
        .catch(err => {
          if (err.response && err.response.data) {
            let i = 1;
            // console.log(err.response.data.errors[`listCustomer.0.${i}.NameCustomner`]);
            this.validation.errors = err.response.data.errors;
            this.$emit("BookingFail", err.response.data.errors)
            this.isloading = false;
          }
        });
    }
  }
};
</script>  
<style scoped>
.card-body.fail {
  background: #2b4c66;
  padding: 6px;
}
.card-title {
  color: #fff;
  margin-bottom: 0;
  text-transform: capitalize;
  font-size: 17px;
}
.failure {
  padding: 0 15px;
}
.margin-top {
  margin-top: 1rem;
}
.footer-price {
  justify-content: flex-end;
}
.footer-price span {
  color: #cd2c24;
  font-weight: bold;
  font-size: 18px;
}
.total-price {
  background: #fff;
  padding: 10px;
  display: flex;
  justify-content: space-between;
  font-weight: bold;
  font-size: 22px;
  border-radius: 5px;
}
.price-bold {
  color: #cd2c24;
}
.payment {
  padding: 17px;
}
</style>
