<template>
    <div class="item-service">
      <div class="row item-service-wrapper" style>
        <div class="col-md-4 thumb-wrapper">
          <div class="thumb bg" v-if="tourInfo.ImageUrl" :style="{backgroundImage: 'url('+ '/images/tour/'+ tourInfo.ImageUrl[0] +')'}">
            <a @click="$router.push({name:'booking', query: {tour: tourInfo.TourID}})">
            <img src="/images/Tour.png" />
            </a>
          </div>
        </div>
        <div class="col-md-5 item-content">
          <div class="item-content-w">
            <p class="service-location"><a-icon type="tags"/> <span  class="tourName" v-for="place in tourInfo.listPlace" :key="place.PlaceID">{{place.PlaceName}}</span></p>
            <h4 class="service-title">
              <a
                @click="$router.push({name:'booking', query: {tour: tourInfo.TourID}})"
              >{{ tourInfo && tourInfo.TourName }}</a>
            </h4>
            <div class="service-review">
              <a-rate v-if="tourInfo.Rating" :defaultValue="tourInfo.Rating.NumberRating" disabled/>
              <span class="review">{{tourInfo && tourInfo.Rating && tourInfo.Rating.NumberReview}} Reviews</span>
            </div>
            <div
              class="service-excerpt"
            >{{tourInfo.TourDescription}}</div>
          </div>
        </div>
        <div class="col-md-3 section-footer">
          <p class="service-duration ">{{tourInfo.TourTime}}</p>
          <p style="color: #cd2c24; font-weight: bold;">Số chổ còn nhận: <span style="font-size: 1.25rem;">{{tourInfo.TourExists}}</span></p>
          <div class="service-price">
            <span class="price">
              <p class="text-lg price-item">Giá người lớn: {{tourInfo.OnsaleAdult | toCurrency}}</p>
              <p class="text-lg price-item">Giá trẻ em: {{tourInfo.OnsaleKid | toCurrency}}</p>
            </span>
          </div>

          <!-- <button
            @click="$router.push({name:'booking', query: {tour: tourInfo.TourID}})"
            class="btn btn-primary btn-view-more"
          >Xem chi tiết Tour</button> -->

          <span v-if="tourInfo" :class="tourInfo.Discount === 0 ? 'd-none' : 'st_sale_class'">11%</span>
        </div>
      </div>
    </div>
</template>
<script>
export default {
  name: 'VerticalTour',
  props: {
    loading: {
      type: Boolean,
      default: false
    },
    tourInfo: Object
  }
}
</script>
<style scoped>
.item-service {
  border: 1px solid #d7dce3;
  border-radius: 4px;
  overflow: hidden;
  background: #fff;

}
.thumb-wrapper {
  padding-left: 14px;
}
.thumb {
  position: relative;
  background-size: cover;
  background-position: center;
}

.item-service .thumb a img {
    position: relative;
    z-index: -1;
    width: 100%;
    height: 100%;
}
.item-content-w {
  height: 100%;
  padding-right: 10px;
  border-right: 1px solid #dfdfdf;
}
.search-result-page.st-tours .style-list .item-service .item-content .service-location {
    position: relative;
    bottom: auto;
    padding-top: 25px;
    margin-bottom: 0px;
}
.service-title {
  margin-bottom: 5px;
  margin-top: 13px;
}
.service-location {
    position: relative;
    bottom: auto;
    padding-top: 25px;
    margin-bottom: 0px;
}
.section-footer {
  position: relative;
  padding-top: 25px;
}
.st_sale_class {
      position: absolute;
    width: 80px;
    height: 48px;
    -webkit-transform: rotate(45deg);
    transform: rotate(45deg);
    right: -19px;
    top: -14px;
    line-height: 65px;
    text-align: center;
    color: #fff;
    font-size: 15px;
    z-index: 8;
    background: orange;
}
.price-item {
  font-size: 1.125rem;
  font-weight: 500;
}
@media (min-width: 576px) and (max-width: 767.98px) { 
  .item-content-w {
    padding: 0 10px;
  }
  .section-footer {
    padding: 0 27px;
  }
  .btn-view-more {
    margin-bottom: 1rem;
  }
 }

</style>
