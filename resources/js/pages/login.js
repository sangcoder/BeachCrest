export default {
  data () {
    return {
      email: '',
      password: '',
      loading: false,
      text: 'Đăng nhập'
    }
  },
  methods: {
    Login () {
      this.text = 'Đang đăng nhập...'
      this.loading = true
      let payload = {email: this.email, password: this.password}
      var that = this
      that.$store.dispatch('user/login', payload).then(res => {
        if (res.data.success) {
          this.loading = false
          that.$router.push({name: 'Admin'})
          this.$notification['success']({
            message: 'Đăng nhập thành công',
            description: 'Chào mừng bạn đến với hệ thống quản lý tour BeachCrest'
          })
        } else {
          this.loading = false
          this.text = 'Đăng nhập'
          this.$notification['warning']({
            message: 'Đăng nhập thất bại',
            description: res.data.message
          })
        }
      })
      .catch(err => {
        this.loading = false
        this.text = 'Đăng nhập'
        console.log(err)
        this.$notification['warning']({
          message: 'Kết nối đến server thất bại'
        })
      })
    },
    emitEmptyEmail () {
      this.$refs.emailInput.focus()
      this.email = ''
    },
    emitEmptyPassword () {
      this.$refs.passwordInput.focus()
      this.password = ''
    }
  }
}
