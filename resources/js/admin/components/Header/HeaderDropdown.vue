<template>
  <div class="menu-pop">
    <a-popover title="Tài khoản" trigger="click" v-model="visible" placement="bottomRight">
      <template slot="content" >
        <a-menu>
          <a-menu-item key="1" @click="profile">
            <a-icon type="user" />Thông tin tài khoản
          </a-menu-item>
          <a-menu-item key="2" @click="logout()">
            <a-icon type="logout"/>Đăng xuất
          </a-menu-item>
        </a-menu>
      </template>
      <a-badge dot status="success">
        <a-avatar icon="user" :src="'/images/' + user.photo"/>
      </a-badge>
    </a-popover>
  </div>
</template>
<script>
import AuthAPI from "../../../store/api/auth.js";
export default {
  name: "HeaderDropdown",
  data: () => {
    return {
      itemsCount: 42,
      user: null,
      visible: false
    };
  },
  created() {
    this.user = this.$store.get("user/user");
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
