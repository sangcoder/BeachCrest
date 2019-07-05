<template>
  <div class="booking">
    <a-card style="margin-top: 24px" :bordered="false" title="Danh sách booking">
      <div slot="extra">
        <a-radio-group defaultValue="all" buttonStyle="solid" @change="changeTypeBooking">
          <a-radio-button value="all">Tất cả</a-radio-button>
          <a-badge :count="stats.processing" :numberStyle="{backgroundColor: '#fe3745'} ">
            <a-radio-button value="inprocess">Chưa xử lý</a-radio-button>
          </a-badge>
          <a-badge :count="stats.accepted" :numberStyle="{backgroundColor: '#52c41a'} ">
            <a-radio-button value="nonprocess">Đã xử lý</a-radio-button>
          </a-badge>
        </a-radio-group>
        <a-input-search style="margin-left: 16px; width: 272px;"/>
      </div>
      <a-list size="large" :pagination="pagination" :loading="loading">
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
            <a-popconfirm
              title="Bạn đồng ý xóa booking này?"
              @confirm="deleteBooking(item.BookingID)"
              okText="Đồng ý"
              cancelText="Hủy"
            >
              <a>Xóa</a>
            </a-popconfirm>
          </div>
          <div class="list-content">
            <div class="list-content-item">
              <span>Số người</span>
              <p class="number-person">{{ item.NumberPerson }}</p>
            </div>
            <div class="list-content-item">
              <span>Ngày Booking</span>
              <p>{{ item.DateBooking }}</p>
            </div>
            <div class="list-content-item">
              <span>Trạng thái</span>
              <p
                :class="item.State === 1 ? 'text-red' : 'text-green'"
              >{{item.State === 1 ? 'Chưa Thanh toán': 'Đã thanh toán' }}</p>
            </div>
            <div class="list-content-item">
              <span>Duyệt bởi</span>
              <p v-if="item.approved_by">
                <strong>{{item.approved_by}}</strong>
              </p>
              <p v-else>
                <a-tag color="#87d068" @click="acceptBooking(item.BookingID)">Duyệt</a-tag>
              </p>
            </div>
          </div>
        </a-list-item>
      </a-list>
    </a-card>
    <a-modal title="Thông tin chi tiết Booking" v-model="visible" @ok="DetailBooking" :width="720">
      <h4 class="card-title">Thông tin liên lạc {{deleGate.CustomerID}}</h4>
      <div class="info-contact">
        <b-row>
          <b-col md="6">
            <b-form-group>
              <p>Họ và tên:</p>
              <p class="text-muted">
                <strong>{{deleGate.CustomerName}}</strong>
              </p>
            </b-form-group>
          </b-col>
          <b-col md="6">
            <b-form-group>
              <p>Địa chỉ:</p>
              <p class="text-muted">
                <strong>{{deleGate.Address}}</strong>
              </p>
            </b-form-group>
          </b-col>
          <b-col md="6">
            <b-form-group>
              <p>Email:</p>
              <p class="text-muted">
                <strong>{{deleGate.Email}}</strong>
              </p>
            </b-form-group>
          </b-col>
          <b-col md="6">
            <b-form-group>
              <p>Điện thoại liên hệ:</p>
              <p class="text-muted">
                <strong>{{deleGate.PhoneNumber}}</strong>
              </p>
            </b-form-group>
          </b-col>
        </b-row>
      </div>

      <h4 class="card-title">Danh sách khách tham gia Tour</h4>
      <table class="table table-bordered table-striped">
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
            <td>{{customer.Birthday | birthDay}}- {{customer.Birthday | calcAge}} tuổi</td>
            <td>{{customer.Gender === 0 ? 'Nữ' : 'Nam'}}</td>
            <td>{{customer.CustomerType === 0 ? 'Trẻ em' : 'Người lớn'}}</td>
          </tr>
        </tbody>
      </table>
      <div class="total-price">
        <p>Hình thức thanh toán:</p>
        <p
          class="left"
        >{{DetailPayment.PaymentType === 1 ? 'Thanh toán tiền mặt' : 'Thanh toán Paypal'}}</p>
      </div>
      <div class="total-price">
        <p>Ngày thanh toán:</p>
        <p class="left">{{DetailPayment.PaymentDate | myDate}}</p>
      </div>
      <div class="total-price">
        <p>Tổng tiền</p>
        <p class="left-price">{{DetailPayment.PaymentAmount | toCurrency}}</p>
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
      loading: {
        loading: true,
        tip: "Đang tải"
      },
      visible: false,
      deleGate: {},
      listCustomer: [],
      formData: {
        BookingID: 0
      },
      DetailPayment: {},
      pagination: {
        showSizeChanger: true,
        showQuickJumper: true,
        pageSize: 5,
        current: 1,
        total: 50,
        showTotal: total => `Total ${total} items`,
        onChange: page => {
          this.pagination.current = page;
        }
      },
      stats: {
        processing: 0,
        accepted: 0
      }
    };
  },
  created() {
    this.fetchBooking();
    this.fetchStat();
  },
  watch: {
    "pagination.current"() {
      this.fetchBooking(this.pagination.current);
    }
  },
  methods: {
    fetchBooking(page, params) {
      this.loading = true;
      BookingAPI.getListBooking(page, params).then(res => {
        let tmp = res.data.data;
        tmp.forEach(ele => {
          ele.byTour.Image = JSON.parse(ele.byTour.Image);
        });
        this.data = tmp;
        (this.pagination.total = res.data.meta.total),
          (this.pagination.pageSize = res.data.meta.per_page);
        this.pagination.current = res.data.meta.current_page;
        this.loading = false;
      });
    },
    fetchDelegate(id) {
      BookingAPI.getDelegateBooking(id, { delegate: true }).then(res => {
        this.deleGate = res.data[0];
      });
    },
    fetchListCustomer(id) {
      BookingAPI.getCustomerBooking(id).then(res => {
        this.listCustomer = res.data;
      });
    },
    fetchPaymentDetail(id) {
      BookingAPI.getDelegateBooking(id, { type: "payment" }).then(res => {
        this.DetailPayment = res.data.data;
      });
    },
    fetchStat() {
      BookingAPI.getStat().then(res => {
        (this.stats.processing = res.data.Processing),
          (this.stats.accepted = res.data.Accepted);
      });
    },
    acceptBooking(idBooking) {
      let payload = {
        BookingID: idBooking
      };
      let that = this;
      this.$confirm({
        title: "Xác nhận đã thanh toán?",
        okText: 'Đồng ý',
        cancelText: 'Hủy',
        content:
          "Khi bạn nhấn Đồng ý thì hóa đơn thì đồng nghĩa hóa đơn đã được thanh toán.",
        onOk() {
          BookingAPI.acceptBooking(payload)
            .then(res => {
              if (res.data.success) {
                that.$notification["success"]({
                  message: "Duyệt thành công booking",
                  description: "Cập nhật lại booking thành công!"
                });
                that.fetchStat();
                that.fetchBooking(that.pagination.current);
              } else {
                that.$notification["error"]({
                  message: "Xảy ra lỗi",
                  description: "Xảy ra vấn đề trong lúc duyệt"
                });
              }
            })
            .catch(err => {
              console.log("Opps Error" + err);
            });
        },
        onCancel() {}
      });
    },
    showDetail(id) {
      this.visible = true;
      this.formData.BookingID = id;
      this.fetchDelegate(id);
      this.fetchListCustomer(id);
      this.fetchPaymentDetail(id);
    },
    DetailBooking() {
      this.visible = false;
    },
    changeTypeBooking(e) {
      let params = {
        type: e.target.value
      };
      this.fetchBooking(1, params);
    },
    deleteBooking(id) {
      BookingAPI.deleteBooking(id).then(res => {
        this.$notification["success"]({
          message: "Xóa thành công",
          description: "Bạn đã tour thành công!"
        });
        this.fetchBooking(this.pagination.current);
        this.fetchStat();
      });
    }
  }
};
</script>

<style lang="css" scoped>
.left-price {
  font-weight: 500;
  font-size: 24px;
}
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
.number-person {
  text-align: center;
  font-weight: 500;
}
</style>