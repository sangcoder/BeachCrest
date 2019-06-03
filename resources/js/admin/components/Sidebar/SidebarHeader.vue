<template>
  <div class="sidebar-header">
    <div>
      <img
        :src="checkImage ? user.photo :'/images/' + user.photo"
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
  computed: {
    checkImage () {
      let url = this.user.photo
      var pat = /^https?:\/\//i
      if (pat.test(url)) {
        return true
      } else {
        return false
      }
    }
  },
  created() {
    this.user = this.$store.get("user/user");
  }
};
</script>
