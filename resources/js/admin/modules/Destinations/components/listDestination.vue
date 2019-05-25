<template>
  <div class="destination-list">
    <div class="card">
      <div class="card-body">
        <!-- title -->
        <div class="d-md-flex align-items-center">
          <div>
            <h4 class="card-title">
              <a-icon type="global" /> Danh sách Địa điểm
            </h4>
            <h5 class="card-subtitle">Trang lưu trữ Địa điểm</h5>
          </div>
          <div class="ml-auto">
            <a-button 
            type="primary" 
            @click="$router.push({name: 'AddDestiantion'})"
            icon="plus"
            >
              Thêm mới điểm đến
            </a-button>
          </div>
        </div>
        <!-- title -->
      </div>
      <a-table
        :columns="columns"
        :rowKey="record => record.PlaceID"
        :dataSource="listPlace"
        :pagination="pagination"
        :loading="loading"
        @change="handleTableChange"
      >
        <template slot="placeImage" slot-scope="placeImage">
          <a-avatar shape="square" :size="64" icon="camera" :src="placeImage"/>
        </template>
        <template slot="description" slot-scope="description">
          {{ description | truncate(100) }}
        </template>
        <template slot="dateCreate" slot-scope="dateCreate">
          {{dateCreate | myDate}}
        </template>
        <template slot="modify" slot-scope="modify">
          <a-button type="primary" icon="edit" @click="goToEdit(modify.PlaceID)"></a-button>
          <a-popconfirm
            title="Are you sure delete?"
            @confirm="confirm(modify.PlaceID)"
            @cancel="cancel"
            okText="Yes"
            cancelText="No"
          >
            <a-button type="danger" icon="delete"></a-button>
          </a-popconfirm>
        </template>
      </a-table>
    </div>
  </div>
</template>
<script>
const columns = [
  {
    title: "#",
    dataIndex: "PlaceID",
    sorter: true
  },
  {
    title: "Tỉnh",
    dataIndex: "PlaceName",
    width: "15%"
  },
  {
    title: "Hình ảnh",
    dataIndex: "ImgUrl",
    scopedSlots: { customRender: "placeImage" },
  },

  {
    title: "Mô tả",
    dataIndex: "Description",
    scopedSlots: { customRender: "description" },
    width: "40%"
  },
  {
    title: "Ngày tạo",
    dataIndex: "created_at",
    scopedSlots: { customRender: "dateCreate" }
  },
  {
    title: "Modify",
    scopedSlots: { customRender: "modify" }
  }
];
export default {
  data() {
    return {
      pagination: {},
      loading: false,
      visible: false,
      editMode: false,
      columns
    };
  },
  created() {
    this.loading = true
    this.$store.dispatch("place/getListPlace", this.pagination.current).then(res => {
      const pagination = { ...this.pagination }
      pagination.total = res.data.data.total
      pagination.pageSize = res.data.data.per_page
      this.pagination = pagination;
      this.loading = false
    });
  },
  computed: {
    listPlace() {
      return this.$store.state.place.listPlace;
    }
  },
  methods: {
    goToEdit(Pid) {
      this.$router.push({ name: "editDestination", params: { id: Pid } });
    },
    confirm(id) {
      this.$store.dispatch("place/deletePlace", id).then(res => {
        this.$message.success("Đã xóa thành công");
      });
    },
    handleTableChange(pagination, filters, sorter) {
      const pager = { ...this.pagination };
      pager.current = pagination.current;
      this.pagination = pager;
      this.loading = true;
      this.$store.dispatch("place/getListPlace", this.pagination.current).then(res => {
        const pagination = { ...this.pagination }
        pagination.total = res.data.data.total
        this.pagination = pagination;
        this.loading = false
      });
    },
    cancel() {}
  }
};
</script>

<style scoped>
</style>
