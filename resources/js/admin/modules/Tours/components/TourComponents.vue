<template>
  <div class="TourManagerment">
    <SearchTour/>
    <div class="card">
      <div class="card-body">
        <!-- title -->
        <div class="d-md-flex align-items-center">
          <div>
            <h4 class="card-title">
              <a-icon type="global"/>Quản lý Tour
            </h4>
            <h5 class="card-subtitle">Danh sách Tour hệ thống</h5>
          </div>
          <div class="ml-auto">
            <a-button type="primary" @click="addTour" icon="plus">Thêm mới Tour</a-button>
            <a-button
              type="danger"
              icon="delete"
              @click="deleteMore"
              v-show="deleteMoreButton"
            >Xóa nhiều</a-button>
            <a-button type="default" @click="exportTour()" icon="file-excel">Export</a-button>
          </div>
        </div>
        <!-- title -->
        <a-table
          :columns="columns"
          :rowKey="record => record.TourID"
          :dataSource="data"
          :pagination="pagination"
          :loading="loading"
          :rowSelection="{selectedRowKeys: selectedRowKeys, onChange: onSelectChange, onSelectAll: selectAll}"
          @change="handleTableChange"
        >
          <template slot="priceAdult" slot-scope="priceAdult">{{priceAdult | toCurrency}}</template>
          <template slot="modify" slot-scope="modify">
            <a-button type="dashed" size="small" icon="gift" @click="showModalPromotion"></a-button>
            <a-button type="primary" size="small" icon="edit" @click="updateTour(modify)"></a-button>
            <a-popconfirm
              title="Are you sure delete?"
              @confirm="deleteTour(modify.TourID)"
              @cancel="cancel"
              okText="Yes"
              cancelText="No"
            >
              <span>
                <a-button size="small" type="danger" icon="delete"></a-button>
              </span>
            </a-popconfirm>
          </template>
        </a-table>
      </div>
    </div>
    <a-modal
      :title="editMode ? 'Sửa thông tin Tour' : 'Thêm mới Tour'"
      v-model="visible"
      @ok="submitForm"
      :width="760"
      :maskClosable="false"
      okText="Hoàn tất"
      cancelText="Hủy bỏ"
    >
      <b-form-group label="Tên Tour:">
        <a-input size="large" v-model="formData.TourName" placeholder="Nhập tên tour"/>
      </b-form-group>
      <b-form-group label="Mô tả ngắn">
        <a-input
          size="large"
          v-model="formData.TourDescription"
          placeholder="Nhập mô tả ngắn về Tour"
        />
      </b-form-group>
      <b-row>
        <b-col md="6">
          <b-form-group label="Ngày bắt đầu">
            <a-date-picker
              format="YYYY-MM-DD HH:mm:ss"
              :disabledDate="disabledDate"
              :disabledTime="disabledDateTime"
              :showTime="{ defaultValue: moment('00:00:00', 'HH:mm:ss') }"
              size="large"
              style="width: 100%;"
              v-model="formData.DateDeparture"
            />
          </b-form-group>
        </b-col>
        <b-col md="6">
          <b-form-group label="Ngày kết thúc">
            <a-date-picker
              format="YYYY-MM-DD HH:mm:ss"
              :disabledDate="disabledDate"
              :disabledTime="disabledDateTime"
              :showTime="{ defaultValue: moment('00:00:00', 'HH:mm:ss') }"
              size="large"
              style="width: 100%;"
              v-model="formData.DateBack"
            />
          </b-form-group>
        </b-col>
      </b-row>
      <b-form-group label="Lưu ý">
        <a-textarea
          v-model="formData.Note"
          placeholder="Những chú yếu về Tour"
          :autosize="{ minRows: 2, maxRows: 6 }"
        />
      </b-form-group>
      <b-form-group>
        <div class="clearfix">
          <a-upload
            action="/api/uploadJson"
            listType="picture-card"
            :fileList="formData.ImageUrl"
            @preview="handlePreview"
            @change="handleChange"
            v-model="formData.ImageUrl"
          >
            <div v-if="formData.ImageUrl.length < 3">
              <a-icon type="plus"/>
              <div class="ant-upload-text">Upload</div>
            </div>
          </a-upload>
          <a-modal :visible="previewVisible" :footer="null" @cancel="handleCancel">
            <img alt="example" style="width: 100%" :src="previewImage">
          </a-modal>
        </div>
      </b-form-group>
      <b-row>
        <b-col md="4">
          <b-form-group label="Số người">
            <a-input-number
              size="large"
              :min="1"
              :max="100000"
              :defaultValue="3"
              @change="onChangePerson"
              style="width:100%;"
              v-model="formData.NumberPerson"
            />
          </b-form-group>
        </b-col>
        <b-col md="4">
          <b-form-group label="Giá người lớn (VND)">
            <a-input v-model="formData.PriceAdult" size="large" placeholder="Giá người lớn"/>
          </b-form-group>
        </b-col>
        <b-col md="4">
          <b-form-group label="Giá trẻ nhỏ (VND)">
            <a-input v-model="formData.PriceKid" size="large" placeholder="Giá trẻ nhỏ"/>
          </b-form-group>
        </b-col>
      </b-row>
    </a-modal>
    <a-modal
      title="Khuyến mãi"
      v-model="hidenModal"
      @ok="updatePromotion"
      okText="Áp dụng khuyến mãi"
      cancelText="Hủy bỏ"
    >
      <b-form-group label="Khuyến mãi">
        <a-select
          showSearch
          :value="value"
          placeholder="Tìm khuyến mãi"
          style="width: 100%"
          :defaultActiveFirstOption="false"
          :showArrow="false"
          :filterOption="false"
          @search="handleSearch"
          @change="handleChange"
          :notFoundContent="null"
          v-model="promotionData.PromotionID"
        >
          <a-select-option v-for="d in dataSelectbox" :key="d.value">{{d.text}}</a-select-option>
        </a-select>
      </b-form-group>
      <b-row>
        <b-col md="6">
          <b-form-group label="Phần trăm">
            <a-input-number
              :defaultValue="10"
              :min="0"
              :max="100"
              :formatter="value => `${value}%`"
              :parser="value => value.replace('%', '')"
              style="width: 100%;"
              v-model="promotionData.Discount"
            />
          </b-form-group>
        </b-col>
        <b-col md="6">
          <b-form-group label="Ngày hết hạn">
            <a-date-picker
              format="YYYY-MM-DD HH:mm:ss"
              :disabledDate="disabledDate"
              :disabledTime="disabledDateTime"
              :showTime="{ defaultValue: moment('00:00:00', 'HH:mm:ss') }"
              size="large"
              style="width: 100%;"
              v-model="promotionData.ExpriedDate"
            />
          </b-form-group>
        </b-col>
      </b-row>
    </a-modal>
  </div>
</template>
<script>
import SearchTour from "./SearchTour";
import moment from "moment";
import TourAPI from "../tourServices";
import Axios from "axios";
const columns = [
  {
    title: "ID",
    dataIndex: "TourID",
    sorter: true,
    width: "2%"
  },
  {
    title: "Name",
    dataIndex: "TourName",
    width: "25%"
  },
  {
    title: "Ngày bắt đầu",
    dataIndex: "DateDeparture",
    filters: [
      { text: "Mới nhất", value: "lastest" },
      { text: "Cũ nhất", value: "oldest" }
    ]
  },
  {
    title: "Ngày kết thúc",
    dataIndex: "DateBack",
    scopedSlots: { customRender: "DateBack" }
  },
  {
    title: "SL",
    slots: { title: "customTitle" },
    dataIndex: "NumberPerson",
    sorter: true
  },
  {
    title: "Giá người lớn",
    dataIndex: "PriceAdult",
    scopedSlots: { customRender: "priceAdult" }
  },
  {
    title: "Modify",
    scopedSlots: { customRender: "modify" },
    width: "15%"
  }
];
// Debounce function search ajax
let timeout;
let currentValue;

function fetchPromotion(value, callback) {
  if (timeout) {
    clearTimeout(timeout);
    timeout = null;
  }
  currentValue = value;
  function fakeRequest() {
    console.log("search" + value);
    Axios.get("/api/promotion/search?q=" + value).then(res => {
      if (currentValue === value) {
        const result = res.data.data;
        const data = [];
        result.forEach(r => {
          data.push({
            value: r.PromotionID,
            text: r.Contents
          });
        });
        callback(data);
      }
    });
  }
  timeout = setTimeout(fakeRequest, 300);
}

export default {
  components: {
    SearchTour
  },
  data() {
    return {
      pagination: {
        showQuickJumper: true,
        showSizeChanger: true,
        pageSizeOptions: ["10", "20", "30", "40"],
        showTotal: total => `Total ${total} items`,
        showSizeChange: (current, pageSize) => (this.pageSize = pageSize)
      },
      dataSource: ["Burns Bay Road", "Downing Street", "Wall Street"],
      editMode: false,
      loading: false,
      data: [],
      visible: false,
      columns,
      deleteMoreButton: false,
      selectedRowKeys: [],
      previewVisible: false,
      previewImage: "",
      hidenModal: false,
      fileListUpdate: [],
      dataSelectbox: [],
      value: undefined,
      formData: {
        TourID: "",
        TourName: "",
        TourDescription: "",
        DateDeparture: moment(),
        DateBack: moment(),
        Note: "",
        ImageUrl: [],
        NumberPerson: 0,
        PriceAdult: "",
        PriceKid: "",
        Unit: "VND"
      },
      promotionData: {
        PromotionID: "",
        Discount: 0,
        ExpriedDate: moment()
      }
    };
  },
  created() {
    this.fetchTour();
  },
  methods: {
    moment,
    filterOption(input, option) {
      return (
        option.componentOptions.children[0].text
          .toUpperCase()
          .indexOf(input.toUpperCase()) >= 0
      );
    },
    range(start, end) {
      const result = [];
      for (let i = start; i < end; i++) {
        result.push(i);
      }
      return result;
    },
    fetchTour(page) {
      this.loading = true;
      TourAPI.getListTour(page).then(res => {
        const pagination = { ...this.pagination };
        pagination.total = res.data.data.total;
        this.pagination = pagination;
        this.data = res.data.data.data;
        this.loading = false;
      });
    },
    handleTableChange(pagination, filters, sorter) {
      const pager = { ...this.pagination };
      pager.current = pagination.current;
      this.pagination = pager;
      this.loading = true;
      let params = {
        orderById: sorter.order,
        orderByDeparture: filters.DateDeparture
      };
      TourAPI.getListTour(this.pagination.current, params).then(res => {
        this.data = res.data.data.data;
        this.loading = false;
      });
    },
    onSelectChange(selectedRowKeys) {
      this.selectedRowKeys = selectedRowKeys;
    },
    selectAll(selected, selectedRows, changeRows) {
      if (selected) {
        this.deleteMoreButton = true;
      } else {
        this.deleteMoreButton = false;
      }
    },
    showModalPromotion() {
      this.hidenModal = true;
    },
    addTour() {
      this.visible = true;
      this.editMode = false;

      // Clear field
      this.formData.TourName = "";
      this.formData.TourDescription = "";
      this.formData.DateDeparture = moment();
      this.formData.DateBack = moment();
      this.formData.Note = "";
      this.formData.ImageUrl = [];
      this.formData.NumberPerson = "";
      this.formData.PriceAdult = "";
      this.formData.PriceKid = "";
      this.formData.Price = "";
    },
    deleteTour(id) {
      TourAPI.deleteTour(id).then(res => {
        this.$message.success("Xóa thành công!");
        this.fetchTour(this.pagination.current);
      });
    },
    updateTour(tour) {
      this.visible = true;
      this.editMode = true;
      this.formData.TourID = tour.TourID;
      this.formData.TourName = tour.TourName;
      this.formData.TourDescription = tour.TourDescription;
      this.formData.DateDeparture = moment(tour.DateDeparture);
      this.formData.DateBack = moment(tour.DateBack);
      this.formData.Note = tour.Note;
      // this.fileListUpdate = JSON.parse(tour.ImageUrl);
      this.formData.NumberPerson = tour.NumberPerson;
      this.formData.PriceAdult = tour.PriceAdult;
      this.formData.PriceKid = tour.PriceKid;
      let fl = JSON.parse(tour.ImageUrl);
      this.formData.ImageUrl = [];
      fl.forEach((item, index) => {
        this.formData.ImageUrl.push({
          uid: index,
          name: item,
          status: "done",
          url: "/images/tour/" + item,
          thumbUrl: "/images/tour/" + item
        });
      });
    },
    submitForm() {
      // cui bap
      let payload = {
        TourName: this.formData.TourName,
        TourDescription: this.formData.TourDescription,
        DateDeparture: this.formData.DateDeparture,
        DateBack: this.formData.DateBack,
        Note: this.formData.Note,
        ImageUrl: this.formData.ImageUrl,
        NumberPerson: this.formData.NumberPerson,
        PriceAdult: this.formData.PriceAdult,
        PriceKid: this.formData.PriceKid,
        Unit: this.formData.Unit
      };
      if (!this.editMode) {
        TourAPI.addNewTour(payload).then(res => {
          this.visible = false;
          this.fetchTour(this.pagination.current);
          this.$message.success("Thêm thành công");
        });
      } else {
        TourAPI.updateTour(this.formData.TourID, payload).then(res => {
          this.visible = false;
          this.fetchTour(this.pagination.current);
          this.$message.success("Sửa thành công");
        });
      }
    },
    exportTour() {},
    deleteMore() {},
    updatePromotion() {},
    disabledDate(current) {
      // Can not select days before today and today
      return current && current < moment().endOf("day");
    },
    disabledDateTime() {
      return {
        // disabledHours: () => this.range(0, 24).splice(4, 20),
        // disabledMinutes: () => this.range(30, 60),
        // disabledSeconds: () => [55, 56]
      };
    },
    handleCancel() {
      this.previewVisible = false;
    },
    handlePreview(file) {
      this.previewImage = file.url;
      this.previewVisible = true;
    },
    updatePreview(url) {},
    handleChange({ fileList }) {
      // this.fileList = fileList;
      console.log(fileList);
      this.formData.ImageUrl = fileList;
    },
    // Search khuyến mãi
    handleSearch(value) {
      fetchPromotion(value, data => (this.dataSelectbox = data));
    },
    handleChange(value) {
      this.value = value;
      fetchPromotion(value, data => (this.dataSelectbox = data));
    },
    onChangePerson() {},
    cancel() {}
  }
};
</script>