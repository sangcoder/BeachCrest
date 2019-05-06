
export default {
  data () {
    return {
      editmode: false,
      form: new Form({
        id: '',
        name: '',
        email: '',
        password: '',
        photo: '',
        bio: ''
      })
    }
  },
  created () {
    this.$store.dispatch('user/getDsUser')
  },
  computed: {
    dsUser () {
      return this.$store.state.user.dsUser
    }
  },
  methods: {
    uploadPhoto (e) {
      console.log('uploading...',e)
      let file = e.target.files[0]
      let reader = new FileReader()
      let that = this
      reader.onloadend = function() {
        // console.log('Result', reader.result)
        that.form.photo = reader.result
      }
      reader.readAsDataURL(file)
    },
    updateUser (id) {
      this.$Progress.start()
      this.form.put('/api/user/' + this.form.id)
      .then(() => {
        // sucess
        $('#addNewUser').modal('hide')
        Swal.fire(
          'Cập nhật thành công',
          'Thông tin đã được cập nhật',
          'success'
        )
        this.$Progress.finish()
        Fire.$emit('afterCreate')
      })
      .catch(() => {
        this.$Progress.fail()
      })
    },
    createUser () {
      this.$Progress.start()
      this.form.post('/api/user')
      .then(() => {
        this.Fire.$emit('afterCreate')   // Event here
      $('#addNewUser').modal('hide')
        this.Toast.fire({
          type: 'success',
          title: 'Signed in successfully'
        })
        this.$Progress.finish()
      })
      .catch(() => {
        this.$Progress.fail()
      }) 
    },
    deleteUser (id) {
      Swal.fire({
        title: 'Are you sure?',
        text: "You won't be able to revert this!",
        type: 'warning',
        showCancelButton: true,
        confirmButtonColor: '#3085d6',
        cancelButtonColor: '#d33',
        confirmButtonText: 'Yes, delete it!'
      }).then((result) => {
        // Request to the server
        if (result.value) {
          this.form.delete('api/user/' + id).then(() => {
            Swal.fire(
            'Deleted!',
            'Your file has been deleted.',
            'success'
          )
            this.Fire.$emit('afterCreate')
          })
        .catch(() => {
          this.Swal('Failed!', 'There was something wrong.', 'warning')
        })
        }
      })
    },
    newModal () {
      this.editmode = false
      this.form.reset()
      $('#addNewUser').modal('show')
    },
    editModal (user) {
      this.editmode = true
      this.form.reset()
      $('#addNewUser').modal('show')
      // Fill data to field
      this.form.fill(user)
    }
  }
}

 