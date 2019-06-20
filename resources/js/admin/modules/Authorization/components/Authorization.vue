<template>
  <div class="section authorization">
    <div class="card">
      <div class="card-body border-left-orange">
        <!-- title -->
        <div class="d-md-flex align-items-center">
          <div>
            <h4 class="card-title">
              <a-icon type="global" class="mr-2"/>Phân nhóm chức năng
            </h4>
            <h5 class="card-subtitle">Cho phép tạo nhóm chức năng cho từng loại người dùng</h5>
          </div>
          <div class="ml-auto">
            <a-button
              type="primary"
              @click="$router.push({name: 'UserInfo'})"
              icon="usergroup-add"
            >Danh sách tài khoản</a-button>
          </div>
        </div>
        <!-- /title -->
      </div>
    </div>
    <b-row>
      <b-col md="4">
        <div class="card">
          <div class="card-body">
            <h5 class="text-uppercase mb-3">Danh sách nhóm người dùng</h5>
            <a-spin :spinning="loadingRole">
              <a-menu @select="selectMenu">
                <a-menu-item v-for="role in Roles" :key="role.id">
                  <a-icon type="lock"/>
                  {{role.name | upText}}
                </a-menu-item>
              </a-menu>
            </a-spin>
            <b-form-group>
              <a-button
                type="dashed"
                class="mt-3"
                icon="usergroup-add"
                @click="showModal"
                block
              >Thêm mới nhóm người dùng</a-button>
            </b-form-group>
          </div>
        </div>
      </b-col>
      <b-col md="8">
        <div class="card">
          <div class="card-body">
            <h5 class="text-uppercase mb-3">Danh sách chức năng</h5>
            <a-checkbox-group @change="onChange">
              <b-container>
                <b-form-group>
                  <a-checkbox-group :options="nameRoles" v-model="valueRoles"></a-checkbox-group>
                </b-form-group>
              </b-container>
            </a-checkbox-group>
            <div class="tool d-md-flex">
              <a-button type="primary" @click="addPermisionWithRole">Sửa quyền</a-button>
              <div class="ml-auto">
                <!-- <a-button type="primary" @click="renameGgroup">Sửa tên nhóm</a-button> -->
                <a-button type="danger" @click="deleteGroup">Xóa nhóm</a-button>
              </div>
            </div>
          </div>
        </div>
      </b-col>
    </b-row>
    <!-- Modal new Role -->
    <a-modal title="Thêm nhóm quyền mới" v-model="visibleRole" @ok="submitRole" okText="Thêm quyền">
      <b-form-group label="Nhập tên nhóm người dùng mới">
        <a-input v-model="formData.NameRole" placeholder="Nhập nhóm người dùng"/>
      </b-form-group>
    </a-modal>
  </div>
</template>
<script>
import AuthAPI from "../authorizationService";
export default {
  data() {
    return {
      visibleRole: false,
      Roles: [],
      nameRoles: [],
      valueRoles: [],
      valueCheck: [],
      loadingRole: false,
      formData: {
        roleId: 0,
        NameRole: ""
      }
    };
  },
  created() {
    this.fetchAllRole();
    this.fetchAllPermision();
  },
  computed: {
    filterPermission() {}
  },
  methods: {
    deleteGroup() {
      this.loadingRole = true;
      let that = this
      AuthAPI.deleteRole(this.formData.roleId)
        .then(res => {
          if (res.data.success) {
            that.loadingRole = false;
            that.fetchAllRole();
            that.$notification["success"]({
              message: "Bạn đã xóa thành công",
              description: "Danh sách đã cập nhật lại!"
            });
          } else {
            that.loadingRole = false;
            that.$notification["error"]({
              message: "Có lỗi xảy ra",
              description: res.data.message
            });
          }
        })
        .catch(err => {
          console.log("Opps Err" + err);
        });
    },
    renameGgroup() {},
    showModal() {
      this.visibleRole = true;
    },
    submitRole() {
      let payload = {
        NameRoles: this.formData.NameRole
      };
      this.loadingRole = true;
      AuthAPI.addNewRole(payload).then(res => {
        this.visibleRole = false;
        this.$message.success("Thêm nhóm người thành công!");
        this.fetchAllRole();
        this.loadingRole = false;
      });
    },
    addPermisionWithRole() {
      let payload = {
        roleId: this.formData.roleId,
        valueRoles: this.valueRoles
      };
      AuthAPI.addPermissioToRole(payload).then(res => {
        console.log("OK");
      });
    },
    selectMenu({ item, key, selectedKeys }) {
      this.fetchPermisionByRole(key);
      this.formData.roleId = key;
    },
    onChange() {},
    addNewGroup() {},
    fetchAllRole() {
      AuthAPI.getAllRole().then(res => {
        this.Roles = res.data;
      });
    },
    fetchAllPermision() {
      AuthAPI.getAllPermission().then(res => {
        this.nameRoles = res.data.map(item => {
          return { label: item.name, value: item.id };
        });
      });
    },
    fetchPermisionByRole(id) {
      AuthAPI.getAllPermisionById(id).then(res => {
        this.valueRoles = res.data.map(item => {
          return item.permission_id;
        });
      });
    }
  }
};
</script>