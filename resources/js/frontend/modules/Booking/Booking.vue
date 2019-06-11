<template>
  <div class="booking">
    <div class="card">
      <div class="card-body">
        <a-steps :current="current">
          <a-step>
            <template slot="title">Xem tour</template>
          </a-step>
          <a-step>
            <template slot="title">Tiến hành đặt Tour</template>
          </a-step>
          <a-step>
            <template slot="title">Hoàn tất</template>
          </a-step>
        </a-steps>
        <div v-if="current === 1">
          <div v-if="!empty" class="requiredLogin mt-3">
            <a-alert message="Thông báo" type="success">
              <p slot="description">
                Cảm ơn quý khách đã sử dụng dịch vụ của chúng tôi.
                Quý khách vui lòng
                <a
                  href="#"
                  @click="$router.push({name: 'Login'})"
                >Đăng nhập</a> để sử dụng dịch vụ của chúng tôi tốt hơn.
              </p>
            </a-alert>
          </div>
          <div v-else class="steps-content">
            <h4 class="card-title">Thông tin Tour</h4>
            <vertical-tour :tour-info="tourInfo"/>
            <h4 class="card-title">Thông tin liên lạc</h4>
            <list-customer @BookingSuccess="BookingSuccess" :tour-info="tourInfo"/>
          </div>
        </div>

        <div v-if="current === 2" class="steps-content">
          <div class="success">
            <!--[if lte IE 9]>
        <style>
          .path {stroke-dasharray: 0 !important;}
        </style>
            <![endif]-->

            <svg version="1.1" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 130.2 130.2">
              <circle
                class="path circle"
                fill="none"
                stroke="#73AF55"
                stroke-width="6"
                stroke-miterlimit="10"
                cx="65.1"
                cy="65.1"
                r="62.1"
              ></circle>
              <polyline
                class="path check"
                fill="none"
                stroke="#73AF55"
                stroke-width="6"
                stroke-linecap="round"
                stroke-miterlimit="10"
                points="100.2,40.2 51.5,88.8 29.8,67.5 "
              ></polyline>
            </svg>
            <p class="success">Quý khách đã gửi yêu cầu đặt tour thành công!</p>
            
          </div>
        </div>
      </div>
    </div>
    <loading :loading="isloading"/>
  </div>
</template>
<script>
import Loading from "../../components/Loading";
import VerticalTour from "./components/VerticalTour";
import ListCustomer from "./components/ListCustomer";
import TourAPI from "./bookingService";
export default {
  components: {
    Loading,
    VerticalTour,
    ListCustomer
  },
  data() {
    return {
      isloading: false,
      user: null,
      empty: false,
      current: 1,
      tourInfo: {}
    };
  },
  created() {
    this.user = this.$store.get("user/user");
    this.fetchTourId(this.$route.query.tour);
  },
  watch: {
    user() {
      if (_.isEmpty(this.user)) {
        this.empty = false;
      } else {
        this.empty = true;
      }
    }
  },
  methods: {
    fetchTourId(id) {
      this.isloading = true;
      TourAPI.getTourById(id).then(res => {
        let tmp = res.data.data;
        // this.tourInfo = res.data.data
        tmp.ImageUrl = JSON.parse(tmp.ImageUrl);
        this.tourInfo = tmp;
        this.isloading = false;
      });
    },
    BookingSuccess () {
      this.current = 2
    }
  }
};
</script>
<style scoped>
.steps-content {
  margin-top: 16px;
  border: 1px dashed #e9e9e9;
  border-radius: 6px;
  background-color: #fafafa;
  min-height: 200px;
  padding: 12px;
}
.card-title {
  margin-top: 10px;
}
svg {
  width: 100px;
  display: block;
  margin: 40px auto 0;
}
.path {
  stroke-dasharray: 1000;
  stroke-dashoffset: 0;
}
.path.circle {
  -webkit-animation: dash 0.9s ease-in-out;
  animation: dash 0.9s ease-in-out;
}
.path.line {
  stroke-dashoffset: 1000;
  -webkit-animation: dash 0.9s 0.35s ease-in-out forwards;
  animation: dash 0.9s 0.35s ease-in-out forwards;
}
.path.check {
  stroke-dashoffset: -100;
  -webkit-animation: dash-check 0.9s 0.35s ease-in-out forwards;
  animation: dash-check 0.9s 0.35s ease-in-out forwards;
}
p {
  text-align: center;
  margin: 20px 0 60px;
  font-size: 1.25em;
}
p.success {
  color: #73af55;
}
p.error {
  color: #d06079;
}
@-webkit-keyframes dash {
  0% {
    stroke-dashoffset: 1000;
  }
  100% {
    stroke-dashoffset: 0;
  }
}
@keyframes dash {
  0% {
    stroke-dashoffset: 1000;
  }
  100% {
    stroke-dashoffset: 0;
  }
}
@-webkit-keyframes dash-check {
  0% {
    stroke-dashoffset: -100;
  }
  100% {
    stroke-dashoffset: 900;
  }
}
@keyframes dash-check {
  0% {
    stroke-dashoffset: -100;
  }
  100% {
    stroke-dashoffset: 900;
  }
}
</style>
