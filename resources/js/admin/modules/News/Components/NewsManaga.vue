<template>
  <div class="new-manager">
    <div class="card">
      <div class="card-body">
        <div class="d-md-flex align-items-center">
          <div>
            <h4 class="card-title">
              <a-icon type="global" class="mr-3"/>Quản lý tin tức
            </h4>
            <h5 class="card-subtitle">Trang lưu trữ tin tức</h5>
          </div>
          <div class="ml-auto">
            <a-button
              type="primary"
              @click="$router.push({name: 'modidfyNews'})"
              icon="plus"
            >Thêm tin tức</a-button>
          </div>
        </div>
      </div>
    </div>
    <div class="card">
      <div class="card-body">
        <div class="d-flex">
          <a-input-search
            placeholder="Nhập tên bài viết"
            size="large"
            style="width: 250px"
            class="mb-3 ml-auto"
            @search="onSearch"
          />
        </div>
        <a-table
          :columns="columns"
          :rowKey="record => record.NewsID"
          :dataSource="listNews"
          :pagination="pagination"
          :loading="loading"
          @change="handleTableChange"
        >
          <template slot="hinhanh" slot-scope="hinhanh">
            <a-avatar
              :size="64"
              shape="square"
              icon="user"
              :src="/^https?:\/\//i.test(hinhanh) ? hinhanh.ImgUrl : hinhanh.ImgUrl"
            />
          </template>
          <template slot="state" slot-scope="state">{{state.State === 1 ? 'Đã đăng' : 'Nháp' }}</template>
          <template slot="person" slot-scope="person">{{person.info.name}}</template>
          <template slot="capnhat" slot-scope="capnhat">{{capnhat | myDate}}</template>
          <template slot="action" slot-scope="action">
            <a-button size="small" type="primary" icon="edit" @click="$router.push({name: 'modidfyNews', query: {type: 'edit', news: action.NewsID}})"></a-button>
            <a-popconfirm
              title="Bạn chắc chắn muốn xóa?"
              @confirm="deleteNews(action.NewsID)"
              okText="Đồng ý"
              cancelText="Hủy"
            >
              <a-button size="small" type="danger" icon="delete"></a-button>
            </a-popconfirm>
          </template>
        </a-table>
      </div>
    </div>
  </div>
</template>
<script>
import NewsAPI from "../newsService";
const columns = [
  {
    title: "ID",
    dataIndex: "NewsID",
    sorter: true
  },
  {
    title: "Hình ảnh",
    scopedSlots: { customRender: "hinhanh" }
  },
  {
    title: "Tiêu đề",
    dataIndex: "Title",
    width: "35%"
  },
  // {
  //   title: "Contents",
  //   dataIndex: "email"
  // },
  {
    title: "Trạng thái",
    filters: [
      { text: "Đã đăng", value: "public" },
      { text: "Nháp", value: "draft" }
    ],
    scopedSlots: { customRender: "state" }
  },
  {
    title: "Người đăng",
    scopedSlots: { customRender: "person" }
  },
  {
    title: "Cập nhật",
    scopedSlots: { customRender: "capnhat" }
  },
  {
    title: "Hành động",
    scopedSlots: { customRender: "action" }
  }
];

export default {
  data() {
    return {
      pagination: {},
      listNews: [],
      loading: false,
      columns
    };
  },
  created() {
    this.fetchData();
  },
  methods: {
    fetchData(page, params = {}) {
      this.loading = true;
      NewsAPI.getListNews(page, params).then(res => {
        const pagination = { ...this.pagination };
        this.listNews = res.data.data;
        pagination.total = res.data.meta.total;
        this.loading = false;
        this.pagination = pagination;
        this.loading = false;
      });
    },
    deleteNews (id) {
      NewsAPI.deleteNews(id).then(res => {
        this.fetchData(this.pagination.current)
        this.$message.success('Xóa thành công!')
      })
    },
    handleTableChange(pagination, filters, sorter) {
      const pager = { ...this.pagination };
      pager.current = pagination.current;
      this.pagination = pager;
      this.fetchData(this.pagination.current);
    },
    onSearch() {}
  }
};
</script>
<style scoped>
</style>
