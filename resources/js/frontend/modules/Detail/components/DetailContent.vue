<template>
  <div class="content-tour border-box-content" >
    <a-carousel arrows dotsClass="slick-dots slick-thumb">
      <a slot="customPaging" slot-scope="props">
        <img :src="getImgUrl(props.i)">
      </a>
      <div v-for="item in 4" :key="item">
        <img :src="baseUrl+'abstract0'+item+'.jpg'">
      </div>
    </a-carousel>
    <div class="lichTrinh">
      <h4>Lịch trình</h4>
      <a-timeline>
        <a-timeline-item>21h00: Quý khách tập trung tại văn phòng công ty Quý khách lên xe giường nằm khởi hành đi thành phố Cam Ranh. Quý khách nghỉ đêm trên xe.</a-timeline-item>
        <a-timeline-item>06h00: HDV đón khách tại Cam Ranh, đưa quý khách dùng điểm tâm sáng tại Cam Ranh.Tiếp tục hành trình du lịch xe đưa quý khách đến cảng cá Ba Ngòi, HDV sẽ hướng dẫn khách lên tàu khởi hành từ cảng Ba Ngòi ra đảo Bình Ba. Sau hơn 1 giờ lênh đênh ngắm cảnh đẹp của Vịnh Cam Ranh, nghe thuyết minh về một trong những địa điểm hoàn toàn mới với du khách về Đảo Tôm Hùm. Đến Bình Ba, Quý khách sẽ lưu trú tại nhà dân (homestay) hoặc nhà nghỉ trên đảo. Sau đó HDV sẽ dẫn Quý khách tham quan về cảnh sinh hoạt đời thường của dân đảo, sau đó Đoàn dùng bữa cơm trưa thân mật với ngư dân trên đảo để tìm hiểu thêm về cuộc sống của những người ngư dân biển.</a-timeline-item>
        <a-timeline-item>19h00: Quý khách đến Sân khấu nhạc nước xem chương trình biểu diễn nhạc nước độc đáo nhất Việt Nam tại Vinpearl Land.</a-timeline-item>
        <a-timeline-item>22h00: Quý khách đến Sân khấu nhạc nước xem chương trình biểu diễn nhạc nước độc đáo nhất Việt Nam tại Vinpearl Land.</a-timeline-item>
      </a-timeline>
    </div>
  </div>
</template>
<script>
const baseUrl =
  "https://raw.githubusercontent.com/vueComponent/ant-design-vue/master/components/vc-slick/assets/img/react-slick/";
export default {
  name: "DetaiContent",
  data() {
    return {
      baseUrl
    };
  },
  methods: {
    getImgUrl(i) {
      return `${baseUrl}abstract0${i + 1}.jpg`;
    }
  }
};
</script>
<style scoped>
/* For demo */
.ant-carousel >>> .slick-dots {
  height: auto;
}
.ant-carousel >>> .slick-slide img {
  border: 5px solid #fff;
  display: block;
  margin: auto;
  max-width: 100%;
  width: 100%;
  max-height: 350px;
}
.ant-carousel >>> .slick-thumb li {
  width: 60px;
  height: 45px;
}
.ant-carousel >>> .slick-thumb li img {
  width: 100%;
  height: 100%;
  filter: grayscale(100%);
}
.ant-carousel >>> .slick-thumb li.slick-active img {
  filter: grayscale(0%);
}
</style>