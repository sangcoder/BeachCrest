<template>
  <div>
    <a-card style="margin-top: 24px" :bordered="false" title="Danh sách booking">
      <div slot="extra">
        <a-radio-group>
          <a-radio-button>Tất cả</a-radio-button>
          <a-radio-button>Đã xử lý</a-radio-button>
          <a-radio-button>Chưa xử lý</a-radio-button>
        </a-radio-group>
        <a-input-search style="margin-left: 16px; width: 272px;"/>
      </div>
      <a-list
        size="large"
        :pagination="{showSizeChanger: true, showQuickJumper: true, pageSize: 5, total: 50}"
      >
        <a-list-item :key="index" v-for="(item, index) in data">
          <a-list-item-meta :description="item.description">
            <a-avatar slot="avatar" size="large" shape="square" :src="item.avatar"/>
            <a slot="title">{{ item.title }}</a>
          </a-list-item-meta>
          <div slot="actions">
            <a>Edit</a>
          </div>
          <div slot="actions">
            <a >Delete</a>
          </div>
          <div class="list-content">
            <div class="list-content-item">
              <span>Người duyệt</span>
              <p>{{ item.owner }}</p>
            </div>
            <div class="list-content-item">
              <span>Ngày Booking</span>
              <p>{{ item.startAt }}</p>
            </div>
            <div class="list-content-item">
              <span>Trạng thái</span>
              <p>Chưa duyệt</p>
            </div>
          </div>
        </a-list-item>
      </a-list>
    </a-card>
  </div>
</template>

<script>
const data = [];
data.push({
  title: "Tour du dịch thăm quan Nha Trang",
  avatar: "https://wiki-travel.com.vn/Uploads/picture/Viet_Dung-184602034655-nha-trang.jpg",
  description: "Tour 1 ngày",
  owner: "Sang Võ",
  startAt: "2018-07-26 22:44",
  progress: {
    value: 90
  }
});
data.push({
  title: "Tour du dịch thăm quan Nha Trang",
  avatar: "https://wiki-travel.com.vn/Uploads/picture/Viet_Dung-184602034655-nha-trang.jpg",
  description: "Tour 1 ngày",
  owner: "Sang Võ",
  startAt: "2018-07-26 22:44",
  progress: {
    value: 90
  }
});
data.push({
  title: "Tour du dịch thăm quan Nha Trang",
  avatar: "https://wiki-travel.com.vn/Uploads/picture/Viet_Dung-184602034655-nha-trang.jpg",
  description: "Tour 1 ngày",
  owner: "Sang Võ",
  startAt: "2018-07-26 22:44",
  progress: {
    value: 90
  }
});
data.push({
  title: "Tour du dịch thăm quan Nha Trang",
  avatar: "https://wiki-travel.com.vn/Uploads/picture/Viet_Dung-184602034655-nha-trang.jpg",
  description: "Tour 1 ngày",
  owner: "Sang Võ",
  startAt: "2018-07-26 22:44",
  progress: {
    value: 90
  }
});

export default {
  name: "StandardList",
  data() {
    return {
      data
    };
  }
};
</script>

<style lang="css" scoped>
.ant-badge-count {
  top: -20px !important;
}
.ant-avatar-lg {
  width: 48px;
  height: 48px;
  line-height: 48px;
}
.list-content-item {
  color: rgba(0, 0, 0, 0.45);
  display: inline-block;
  vertical-align: middle;
  font-size: 14px;
  margin-left: 40px;
}
.list-content-item span {
  line-height: 20px;
}
.list-content-item p {
  margin-top: 4px;
  margin-bottom: 0;
  line-height: 22px;
}
</style>