<template>
  <div class="destination-list">
    <div class="card">
      <div class="card-body">
        <!-- title -->
        <div class="d-md-flex align-items-center">
            <div>
              <h4 class="card-title"><i class="el-icon-location"></i> Danh sách  Địa điểm</h4>
              <h5 class="card-subtitle">Trang lưu trữ  Địa điểm</h5>
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
                    <th class="border-top-0">Name</th>
                    <th class="border-top-0">Image</th>
                    <th class="border-top-0">Description</th>
                    <th class="border-top-0">Date Create</th>
                    <th class="border-top-0">Modify</th>
                </tr>
            </thead>
              <tbody>
                  <tr v-for="place in listPlace.data" :key="place.PlaceID">
                    <td>{{place.PlaceID }}</td>
                    <td>{{place.PlaceName}}</td>
                    <td><img :src="place.ImgUrl" :alt="place.PlaceName" width="80"></td>
                    <td>{{ place.Description}}</td>
                    <td>{{place.created_at}}</td>
                    <td><a href="javscript:;" @click="goToEdit(place.PlaceID)">Edit</a> / <a href="#">Delete</a></td>
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
      page:1,
      current_page:1,
      total:0,
      perPage:0
      }
    },
    mounted() {
      this.$store.dispatch('place/getListPlace',this.page).then(res => {
        let data = res.data.data
        this.current_page = data.current_page
        this.total = data.total
        this.perPage = data.per_page
      })
    },
    computed: {
      listPlace () {
        return this.$store.state.place.listPlace
      }
    },
    watch: {
      current_page () {
        this.$store.dispatch('place/getListPlace',this.current_page)
      }
    },
    methods: {
      goToEdit(Pid) {
        this.$router.push({name: 'editDestination', params:{id: Pid}})
      }
    }
  }
</script>

<style scoped>

</style>
