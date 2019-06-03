<template>
  <div id="login" class="login-box">
    <div class="login-logo">
      <img src="/../images/logo-bc.png" alt="Logo BeachCrests">
    </div>
    <!-- /.login-logo -->
    <div class="card">
      <div class="card-body login-card-body">
        <h2 class="login-box-msg">Đăng kí tài khoản BeachCrest</h2>
        <div class="input-group mb-3">
          <p>Họ và tên</p>
          <a-input
            placeholder="Họ và tên"
            v-model="name"
            :class="$v.name.$error ? 'has-feedback has-error' : ''"
          >
            <a-icon slot="prefix" type="user"/>
          </a-input>
          <div class="invalid-feedback d-block" v-if="!$v.name.required">Tên là bắt buộc.</div>
            <div class="invalid-feedback d-block" v-if="!$v.name.minLength">Phải có ít nhất {{ $v.password.$params.minLength.min }} kí tự.</div>
          <div
            class="invalid-feedback d-block"
            v-if="$v.name.$invalid && validation.errors && validation.errors.name"
          >{{ validation.errors.name[0] }}</div>
        </div>
        <div class="input-group mb-3">
          <p>Email</p>
          <a-input
            placeholder="Nhập địa chỉ email của bạn"
            v-model="email"
            ref="emailInput"
            :class="$v.email.$error ? 'has-feedback has-error' : ''"
          >
            <a-icon slot="prefix" type="user"/>
            <a-icon v-if="email" slot="suffix" type="close-circle" @click="emitEmptyEmail"/>
          </a-input>
          <div
            class="invalid-feedback d-block"
            v-if="validation.errors && validation.errors.email"
          >{{ validation.errors.email[0] }}</div>
        </div>
        <p>Mật khẩu</p>
        <div class="input-group mb-3">
          <a-input
            placeholder="Nhập mật khẩu"
            type="password"
            v-model="password"
            ref="passwordInput"
            :class="$v.password.$error ? 'has-feedback has-error' : ''"
          >
            <a-icon slot="prefix" type="lock"/>
            <a-icon v-if="password" slot="suffix" type="close-circle" @click="emitEmptyPassword"/>
          </a-input>
          <div class="invalid-feedback d-block" v-if="!$v.password.required">Mật khẩu là bắt buộc.</div>
            <div class="invalid-feedback d-block" v-if="!$v.password.minLength">Mật khẩu phải có ít nhất {{ $v.password.$params.minLength.min }} kí tự.</div>
          <div
            class="invalid-feedback d-block"
            v-if="$v.password.$invalid && validation.errors && validation.errors.password"
          >{{ validation.errors.password[0] }}</div>
        </div>
        <div class="input-group mb-3">
          <p>Nhập lại mật khẩu</p>
          <a-input
            placeholder="Nhập lại mật khẩu"
            type="password"
            v-model="rePassword"
            ref="rePassword"
            :class="$v.rePassword.$error ? 'has-feedback has-error' : ''"
          >
            <a-icon slot="prefix" type="lock"/>
            <a-icon v-if="rePassword" slot="suffix" type="close-circle" click="emitClearPassword"/>
          </a-input>
            <div class="invalid-feedback d-block" v-if="!$v.rePassword.sameAsPassword">Mật khẩu không giống nhau</div>

          <div
            class="invalid-feedback d-block"
            v-if="$v.rePassword.$invalid && validation.errors && validation.errors.rePassword"
          >{{ validation.errors.rePassword[0] }}</div>
        </div>
        <div class="row">
          <div class="col-12">
            <a-button type="primary" :loading="loading" @click="Register()" block>{{ text }}</a-button>
          </div>
          <!-- /.col -->
        </div>

        <div class="social-auth-links text-center my-3">
          <p>
            <button
              class="btn btn-success block"
              @click="$router.push({name: 'Login'})"
            >Đăng nhập tài khoản tại đây
            </button>
          </p>
        </div>
        <!-- /.social-auth-links -->
      </div>
      <!-- /.login-card-body -->
    </div>
  </div>
</template>
<script src="./register.js"></script>
<style scoped>
.input-group-append span {
  display: flex;
}
.login-box {
  width: 550px;
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
