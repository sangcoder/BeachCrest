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
      that.$store.dispatch('user/login', payload).then(res => {
        that.$router.push({name: 'Admin'})
      })
    }
  }
}
