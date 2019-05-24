<template>
  <div class="menu-pop">
    <a-popover
      v-if="!empty"
      title="Tài khoản"
      trigger="click"
      v-model="visible"
      placement="bottomRight"
    >
      <template slot="content" >
        <a-menu>
          <a-menu-item key="1">
            <a-icon type="user" @click="resgister"/>Đăng kí
          </a-menu-item>
          <a-menu-item key="2" @click="login()">
            <a-icon type="login"/>Đăng nhập
          </a-menu-item>
        </a-menu>
      </template>
      <a-avatar v-if="!empty" icon="user"/>
      <a-avatar v-else icon="user" :src="'/images/' + user.photo"/>
    </a-popover>
    <a-popover v-else title="Tài khoản" trigger="click" v-model="visible" placement="bottomRight">
      <template slot="content">
        <a-menu>
          <a-menu-item key="1">
            <a-icon type="user" @click="profile"/>Thông tin tài khoản
          </a-menu-item>
          <a-menu-item key="2" @click="logout()">
            <a-icon type="logout"/>Đăng xuất
          </a-menu-item>
        </a-menu>
      </template>
      <a-avatar v-if="!empty" icon="user"/>
      <a-avatar v-else icon="user" :src="'/images/' + user.photo"/>
    </a-popover>
  </div>
</template>
<script>
import _ from "lodash";
import AuthAPI from "../../../store/api/auth.js";
export default {
  name: "HeaderDropdown",
  data: () => {
    return {
      itemsCount: 42,
      user: null,
      visible: false,
      empty: false
    };
  },
  created() {
    this.user = this.$store.get("user/user");
  },
  watch: {
    user() {
      if (_.isEmpty(this.user)) {
        this.empty = false;
      } else {
        this.empty = true;
      }
    }
  },
  methods: {
    logout() {
      var vueComponent = this;
      AuthAPI.logout()
        .then(response => {
          if (response.data && response.data.success) {
            // Clear user in store
            vueComponent.$store.dispatch("user/logout");
            window.location.href = "/admin/login";
          } else {
            // TODO: handle error
            console.log(JSON.stringify(response));
          }
        })
        .catch(function(error) {
          // TODO: handle error
          console.log(JSON.stringify(error));
        });
    },
    profile() {
      this.$router.push({ name: "Profile" });
    },
    resgister() {},
    login() {
      this.$router.push({name: 'Login'})
    }
  }
};
</script>
<style scoped>
.ant-divider-horizontal {
  margin: 14px 0 !important;
}
.ant-popover-inner-content div:hover a {
  background: #f8f8f8;
}
.ant-popover-inner-content div a {
  display: block;
  padding: 5px;
}

</style>
<style>
.ant-popover.ant-popover-placement-bottomRight .ant-popover-inner-content {
  padding: 0 !important;
}
.ant-popover.ant-popover-placement-bottomRight .ant-menu-item:hover {
  background-color: #e6f7ff;
}
.menu-pop {
  cursor: pointer;
}
</style>
