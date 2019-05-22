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
            <a-button type="primary" icon="plus" @click="addNewGroup">Thêm mới nhóm người dùng</a-button>
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
            <a-select
              defaultValue="Chọn nhóm người dùng"
              style="width: 100%;"
              @change="handleChangeSelect"
            >
              <a-select-option v-for="item in Roles" :key="item.id" :value="item.id">{{item.name}}</a-select-option>
            </a-select>
          </div>
        </div>
      </b-col>
      <b-col md="8">
        <div class="card">
          <div class="card-body">
            <h5 class="text-uppercase mb-3">Danh sách chức năng</h5>
            <a-checkbox-group @change="onChange">
              <a-row>
                <a-col v-for="per in Permission" :key="per.id" :span="12" >
                  <a-checkbox :value="per.id">{{per.name}}</a-checkbox>
                </a-col>
              </a-row>
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
      Permission: []
    };
  },
  created() {
    this.fetchAllRole()
    this.fetchAllPermision()
  },
  computed: {
    filterPermission () {
      
    }
  },
  methods: {
    handleChangeSelect(value) {
      // this.fetchPermisionByRole(value)
    },
    onChange() {},
    addNewGroup() {},
    fetchAllRole() {
      AuthAPI.getAllRole().then(res => {
        this.Roles = res.data
      });
    },
    fetchAllPermision () {
      AuthAPI.getAllPermission().then(res => {
        this.Permission = res.data
      })
    },
    fetchPermisionByRole (id) {
      AuthAPI.getAllPermisionById(id).then(res => {
        console.log('res' + JSON.stringify(res.data))
        this.Permission = res.data
      })
    }
  }
};
</script>