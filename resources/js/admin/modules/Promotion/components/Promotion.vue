<template>
  <div>
 <div class="card">
      <div class="card-body">
        <!-- title -->
        <div class="d-md-flex align-items-center">
            <div>
              <h4 class="card-title"><i class="el-icon-location"></i> Danh sách khuyến mãi</h4>
              <h5 class="card-subtitle">Danh sách thông tin khuyến mãi</h5>
              </div>
              <div class="ml-auto">
                <b-button variant="primary" @click="$router.push({name: 'AddDestiantion'})"><i class="el-icon-plus"></i> Thêm mới</b-button>
              </div>
            </div>
            <!-- title -->
        </div>
        <div class="table-responsive table-hover">
          <table class="table v-middle">
            <thead>
                <tr class="bg-light">
                    <th class="border-top-0">#</th>
                    <th class="border-top-0" style="width: 40%;">Contents</th>
                    <th class="border-top-0">Created at</th>
                    <th class="border-top-0">Updated at</th>
                    <th class="border-top-0">Modify</th>
                </tr>
            </thead>
              <tbody>
                  <tr v-for="promotion in listPromtion" :key="promotion.PromotionID">
                    <td>{{promotion.PromotionID}}</td>
                    <td>{{promotion.Contents | truncate(100) }} </td>
                    <td>{{promotion.created_at}}</td>
                    <td>{{promotion.updated_at}}</td>
                    <td><button @click="goToEdit(place.PlaceID)" class="btn">Edit</button> / <button @click="deletePlace(place.PlaceID)">Delete</button></td>
                  </tr>
              </tbody>
            </table>
            <b-pagination
              v-model="current_page"
              :total-rows="total"
              :per-page="perPage"
            ></b-pagination>
        </div>
  </div>
  </div>
</template>
<script>
export default {
  data() {
    return {
      page: 1,
      current_page: 1,
      total: 0,
      perPage: 0
    }
  },
  mounted() {
    this.$store.dispatch('promotion/getListProMotion', this.page).then ((res) => {
      let data = res.data.data
      this.current_page = data.current_page
      this.total = data.total
      this.perPage = data.per_page
      //  console.log(this.$store)
    })
  },
  watch: {
    current_page() {
       this.$store.dispatch('promotion/getListProMotion', this.current_page)
    }
  },
  computed: {
    listPromtion () {
      return this.$store.state.promotion.listPromtion
    }
  }
}
</script>
<style scoped>

</style>
