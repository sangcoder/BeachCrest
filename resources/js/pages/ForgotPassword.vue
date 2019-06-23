<template>
  <div class="forgot-password">
    <div class="card">
      <div class="card-body">
        <h2>Quên mật khẩu tài khoản</h2>
        <b-row>
          <b-col md="12">
            <b-form-group label="Địa chỉ email">
              <a-input
                placeholder="Nhập địa chỉ"
                size="large"
                v-model="email"
                @keyup.enter="sendForgot()"
              />
              <a-button
                type="primary"
                @click="sendForgot"
                size="large"
                style="margin-top: 20px;"
              >Lấy liên kết</a-button>
            </b-form-group>
          </b-col>
        </b-row>
        <a-alert
          v-if="success === 1"
          message="Thành công"
          :description="`Chúng tôi đã gửi một liên kết đến địa chỉ ${email}. Vui lòng đăng nhập Email để đổi mật khẩu tài khoản của bạn cảm ơn`"
          type="success"
          showIcon
        />
        <a-alert
          v-if="success === 2"
          message="Thất bại"
          description="Địa chỉ email không phù hợp với bất kì tài khoản chúng tôi quản lý. Vui lòng xem lại địa chỉ email. Hoặc liên hệ với quản trị viên để biết thông tin"
          type="error"
          showIcon
        />
      </div>
    </div>
    <loading :loading="isloading"/>
  </div>
</template>
<script>
import Axios from "axios";
import Loading from "../frontend/components/Loading";
import { APP_CONFIG } from "../config";
export default {
  components: {
    Loading
  },
  data() {
    return {
      email: "",
      success: 0,
      isloading: false
    };
  },
  methods: {
    sendForgot(e) {
      e.preventDefault();
      this.isloading = true;
      Axios.post(APP_CONFIG.API_URL + "/auth/password/token/create", {
        email: this.email
      })
        .then(res => {
          this.isloading = false;
          this.success = 1;

        })
        .catch(err => {
          this.isloading = false;
          this.success = 2;

        });
    }
  }
};
</script>
<style lang="css" scoped>
.forgot-password {
  width: 650px;
  margin: 0 auto;
}
</style>