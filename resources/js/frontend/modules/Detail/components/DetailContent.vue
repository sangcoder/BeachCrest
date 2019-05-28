<template>
  <div class="content-tour border-box-content" >
    <a-carousel arrows dotsClass="slick-dots slick-thumb" autoplay>
      <a slot="customPaging" slot-scope="props">
        <img :src="getImgUrl(props.i)">
      </a>
      <div v-for="(item, index) in ImageUrl" :key="index">
        <img :src="baseUrl + item">
      </div>
    </a-carousel>
    <div class="lichTrinh">
      <h3>Lịch trình</h3>
      <a-timeline >
        <a-timeline-item v-for="(item, index) in Schedules" :key="index"><span class="startTime">{{item.StartTime | timeHour}}</span> - <span class="endTime">{{ item.EndTime | timeHour }}</span>: 
          {{item.Contents}}
        </a-timeline-item>
      </a-timeline>
    </div>
  </div>
</template>
<script>
const baseUrl =
  "/images/tour/";
export default {
  name: "DetaiContent",
  props: {
    ImageUrl: Array,
    Schedules: Array
  },
  data() {
    return {
      baseUrl
    };
  },
  methods: {
    getImgUrl(i) {
      return baseUrl + this.ImageUrl[i]
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
  filter: grayscale(70%);
}
.ant-carousel >>> .slick-thumb li.slick-active img {
  filter: grayscale(0%);
}
</style>