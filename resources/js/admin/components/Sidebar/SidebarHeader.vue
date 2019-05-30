<template>
  <div class="sidebar-header">
    <div>
      <img
        :src="'/images/' + user.photo"
        style="width: 64px; height: 64px;"
        alt="Avatar"
        class="img-avatar"
      >
      <div>
        <strong>{{ user.name }}</strong>
      </div>
    </div>
  </div>
</template>
<script>
export default {
  name: "SidebarHeader",
  data: () => {
    return {
      user: null
    };
  },
  created() {
    this.user = this.$store.get("user/user");
  }
};
</script>
