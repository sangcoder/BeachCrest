<template>
  <div class="list-promotion mt-4">
    <div class="box-header">
      <skeleton-box v-if="loading" height="30px" />
      <h3 v-else class="box-title">{{titlePromotion}}</h3>
    </div>
    <div class="box-body">
      <ul class="box-promotion no-padding">
        <template v-if="loading">
          <li v-for="i in 3" :key="i" class="col-xs-12">
            <item-sidebar loading />
          </li>
        </template>
        <template v-else>
          <li v-for="pro in listPromotion" :key="pro.TourID" class="col-xs-12">
          <item-sidebar>
            <template slot="tourImage">
              <a
                @click="$router.replace({name: 'booking', query: {tour: pro.TourID}})"
                :title="pro.TourName"
              >
                <img
                  class="img-responsive"
                  :src="'/images/tour/' + pro.ImageUrl[0]"
                  :alt="pro.TourName"
                  :title="pro.TourName"
                  style="width: 100px; height: 96px; object-fit: cover;"
                >
              </a>
            </template>
            <template slot="TourName">
              <a
                href="javascript:;"
                @click="$router.replace({name: 'booking', query: {tour: pro.TourID}})"
                :title="pro.TourName"
                class="item-name"
              >{{pro.TourName | truncate(40)}}</a>
            </template>
            <template slot="priceTour">
              <div class="item-price">
                <span class="text-xs">Giá từ:</span>
                <strong class="price">{{pro.PriceAdult | toCurrency}}</strong>
              </div>
            </template>
            <template slot="tourDiscount">
              <p class="red mg-bt-0">Tour đang có giảm giá đến {{pro.Discount}}%</p>
            </template>
          </item-sidebar>
        </li>
        </template>
      </ul>
    </div>
    <div class="text-center col-xs-12 mg-t-10 mg-bt-10">
      <a href="#" class="show_more">Xem thêm...</a>
    </div>
  </div>
</template>
<script>
import Skeleton from "./Effects/SkeletonBox";
import ItemSidebar from "./ItemSidebar";
export default {
  name: "ListPromtion",
  components: {
    "skeleton-box": Skeleton,
    ItemSidebar
  },
  props: {
    listPromotion: Array,
    titlePromotion: {
      type: String
    },
    loading: {
      type: Boolean,
      default: false
    }
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