<template>
  <div class="list-customer">
    <b-row>
      <b-col md="6">
        <b-form-group :class="validation.errors[`infoContact.FullName`] ? 'has-error' : ''">
          <p>
            Họ và tên (<span class="red-rquired">*</span>)
            <a-tooltip title="Hãy nhập đúng tên để nhân viên xác nhận">
              <a-icon type="question-circle-o"/>
            </a-tooltip>
          </p>
          <a-input v-model="InfoContact.FullName" size="large" placeholder="Nhập họ và tên"/>
          <div
            v-if="validation.errors[`infoContact.FullName`]"
            class="invalid-feedback d-block"
          >{{validation.errors[`infoContact.FullName`][0]}}</div>
        </b-form-group>
      </b-col>
      <b-col md="6">
        <b-form-group :class="validation.errors[`infoContact.Email`] ? 'has-error' : ''">
          <p>
            Email (<span class="red-rquired">*</span>)
          </p>
          <a-input size="large" v-model="InfoContact.Email" placeholder="Email"/>
          <div
            v-if="validation.errors[`infoContact.Email`]"
            class="invalid-feedback d-block"
          >{{validation.errors[`infoContact.Email`][0]}}</div>
        </b-form-group>
      </b-col>
      <b-col md="6">
        <b-form-group :class="validation.errors[`infoContact.PhoneNumber`] ? 'has-error' : ''">
          <p>
            Số điện thoại (<span class="red-rquired">*</span>)
          </p>
          <a-input size="large" v-model="InfoContact.PhoneNumber" placeholder="Số điện thoại"/>
          <div
            v-if="validation.errors[`infoContact.PhoneNumber`]"
            class="invalid-feedback d-block"
          >{{validation.errors[`infoContact.PhoneNumber`][0]}}</div>
        </b-form-group>
      </b-col>
      <b-col md="6">
        <b-form-group :class="validation.errors[`infoContact.Address`] ? 'has-error' : ''">
          <p>
            Địa chỉ(<span class="red-rquired">*</span>)
          </p>
          <a-input size="large" v-model="InfoContact.Address" placeholder="Nhập địa chỉ"/>
          <div
            v-if="validation.errors[`infoContact.Address`]"
            class="invalid-feedback d-block"
          >{{validation.errors[`infoContact.Address`][0]}}</div>
        </b-form-group>
      </b-col>
      <b-col md="6" class="d-flex align-items-md-center">
        <b-form-group :class="calcSlot ? 'has-warring' :''">
          <p>
            Số người hành khách (
            <span class="red-rquired">*</span>)
          </p>
          <span>Người lớn</span>
          <a-input-number
            size="large"
            v-model="NumberAdult"
            :min="1"
            :max="tourInfo.TourExists"
            :defaultValue="2"
          />
          <span style="margin-left: 10px;">Trẻ em</span>
          <a-input-number
            size="large"
            v-model="NumberKid"
            :min="0"
            :max="tourInfo.TourExists - NumberAdult"
            :defaultValue="0"
          />
          <p :class="calcSlot ? 'text-warning visible' :'invisible'">
            Đã đủ số người của Tour
            <span
              style="color: #cd2c24; font-weight: bold;"
            >{{tourInfo.TourExists}}</span>
          </p>
        </b-form-group>
      </b-col>
      <b-col md="6">
        <b-form-group label="Ghi chú">
          <a-textarea v-model="InfoContact.Note" placeholder="Nhập ghi chú" :rows="4"/>
        </b-form-group>
      </b-col>
    </b-row>
    <h4 class="card-title">Danh sách khách hàng đi Tour</h4>
    <info-customer
      @BookingSuccess="BookingSuccess"
      @BookingFail="BookingFail"
      :info-contact="InfoContact"
      :number-adult="NumberAdult"
      :number-kid="NumberKid"
      :price-kid="tourInfo.OnsaleKid"
      :price-adult="tourInfo.OnsaleAdult"
    />
  </div>
</template>
<script>
import moment from "moment";
import InfoCustomer from "./InfoCustomer";
export default {
  name: "ListCustomer",
  components: {
    InfoCustomer
  },
  props: {
    tourInfo: Object
  },
  data() {
    return {
      NumberKid: parseInt(this.$route.query.numberKid),
      NumberAdult: parseInt(this.$route.query.numberAdult),
      InfoContact: {
        FullName: this.$store.state.user.user.name,
        Email: this.$store.state.user.user.email,
        PhoneNumber: "",
        Address: "",
        Note: ""
      },
      validation: {
        errors: {}
      }
    };
  },
  created() {
    // console.log(this.$store.state.user.user.email)
  },
  watch: {
    NumberKid(value) {
      this.NumberKid = value;
    },
    NumberAdult(value) {
      this.NumberAdult = value;
    }
  },
  computed: {
    calcSlot() {
      return this.NumberKid + this.NumberAdult >= this.tourInfo.TourExists
        ? true
        : false;
    }
  },
  methods: {
    moment,
    handleSubmit(e) {},
    BookingSuccess(data) {
      this.$emit("BookingSuccess", data);
    },
    BookingFail(data) {
      this.validation.errors = data;
    }
  }
};
</script>
<style lang="css" scoped>
.red-rquired {
  font-weight: bold;
  color: #cd2c24;
}
</style>