
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
    updateUser (id) {
      this.$Progress.start()
      this.form.put('api/user/' + this.form.id)
      .then(() => {
        // sucess
        $('#addNewUser').modal('hide')
        Swal.fire(
          'Cập nhật thành công',
          'Thông tin đã được cập nhật',
          'sucess'
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
      this.form.post('api/user')
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
      this.Swal.fire({
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
            this.Swal.fire(
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

 