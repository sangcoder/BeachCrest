<template>
  <div class="card">
    <div class="card-body">
      <h4 class="card-title"> <a-icon type="file-search" /> Tìm kiếm tour</h4>
      <b-row>
        <b-col lg="4">
          <a-form-item label="Mã tour">
            <a-input size="large" placeholder="Nhập mã tour" v-model="queryParam.byId" />
          </a-form-item>
        </b-col>
        <b-col lg="4">
          <a-form-item label="Tên tour">
            <a-input size="large" placeholder="Nhập tên tour" v-model="queryParam.byName"/>
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
import TourAPI from '../tourServices'
export default {
  name: 'SearchTour',
  data() {
    return {
      advanced: false,
      queryParam: {
        byId: '',
        byName: ''
      }
    }
  },
  methods: {
    toggleAdvanced () {
      this.advanced = !this.advanced
    },
    fetchSearch (params = {}) {
      TourAPI.searchTour(params).then(res => {
        this.$emit('search-tour', res)
      })
    },
    searchTour () {
      this.fetchSearch(this.queryParam)
    }
  }
}
</script>