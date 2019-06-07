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
          :filterOption="filterOption"
          @change="handleChange"
        >
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
            size="large"
            style="width: 100%;"
          />
        </a-form-item>
      </b-form-group>
    </div>
    <a-collapse defaultActiveKey="1" :bordered="false">
      <a-collapse-panel header="Lọc theo giá" key="1">
        <p>
          <a-checkbox-group
            :options="filterPriceOptions"
            @change="onchangePrice"
            :defaultValue="['all']"
          />
        </p>
      </a-collapse-panel>
      <a-collapse-panel header="Lọc theo rating" key="2">
        <p>
          <a-checkbox-group
            :options="filterRatingOptions"
            @change="onchageRating"
            :defaultValue="['all']"
          />
        </p>
      </a-collapse-panel>
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
      filterRatingOptions: [
        { label: "Tất cả", value: "all" },
        { label: "Được xếp hạng 5 sao", value: 5 },
        { label: "Được xếp hạng 4 sao", value: 4 },
        { label: "Được xếp hạng 3 sao", value: 3 },
        { label: "Được xếp hạng 2 sao", value: 2 },
        { label: "Được xếp hạng 1 sao", value: 1 }
      ],
      filterPriceOptions: [
        { label: "Tất cả", value: "all" },
        { label: "Dưới 500 nghìn", value: 5 },
        { label: "Từ 500 - 1 triệu", value: 4 },
        { label: "Từ 1 - 2 triệu", value: 3 },
        { label: "Từ 2 - 5 triệu", value: 2 },
        { label: "Trên 5 triệu", value: 1 }
      ]
    };
  },
  methods: {
    moment,
    onchageRating(checkedValues) {
      console.log("checked = ", checkedValues);
    },
    onchangePrice(checkedPrice) {
      console.log("checked = ", checkedPrice);
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
      this.search.tungay = date[0].format(this.dateFormat);
      this.search.denngay = date[1].format(this.dateFormat);
    }
  }
};
</script>