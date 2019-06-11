<template>
  <div class="tour__wrapper">
    <skeleton-box v-if="loading" width="100%" height="200px" />
    <slot v-else name="tour_image"/>

    <div class="tour--content">
      <p>
        <skeleton-box v-if="loading" :max-width="20" :min-height="60"/>
        <slot v-else name="tag"/>
      </p>
      <h4 class="tour__title">
        <skeleton-box v-if="loading" :min-width="80" :min-height="60"/>
        <slot v-else name="heading"/>
      </h4>
      <div class="tour__review">
        <skeleton-box v-if="loading" width="80px" :min-height="50"/>
        <slot v-else name="rating"/>
        <skeleton-box v-if="loading" width="60px" :min-height="50"/>
        <slot v-else name="review"/>
      </div>
    </div>
    <div class="tour--footer">
      <slot name="footer"/>
      <skeleton-box v-if="loading" width="80px" :min-height="50"/>
      <slot v-else name="duration"/>
      <skeleton-box v-if="loading" width="90px" :min-height="90"/>
      <slot v-else name="price"/>
    </div>
  </div>
</template>
<script>
import SkeletonBox from "../../../components/Effects/SkeletonBox";
export default {
  name: "ListTour",
  components: {
    SkeletonBox
  },
  props: {
    loading: {
      default: false,
      type: Boolean
    }
  }
};
</script>
<style scoped>
.mod-tour {
  background: #f8f8f8;
  padding: 12px 0;
}
.tour__wrapper {
  border: 1px solid #dfdfdf;
  border-radius: 3px;
  overflow: hidden;
  height: 100%;
  padding-bottom: 15px;
  background-color: #fff;
}
.tour__title a {
  font-size: 17px;
}
.tour--item {
  margin-bottom: 20px;
}
.tour--footer,
.tour--content {
  padding: 0 15px;
}
.tour--content p {
  margin-bottom: 10px;
}
.tour__img {
  position: relative;
  background-size: cover;
  transition: all 220ms ease-in;
}
.tour__img span {
  position: absolute;
  top: -13px;
  right: -30px;
  z-index: 1;
  width: 75px;
  height: 45px;
  background: orange;
  transform: rotate(45deg);
  line-height: 67px;
  text-align: center;
}
.tour__img img {
  position: relative;
  z-index: -1;
  width: 100%;
  height: 100%;
}
.tour__review,
.tour--footer {
  display: flex;
  justify-content: space-between;
}

.tour__tag {
  position: absolute;
  top: 10px;
  z-index: 1;
  border-radius: 0 3px 3px 0;
  padding: 0px 10px;
  color: #fff;
  font-weight: 500;
}
.tour__tag.green{
  background: #27ae60;
}
.tour__tag.blue{
  background: #e74c3c;
}
.tour__review {
  margin: 12px 0;
}
.tour__price .onsale {
  position: absolute;
  top: -25px;
  right: 0;
  text-decoration: line-through;
  font-size: 14px;
  color: orange;
}

.tour__price .price {
  position: relative;
}
.tour__price .price span:not(.onsale) {
  font-size: 1.25rem;
  font-weight: 500;
}
.tour__duration {
  padding-top: 2px;
}
</style>
<style>
.ant-rate {
  font-size: 16px;
}
</style>
