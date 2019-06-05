<template>
  <div class="list-customer">
    <div class="card info-customer" v-for="(adult, index) in NumberAdult" :key="index">
      <div class="card-body fail">
        <div class="d-md-flex align-items-center">
          <div>
            <h4 class="card-title">Khách hàng #{{index}}</h4>
          </div>
        </div>
      </div>
      <div class="failure">
        <b-row>
          <b-col md="4">
            <b-form-group class="margin-top" label="Họ và tên">
              <a-input size="large" placeholder="Họ và tên"/>
            </b-form-group>
          </b-col>
          <b-col md="2">
            <b-form-group class="margin-top" label="Giới tính">
              <a-radio-group size="large" defaultValue="1" buttonStyle="solid">
                <a-radio-button value="1">Nam</a-radio-button>
                <a-radio-button value="0">Nữ</a-radio-button>
              </a-radio-group>
            </b-form-group>
          </b-col>
          <b-col md="2">
            <b-form-group class="margin-top" label="Ngày sinh">
              <a-date-picker
                size="large"
                :defaultValue="moment('01/01/2000',  'DD/MM/YYYY')"
                :format=" 'DD/MM/YYYY'"
              />
            </b-form-group>
          </b-col>
          <b-col md="2">
            <b-form-group class="margin-top" label="Độ tuổi">
              <a-select size="large" defaultValue="adult" style="width: 100%">
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
    <div v-if="NumberKid > 0">
      <div class="card info-customer" v-for="index in range( NumberAdult , (NumberAdult + NumberKid) - 1)" :key="index">
        <div class="card-body fail">
          <div class="d-md-flex align-items-center">
            <div>
              <h4 class="card-title">Khách hàng #{{index}}</h4>
            </div>
          </div>
        </div>
        <div class="failure">
          <b-row>
            <b-col md="4">
              <b-form-group class="margin-top" label="Họ và tên">
                <a-input size="large" placeholder="Họ và tên"/>
              </b-form-group>
            </b-col>
            <b-col md="2">
              <b-form-group class="margin-top" label="Giới tính">
                <a-radio-group size="large" defaultValue="1" buttonStyle="solid">
                  <a-radio-button value="1">Nam</a-radio-button>
                  <a-radio-button value="0">Nữ</a-radio-button>
                </a-radio-group>
              </b-form-group>
            </b-col>
            <b-col md="2">
              <b-form-group class="margin-top" label="Ngày sinh">
                <a-date-picker
                  size="large"
                  :defaultValue="moment('01/01/2000',  'DD/MM/YYYY')"
                  :format=" 'DD/MM/YYYY'"
                />
              </b-form-group>
            </b-col>
            <b-col md="2">
              <b-form-group class="margin-top" label="Độ tuổi">
                <a-select size="large" defaultValue="kid" style="width: 100%">
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

    <b-row>
      <b-col cols="12">
        <div class="total-price">
          <span>Tổng cộng</span>
          <span class="price-bold">{{calcTotal | toCurrency}}</span>
        </div>
      </b-col>
    </b-row>
  </div>
</template>
<script>
import moment from "moment";
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
    }
  },
  computed: {
    calcTotal () {
      return (this.NumberKid * this.priceKid) + (this.priceAdult * this.NumberAdult)
    }
  },
  methods: {
    moment,
    range : function (start, end) {
      return Array(end - start + 1).fill().map((_, idx) => start + idx)
   }
  }
};
</script>  
<style scoped>
.card-body.fail {
  background: #d06079;
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
@media screen {
}
</style>
