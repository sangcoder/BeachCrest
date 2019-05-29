<template>
  <div class="item-thumbnail">
    <skeleton-box v-if="loading" width="100px" height="96px"/>
      <slot v-else name="tourImage" />
    <div class="item-thumbnail-content">
      <skeleton-box v-if="loading" width="210px" :min-height="60"/>
      <slot v-else name="TourName" />
      <skeleton-box v-if="loading" width="210px" :min-height="60"/>
      <slot v-else name="priceTour" />
      <skeleton-box v-if="loading" width="210px" :min-height="60"/>
     <slot v-else name="tourDiscount" />
    </div>
  </div>
</template>
<script>
import Skeleton from './Effects/SkeletonBox'
export default {
  name: 'ItemSidebar',
  components: {
    'skeleton-box': Skeleton
  },
  props: {
    loading: {
      type: Boolean,
      default: false
    }
  }
}
</script>
<style scoped>
.item-thumbnail .list-item-loader {
  margin-bottom: 0 !important;
}
</style>
