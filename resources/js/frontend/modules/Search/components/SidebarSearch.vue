<template>
  <div class="sidebar-search">
    <a-collapse defaultActiveKey="1" :bordered="false">
      <a-collapse-panel header="Lọc theo giá" key="1">
        <p>
          <a-checkbox-group :options="filterPriceOptions" @change="onchangePrice" :defaultValue="['all']"/>
        </p>
      </a-collapse-panel>
      <a-collapse-panel header="Lọc theo rating" key="2">
        <p>
          <a-checkbox-group :options="filterRatingOptions" @change="onchageRating" :defaultValue="['all']" />
        </p>
      </a-collapse-panel>
      <!-- <a-collapse-panel header="Lọc theo địa điểm" key="3">
        <p>Lorem ipsum dolor sit</p>
      </a-collapse-panel> -->
    </a-collapse>
  </div>
</template>
<script>
export default {
  data() {
    return {
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
    }
  },
  methods: {
    onchageRating(checkedValues) {
      console.log("checked = ", checkedValues);
    },
    onchangePrice (checkedPrice) {
      console.log("checked = ", checkedPrice)
    }
  }
};
</script>