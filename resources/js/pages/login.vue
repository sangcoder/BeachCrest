<template>
  <div id="login" class="login-box">
 <div class="login-logo">
    <img src="/../images/logo-bc.png" alt="Logo BeachCrests">
  </div>
  <!-- /.login-logo -->
  <div class="card">
    <div class="card-body login-card-body">
      <h2 class="login-box-msg">Login to system</h2>
        <div class="input-group mb-3">
          <input type="email" v-model="email" class="form-control" placeholder="Email">
          <div class="input-group-append">
              <span class="fa fa-envelope input-group-text"></span>
          </div>
        </div>
        <div class="input-group mb-3">
          <input type="password" v-model="password" class="form-control" placeholder="Password">
          <div class="input-group-append">
              <span class="fa fa-lock input-group-text"></span>
          </div>
        </div>
        <div class="row">
          <div class="col-12">
            <button @click="Login" class="btn btn-success btn-block">Sign In</button>
          </div>
          <!-- /.col -->
        </div>


      <div class="social-auth-links text-center mb-3">
        <p>- OR -</p>
        <a href="#" class="btn btn-block btn-primary">
          <i class="fa fa-facebook mr-2"></i> Sign in using Facebook
        </a>
        <a href="#" class="btn btn-block btn-danger">
          <i class="fa fa-google-plus mr-2"></i> Sign in using Google+
        </a>
      </div>
      <!-- /.social-auth-links -->

      <p class="mb-1">
        <a href="#">I forgot my password</a>
      </p>
      <p class="mb-0">
        <a href="register.html" class="text-center">Register a new membership</a>
      </p>
    </div>
    <!-- /.login-card-body -->
  </div>
  </div>
</template>

<script src="./login.js"></script>
<style scoped>
.input-group-append span {
  display: flex;
}
.login-box {
  width: 350px;
  margin: 7% auto 0;
}
.login-logo {
  display: flex;
  justify-content: center;
}
.form-control {
  border-right: none;
}
.input-group-text {
  color: #777;
  background: transparent;
}
.login-box-msg {
  margin-bottom: 35px;
  position: relative;
  color: #5191fa;
}
.login-box-msg::after {
  content: "";  
  position: absolute;
  width: 80px;
  bottom: -15px;
  background: #88b0f3;
  height: 2px;
  left: 0;
}
</style>
