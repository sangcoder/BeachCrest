<template>
  <div class="box-booking border-box-content">
    <div class="booking-head">
      <span class="price">1.200.000 đ</span>
      <img src="/images/price.svg">
    </div>
    <a-divider dashed>Thông tin</a-divider>
    <div class="booking-body">
      <b-row>
        <b-col md="6">
          <b-form-group label="Người lớn">
            <a-input-number
              size="large"
              :min="1"
              :max="100000"
              :defaultValue="3"
              style="width: 100%;"
            />
          </b-form-group>
        </b-col>
        <b-col md="6">
          <b-form-group label="Trẻ em < 6">
            <a-input-number
              size="large"
              :min="1"
              :max="100000"
              :defaultValue="3"
              style="width: 100%;"
            />
          </b-form-group>
        </b-col>
      </b-row>
      <b-form-group>
        <a-button size="large" type="primary" block>Đặt ngay</a-button>
      </b-form-group>
    </div>
  </div>
</template>
<script>
export default {
  name: "BoxBooking"
};
</script>
<style scoped>
.booking-head {
  font-size: 2rem;
  text-align: center;
}
.ant-divider-horizontal {
  margin: 16px 0 !important;
}
.booking-head {
  border-radius: 5px;
  position: relative;
}
.booking-head img {
  width: 40px;
  position: absolute;
  right: 0;
}
.price {
    background: #02af8e;
    padding: 0.835rem;
    color: #fff;
}
</style>
