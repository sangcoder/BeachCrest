<template>
  <div>
 <div class="card">
      <div class="card-body">
        <!-- title -->
        <div class="d-md-flex align-items-center">
            <div>
              <h4 class="card-title"><i class="el-icon-location"></i> Danh sách khuyến mãi</h4>
              <h5 class="card-subtitle">Danh sách thông tin khuyến mãi</h5>
              </div>
              <div class="ml-auto">
                <b-button variant="primary" @click="showModalAdd"><i class="el-icon-plus"></i> Thêm mới</b-button>
              </div>
            </div>
            <!-- title -->
        </div>
        <div class="table-responsive table-hover">
          <table class="table v-middle">
            <thead>
                <tr class="bg-light">
                    <th class="border-top-0">#</th>
                    <th class="border-top-0" style="width: 40%;">Contents</th>
                    <th class="border-top-0">Created at</th>
                    <th class="border-top-0">Updated at</th>
                    <th class="border-top-0">Modify</th>
                </tr>
            </thead>
              <tbody>
                  <tr v-for="promotion in listPromtion" :key="promotion.PromotionID">
                    <td>{{promotion.PromotionID}}</td>
                    <td>{{promotion.Contents  }} </td>
                    <td>{{promotion.created_at}}</td>
                    <td>{{promotion.updated_at}}</td>
                    <td>
                      <a-button type="primary" icon="edit" @click="updatePromotion(promotion)">Edit</a-button>
                      <a-popconfirm title="Are you sure delete?" @confirm="deletePromotion(promotion.PromotionID)" @cancel="cancel" okText="Yes" cancelText="No">
                          <a-button type="danger" icon="delete">Delete</a-button>
                      </a-popconfirm>  
                    </td>
                  </tr>
              </tbody>
            </table>
            <b-pagination
              v-model="current_page"
              :total-rows="total"
              :per-page="perPage"
            ></b-pagination>
            <a-modal
              :title="editMode ? 'Sửa khuyến mãi': 'Thêm khuyến mãi'"
              :visible="visible"
              :confirmLoading="confirmLoading"
              @ok="handleOk"
              @cancel="handleCancel"
            >
            <p>Nội dung khuyến mãi</p>
            <a-textarea v-model="formData.Contents" placeholder="Nhập nội dung khuyến mãi" :rows="4"/>
            </a-modal>
        </div>
  </div>
  </div>
</template>
<script>
export default {
  data() {
    return {
      page: 1,
      current_page: 1,
      total: 0,
      perPage: 0,
      visible: false,
      confirmLoading: false,
      editMode: false,
      formData: {
        PromotionID: '',
        Contents: ''
      }
    }
  },
  mounted() {
    this.$store.dispatch('promotion/getListProMotion', this.page).then ((res) => {
      let data = res.data.data
      this.current_page = data.current_page
      this.total = data.total
      this.perPage = data.per_page
      //  console.log(this.$store)
    })
  },
  watch: {
    current_page() {
       this.$store.dispatch('promotion/getListProMotion', this.current_page)
    }
  },
  computed: {
    listPromtion () {
      return this.$store.state.promotion.listPromtion
    }
  },
  methods: {
    showModalAdd () {
      this.visible = true
      this.editMode = false
      this.formData.Contents = ''
    },
    showModalEdit () {
      this.visible = true
      this.editMode = true
    },
    handleCancel () {
      this.visible = false
    },
    handleOk () {
      this.confirmLoading = true
      let payload = {Contents: this.formData.Contents}
      let that = this
      if(!this.editMode) {
        this.$store.dispatch('promotion/addPromotion', payload).then(res => {
        that.visible = false;
        that.confirmLoading = false;
        this.$message.success('Thêm thành công!')
        })
      }
      let updatePayload = {
        PromotionID: this.formData.PromotionID,
        Contents: this.formData.Contents
      }
      if(this.editMode) {
        this.$store.dispatch('promotion/updatePromotion', updatePayload).then(res => {
        that.visible = false;
        that.confirmLoading = false;
        this.$message.success('Sửa thành công!')
        })
      }
    },
    deletePromotion (id) {
      this.$store.dispatch('promotion/deletePromotion', id).then(res => {
        this.$message.success('Đã xóa thành công')
    })
    },
    updatePromotion(promotion) {
      this.visible = true
      this.editMode = true
      this.formData.Contents = promotion.Contents
      this.formData.PromotionID = promotion.PromotionID
    },
    cancel() {

    }
  }
}
</script>
<style scoped>

</style>
