export default {
  data () {
    return {
      email: '',
      password: ''
    }
  },
  methods: {
    Login () {
      let payload = {email: this.email, password: this.password}
      var that = this
      this.$store.dispatch('user/login', payload).then(res => {
        if (res.data === true) {
          that.$router.push({name: 'Admin'})
        }
      })
    }
  }
}
