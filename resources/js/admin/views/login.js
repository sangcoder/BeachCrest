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
          console.log('vo' + res)
          that.$router.push({name: 'admin'})
        }
      })
    }
  }
}