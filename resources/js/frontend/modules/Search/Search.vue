<template>
  <div class="search-form">
    <h2>Tìm kiếm tour</h2>
    <b-row>
      <b-col lg="3">
        <sidebar-search
          @EventReload="FetchLoad"
          @search-filter="SearchFilter"
          :list-place="listPlace"
        />
      </b-col>
      <b-col lg="9">
        <list-search
          @search-name="SearchName"
          :list-tour-search="listSearchTour"
          :total="pagination.total"
          :loading="loading"
        />
      </b-col>
    </b-row>
  </div>
</template>
<script>
import SidebarSearch from "./components/SidebarSearch";
import ListSearch from "./components/ListSearch";
import SearchAPI from "./searchService";
import moment from "moment";
export default {
  components: {
    SidebarSearch,
    ListSearch
  },
  created() {
    this.fetchPlace();
    // console.log('1' + this.$route.query.diemden, this.$route.query.tuNgay, this.$route.query.denNgay)

    if (this.$route.query.diemden) {
      this.queryData.diemden = parseInt(this.$route.query.diemden);
    }
    if (this.$route.query.tuNgay && this.$route.query.denNgay) {
      let dateStart = moment(this.$route.query.tuNgay, "DD-MM-YYYY").format(
        "YYYY-MM-DD"
      );
      let dateEnd = moment(this.$route.query.denNgay, "DD-MM-YYYY").format(
        "YYYY-MM-DD"
      );
      this.queryData.dateDeparture = [dateStart, dateEnd];
    }
    this.fetchListTour(this.queryData);
  },
  data() {
    return {
      listPlace: [],
      listSearchTour: [],
      pagination: {
        current: 1,
        total: 1
      },
      loading: false,
      queryData: {
        dateDeparture: [],
        diemden: -1
      }
    };
  },
  watch: {
    "$route.query.diemden"() {
      if (this.$route.query.diemden) {
        this.queryData.diemden = parseInt(this.$route.query.diemden);
      }
    },
    "$route.query.tuNgay"() {
      this.queryData.dateDeparture[0] = moment(
        this.$route.query.tuNgay,
        "DD-MM-YYYY"
      ).format("YYYY-MM-DD");
    },
    "$route.query.denNgay"() {
      this.queryData.dateDeparture[1] = moment(
        this.$route.query.denNgay,
        "DD-MM-YYYY"
      ).format("YYYY-MM-DD");
    }
  },
  methods: {
    fetchListTour(params) {
      this.loading = true;
      SearchAPI.findTour(params).then(res => {
        this.listSearchTour = res.data.data;
        let tmp = res.data.data;
        tmp.forEach(ele => {
          ele.ImageUrl = JSON.parse(ele.ImageUrl);
        });
        this.listSearchTour = tmp;
        (this.pagination.total = res.data.meta.total), (this.loading = false);
      });
    },
    fetchPlace() {
      SearchAPI.getListPlace().then(res => {
        this.listPlace = res.data.data;
      });
    },
    FetchLoad(payload) {
      let send = {
        dateDeparture: this.queryData.dateDeparture,
        diemden: this.queryData.diemden
      };
      this.fetchListTour(this.queryData);
      // this.fetchListTour()
    },
    SearchFilter(value) {
      // Filter Array
            let send = {
        dateDeparture: this.queryData.dateDeparture,
        diemden: this.queryData.diemden,
        filters: value
      };
      this.fetchListTour(send);
      // switch (value) {
      //   case "small500":
      //     // filter
      //     this.listSearchTour.filter(item => {
      //       return item.OnsaleAdult < 500000;
      //     });
      //     break;
      //   case "500to1000":
      //     this.listSearchTour.filter(item => {
      //       return item.OnsaleAdult > 500000 && item.OnsaleAdult < 1000000;
      //     });
      //     break;
      //   case "1000to2000":
      //     break;
      //   case "2000to5000":
      //     break;
      //   case "big5000":
      //     break;
      //   default:
      //}
      // this.listSearchTour.filter()
    },
    SearchName(value) {
      let params = {
        q: value
      };
      this.fetchListTour(params);
    }
  }
};
</script>
<style scoped>
</style>
<style>
.sidebar-search .ant-checkbox-group-item:not(:last-child) {
  display: block;
  margin-bottom: 1rem;
}
.sidebar-search .ant-collapse-header {
  background: #1890ff;
  color: #fff !important;
}
</style>
