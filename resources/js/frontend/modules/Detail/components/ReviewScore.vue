<template>
  <div class="review-box">
    <b-row>
      <b-col md="5" class="review-box-score">
        <div class="review-score">
          4.0
          <span>/5</span>
        </div>
        <a-rate :defaultValue="4" disabled/>
        <p>Trên 4 nhận xét</p>
      </b-col>
      <b-col md="7">
        <div>
          <span>Tuyệt vời</span>
          <a-progress :percent="70" size="small"/>
         <span>Tốt</span>
         <a-progress :percent="30" size="small"/>
         <span>Bình thường</span>
          <a-progress :percent="50" size="small" status="active"/>
          <span>Tệ</span>
          <a-progress :percent="80" size="small"/>
          <span>Rất tệ</span>
          <a-progress :percent="100" size="small"/>
        </div>
      </b-col>
    </b-row>
  </div>
</template>
<script>
export default {
  name: "ReviewScore"
};
</script>
<style scoped>
.review-box {
  padding: 2rem;
}
.review-box-score {
  display: flex;
  flex-direction: column;
  align-items: center;
  justify-content: center;
  font-size: 1rem;
}
.review-score {
  font-size: 30px;
}
.review-score span {
  font-size: 1rem;
}
</style>
