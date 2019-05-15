<template>
  <div>
    <div class="card">
      <div class="card-body">
        <!-- title -->
        <div class="d-md-flex align-items-center">
          <div>
            <h4 class="card-title">
              <i class="el-icon-location"></i> Danh sách khuyến mãi
            </h4>
            <h5 class="card-subtitle">Danh sách thông tin khuyến mãi</h5>
          </div>
          <div class="ml-auto">
            <b-button variant="primary" @click="showModalAdd">
              <i class="el-icon-plus"></i> Thêm mới
            </b-button>
          </div>
        </div>
        <!-- title -->
      </div>
      <a-table
        :columns="columns"
        :rowKey="record => record.PromotionID"
        :dataSource="listPromtion"
        :pagination="pagination"
        :loading="loading"
        @change="handleTableChange"
      >
        <template slot="dateCreate" slot-scope="dateCreate">{{dateCreate | myDate}}</template>
        <template slot="dateUpdate" slot-scope="dateUpdate">{{dateUpdate | myDate}}</template>
        <template slot="modify" slot-scope="modify">
          <a-button type="primary" icon="edit" @click="updatePromotion(modify)">Edit</a-button>
          <a-popconfirm
            title="Are you sure delete?"
            @confirm="deletePromotion(modify.PromotionID)"
            @cancel="cancel"
            okText="Yes"
            cancelText="No"
          >
            <a-button type="danger" icon="delete">Delete</a-button>
          </a-popconfirm>
        </template>
      </a-table>
      <a-modal
        :title="editMode ? 'Sửa khuyến mãi': 'Thêm khuyến mãi'"
        :visible="visible"
        :confirmLoading="confirmLoading"
        :maskClosable="false"
        @ok="handleOk"
        @cancel="handleCancel"
      >
        <p>Nội dung khuyến mãi</p>
        <a-textarea v-model="formData.Contents" placeholder="Nhập nội dung khuyến mãi" :rows="4"/>
      </a-modal>
    </div>
  </div>
</template>
<script>
const columns = [
  {
    title: "ID",
    dataIndex: "PromotionID",
    sorter: true,
    width: "5%"
  },
  {
    title: "Nội dung khuyến mãi",
    dataIndex: "Contents",
    width: "55%"
  },
  {
    title: "Ngày tạo",
    dataIndex: "created_at",
    width: "10%",
    scopedSlots: { customRender: "dateCreate" }
  },
  {
    title: "Ngày sửa",
    dataIndex: "updated_at",
    width: "10%",
    scopedSlots: { customRender: "dateUpdate" }
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
      columns,
      editMode: false,
      confirmLoading: false,
      formData: {
        PromotionID: "",
        Contents: ""
      }
    };
  },
  mounted() {
    this.loading = true;
    this.$store
      .dispatch("promotion/getListProMotion", this.pagination.current)
      .then(res => {
        const pagination = { ...this.pagination };
        pagination.total = res.data.data.total;
        pagination.pageSize = res.data.data.per_page
        this.pagination = pagination;
        this.loading = false;
      });
  },
  computed: {
    listPromtion() {
      return this.$store.state.promotion.listPromtion;
    }
  },
  methods: {
    handleTableChange(pagination, filters, sorter) {
      const pager = { ...this.pagination };
      pager.current = pagination.current;
      this.pagination = pager;
      console.log('page' + pagination, 'sort' + JSON.stringify(sorter))
      this.loading = true;
      this.$store
        .dispatch("promotion/getListProMotion", this.pagination.current)
        .then(res => {
          const pagination = { ...this.pagination };
          pagination.total = res.data.data.total;
          this.pagination = pagination;
          this.loading = false;
        });
    },
    showModalAdd() {
      this.visible = true;
      this.editMode = false;
      this.formData.Contents = "";
    },
    showModalEdit() {
      this.visible = true;
      this.editMode = true;
    },
    handleCancel() {
      this.visible = false;
    },
    handleOk() {
      this.confirmLoading = true;
      let payload = { Contents: this.formData.Contents };
      let that = this;
      if (!this.editMode) {
        this.$store.dispatch("promotion/addPromotion", payload).then(res => {
          that.visible = false;
          that.confirmLoading = false;
          this.$message.success("Thêm thành công!");
        });
      }
      let updatePayload = {
        PromotionID: this.formData.PromotionID,
        Contents: this.formData.Contents
      };
      if (this.editMode) {
        this.$store
          .dispatch("promotion/updatePromotion", updatePayload)
          .then(res => {
            that.visible = false;
            that.confirmLoading = false;
            this.$message.success("Sửa thành công!");
          });
      }
    },
    deletePromotion(id) {
      this.$store.dispatch("promotion/deletePromotion", id).then(res => {
        this.$message.success("Đã xóa thành công");
      });
    },
    updatePromotion(promotion) {
      this.visible = true;
      this.editMode = true;
      this.formData.Contents = promotion.Contents;
      this.formData.PromotionID = promotion.PromotionID;
    },
    cancel() {}
  }
};
</script>
<style scoped>
</style>
