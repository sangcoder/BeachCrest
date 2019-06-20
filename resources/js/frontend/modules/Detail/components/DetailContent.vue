<template>
  <div class="content-tour border-box-content">
    <skeleton-box v-if="loading" width="100%" height="350px"/>
    <a-carousel v-else arrows dotsClass="slick-dots slick-thumb" autoplay>
      <a slot="customPaging" slot-scope="props">
        <img :src="getImgUrl(props.i)">
      </a>
      <div v-for="(item, index) in ImageUrl" :key="index">
        <img :src="baseUrl + item">
      </div>
    </a-carousel>
    <template v-if="loading">
      <skeleton-box width="80%" height="60px"/>
      <br>
      <skeleton-box width="90%" height="45px"/>
      <br>
      <skeleton-box width="70%" height="45px"/>
    </template>
    <div v-else class="lichTrinh">
      <h3>Lịch trình</h3>
      <a-timeline v-if="Schedules.length !== 0">
        <a-timeline-item v-for="(item, index) in Schedules" :key="index">
          <span class="startTime">{{item.StartTime | timeHour}}</span> -
          <span class="endTime">{{ item.EndTime | timeHour }}</span>
          :
          {{item.Contents}}
        </a-timeline-item>
      </a-timeline>
      <p v-else>Chưa có lịch trình cho tour này!</p>
    </div>
  </div>
</template>
<script>
import SkeletonBox from "../../../components/Effects/SkeletonBox";

const baseUrl = "/images/tour/";
export default {
  name: "DetaiContent",
  props: {
    ImageUrl: Array,
    Schedules: Array,
    loading: {
      type: Boolean,
      default: false
    }
  },
  components: {
    SkeletonBox
  },
  data() {
    return {
      baseUrl
    };
  },
  methods: {
    getImgUrl(i) {
      return baseUrl + this.ImageUrl[i];
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