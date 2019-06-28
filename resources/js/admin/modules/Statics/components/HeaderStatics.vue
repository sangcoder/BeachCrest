<template>
  <div class="header-static">
    <div>
      <b-row>
        <b-col>
          <div class="card">
            <div class="card-body">
              <h2>Thống kê doanh thu</h2>
              <b-form-group>
                <a-month-picker size="large" v-model="form.statsic" placeholder="Chọn tháng"/>
                <a-button type="primary" size="large">Thống kê</a-button>
              </b-form-group>
            </div>
          </div>
        </b-col>
        <b-col>
          <div class="card">
            <div class="card-body">
              <h2>Thông tin</h2>
            </div>
          </div>
        </b-col>
      </b-row>
    </div>
  </div>
</template>
<script>
import moment from "moment";
export default {
  name: "HeaderStatics",
  data() {
    return {
      form: {
        statsic: moment()
      }
    };
  },
  methods: {
    moment
  }
};
</script>
<style scoped>
</style>
