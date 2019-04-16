<template>
    <div class="container">
      <div class="row pt-5">
        <div class="col-md-12">
          <div class="card">
            <div class="card-header">
              <h3 class="card-title">Customer Managament</h3>
              <div class="card-tools">
                <button class="btn btn-primary" @click="newModal" data-toggle="modal" data-target="#addNewUser">Add new <i class="fas fa-user-plus"></i></button>
              </div>
            </div>
            <!-- /.card-header -->
            <div class="card-body table-responsive p-0">
              <table class="table table-hover">
                <tbody><tr>
                  <th>ID</th>
                  <th>Name</th>
                  <th>Email</th>
                  <th>Status</th>
                  <th>Create at</th>
                  <th>Modify</th>
                </tr>
                <tr v-for="user in users" :key="user.id">
                  <td>{{ user.id }}</td>
                  <td>{{ user.name | upText }}</td>
                  <td>{{ user.email }}</td>
                  <td><span class="badge badge-success">Active</span></td>
                  <td>{{ user.created_at | myDate }}</td>
                  <td>
                    <a href="#" title="Settings" data-toggle="tooltip" @click="editModal(user)"><i class="fa fa-edit"></i></a> /
                    <a href="#" title="Settings" data-toggle="tooltip" @click="deleteUser(user.id)"><i class="fa fa-trash"></i></a>
                  </td>
                </tr>
              </tbody></table>
            </div>
            <!-- /.card-body -->
          </div>
          <!-- /.card -->
        </div>
      </div>
      <div class="modal fade" id="addNewUser" tabindex="-1" role="dialog" aria-labelledby="addNewLabelUser" aria-hidden="true">
      <div class="modal-dialog" role="document">
        <div class="modal-content">
          <div class="modal-header">
            <h5 class="modal-title" id="exampleModalLabel" v-show="!editmode">Add new user</h5>
            <h5 class="modal-title" id="exampleModalLabel" v-show="editmode">Edit user info</h5>
            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
              <span aria-hidden="true">&times;</span>
            </button>
          </div>
          <form @submit.prevent="editmode ? updateUser() :createUser() ">
          <div class="modal-body">
            <div class="form-group">
              <label>Name</label>
              <input v-model="form.name" type="text" name="name"
              placeholder="Enter Name"
                class="form-control" :class="{ 'is-invalid': form.errors.has('name') }">
              <has-error :form="form" field="name"></has-error>
            </div>
            <div class="form-group">
              <label>Email</label>
              <input v-model="form.email" type="email" name="email"
              placeholder="Enter Email"
                class="form-control" :class="{ 'is-invalid': form.errors.has('email') }">
              <has-error :form="form" field="email"></has-error>
            </div>
            <div class="form-group">
              <label>Bio</label>
              <textarea v-model="form.bio" type="text" name="bio"
              placeholder="Enter short bio (optional)"
                class="form-control" :class="{ 'is-invalid': form.errors.has('bio') }" rows="3" >
              </textarea>
              <has-error :form="form" field="bio"></has-error>
            </div>
             <div class="form-group">
              <label for="photoUser">Photo</label>
              <input type="file" class="form-control-file" id="photoUser">
            </div>
            <div class="form-group">
              <label>Password</label>
              <input v-model="form.password" type="password" name="password"
              placeholder="Enter your password"
                class="form-control" :class="{ 'is-invalid': form.errors.has('password') }">
              <has-error :form="form" field="password"></has-error>
            </div>
          </div>
          <div class="modal-footer">
            <button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
            <button type="submit" class="btn btn-primary" v-show="!editmode">Create</button>
            <button type="submit" class="btn btn-primary" v-show="editmode">Update</button>
            
          </div>
          </form>
        </div>
      </div>
      </div>
    </div>
</template>

<script>
    export default {
      data () {
        return {
          editmode: false,
          users: [],
          form : new Form({
            id: '',
            name : '',
            email : '',
            password: '',
            photo : '',
            bio : ''
          })
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
        loadUser(){
          axios.get('api/user').then(({data}) => {
            this.users = JSON.parse(JSON.stringify(data.data))
          })

        },
        createUser() {
          this.$Progress.start()
          this.form.post('api/user')
          .then(() => {
          Fire.$emit('afterCreate')   // Event here
          $('#addNewUser').modal('hide')
          Toast.fire({
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
            if(result.value) {
              this.form.delete('api/user/'+ id).then(() => {
              Swal.fire(
                'Deleted!',
                'Your file has been deleted.',
                'success'
              )
              Fire.$emit('afterCreate')
            })
            .catch(() => {
              Swal('Failed!', "There was something wrong.", "warning")
            })
            }
          })
        },
        newModal() {
          this.editmode = false
          this.form.reset()
          $('#addNewUser').modal('show')
        },
        editModal(user) {
          this.editmode = true
          this.form.reset()
          $('#addNewUser').modal('show')
          // Fill data to field
          this.form.fill(user)
        }
        
      },
      mounted() {
        this.loadUser()
          // Call event
          Fire.$on('afterCreate', () => {
            this.loadUser()
          })
      }
    }
</script>
