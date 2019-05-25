<template>
  <section class="mod-tour">
    <div class="container">
      <h2>Tour mới cập nhật</h2>
      <div class="row tour-r">
        <div v-for="tour in listTour" :key="tour.TourID" class="col-lg-3 col-md-4 col-sm-6 tour--item">
          <div class="tour__wrapper">
            <div
              class="tour__img"
              :style="{backgroundImage: 'url('+ '/images/tour/'+ tour.ImageUrl[0] +')'}"
            >
              <span :class="tour.Discount === 0 ? 'text-white d-none' : 'text-white d-block'">{{tour.Discount}}%</span>
              <a href="#" style="display:block;" :title="tour.TourName">
                <img
                  class="lazy"
                  src="images/Tour.png"
                  alt="BeachCrest Tour"
                >
              </a>

              <!-- <div class="tour__tag bestseller">Featured</div> -->
            </div>
            <div class="tour--content">
              <p>
                <a-icon type="tags" /> Nha Trang
              </p>
              <h4 class="tour__title">
                <a href="#" :title="tour.TourName">{{tour.TourName | truncate(50)}}</a>
              </h4>
              <div class="tour__review">
                 <a-rate :defaultValue="tour.Rating" allowHalf disabled  />
                <span>{{tour.NumberReview}} Review</span>
              </div>
            </div>
            <div class="tour--footer">
              <div class="tour__duration">
                <i class="icomoon icon-calendar-alt"></i>{{ tour.TourTime }}
              </div>
              <div class="tour__price">
                <span class="price">
                  <span :class="tour.Discount === 0 ? 'd-none' : 'onsale'">{{tour.PriceAdult | toCurrency}}</span>
                  <span>{{ tour.Discount === 0 ? tour.PriceAdult : tour.Onsale | toCurrency}}</span>
                </span>
              </div>
            </div>
          </div>
        </div>
      </div>
      <p  class="text-center"><a-button type="primary">Tải thêm</a-button></p>
    </div>
  </section>
</template>
<script>
export default {
  name: "ListTour",
  props: {
    listTour: {
      type: Array
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
  background: blue;
  padding: 0px 10px;
  color: #fff;
  font-weight: 500;
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
