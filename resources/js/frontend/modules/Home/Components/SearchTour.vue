<template>
  <div class="card">
    <div class="card-body">
      <h4 class="card-title">Tìm kiếm tour</h4>
      <b-row>
        <b-col lg="4">
          <a-form-item label="Điểm đến">
            <a-select
              showSearch
              size="large"
              placeholder="Chọn điểm đến"
              optionFilterProp="children"
              style="width: 100%"
              :filterOption="filterOption"
              @change="handleChange"
            >
              <a-select-option v-for="place in listPlace" :key="place.PlaceID" :value="place.PlaceID">
                {{place.PlaceName}}
              </a-select-option>
            </a-select>
          </a-form-item>
        </b-col>
        <b-col lg="4">
          <a-form-item label="Ngày khởi hành">
            <a-range-picker
              :format="dateFormat"
              :ranges="{ 'Hôm nay': [moment(), moment()], 'Tuần này': [moment(), moment().endOf('week')], 'Tháng này': [moment(), moment().endOf('month')] }"
              @change="handleDeparture"
              size="large"
              style="width: 100%;"
            />
          </a-form-item>
        </b-col>
        <b-col lg="4" class="d-flex justify-content-center align-items-center">
          <a-button
            type="primary"
            icon="search"
            size="large"
            style="margin-top: 10px;"
            @click="$router.replace({name: 'SeachTour', query: {diemden: search.diemden, tuNgay: search.tungay, denNgay: search.denngay }})"
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
  props: {
    listPlace: Array
  },
  data() {
    return {
      advanced: false,
      queryParam: {},
      dateRange: [moment(), moment()],
      search: {
        diemden: '',
        tungay: '',
        denngay: ''
      },
      dateFormat: "DD-MM-YYYY",
      monthFormat: "MM-YYYY"
    };
  },
  methods: {
    moment,
    handleChange(value) {
      this.search.diemden = value
    },
    toggleAdvanced() {
      this.advanced = !this.advanced;
    },
    filterOption(input, option) {
      return option.componentOptions.children[0].text.toLowerCase().indexOf(input.toLowerCase()) >= 0
    },
    handleDeparture (date) {
      this.search.tungay = date[0].format(this.dateFormat)
      this.search.denngay = date[1].format(this.dateFormat)
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