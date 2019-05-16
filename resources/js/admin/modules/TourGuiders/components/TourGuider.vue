<template>
  <div>
    <div class="card">
      <div class="card-body">
        <!-- title -->
        <div class="d-md-flex align-items-center">
          <div>
            <h4 class="card-title">
              <a-icon type="global" /> Hướng dẫn viên
            </h4>
            <h5 class="card-subtitle">Danh sách hướng dẫn viên</h5>
          </div>
          <div class="ml-auto">
            <a-button type="primary" @click="addGuider">Thêm mới hướng dẫn viên</a-button>
          </div>
        </div>
        <!-- title -->
        <a-table
          :columns="columns"
          :rowKey="record => record.GuiderID"
          :dataSource="listGuiders"
          :pagination="pagination"
          :loading="loading"
          :rowSelection="{selectedRowKeys: selectedRowKeys, onChange: onSelectChange}"
          @change="handleTableChange"
        >
          <template slot="avatar" slot-scope="avatar">
            <a-avatar :size="64" icon="user" :src="avatar"/>
          </template>
          <template slot="gender" slot-scope="gender">{{gender === 1 ? 'Nam' : 'Nữ'}}</template>
          <template slot="bday" slot-scope="bday">{{bday | myDate}}</template>
          <template slot="modify" slot-scope="modify">
            <a-button type="primary" icon="edit" @click="updateTourGuider(modify)"></a-button>
            <a-popconfirm
              title="Are you sure delete?"
              @confirm="deleteTourGuider(modify.GuiderID)"
              @cancel="cancel"
              okText="Yes"
              cancelText="No"
            >
              <a-button type="danger" icon="delete"></a-button>
            </a-popconfirm>
          </template>
        </a-table>
        <a-modal
          :title="this.editMode ? 'Sửa hướng dẫn viên' :'Thêm hướng dẫn viên'"
          :maskClosable="false"
          v-model="visible"
          @ok="submitForm"
        >
          <b-form-group label="Họ tên">
            <a-input v-model="formData.GuiderName" placeholder="Nhập tên hướng dẫn viên"/>
          </b-form-group>
          <b-row>
            <b-col>
              <b-form-group label="Ngày sinh">
                <a-date-picker @change="onChange" format="DD-MM-YYYY"/>
              </b-form-group>
            </b-col>
            <b-col>
              <b-form-group label="Giới tính">
                <a-radio-group v-model="formData.Gender" :defaultValue="1">
                  <a-radio :value="1">Nam</a-radio>
                  <a-radio :value="0">Nữ</a-radio>
                </a-radio-group>
              </b-form-group>
            </b-col>
          </b-row>
          <b-form-group label="Địa chỉ">
            <a-input v-model="formData.Address" placeholder="Nhập địa chỉ"/>
          </b-form-group>
          <b-form-group label="Số điện thoại">
            <a-input v-model="formData.PhoneNumner" type="text" placeholder="Nhập số điện thoại"/>
          </b-form-group>
          <b-form-group>
            <a-upload
              name="avatar"
              listType="picture-card"
              class="avatar-uploader"
              :showUploadList="false"
              action="/api/uploadJson"
              :beforeUpload="beforeUpload"
              @change="handleChange"
            >
              <img v-if="formData.ImgUrl" :src="formData.ImgUrl" alt="avatar" width="128">
              <div v-else>
                <a-icon :type="loading ? 'loading' : 'plus'"/>
                <div class="ant-upload-text">Upload</div>
              </div>
            </a-upload>
          </b-form-group>
        </a-modal>
      </div>
    </div>
  </div>
</template>
<script>
import moment from "moment"

function getBase64(img, callback) {
  const reader = new FileReader();
  reader.addEventListener("load", () => callback(reader.result));
  reader.readAsDataURL(img);
}
const columns = [
  {
    title: "ID",
    dataIndex: "GuiderID",
    sorter: true
  },
  {
    title: "Image",
    dataIndex: "ImgUrl",
    scopedSlots: { customRender: "avatar" }
  },
  {
    title: "Name",
    dataIndex: "GuiderName",
    width: "20%"
  },
  {
    title: "Gender",
    dataIndex: "Gender",
    scopedSlots: { customRender: "gender" },
    filters: [
      { text: "Male", value: "1" },
      { text: "Female", value: "0" }
    ],
    width: "10%"
  },
  {
    title: "Birthday",
    dataIndex: "Birthday",
    scopedSlots: { customRender: "bday" }
  },
  {
    title: "Address",
    dataIndex: "Address"
  },
  {
    title: "Modify",
    scopedSlots: { customRender: "modify" }
  }
];
export default {
  data() {
    return {
      pagination: {},
      loading: false,
      visible: false,
      editMode: false,
      columns,
      selectedRowKeys: [],
      formData: {
        GuiderName: "",
        Birthday: "",
        Gender: 1,
        Address: "",
        PhoneNumner: "",
        ImgUrl: "",
        GuiderID: ""
      }
    };
  },
  created() {
    this.loading = true;
    const pl = {
      page: this.pagination.current
    }
    this.$store
      .dispatch("tourguider/getListGuider", pl)
      .then(res => {
        const pagination = { ...this.pagination };
        pagination.total = res.data.data.total;
        pagination.pageSize = res.data.data.per_page
        this.pagination = pagination;
        this.loading = false;
      });
  },
  computed: {
    listGuiders() {
      return this.$store.state.tourguider.listGuiders;
    }
  },
  methods: {
    onSelectChange (selectedRowKeys) {
      console.log('selectedRowKeys changed: ', selectedRowKeys);
      this.selectedRowKeys = selectedRowKeys
    },
    handleTableChange(pagination, filters, sorter) {
      const pager = { ...this.pagination };
      pager.current = pagination.current;
      this.pagination = pager;
      this.loading = true;
      const payload = {
        page: this.pagination.current,
        params: {
          guiderid: sorter.order,
          ...filters
        }
      }
      this.$store
        .dispatch("tourguider/getListGuider", payload)
        .then(res => {
          const pagination = { ...this.pagination };
          pagination.total = res.data.data.total;
          this.pagination = pagination;
          this.loading = false;
        });
    },
    submitForm() {
      // Add
      let payload = {
        GuiderName: this.formData.GuiderName,
        Birthday: this.formData.Birthday,
        Address: this.formData.Address,
        PhoneNumner: this.formData.PhoneNumner,
        ImgUrl: this.formData.ImgUrl,
        Gender: this.formData.Gender
      };
      // Edit
      let payloadUpdate = {
        GuiderID: this.formData.GuiderID,
        GuiderName: this.formData.GuiderName,
        Birthday: this.formData.Birthday,
        Address: this.formData.Address,
        PhoneNumner: this.formData.PhoneNumner,
        ImgUrl: this.formData.ImgUrl,
        Gender: this.formData.Gender
      };
      if (!this.editMode) {
        this.$store.dispatch("tourguider/addGuider", payload).then(res => {
          this.visible = false;
          this.$message.success("Thêm thành công");
        });
      } else {
        this.$store
          .dispatch("tourguider/updateGuider", payloadUpdate)
          .then(res => {
            this.visible = false;
            this.$message.success("Sửa thành công");
          });
      }
    },
    addGuider(e) {
      this.visible = true;
      this.editMode = false;
      // Clear all fill
      this.formData.GuiderName = "";
      this.formData.Birthday = "";
      this.formData.Address = "";
      this.formData.PhoneNumner = "";
      this.formData.ImgUrl = "";
      this.formData.Gender = "";
    },
    updateTourGuider(guider) {
      this.visible = true;
      this.editMode = true;
      this.formData.GuiderID = guider.GuiderID;
      this.formData.GuiderName = guider.GuiderName;
      this.formData.Birthday = moment(guider.Birthday).format("DD-MM-YYYY");
      this.formData.Address = guider.Address;
      this.formData.PhoneNumner = guider.PhoneNumner;
      this.formData.ImgUrl = guider.ImgUrl;
      this.formData.Gender = guider.Gender;
    },
    deleteTourGuider(id) {
      this.$store.dispatch("tourguider/deleteGuider", id).then(res => {
        this.$message.success("Đã xóa thành công");
      });
    },
    onChange(date, dateString) {
      this.formData.Birthday = dateString;
    },
    handleChange(info) {
      if (info.file.status === "uploading") {
        this.loading = true;
        return;
      }
      if (info.file.status === "done") {
        // Get this url from response in real world.
        getBase64(info.file.originFileObj, imageUrl => {
          this.formData.ImgUrl = imageUrl;
          this.loading = false;
        });
      }
    },
    beforeUpload(file) {
      const isLt2M = file.size / 1024 / 1024 < 5;
      if (!isLt2M) {
        this.$message.error("Ảnh upload phải nhỏ hơn 5MB!");
      }
      return isLt2M;
    },
    cancel() {}
  }
};
</script>
<style>
.avatar-uploader > .ant-upload {
  width: 128px;
  height: 128px;
}
.ant-upload-select-picture-card i {
  font-size: 32px;
  color: #999;
}

.ant-upload-select-picture-card .ant-upload-text {
  margin-top: 8px;
  color: #666;
}
</style>