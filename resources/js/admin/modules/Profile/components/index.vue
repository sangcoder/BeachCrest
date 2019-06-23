<template>
  <div class="page-profile">
    <a-card
      :bordered="false"
      :bodyStyle="{ padding: '16px 0', height: '100%' }"
      :style="{ height: '100%' }"
    >
      <div class="account-settings-info-main">
        <div class="account-settings-info-left">
          <a-menu :defaultSelectedKeys="['1']" type="inner" @openChange="onOpenChange">
            <a-menu-item key="1">
              <router-link :to="{ name: 'Profile' }">Thông tin cá nhân</router-link>
            </a-menu-item>
            <a-menu-item key="2">
              <router-link :to="{ name: 'historyBooking' }">Lịch sử booking</router-link>
            </a-menu-item>
            <a-menu-item key="3">
              <router-link :to="{ name: 'ChangePassword' }">Đổi mật khẩu</router-link>
            </a-menu-item>
          </a-menu>
        </div>
        <div class="account-settings-info-right">
          <router-view/>
        </div>
      </div>
    </a-card>
  </div>
</template>
<script>
export default {
  name: "Profile",
  data() {
    return {
      defaultSelectedKeys: []
    };
  },
  methods: {
    onOpenChange() {}
  }
};
</script>
<style scoped>
.account-settings-info-main {
  width: 100%;
  display: flex;
  height: 100%;
  overflow: auto;
}
.account-settings-info-main.mobile {
  display: block;
}
.account-settings-info-main.mobile .account-settings-info-left {
  border-right: unset;
  border-bottom: 1px solid #e8e8e8;
  width: 100%;
  height: 50px;
  overflow-x: auto;
  overflow-y: scroll;
}
.account-settings-info-main.mobile .account-settings-info-right {
  padding: 20px 40px;
}
.account-settings-info-main .account-settings-info-left {
  border-right: 1px solid #e8e8e8;
  width: 224px;
}
.account-settings-info-main .account-settings-info-right {
  flex: 1 1;
  padding: 8px 40px;
}
.account-settings-info-main
  .account-settings-info-right
  .account-settings-info-title {
  color: rgba(0, 0, 0, 0.85);
  font-size: 20px;
  font-weight: 500;
  line-height: 28px;
  margin-bottom: 12px;
}
.account-settings-info-main
  .account-settings-info-right
  .account-settings-info-view {
  padding-top: 12px;
}
</style>
