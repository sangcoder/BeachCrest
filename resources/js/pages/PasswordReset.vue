<template>
  <div class="ActiveTokenMail">
    <div v-if="!errors.success" class="card">
      <div class="card-body">
        <h2>{{errors.message}}</h2>
      </div>
    </div>
    <div v-if="data" class="card">
      <div class="card-body">
        <h2>Đổi mật khẩu</h2>
        <b-form-group>
          <a-input
            size="large"
            type="primary"
            v-model="form.email"
            placeholder="Nhập địa chỉ email"
            disabled
          />
        </b-form-group>
        <b-form-group>
          <a-input
            size="large"
            type="password"
            placeholder="Nhập mật khẩu"
            v-model="form.password"
          />
        </b-form-group>
        <b-form-group>
          <a-input
            size="large"
            type="password"
            placeholder="Nhập lại mật khẩu"
            v-model="form.password_confirm"
          />
        </b-form-group>
        <b-form-group>
          <a-button type="primary" @click="Resetpassword">Đổi mật khẩu</a-button>
        </b-form-group>
      </div>
    </div>
    <loading :loading="isloading"/>
  </div>
</template>
<script>
import Axios from "axios";
import { APP_CONFIG } from "../config";
import Loading from "../frontend/components/Loading";

export default {
  components: {
    Loading
  },
  created() {
    this.checkToken(this.$route.params.token);
  },
  data() {
    return {
      data: null,
      isloading: false,
      form: {
        email: "",
        password: "",
        password_confirm: ""
      },
      errors: {}
    };
  },
  methods: {
    checkToken(token) {
      this.isloading = true;
      Axios.get(APP_CONFIG.API_URL + "/auth/password/token/find/" + token)
        .then(res => {
          this.data = res.data.data;
          this.form.email = res.data.data.email;
          this.isloading = false;
        })
        .catch(err => {
          if (err.response && err.response.data) {
            this.errors = err.response.data;
            this.isloading = false;
          }
        });
    },
    Resetpassword() {
      let payload = {
        email: this.form.email,
        password: this.form.password,
        password_confirmation: this.form.password_confirm,
        token: this.data.token
      };
      this.isloading = true;
      Axios.post(APP_CONFIG.API_URL + "/auth/password/reset", payload)
        .then(res => {
          this.isloading = false;
          this.$notification["success"]({
            message: "Đổi mật khẩu thành công",
            description: "Hãy đăng nhập bằng mật khẩu mới của bạn"
          });
        })
        .catch(err => {
          this.isloading = false;
          this.$notification["warning"]({
            message: "Thất bại",
            description: "Đổi mật khẩu thất bại"
          });
        });
    }
  }
};
</script>
<style scoped>
.ActiveTokenMail {
  width: 650px;
  margin: 0 auto;
}
</style>
