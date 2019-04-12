<template>
    <div class="container">
      <div class="row pt-5">
        <div class="col-md-12">
          <div class="card">
            <div class="card-header">
              <h3 class="card-title">Customer Managament</h3>
              <div class="card-tools">
                <button class="btn btn-primary" data-toggle="modal" data-target="#addNewUser">Add new <i class="fas fa-user-plus"></i></button>
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
                  <th>Modify</th>
                </tr>
                <tr>
                  <td>183</td>
                  <td>John Doe</td>
                  <td>johndoe@test.com</td>
                  <td><span class="tag tag-success">Active</span></td>
                  <td>
                    <a href="#"><i class="fa fa-edit"></i></a> /
                    <a href="#"><i class="fa fa-trash"></i></a>
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
            <h5 class="modal-title" id="exampleModalLabel">Add new user</h5>
            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
              <span aria-hidden="true">&times;</span>
            </button>
          </div>
          <form @submit.prevent="createUser">
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
            <button type="submit" class="btn btn-primary">Create</button>
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
          form : new Form({
            name : '',
            email : '',
            password: '',
            photo : '',
            bio : ''
          })
        }
      },
      methods: {
        createUser() {
          this.form.post('api/user')
        }
      },
      mounted() {
          console.log('Component mounted.')
      }
    }
</script>
