<template>
<div class="container">
    <div class="card">
      <div class="card-body">
        <!-- title -->
        <div class="d-md-flex align-items-center">
            <div>
              <h4 class="card-title">Danh sách tài khoản</h4>
              <h5 class="card-subtitle">Trang lưu trữ danh sách tài khoản</h5>
              </div>
              <div class="ml-auto">
                <button class="btn btn-primary" @click="newModal" data-toggle="modal" data-target="#addNewUser">Add new <i class="fa fa-user-plus"></i></button>
              </div>
            </div>
            <!-- title -->
        </div>
        <div class="table-responsive table-hover">
          <table class="table v-middle">
            <thead>
                <tr class="bg-light">
                  <th class="border-top-0">ID</th>
                  <th class="border-top-0">Name</th>
                  <th class="border-top-0">Email</th>
                  <th class="border-top-0">Status</th>
                  <th class="border-top-0">Role</th>
                  <th class="border-top-0">Create at</th>
                  <th class="border-top-0">Modify</th>
                </tr>
            </thead>
              <tbody>
            <tr v-for="user in dsUser" :key="user.id">
              <td>{{ user.id }}</td>
              <td><img :src="'/images/' + user.photo" class="m-r-10 rounded-circle" alt="Avatar" width="45"/>{{ user.name | upText }}</td>
              <td>{{ user.email }}</td>
              <td><span :class="user.active === 1 ? 'badge badge-success':'badge badge-danger'">{{ user.active === 1 ? 'Kích hoạt' : 'Chưa kích hoạt' }}</span></td>
              <td>{{ user.roleName }}</td>
              <td>{{ user.created_at | myDate }}</td>
              <td>
                <a href="#" title="Settings" data-toggle="tooltip" @click="editModal(user)"><i class="fa fa-edit"></i></a> /
                <a href="#" title="Settings" data-toggle="tooltip" @click="deleteUser(user.id)"><i class="fa fa-trash"></i></a>
              </td>
            </tr>
              </tbody>
            </table>
        </div>
    </div>
  <!-- Modal -->
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
            <input type="file" @change="uploadPhoto" class="form-control-file" id="photoUser">
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
<script src="./User.js">
</script>
