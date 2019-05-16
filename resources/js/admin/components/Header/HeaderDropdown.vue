<template>
 <a-popover
    title="Tài khoản"
    trigger="click"
    v-model="visible"
    placement="bottomRight"
  >
    <template slot="content">
       <div><a @click="profile"><a-icon type="setting" /> Thông tin tài khoản</a></div> 
        <a-divider dashed />
        <div> <a @click="logout()"><a-icon type="poweroff" /> Đăng xuất</a></div>
    </template>
    <a-badge dot status="success"><a-avatar icon="user" /></a-badge>
  </a-popover>

</template>
<script>
import AuthAPI from '../../../store/api/auth.js'
export default {
    name: 'HeaderDropdown',
    data: () => {
        return {
            itemsCount: 42,
            user: null,
            visible: false,
        }
    },
    created () {
        this.user = this.$store.get('user/user')
    },
    methods: {
        logout () {
            var vueComponent = this
            AuthAPI.logout()
            .then(response => {
                if (response.data && response.data.success) {
                    // Clear user in store
                    vueComponent.$store.dispatch('user/logout')
                    window.location.href = "/admin/login"
                } else {
                    // TODO: handle error
                    console.log(JSON.stringify(response))
                }
            })
            .catch(function(error) {
                // TODO: handle error
                console.log(JSON.stringify(error))
            })
        },
        profile () {
            this.$router.push({name: 'Admin'})
        }
    },
}

</script>
<style scoped>
.ant-divider-horizontal {
    margin: 14px 0 !important;
}
</style>
