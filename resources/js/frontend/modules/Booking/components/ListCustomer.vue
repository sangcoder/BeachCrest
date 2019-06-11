<template>
  <div class="list-customer">
    <b-row>
      <b-col md="6">
        <b-form-group>
          <p>
            Họ và tên (
            <span class="red-rquired">*</span>)
          </p>
          <a-input v-model="InfoContact.FullName" size="large" placeholder="Nhập họ và tên"/>
        </b-form-group>
      </b-col>
      <b-col md="6">
        <b-form-group>
          <p>
            Email (
            <span class="red-rquired">*</span>)
          </p>
          <a-input size="large" v-model="InfoContact.Email" placeholder="Email"/>
        </b-form-group>
      </b-col>
      <b-col md="6">
        <b-form-group>
          <p>
            Số điện thoại (
            <span class="red-rquired">*</span>)
          </p>
          <a-input size="large" v-model="InfoContact.PhoneNumber" placeholder="Số điện thoại"/>
        </b-form-group>
      </b-col>
      <b-col md="6">
        <b-form-group>
          <p>Địa chỉ</p>
          <a-input size="large" v-model="InfoContact.Address" placeholder="Nhập địa chỉ"/>
        </b-form-group>
      </b-col>
      <b-col md="6" class="d-flex align-items-md-center">
        <b-form-group :class="calcSlot ? 'has-warring' :''">
          <p>
            Số người hành khách (
            <span class="red-rquired">*</span>)
          </p>
          <span>Người lớn</span>
          <a-input-number size="large" v-model="NumberAdult" :min="1" :max="tourInfo.TourExists" :defaultValue="2"/>
          <span style="margin-left: 10px;">Trẻ em</span>
          <a-input-number size="large" v-model="NumberKid" :min="0" :max="tourInfo.TourExists - NumberAdult" :defaultValue="0"/>
          <p :class="calcSlot ? 'text-warning visible' :'invisible'">Đã đủ số người của Tour <span style="color: #cd2c24; font-weight: bold;"> {{tourInfo.TourExists}} </span></p>
        </b-form-group>
      </b-col>
      <b-col md="6">
        <b-form-group label="Ghi chú">
          <a-textarea v-model="InfoContact.Note" placeholder="Nhập ghi chú" :rows="4"/>
        </b-form-group>
      </b-col>
    </b-row>
    <h4 class="card-title">Danh sách khách hàng đi Tour</h4>
    <info-customer @BookingSuccess="BookingSuccess" :info-contact="InfoContact" :number-adult="NumberAdult" :number-kid="NumberKid" :price-kid="tourInfo.OnsaleKid" :price-adult="tourInfo.OnsaleAdult" />
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
  data () {
    return {
        NumberKid: parseInt(this.$route.query.numberKid),
        NumberAdult: parseInt(this.$route.query.numberAdult),
        InfoContact: {
          FullName: this.$store.state.user.user.name,
          Email: this.$store.state.user.user.email,
          PhoneNumber: '',
          Address: '',
          Note: ''
        }
    }
  },
  created() {
    // console.log(this.$store.state.user.user.email)
  },
  watch: {
    NumberKid(value)
    {
      this.NumberKid = value
    },
    NumberAdult (value) {
      this.NumberAdult = value
    }
  },
  computed: {
    calcSlot () {
      return ((this.NumberKid + this.NumberAdult) >= this.tourInfo.TourExists) ? true : false
    }
  },
  methods: {
    moment,
    handleSubmit(e) {},
    BookingSuccess () {
      this.$emit('BookingSuccess')
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