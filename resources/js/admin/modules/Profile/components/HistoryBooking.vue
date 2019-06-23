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
      <template slot="tour" slot-scope="tour"><a target="_blank" rel="noopener noreferrer" @click="$router.push({name: 'booking', query: {tour: tour.infoTour.id}})" >{{tour.infoTour.name}}</a> </template>
      <template slot="State" slot-scope="State">
        {{State === 1 ? 'Chưa thanh toán': 'Đã thanh toán'}}</template>
      <template slot="dateBooking" slot-scope="dateBooking">{{dateBooking.DateBooking}}</template>
      <template slot="nguoiduyet" slot-scope="nguoiduyet">
        <p v-if="nguoiduyet">
          <strong>{{nguoiduyet}}</strong>
        </p>
        <p>
          Chưa duyệt
        </p>
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
    dataIndex: "nguoiduyet",
    scopedSlots: { customRender: "nguoiduyet" }
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
      console.log(pagination);
    },
    fetchHistoryBooking(page) {
      HistoryBooking.getHistoryBooking(page).then(res => {
        const pagination = { ...this.pagination };
        pagination.total = res.data.meta.total;
        this.data = res.data.data;
        this.pagination = pagination;
      });
    }
  }
};
</script>
<style scoped>
</style>
