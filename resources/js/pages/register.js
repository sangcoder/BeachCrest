import { required, minLength, sameAs, email } from 'vuelidate/lib/validators'
import AuthAPI from './authService'
export default {
  data () {
    return {
      name: '',
      email: '',
      password: '',
      rePassword: '',
      loading: false,
      text: 'Đăng kí tài khoản',
      validation: {
        message: '',
        errors: {}
      }
    }
  },
  validations () {
    return {
      name: {required, minLength: minLength(4)},
      email: {
        required,
        email
      },
      password: {required, minLength: minLength(6)},
      rePassword: {sameAsPassword: sameAs('password')}
    }
  },
  methods: {
    Register () {
      this.$v.$touch()
      let payload = {
        name: this.name,
        email: this.email,
        password: this.password,
        password_confirmation: this.rePassword
      }
      this.loading = true
      AuthAPI.registerMember(payload).then(res => {
        this.text = 'Đang tiến hành đăng kí...'
        this.loading = false
        this.text = 'Đăng kí'
        this.$notification['success']({
          message: 'Tạo tài khoản thành công',
          description: `Email kích hoạt đã gửi đến tài khoản ${this.email}. Vui lòng kích hoạt để sử dụng dịch vụ!`,
          duration: 10
        })
      }).catch((err) => {
        if (err.response && err.response.data) {
          this.validation.errors = err.response.data.errors
        }
      })
    },
    emitEmptyEmail () {
      this.$refs.emailInput.focus()
      this.email = ''
    },
    emitEmptyPassword () {
      this.$refs.passwordInput.focus()
      this.password = ''
    },
    emitClearPassword () {
      this.$refs.rePassword.focus()
      this.repassword = ''
    }
  }
}
