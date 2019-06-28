import { required, email } from 'vuelidate/lib/validators'
export default {
  data () {
    return {
      email: '',
      password: '',
      loading: false,
      text: 'Đăng nhập',
      validation: {
        message: '',
        errors: {}
      }
    }
  },
  validations () {
    return {
      email: { required, email },
      password: { required }
    }
  },
  methods: {
    Login (e) {
      this.$v.$touch()
      e.preventDefault()
      this.text = 'Đang đăng nhập...'
      this.loading = true
      let payload = { email: this.email, password: this.password }
      var that = this
      that.$store.dispatch('user/login', payload).then(res => {
        if (res.data.success && res.data.data.permistion.some(item => item.role_id === 1)) {
          this.loading = false
          that.$router.push({ name: 'DashboardMember' })
          this.$notification['success']({
            message: 'Đăng nhập thành công',
            description: 'Chào mừng bạn đến với hệ thống quản lý tour BeachCrest'
          })
        } else if (res.data.success && res.data.data.permistion.some(item => item.role_id === 2)) {
          this.loading = false
          that.$router.push({ name: 'Dashboard' })
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
          if (err.response && err.response.data) {
            this.validation.errors = err.response.data.errors
          }
          this.$notification['warning']({
            message: 'Kết nối đến server thất bại'
          })
        })
    },
    goTo (path) {
      window.location.href = path
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
