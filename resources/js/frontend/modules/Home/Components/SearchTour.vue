<template>
  <div class="card">
    <div class="card-body">
      <h4 class="card-title">Tìm kiếm tour</h4>
      <b-row>
        <b-col lg="4">
          <a-form-item label="Điểm đến">
            <a-input size="large" placeholder="Nhập tên điểm đến"/>
          </a-form-item>
        </b-col>
        <b-col lg="4">
          <a-form-item label="Ngày khởi hành">
            <a-range-picker
              :defaultValue="[moment('01/06/2019', dateFormat), moment('01/09/2019', dateFormat)]"
              :format="dateFormat"
              size="large"
              style="width: 100%;"
            />
          </a-form-item>
        </b-col>
        <b-col lg="4" class="d-flex justify-content-center align-items-center">
          <a-button
            type="primary"
            @click="searchTour"
            block
            icon="search"
            size="large"
            style="margin-top: 10px;"
          >Tìm kiếm</a-button>
        </b-col>
      </b-row>
    </div>
  </div>
</template>
<script>
import moment from "moment";
export default {
  name: "SearchTour",
  data() {
    return {
      advanced: false,
      queryParam: {},
      dateFormat: "DD/MM/YYYY",
      monthFormat: "MM/YYYY"
    };
  },
  methods: {
    moment,
    handleChange() {},
    toggleAdvanced() {
      this.advanced = !this.advanced;
    },
    searchTour() {}
  }
};
</script>
<style>
.ant-form-item-label label {
  margin-bottom: 0 !important;
}
</style>