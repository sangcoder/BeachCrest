<template>
  <div>
    <div>
      <a-input-search placeholder="Nhập tên tour cần tìm kiếm" enterButton/>
    </div>
  
  </div>
</template>
<script>
import VerticalTour from "../../Booking/components/VerticalTour"
import ListTour from '../../Home/Components/ListTour'

export default {
  name: "ListSearch",
  components: {
    VerticalTour,
    ListTour
  }
};
</script>
<style scoped>
</style>
