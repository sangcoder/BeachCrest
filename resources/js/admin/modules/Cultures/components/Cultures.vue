<template>
  <div class="culture">
    <div class="card">
      <div class="card-body">
        <!-- title -->
        <div class="d-md-flex align-items-center">
          <div>
            <h4 class="card-title">
              <a-icon type="global"/> Danh lam thắng cảnh
            </h4>
            <h5 class="card-subtitle">Danh sách danh lam thắng cảnh</h5>
          </div>
          <div class="ml-auto">
            <a-button
              type="primary"
              icon="plus"
              @click="addNewCultures"
            >Thêm mới danh lam thắng cảnh</a-button>
          </div>
        </div>
        <!-- /title -->
        <a-table
          :columns="columns"
          :rowKey="record => record.ScenicID"
          :dataSource="data"
          :pagination="pagination"
          :loading="loading"
          @change="handleTableChange"
          :rowSelection="{selectedRowKeys: selectedRowKeys, onChange: onSelectChange}"
        >
          <template slot="scenicName" slot-scope="scenicName">
            <a-avatar :size="64" shape="square" icon="camera" :src="scenicName"/>
          </template>
          <template slot="description" slot-scope="description">{{ description | truncate(45) }}</template>
          <template slot="state" slot-scope="state">{{state === 1 ? 'OK' : 'Bảo trì'}}</template>
          <template slot="dateCreate" slot-scope="dateCreate">{{dateCreate | myDate}}</template>
          <template slot="modify" slot-scope="modify">
            <a-button size="small" type="primary" icon="edit" @click="updateTourGuider(modify)"></a-button>
            <a-popconfirm
              title="Are you sure delete?"
              @confirm="deleteTourGuider(modify.ScenicID)"
              @cancel="cancel"
              okText="Yes"
              cancelText="No"
            >
              <a-button size="small" type="danger" icon="delete"></a-button>
            </a-popconfirm>
          </template>
        </a-table>
      </div>
    </div>
  </div>
</template>
<script>
import CultureAPI from "../cultureService";
function getBase64(img, callback) {
  const reader = new FileReader();
  reader.addEventListener("load", () => callback(reader.result));
  reader.readAsDataURL(img);
}
const columns = [
  {
    title: "ID",
    dataIndex: "ScenicID",
    width: "2%",
    sorter: true
  },
  {
    title: "Hình ảnh",
    dataIndex: "ImgUrl",
    scopedSlots: { customRender: "scenicName" },
    width: "8%"
  },
  {
    title: "Tên thắng cảnh",
    dataIndex: "ScenicName",
    width: "15%"
  },
  {
    title: "Mô tả",
    dataIndex: "Description",
    width: "20%",
    scopedSlots: { customRender: "description" }
  },
  {
    title: "Trạng thái",
    dataIndex: "State",
    scopedSlots: { customRender: "state" },
    width: "10%"
  },
  {
    title: "Điểm đến",
    dataIndex: "PlaceName",
    width: "10%"
  },
  {
    title: "Ngày tạo",
    dataIndex: "created_at",
    scopedSlots: { customRender: "dateCreate" },
    width: "12%",
    filters: [
      { text: "Mới nhất", value: "lastest" },
      { text: "Cũ nhất", value: "oldest" }
    ]
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
      data: [],
      selectedRowKeys: [],
      loading: false,
      visible: false,
      editMode: false,
      columns
    };
  },
  created() {
    this.fetchDataCultures();
  },
  methods: {
    fetchDataCultures(page, params = {}) {
      this.loading = true;
      CultureAPI.getListCultures(page, params).then(res => {
        const pagination = { ...this.pagination };
        pagination.total = res.data.data.total;
        pagination.pageSize = res.data.data.per_page;
        this.data = res.data.data.data;
        this.pagination = pagination;
        this.loading = false;
      });
    },
    handleTableChange(pagination, filters, sorter) {
      const pager = { ...this.pagination };
      pager.current = pagination.current;
      this.pagination = pager;
      this.fetchDataCultures(this.pagination.current, {
        sortById: sorter.order,
        filterLastest: filters.created_at
      });
    },
    onSelectChange(selectedRowKeys) {
      console.log("selectedRowKeys changed: ", selectedRowKeys);
      this.selectedRowKeys = selectedRowKeys;
    },
    addNewCultures() {
      this.$router.push({name: 'editCultures'})
    },
    updateTourGuider(culture) {
      this.$router.push({name: 'editCultures', query: {type: 'edit', cultureId: culture.ScenicID}})
    },
    deleteTourGuider(id) {
      this.loading = true
      CultureAPI.deleteCultures(id).then(res => {
        this.fetchDataCultures(this.pagination.current)
        this.loading = false
        this.$message.success('Xóa thành công!');
      })
    },
    cancel() {}
  }
};
</script>
<style scoped>
</style>
