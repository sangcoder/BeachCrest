<template>
  <div class="sidebar-search">
    <div class="search-box">
      <a-form-item label="Điểm đến">
        <a-select
          showSearch
          size="large"
          placeholder="Chọn điểm đến"
          optionFilterProp="children"
          style="width: 100%"
          v-model="search.diemden"
          :filterOption="filterOption"
          @change="handleChange"
        >
          <a-select-option :value="-1">Tất cả</a-select-option>
          <a-select-option
            v-for="place in listPlace"
            :key="place.PlaceID"
            :value="place.PlaceID"
          >{{place.PlaceName}}</a-select-option>
        </a-select>
      </a-form-item>
      <b-form-group>
        <a-form-item label="Ngày khởi hành">
          <a-range-picker
            :format="dateFormat"
            :ranges="{ 'Hôm nay': [moment(), moment()], 'Tuần này': [moment(), moment().endOf('week')], 'Tháng này': [moment(), moment().endOf('month')] }"
            @change="handleDeparture"
            v-model="search.dateDeparture"
            size="large"
            style="width: 100%;"
          />
        </a-form-item>
      </b-form-group>
      <b-form-group>
        <a-button type="primary" @click="handleSearch">Tìm kiếm</a-button>
      </b-form-group>
    </div>
    <a-collapse defaultActiveKey="1" :bordered="false">
      <a-collapse-panel header="Lọc theo giá" key="1">
        <p>
          <!-- <a-checkbox
            :indeterminate="indeterminate"
            @change="onCheckAllChange"
            :checked="checkAll"
          >Tất cả</a-checkbox>-->
        </p>
        <p>
          <a-radio-group @change="onchangePrice" v-model="value" >
            <a-radio :style="radioStyle" :value="'all'">Tất cả</a-radio>
            <a-radio :style="radioStyle" :value="'small500'">Dưới 500 nghìn</a-radio>
            <a-radio :style="radioStyle" :value="'500to1000'">Từ 500 - 1 triệu</a-radio>
            <a-radio :style="radioStyle" :value="'1000to2000'">Từ 1 - 2 triệu</a-radio>
            <a-radio :style="radioStyle" :value="'2000to5000'">Từ 2 - 5 triệu</a-radio>
            <a-radio :style="radioStyle" :value="'big5000'">Trên 5 triệu</a-radio>
          </a-radio-group>
          <!-- <a-checkbox-group
            :options="filterPriceOptions"
            v-model="checkedList"
            @change="onchangePrice"
          />-->
        </p>
      </a-collapse-panel>
      <!-- <a-collapse-panel header="Lọc theo rating" key="2">
        <p>
          <a-checkbox-group
            :options="filterRatingOptions"
            @change="onchageRating"
            :defaultValue="['all']"
          />
        </p>
      </a-collapse-panel>-->
      <!-- <a-collapse-panel header="Lọc theo địa điểm" key="3">
        <p>Lorem ipsum dolor sit</p>
      </a-collapse-panel>-->
    </a-collapse>
  </div>
</template>
<script>
import moment from "moment";
export default {
  name: "SidebarSearch",
  props: {
    listPlace: Array
  },
  data() {
    return {
      dateFormat: "DD-MM-YYYY",
      monthFormat: "MM-YYYY",
      indeterminate: true,
      checkAll: false,
      value: 'all',
      checkedList: [],
      search: {
        tuNgay: '',
        denNgay: '',
        diemden: -1,
        dateDeparture: []
      },
      radioStyle: {
        display: "block",
        height: "30px",
        lineHeight: "30px"
      },
      filterRatingOptions: [
        { label: "Tất cả", value: "all" },
        { label: "Được xếp hạng 5 sao", value: 5 },
        { label: "Được xếp hạng 4 sao", value: 4 },
        { label: "Được xếp hạng 3 sao", value: 3 },
        { label: "Được xếp hạng 2 sao", value: 2 },
        { label: "Được xếp hạng 1 sao", value: 1 }
      ],
      filterPriceOptions: [
        { label: "Dưới 500 nghìn", value: "small500" },
        { label: "Từ 500 - 1 triệu", value: "500to1000" },
        { label: "Từ 1 - 2 triệu", value: "1000to2000" },
        { label: "Từ 2 - 5 triệu", value: "2000to5000" },
        { label: "Trên 5 triệu", value: "big5000" }
      ]
    };
  },
  created() {
    let dateStart = moment(this.$route.query.tuNgay, "DD-MM-YYYY").format(
      "MM-DD-YYYY"
    );
    let dateEnd = moment(this.$route.query.denNgay, "DD-MM-YYYY").format(
      "MM-DD-YYYY"
    );
    if (this.$route.query.diemden) {
      this.search.diemden = parseInt(this.$route.query.diemden);
    }
    if (this.$route.query.tuNgay && this.$route.query.denNgay) {
      this.search.dateDeparture = [
        moment(new Date(dateStart)),
        moment(new Date(dateEnd))
      ];
    }
  },
  methods: {
    moment,
    onchageRating(checkedValues) {
    },
    onchangePrice(e) {

      this.$emit("search-filter", e.target.value);
      // console.log(checkedPrice)
    },
    filterOption(input, option) {
      return (
        option.componentOptions.children[0].text
          .toLowerCase()
          .indexOf(input.toLowerCase()) >= 0
      );
    },
    handleChange(value) {
      this.search.diemden = value;
    },
    handleDeparture(date) {
      if (date.length > 0) {
      this.search.tungay = date[0].format(this.dateFormat);
      this.search.denngay = date[1].format(this.dateFormat);
      } 

    },
    onCheckAllChange(e) {
      // if (e.target.checked) {
      //    this.checkedList = ['all']
      // } else {
      //    this.checkedList = this.filterPriceOptions
      // }
      Object.assign(this, {
        checkedList: e.target.checked ? ["all"] : [],
        indeterminate: false,
        checkAll: e.target.checked
      });
    },
    handleSearch() {
      if (this.search.dateDeparture.length > 0) {
        this.$router.replace({
          name: "SeachTour",
          query: {
            diemden: this.search.diemden,
            tuNgay: this.search.dateDeparture ? this.search.dateDeparture[0].format("DD-MM-YYYY") : '',
            denNgay:  this.search.dateDeparture ? this.search.dateDeparture[1].format("DD-MM-YYYY") : ''
          }
        });
      } else {
        this.$router.replace({
          name: "SeachTour",
          query: {
            diemden: this.search.diemden,
            tuNgay: "",
            denNgay: ""
          }
        });
      }
      this.value = 'all'
      this.$emit("EventReload", this.checkedList);
    }
  }
};
</script>
<style scoped>
.search-box {
  background: #fff;
  padding: 12px;
  border-radius: 5px 5px 0 0;
}
</style>
