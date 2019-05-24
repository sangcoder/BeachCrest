<template>
  <div class="section schedules">
    <div class="card">
      <div class="card-body">
        <!-- title -->
        <div class="d-md-flex align-items-center">
          <div>
            <h4 class="card-title">
              <a-icon type="global" class="mr-2"/>Lịch trình
            </h4>
            <h5 class="card-subtitle">Danh sách lịch trình của Tour</h5>
          </div>
          <div class="ml-auto">
            <a-button type="primary" @click="addSchedule" icon="plus">Thêm mới lịch trình</a-button>
            <a-button type="default" @click="downloadExel()" icon="file-excel">Export</a-button>
          </div>
        </div>
        <!-- title -->
      </div>
    </div>
    <div class="card">
      <div class="card-body">
        <div class="d-md-flex align-items-center">
          <div class="ml-auto">
            <a-input-search
              placeholder="input search text"
              style="width: 250px; margin-bottom: 10px;"
              @search="seachTourGuider"
            />
          </div>
        </div>
        <a-table
          :columns="columns"
          :rowKey="record => record.id"
          :dataSource="data"
          :pagination="pagination"
          :loading="loading"
          @change="handleTableChange"
        >
          <template slot="Tour" slot-scope="Tour">{{ Tour.BelongTour.TourName }}</template>
          <template slot="hdv" slot-scope="hdv">{{hdv.ByGuider.GuiderName}}</template>
          <template slot="modify" slot-scope="modify">
            <a-button size="small" type="primary" icon="edit" @click="updateSchedule(modify)"></a-button>
            <a-popconfirm
              title="Bạn muốn xóa lịch trình ?"
              @confirm="deleteSchedule(modify.id)"
              @cancel="cancel"
              okText="Yes"
              cancelText="No"
            >
              <a-button size="small" type="danger" icon="delete"></a-button>
            </a-popconfirm>
          </template>
        </a-table>
      </div>
    </div>
  </div>
</template>

<script>
const columns = [
  {
    title: "ID",
    dataIndex: "id",
    sorter: true
  },
  {
    title: "HDV",
    scopedSlots: { customRender: "hdv" }
  },
  {
    title: "Bắt đầu",
    dataIndex: "StartTime"
  },
  {
    title: "Kết thúc",
    dataIndex: "EndTime"
  },

  {
    title: "Modify",
    scopedSlots: { customRender: "modify" },
    width: "12%"
  }
];
import ScheduleAPI from "../scheduleServices";
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
    this.fetchSchedule();
  },
  methods: {
    fetchSchedule(page) {
      this.loading = true;
      ScheduleAPI.getListSchedules(page).then(res => {
        const pagination = { ...this.pagination };
        pagination.total = res.data.meta.total;
        this.pagination = pagination;
        this.data = res.data.data;
        this.loading = false;
        this.loading = false;
      });
    },
    handleTableChange(pagination, filters, sorter) {
      const pager = { ...this.pagination };
      pager.current = pagination.current;
      this.pagination = pager;
      this.loading = true;
      let params = {
        orderById: sorter.order
      };
      ScheduleAPI.getListSchedules(this.pagination.current, params).then(
        res => {
          this.data = res.data.data;
          this.loading = false;
        }
      );
    },
    updateSchedule(schedule) {},
    deleteSchedule(id) {},
    addSchedule() {},
    seachTourGuider(value) {},
    downloadExel() {},
    cancel() {}
  }
};
</script>