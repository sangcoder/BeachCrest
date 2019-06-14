<template>
  <div class="booking">
    <a-card style="margin-top: 24px" :bordered="false" title="Danh sách booking">
      <div slot="extra">
        <a-radio-group defaultValue="all" buttonStyle="solid">
          <a-badge count="109" :numberStyle="{backgroundColor: '#52c41a'} ">
            <a-radio-button value="all">Tất cả</a-radio-button>
          </a-badge>
          <a-badge count="109" :numberStyle="{backgroundColor: '#52c41a'} ">
            <a-radio-button value="inprocess">Đã xử lý</a-radio-button>
          </a-badge>
          <a-badge count="109" :numberStyle="{backgroundColor: '#52c41a'} ">
            <a-radio-button value="nonprocess">Chưa xử lý</a-radio-button>
          </a-badge>
        </a-radio-group>
        <a-input-search style="margin-left: 16px; width: 272px;"/>
      </div>
      <a-list
        size="large"
        :pagination="{showSizeChanger: true, showQuickJumper: true, pageSize: 5, total: 50}"
        :loading="loading"
      >
        <a-list-item :key="index" v-for="(item, index) in data">
          <a-list-item-meta :description="item.byTour.TourTime">
            <a-avatar
              slot="avatar"
              size="large"
              shape="square"
              :src="'/images/tour/' + item.byTour.Image[0]"
            />
            <a slot="title">
              <a-tag color="#87d068">{{ '# '+item.BookingID}}</a-tag>
              {{ item.byTour.TourName | truncate(60)}}
            </a>
          </a-list-item-meta>
          <div slot="actions">
            <a @click="showDetail(item.BookingID)">Chi tiết</a>
          </div>
          <div slot="actions">
            <a>Xóa</a>
          </div>
          <div class="list-content">
            <div class="list-content-item">
              <span>Số người</span>
              <p>{{ item.NumberPerson }}</p>
            </div>
            <div class="list-content-item">
              <span>Ngày Booking</span>
              <p>{{ item.DateBooking }}</p>
            </div>
            <div class="list-content-item">
              <span>Trạng thái</span>
              <p>{{item.State === 0 ? 'Chưa duyệt': 'Đã duyệt'}}</p>
            </div>
            <div class="list-content-item">
              <span>Duyệt bởi</span>
              <p>
                <a-tag color="#87d068">Duyệt</a-tag>
              </p>
            </div>
          </div>
        </a-list-item>
      </a-list>
    </a-card>
    <a-modal title="Thông tin chi tiết Booking" v-model="visible" @ok="DetailBooking" :width="720">
      <h4 class="card-title">Thông tin liên lạc</h4>
      <table class="table table-hover table-striped">
        <tbody>
          <tr>
            <th>ID</th>
            <th>Tên người đại diện</th>
            <th>Địa chỉ</th>
            <th>Email</th>
            <th>Số điện thoại</th>
          </tr>
          <tr>
            <td>{{deleGate.CustomerID}}</td>
            <td>{{deleGate.CustomerName}}</td>
            <td>{{deleGate.Address}}</td>
            <td>{{deleGate.Email}}</td>
            <td>{{deleGate.PhoneNumber}}</td>
          </tr>
        </tbody>
      </table>
      <h4 class="card-title">Danh sách khách tham gia Tour</h4>
      <table class="table table-hover">
        <tbody>
          <tr>
            <th>ID</th>
            <th>Tên khách hàng</th>
            <th>Ngày sinh</th>
            <th>Giới tính</th>
            <th>Loại khách</th>
          </tr>
          <tr v-for="customer in listCustomer" :key="customer.CustomerID">
            <td>{{customer.CustomerID}}</td>
            <td>{{customer.CustomerName}}</td>
            <td>{{customer.Birthday | birthDay}}- {{customer.Birthday | calcAge}}</td>
            <td>{{customer.Gender === 0 ? 'Nữ' : 'Nam'}}</td>
            <td>{{customer.CustomerType === 0 ? 'Người lớn' : 'Trẻ em'}}</td>
          </tr>
        </tbody>
      </table>
      <div class="total-price">
        <p>Tổng tiền</p>
        <p>1.200.000 VNĐ</p>
      </div>
    </a-modal>
  </div>
</template>

<script>
import BookingAPI from "../serviceBookingManga";
export default {
  name: "StandardList",
  data() {
    return {
      data: [],
      loading: false,
      visible: false,
      deleGate: {},
      listCustomer: [],
      formData: {
        BookingID: 0
      }
    };
  },
  created() {
    this.fetchBooking();
  },
  methods: {
    fetchBooking(page) {
      this.loading = true;
      BookingAPI.getListBooking(page).then(res => {
        let tmp = res.data.data;
        tmp.forEach(ele => {
          ele.byTour.Image = JSON.parse(ele.byTour.Image);
        });
        this.data = tmp;
        this.loading = false;
      });
    },
    fetchDelegate(id) {
      BookingAPI.getDelegateBooking(id).then(res => {
        this.deleGate = res.data[0];
      });
    },
    fetchListCustomer(id) {
      BookingAPI.getCustomerBooking(id).then(res => {
        this.listCustomer = res.data;
      });
    },
    showDetail(id) {
      this.visible = true;
      this.formData.BookingID = id;
      this.fetchDelegate(id);
      this.fetchListCustomer(id);
    },
    DetailBooking() {
      this.visible = false;
    }
  }
};
</script>

<style lang="css" scoped>
.booking .ant-badge-count {
  top: -20px !important;
}
.ant-avatar-lg {
  width: 60px;
  height: 60px;
  line-height: 48px;
}
.list-content {
  margin-bottom: 25px;
}
.list-content-item {
  color: rgb(24, 144, 255);
  display: inline-block;
  vertical-align: middle;
  font-size: 14px;
  margin-left: 20px;
}
.list-content-item span {
  line-height: 20px;
}
.list-content-item p {
  margin-top: 4px;
  margin-bottom: 0;
  line-height: 22px;
}
.ant-radio-button-wrapper:first-child {
  border-radius: 0 !important;
}
.total-price {
  display: flex;
  justify-content: space-between;
}
</style>