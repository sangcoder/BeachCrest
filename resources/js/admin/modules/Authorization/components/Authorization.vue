<template>
  <div class="section authorization">
    <div class="card">
      <div class="card-body border-left-orange">
        <!-- title -->
        <div class="d-md-flex align-items-center">
          <div>
            <h4 class="card-title">
              <a-icon type="global"/>Phân nhóm chức năng
            </h4>
            <h5 class="card-subtitle">Cho phép tạo nhóm chức năng cho từng loại người dùng</h5>
          </div>
          <div class="ml-auto">
            <a-button type="primary" icon="usergroup-add">Danh sách tài khoản</a-button>
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
            <a-menu @select="selectMenu">
              <a-menu-item v-for="role in Roles" :key="role.id">
                <a-icon type="lock"/>
                {{role.name | upText}}
              </a-menu-item>
            </a-menu>
            <b-form-group>
              <a-button
                type="dashed"
                class="mt-3"
                icon="usergroup-add"
                @click="addNewGroup"
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
                    <a-checkbox-group :options="nameRoles"  v-model="valueRoles" ></a-checkbox-group>
                  </b-form-group>
              </b-container>
            </a-checkbox-group>
            <p>
              <a-button type="primary">Primary</a-button>
            </p>
          </div>
        </div>
      </b-col>
    </b-row>
  </div>
</template>
<script>
import AuthAPI from "../authorizationService";
export default {
  data() {
    return {
      value: "",
      Roles: [],
      Permission: [],
      userPermision: [],
      nameRoles: [],
      valueRoles: [],
      valueCheck: [],
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
    addPermistion (value) {
      console.log(value)
    },
    handleChangeSelect(value) {
      // this.fetchPermisionByRole(value)
    },
    selectMenu({ item, key, selectedKeys }) {
      this.fetchPermisionByRole(key);
    },
    onChange() {

    },
    addNewGroup() {},
    fetchAllRole() {
      AuthAPI.getAllRole().then(res => {
        this.Roles = res.data;
      });
    },
    fetchAllPermision() {
      AuthAPI.getAllPermission().then(res => {
        this.Permission = res.data;
        this.nameRoles = this.Permission.map(item => {return {label:item.name, value: item.id} })
        // this.valueRoles = this.Permission.map(item => {return item.id})
      });
    },
    fetchPermisionByRole(id) {
      AuthAPI.getAllPermisionById(id).then(res => {
        this.userPermision = res.data;
        this.valueRoles = this.userPermision.map(item => {return item.permission_id})
      });
    }
  }
};
</script>