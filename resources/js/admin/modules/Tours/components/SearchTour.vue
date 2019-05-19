<template>
  <div class="card">
    <div class="card-body">
      <h2 class="card-title">Tìm kiếm tour</h2>
      <a-form layout="inline">
        <a-row :gutter="48">
          <a-col :md="8" :sm="24">
            <a-form-item label="Tìm theo tên">
              <a-input v-model="queryParam.id" placeholder/>
            </a-form-item>
          </a-col>
          <a-col :md="8" :sm="24">
            <a-form-item label="Tên tour">
              <a-input v-model="queryParam.id" placeholder/>
            </a-form-item>
          </a-col>
          <template v-if="advanced">
            <a-col :md="8" :sm="24">
            <a-form-item label="Tên tour">
              <a-input v-model="queryParam.id" placeholder/>
            </a-form-item>
            </a-col>
            <a-col :md="8" :sm="24">
              <a-form-item label="Ngày bắt đầu">
                <a-date-picker v-model="queryParam.date" style="width: 100%" placeholder="Chọn ngày"/>
              </a-form-item>
            </a-col>
            <a-col :md="8" :sm="24">
            <a-form-item label="Tên tour">
              <a-input v-model="queryParam.id" placeholder/>
            </a-form-item>
            </a-col>
            <a-col :md="8" :sm="24">
            <a-form-item label="Tên tour">
              <a-input v-model="queryParam.id" placeholder/>
            </a-form-item>
            </a-col>
          </template>
          <a-col :md="!advanced && 8 || 24" :sm="24">
            <span
              class="table-page-search-submitButtons"
              :style="advanced && { float: 'right', overflow: 'hidden' } || {} "
            >
              <a-button type="primary" @click="searchTour">Search</a-button>
              <a-button >Clear</a-button>
              <a @click="toggleAdvanced" style="margin-left: 8px">
                {{ advanced ? 'Ẩn nâng cao' : 'Tìm nâng cao' }}
                <a-icon :type="advanced ? 'up' : 'down'"/>
              </a>
            </span>
          </a-col>
        </a-row>
      </a-form>
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