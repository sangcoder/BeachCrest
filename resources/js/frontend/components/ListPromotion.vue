<template>
  <div class="list-promotion mt-4">
    <div class="box-header">
      <h3 class="box-title">Tour có khuyến mãi</h3>
    </div>
    <div class="box-body">
      <ul class="box-promotion no-padding">
        <li v-for="pro in listPromotion" :key="pro.TourID" class="col-xs-12">
          <div class="item-thumbnail">
            <a  @click="$router.replace({name: 'booking', query: {tour: pro.TourID}})" :title="pro.TourName">
              <img
                class="img-responsive"
                :src="'/images/tour/' + pro.ImageUrl[0]"
                :alt="pro.TourName"
                :title="pro.TourName"
                style="width: 100px; height: 96px; object-fit: cover;"
              >
            </a>
            <div class="item-thumbnail-content">
              <a href="javascript:;"
                @click="$router.replace({name: 'booking', query: {tour: pro.TourID}})" :title="pro.TourName"
                class="item-name"
              >{{pro.TourName | truncate(40)}}</a>
              <div class="item-price">
                <span class="text-xs">Giá từ:</span>
                <strong class="price">
                  {{pro.PriceAdult | toCurrency}}
                </strong>
              </div>
              <p class="red mg-bt-0">Tour đang có giảm giá đến {{pro.Discount}}%</p>
            </div>
          </div>
        </li>
      </ul>
    </div>
    <div class="text-center col-xs-12 mg-t-10 mg-bt-10">
      <a href="#" class="show_more">Xem thêm...</a>
    </div>
  </div>
</template>
<script>
export default {
  name: "ListPromtion",
  props: {
    listPromotion: Array
  }
};
</script>
<style>
.box-promotion {
  padding: 0;
  margin: 0;
  list-style: none;
}
.item-thumbnail {
  display: flex;
  margin-bottom: 8px;
  background: #fff;
}
.item-thumbnail-content {
  margin-left: 20px;
}
</style>