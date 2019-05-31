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
            <a-icon v-if="name" slot="suffix" type="close-circle" />
          </a-input>
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
            v-if="$v.email.$invalid && validation.errors && validation.errors.email"
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
            v-model="repassword"
            :class="$v.repassword.$error ? 'has-feedback has-error' : ''"
          >
            <a-icon slot="prefix" type="lock"/>
            <a-icon v-if="repassword" slot="suffix" type="close-circle" />
          </a-input>
          <div
            class="invalid-feedback d-block"
            v-if="$v.repassword.$invalid && validation.errors && validation.errors.repassword"
          >{{ validation.errors.repassword[0] }}</div>
        </div>
        <div class="row">
          <div class="col-12">
            <a-button type="primary" :loading="loading" @click="Register()" block>{{ text }}</a-button>
          </div>
          <!-- /.col -->
        </div>

        <div class="social-auth-links text-center mb-3">
          <p>- OR -</p>
          <a href="#" class="btn btn-block btn-primary">
            <i class="fa fa-facebook mr-2"></i> Đăng nhập nhanh bằng Facebook
          </a>
          <a href="#" class="btn btn-block btn-danger">
            <i class="fa fa-google-plus mr-2"></i> Đăng nhập nhanh bằng  Google+
          </a>
        </div>
        <!-- /.social-auth-links -->
        <p class="mb-0">
          <a href="javascript:;" @click="$router.push({name: 'Login'})" class="text-center">Đăng nhập tại đây</a>
        </p>
      </div>
      <!-- /.login-card-body -->
    </div>
  </div>
</template>
<script>
import { required, email } from "vuelidate/lib/validators";
export default {
  data() {
    return {
      name: "",
      email: "",
      password: "",
      repassword: "",
      loading: false,
      text: "Đăng kí tài khoản",
      validation: {
        message: "",
        errors: {}
      }
    };
  },
  validations() {
    return {
      name: {required, email},
      email: { required, email },
      password: { required },
      repassword: {required}
    };
  },
  methods: {
    Register () {
      this.$v.$touch()
    },
    emitEmptyEmail() {
      this.$refs.emailInput.focus();
      this.email = "";
    },
    emitEmptyPassword() {
      this.$refs.passwordInput.focus();
      this.password = "";
    }
  }
};
</script>
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
