<template>
  <div class="main-index">
    <SearchTour/>
    <ListTour/>
  </div>
</template>
<script>
import SearchTour from "./SearchTour";
import ListTour from "./ListTour";
export default {
  components: {
    SearchTour,
    ListTour
  }
};
</script>