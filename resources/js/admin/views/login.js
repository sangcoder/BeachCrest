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
      this.$store.dispatch('user/login', payload).then(res => {
        if (res === true) {
          this.$router.push({name: 'admin'})
        }
      })
    }
  }
}