<template>
  <div class="history-booking">
    <h3>Lịch sử booking</h3>
    <a-table
      :columns="columns"
      :rowKey="record => record.BookingID"
      :dataSource="data"
      :pagination="pagination"
      :loading="loading"
      @change="handleTableChange"
    >
      <template slot="tour" slot-scope="tour"><a target="_blank" href="javascript:;" rel="noopener noreferrer" @click="$router.push({name: 'booking', query: {tour: tour.infoTour.id}})" >{{tour.infoTour.name | truncate(45)}}</a> </template>
      <template slot="State" slot-scope="State">
        {{State === 1 ? 'Chưa thanh toán': 'Đã thanh toán'}}</template>
      <template slot="dateBooking" slot-scope="dateBooking">{{dateBooking.DateBooking}}</template>
      <template slot="nguoiduyet" slot-scope="nguoiduyet">
        <p v-if="nguoiduyet.infoStaff.name">
          <strong>{{nguoiduyet.infoStaff.name}}</strong>
        </p>
        <p v-else>
          Chưa duyệt
        </p>
      </template>
      <template slot="totalAmount" slot-scope="totalAmount">
        {{totalAmount.payment.PaymentAmount | toCurrency}}
      </template>
      <template slot="type" slot-scope="type">
        {{type.payment.PaymentType === 1 ? 'Normal' : 'Paypal'}}
      </template>
    </a-table>
  </div>
</template>
<script>
import HistoryBooking from "../serviceBooking";
const columns = [
  {
    title: "ID",
    dataIndex: "BookingID"
  },
  {
    title: "Tên tour",
    scopedSlots: { customRender: "tour" },
    width: "25%"
  },
  {
    title: "Số người",
    dataIndex: "NumberPerson"
  },
  {
    title: "Ngày đặt",
    scopedSlots: { customRender: "dateBooking" }
  },
  {
    title: "Trạng thái",
    dataIndex: "State",
    scopedSlots: { customRender: "State" }
  },
  {
    title: "Người duyệt",
    // dataIndex: "nguoiduyet",
    scopedSlots: { customRender: "nguoiduyet" }
  },
  {
    title: 'Tổng tiền',
    scopedSlots: {customRender: 'totalAmount'}  
  },
  {
    title: 'Phương thức',
    scopedSlots: {customRender: 'type'}
  }
];
export default {
  data() {
    return {
      data: [],
      pagination: {},
      loading: false,
      columns
    };
  },
  created() {
    this.fetchHistoryBooking();
  },
  methods: {
    handleTableChange(pagination, filters, sorter) {
           const pager = { ...this.pagination };
      pager.current = pagination.current;
      this.pagination = pager;
      this.fetchHistoryBooking(this.pagination.current)
    },
    fetchHistoryBooking(page) {
      this.loading = true
      HistoryBooking.getHistoryBooking(page).then(res => {
        const pagination = { ...this.pagination };
        pagination.total = res.data.meta.total;
        this.data = res.data.data;
        this.pagination = pagination;
        this.loading = false
      });
    }
  }
};
</script>
<style scoped>
</style>
