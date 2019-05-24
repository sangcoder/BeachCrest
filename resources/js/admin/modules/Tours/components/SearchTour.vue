<template>
  <div class="card">
    <div class="card-body">
      <h4 class="card-title"> <a-icon type="file-search" /> Tìm kiếm tour</h4>
      <b-row>
        <b-col lg="4">
          <a-form-item label="Điểm đến">
            <a-input size="large" placeholder="Nhập tên điểm đến"/>
          </a-form-item>
        </b-col>
        <b-col lg="4">
          <a-form-item label="Ngày khởi hành">
            <a-input size="large" placeholder="Nhập tên điểm đến"/>
          </a-form-item>
        </b-col>
        <b-col lg="2" class="d-flex justify-content-center align-items-center">
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
export default {
  name: 'SearchTour',
  data() {
    return {
      advanced: false,
      queryParam: {}
    }
  },
  methods: {
    toggleAdvanced () {
      this.advanced = !this.advanced
    },
    searchTour () {

    }
  }
}
</script>