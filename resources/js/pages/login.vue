<template>
  <div id="login" class="login-box">
    <div class="login-logo">
      <img src="/../images/logo-bc.png" alt="Logo BeachCrests">
    </div>
    <!-- /.login-logo -->
    <div class="card">
      <div class="card-body login-card-body">
        <h2 class="login-box-msg">Đăng nhập vào hệ thống</h2>
        <div class="input-group mb-3">
          <a-input
            placeholder="Enter your email"
            v-model="email"
            ref="emailInput"
            :class="$v.email.$error ? 'has-feedback has-error' : ''"
          >
            <a-icon slot="prefix" type="user"/>
            <a-icon v-if="email" slot="suffix" type="close-circle" @click="emitEmptyEmail"/>
          </a-input>
          <div
            class="invalid-feedback d-block"
            v-if="$v.email.$invalid && validation.errors && validation.errors.email"
          >{{ validation.errors.email[0] }}</div>
        </div>
        <div class="input-group mb-3">
          <a-input
            placeholder="Enter your password"
            type="password"
            v-model="password"
            @keyup.enter="Login"
            ref="passwordInput"
             :class="$v.password.$error ? 'has-feedback has-error' : ''"
          >
            <a-icon slot="prefix" type="lock"/>
            <a-icon v-if="password" slot="suffix" type="close-circle" @click="emitEmptyPassword"/>
          </a-input>
          <div
            class="invalid-feedback d-block"
            v-if="$v.password.$invalid && validation.errors && validation.errors.password"
          >{{ validation.errors.password[0] }}</div>
        </div>
        <div class="row">
          <div class="col-12">
            <a-button type="primary" :loading="loading"  @click="Login" block>{{ text }}</a-button>
          </div>
          <!-- /.col -->
        </div>

        <div class="social-auth-links text-center mb-3">
          <p>- OR -</p>
          <button class="btn btn-block btn-primary" @click="goTo('/redirect/facebook')">
            <a-icon type="facebook" class="mr-2" /> Đăng nhập nhanh bằng Facebook
          </button>
          <!-- <button href="#" class="btn btn-block btn-danger">
            <a-icon type="google" /> Đăng nhập nhanh bằng Google
          </button> -->
        </div>
        <!-- /.social-auth-links -->

        <p class="mb-1">
          <a href="#">Quên mật khẩu?</a>
        </p>
        <p class="mb-0">
          <a href="javascript:;" @click="$router.push({name: 'Register'})" class="text-center">Đăng kí mới tài khoản tại đây</a>
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
