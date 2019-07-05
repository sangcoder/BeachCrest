<template>
  <div class="main-statics">
    <header-static @list-payment="getListPayment" @get-date="GetDateChild" />
    <div class="card" v-if="listPayment">
      <div class="card-body">
        <div class="d-md-flex align-items-center mb-3">
          <div>
            <h4>Danh sách Giao dịch</h4>
          </div>
          <div class="ml-auto">
            <a-button type="primary" v-if="payload" @click="exportPayment()" icon="file-excel">Xuất Excel</a-button>
          </div>
        </div>
        <table class="table table-striped">
          <tbody>
            <tr>
              <th>BookingID</th>
              <th>Ngày thanh toán</th>
              <th>Phương thức thanh toán</th>
              <th class="text-right">Số tiền</th>
            </tr>

            <tr v-for="item in listPayment" :key="item.id">
              <td>{{item.booking_id}}</td>
              <td>{{item.updated_at}}</td>
              <td>{{item.PaymentType === 1 ? 'Thanh toán tiền mặt' : 'Thanh toán Paypal'}}</td>
              <td class="text-right">{{item.PaymentAmount}}</td>
            </tr>
          </tbody>
        </table>
        <p v-if="listPayment.length === 0" class="text-center">Không có dữ liệu</p>
        <p class="text-right">
          Tổng tiền:
          <strong>{{totalAmout | toCurrency}}</strong>
        </p>
      </div>
    </div>
  </div>
</template>
<script>
import HeaderStatic from "./components/HeaderStatics";
import moment from "moment";
export default {
  components: {
    HeaderStatic
  },
  data() {
    return {
      listPayment: [],
      totalAmout: 0,
      countStat: 0,
      payload: null
    };
  },
  methods: {
    moment,
    getListPayment(payload) {
      this.listPayment = payload.data;
      (this.totalAmout = payload.totalAmount),
        (this.countStat = payload.numberCount);
    },
    GetDateChild (data) {
      this.payload = data
    },
    exportPayment () {
     axios({
      url: '/download/payment',
      method: 'GET',
      responseType: 'blob', // important
      params: {
        dateStart: this.payload.dateStart,
        dateEnd: this.payload.dateEnd
      }
    }).then((response) => {
      let fileName = 'Thong-ke-doanh-thu-tu-ngay-' + moment(this.payload.dateStart).format('DD/MM/YYYY') + '-den-ngay-' +  moment(this.payload.dateEnd).format('DD/MM/YYYY') + '.xlsx'
      const url = window.URL.createObjectURL(new Blob([response.data]));
      const link = document.createElement('a');
      link.href = url;
      link.setAttribute('download', fileName); //or any other extension
      document.body.appendChild(link);
      link.click();
    });
    }
  }
};
</script>