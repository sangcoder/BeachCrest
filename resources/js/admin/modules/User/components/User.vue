<template>
  <div class="user-list">
    <div class="card">
      <div class="card-body">
        <!-- title -->
        <div class="d-md-flex align-items-center">
          <div>
            <h4 class="card-title">
              <a-icon type="global"/> Danh sách tài khoản
            </h4>
            <h5 class="card-subtitle">Trang lưu trữ danh sách tài khoản</h5>
          </div>
          <div class="ml-auto">
            <a-input-search placeholder="Input email..." style="width: 250px" @search="onSearch"/>
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
        :rowSelection="{selectedRowKeys: selectedRowKeys, onChange: onSelectChange}"
        @change="handleTableChange"
      >
        <template slot="photo" slot-scope="photo">
          <a-avatar :size="64" icon="user" :src="'/images/' + photo"/>
        </template>
        <template slot="active" slot-scope="active">
          <a-tooltip placement="bottom">
            <template slot="title">
              <span v-if="active === 1">Kích hoạt</span>
              <span v-else>Chưa kích hoạt</span>
            </template>
            <a-icon
              v-if="active === 1"
              type="check-circle"
              :style="{fontSize: '30ppx;'}"
              theme="twoTone"
              twoToneColor="#52c41a"
            />
            <a-icon v-else type="check-circle"/>
          </a-tooltip>
        </template>
        <template slot="roleName" slot-scope="roleName">
          <a-tag color="#f50" v-if="roleName.includes('admin') || roleName.includes('Mod')">{{ roleName | upText }}</a-tag>
          <a-tag color="#87d068" v-else>{{ roleName | upText }}</a-tag>
        </template>
        <template slot="createAt" slot-scope="createAt">{{createAt | myDate(createAt)}}</template>
        <template slot="modify" slot-scope="modify">
          <a-button size="small" type="primary" icon="edit" @click="showModalRole(modify)"></a-button>
          <a-popconfirm
            title="Bạn có chắc muốn xóa tài khoản này?"
            @confirm="deleteUser(modify.id)"
            @cancel="cancel"
            okText="Yes"
            cancelText="No"
          >
            <a-button size="small" type="danger" icon="delete"></a-button>
          </a-popconfirm>
        </template>
      </a-table>
    </div>
    <!-- Modal -->
    <a-modal title="Chỉnh sửa quyền" v-model="visible" @ok="changeRole">
      <a-select
        defaultValue="Chọn nhóm người dùng"
        style="width: 100%;"
        @change="handleChangeSelect"
      >
        <a-select-option v-for="item in Roles" :key="item.id" :value="item.id">{{item.name}}</a-select-option>
      </a-select>
    </a-modal>
  </div>
</template>
<script>
import UserAPI from "../services";
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
    dataIndex: "name"
  },
  {
    title: "Email",
    dataIndex: "email"
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
    scopedSlots: { customRender: "roleName" }
  },
  {
    title: "Create at",
    dataIndex: "created_at",
    scopedSlots: { customRender: "createAt" }
  },
  {
    title: "Modify",
    scopedSlots: { customRender: "modify" }
  }
];
export default {
  data() {
    return {
      editmode: false,
      pagination: {
        showQuickJumper: true,
        showSizeChanger: true,
        pageSizeOptions: ["10", "20", "30", "40"],
        showTotal: total => `Total ${total} items`,
        showSizeChange: (current, pageSize) => (this.pageSize = pageSize)
      },
      modelHasRole: {
        roleID: 0,
        userID: 0
      },
      loading: false,
      visible: false,
      selectedRowKeys: [],
      Roles: [],
      columns,
      form: {
        id: "",
        name: "",
        email: "",
        password: "",
        photo: "",
        bio: ""
      }
    };
  },
  created() {
    this.loading = true;
    let payload = {
      page: this.pagination.current
    };
    this.$store.dispatch("user/getDsUser", payload).then(res => {
      const pagination = { ...this.pagination };
      pagination.total = res.data.meta.total;
      pagination.pageSize = res.data.meta.per_page;
      this.pagination = pagination;
      this.loading = false;
    });
  },
  computed: {
    dsUser() {
      return this.$store.state.user.dsUser;
    }
  },
  methods: {
    onSearch(value) {
      this.loading = true;
      let payload = {
        page: this.pagination.current,
        params: {
          searchEmail: value
        }
      };
      this.$store.dispatch("user/getDsUser", payload).then(res => {
        const pagination = { ...this.pagination };
        pagination.total = res.data.meta.total;
        this.pagination = pagination;
        this.loading = false;
      });
    },
    onSelectChange(selectedRowKeys) {
      this.selectedRowKeys = selectedRowKeys;
    },
    handleTableChange(pagination, filters, sorter) {
      const pager = { ...this.pagination };
      pager.current = pagination.current;
      this.pagination = pager;
      this.loading = true;
      let payload = {
        page: this.pagination.current,
        params: {
          sortById: sorter.order,
          ...filters
        }
      };
      this.$store.dispatch("user/getDsUser", payload).then(res => {
        const pagination = { ...this.pagination };
        pagination.total = res.data.meta.total;
        this.pagination = pagination;
        this.loading = false;
      });
    },
    uploadPhoto(e) {
      let file = e.target.files[0];
      let reader = new FileReader();
      let that = this;
      reader.onloadend = function() {
        that.form.photo = reader.result;
      };
      reader.readAsDataURL(file);
    },
    deleteUser(id) {
      UserAPI.deleteUser(id).then(res => {
        this.loading = false;
        UserAPI.getlistUser(this.pagination.current).then (res => {
          const pagination = { ...this.pagination };
          pagination.total = res.data.meta.total;
          this.pagination = pagination;
          this.loading = false;
        })
      });
    },
    showModalRole(user) {
      this.visible = true;
      this.modelHasRole.userID = user.id
      this.fetchAllRole();
    },
    changeRole() {
      this.visible = false;
      UserAPI.addRoleModel(this.modelHasRole).then(res => {
        console.log('Ok')
      })
    },
    handleChangeSelect(value) {
      this.modelHasRole.roleID = value
    },
    fetchAllRole() {
      UserAPI.getAllRole().then(res => {
        this.Roles = res.data;
      });
    },
    confirm() {},
    cancel() {}
  }
};
</script>