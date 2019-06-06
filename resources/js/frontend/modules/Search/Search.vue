<template>
  <div class="search-form">
    <h2>Tìm kiếm tour</h2>
    <b-row>
      <b-col lg="3">
        <sidebar-search />
      </b-col>
      <b-col lg="9">
        <list-search />
      </b-col>
    </b-row>
  </div>
</template>
<script>
import SidebarSearch from './components/SidebarSearch'
import ListSearch from './components/ListSearch'
export default {
  components: {
    SidebarSearch,
    ListSearch
  }
}
</script>
<style scoped>

</style>
<style>
.sidebar-search .ant-checkbox-group-item:not(:last-child) {
  display: block;
  margin-bottom: 1rem;
}
.sidebar-search .ant-collapse-header {
    background: #1890ff;
    color: #fff !important;
}
</style>
