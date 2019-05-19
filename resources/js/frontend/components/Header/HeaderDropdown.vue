<template>
  <div>
    <a-popover v-if="!empty" title="Tài khoản" trigger="click" v-model="visible" placement="bottomRight">
      <template slot="content">
        <div>
          <a @click="resgister">
            <a-icon type="setting"/> Đăng kí
          </a>
        </div>
        <a-divider dashed/>
        <div>
          <a @click="login()">
            <a-icon type="poweroff"/>Đăng nhập
          </a>
        </div>
      </template>
      <a-avatar v-if="!empty" icon="user"/>
      <a-avatar v-else icon="user" :src="'/images/' + user.photo"/>
    </a-popover>
    <a-popover v-else title="Tài khoản" trigger="click" v-model="visible" placement="bottomRight">
      <template slot="content">
        <div>
          <a @click="profile">
            <a-icon type="setting"/>Thông tin tài khoản
          </a>
        </div>
        <a-divider dashed/>
        <div>
          <a @click="logout()">
            <a-icon type="poweroff"/>Đăng xuất
          </a>
        </div>
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
    resgister () {

    },
    login () {

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
