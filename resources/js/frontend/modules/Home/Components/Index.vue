<template>
  <div class="main-index">
    <SearchTour />
    <ListTour :list-tour="listTour"/>
  </div>
</template>
<script>
import SearchTour from "./SearchTour";
import ListTour from "./ListTour";
export default {
  components: {
    SearchTour,
    ListTour
  },
    data () {
    return {

    }
  },
  mounted() {
    this.$store.dispatch('tour/getListTour')
  },
  computed: {
    listTour () {
      return this.$store.state.tour.listTour
    }
  }
};
</script>