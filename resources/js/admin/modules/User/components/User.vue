<template>
<div class="container">
    <div class="card">
      <div class="card-body">
        <!-- title -->
        <div class="d-md-flex align-items-center">
            <div>
              <h4 class="card-title">Danh sách tài khoản</h4>
              <h5 class="card-subtitle">Trang lưu trữ danh sách tài khoản</h5>
              </div>
              <div class="ml-auto">
                   <a-button type="primary">Thêm</a-button>
              </div>
            </div>
            <!-- title -->
        </div>
        <a-table
          :columns="columns"
          :rowKey="record => record.id"
          :dataSource="dsUser"
          :pagination="pagination"
          :loading="loading"
          @change="handleTableChange"
        >
          <template slot="photo" slot-scope="photo">
            <a-avatar :size="64" icon="user" :src="'/images/' + photo"/>
          </template>
          <template slot="active" slot-scope="active">
            <span :class="active === 1 ? 'badge badge-success':'badge badge-danger'">{{ active === 1 ? 'Kích hoạt' : 'Chưa kích hoạt' }}</span>
          </template>
          <template slot="roleName" slot-scope="roleName">
            {{ roleName | upText }}
          </template>
          <template slot="createAt" slot-scope="createAt">
            {{createAt | myDate}}
            </template>
          <template slot="modify" slot-scope="modify">
            <a-button type="primary" icon="edit" @click="updatePermision(modify)"></a-button>
            <a-popconfirm
              title="Are you sure delete?"
              @confirm="deleteUser(modify.id)"
              @cancel="cancel"
              okText="Yes"
              cancelText="No"
            >
              <a-button type="danger" icon="delete"></a-button>
            </a-popconfirm>
          </template>
        </a-table>
    </div>
  <!-- Modal -->
</div>
</template>
<script>
 const columns = [
  {
    title: "ID",
    dataIndex: "id",
    sorter: true
  },
  {
    title: "Image",
    dataIndex: "photo",
    scopedSlots: { customRender: "photo" }
  },
  {
    title: "Name",
    dataIndex: "name",
    width: "20%"
  },
  {
    title: 'Email',
    dataIndex: 'email'
  },
  {
    title: "Status",
    dataIndex: "active",
    scopedSlots: { customRender: "active" },
    filters: [
      { text: "Kích hoạt", value: "1" },
      { text: "Chưa kích hoạt", value: "0" }
    ]
  },
  {
    title: "Role",
    dataIndex: "roleName",
    scopedSlots: {customRender: "roleName"}
  },
  {
    title: 'Create at',
    dataIndex: 'created_at',
    scopedSlots: {customRender: "createAt"}
  },
  {
    title: "Modify",
    scopedSlots: { customRender: "modify" }
  }
]
export default {
  data () {
    return {
      editmode: false,
      pagination: {},
      loading: false,
      visible: false,
      columns,
      form: new Form({
        id: '',
        name: '',
        email: '',
        password: '',
        photo: '',
        bio: ''
      })
    }
  },
  created () {
    this.loading = true
    this.$store.dispatch('user/getDsUser').then(res => {
      const pagination = { ...this.pagination }
      pagination.total = res.data.data.total
      pagination.pageSize = res.data.data.per_page
      this.pagination = pagination
      this.loading = false
    })
  },
  computed: {
    dsUser () {
      return this.$store.state.user.dsUser
    }
  },
  methods: {
    handleTableChange(pagination, filters, sorter) {
      const pager = { ...this.pagination };
      pager.current = pagination.current;
      this.pagination = pager;
      this.loading = true;
      this.$store
        .dispatch("user/getDsUser", this.pagination.current)
        .then(res => {
          const pagination = { ...this.pagination };
          pagination.total = res.data.data.total;
          this.pagination = pagination;
          this.loading = false;
        });
    },
    uploadPhoto (e) {
      let file = e.target.files[0]
      let reader = new FileReader()
      let that = this
      reader.onloadend = function() {
        that.form.photo = reader.result
      }
      reader.readAsDataURL(file)
    },
    updatePermision (id) {

    },
    createUser () {

    },
    deleteUser (id) {

    },
    confirm () {
      
    },
    cancel () {

    }
  }
}
</script>