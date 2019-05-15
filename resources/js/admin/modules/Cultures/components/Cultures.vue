<template>
  <div class="culture">
        <div class="card">
      <div class="card-body">
        <!-- title -->
        <div class="d-md-flex align-items-center">
          <div>
            <h4 class="card-title">
              <i class="el-icon-location"></i> Danh lam thắng cảnh
            </h4>
            <h5 class="card-subtitle">Danh sách danh lam thắng cảnh</h5>
          </div>
          <div class="ml-auto">
            <a-button type="primary" @click="addNewCultures">Thêm mới danh lam thắng cảnh</a-button>
          </div>
        </div>
        <!-- title -->
        <a-table
          :columns="columns"
          :rowKey="record => record.GuiderID"
          :dataSource="listGuiders"
          :pagination="pagination"
          :loading="loading"
          @change="handleTableChange"
        >
          <template slot="avatar" slot-scope="avatar">
            <a-avatar :size="64" icon="user" :src="avatar"/>
          </template>
          <template slot="gender" slot-scope="gender">{{gender === 1 ? 'Nam' : 'Nữ'}}</template>
          <template slot="bday" slot-scope="bday">{{bday | myDate}}</template>
          <template slot="modify" slot-scope="modify">
            <a-button type="primary" icon="edit" @click="updateTourGuider(modify)">Edit</a-button>
            <a-popconfirm
              title="Are you sure delete?"
              @confirm="deleteTourGuider(modify.GuiderID)"
              @cancel="cancel"
              okText="Yes"
              cancelText="No"
            >
              <a-button type="danger" icon="delete">Delete</a-button>
            </a-popconfirm>
          </template>
        </a-table>
      </div>
    </div>
  </div>
</template>
<script>
function getBase64(img, callback) {
  const reader = new FileReader();
  reader.addEventListener("load", () => callback(reader.result));
  reader.readAsDataURL(img);
}
const columns = [
  {
    title: "ID",
    dataIndex: "GuiderID"
  },
  {
    title: "Image",
    dataIndex: "ImgUrl",
    scopedSlots: { customRender: "avatar" }
  },
  {
    title: "Tên địa danh",
    dataIndex: "GuiderName",
    sorter: true,
    width: "20%"
  },
  {
    title: "Description",
    dataIndex: "Gender",
    scopedSlots: { customRender: "gender" },
    filters: [
      { text: "Male", value: "male" },
      { text: "Female", value: "female" }
    ],
    width: "10%"
  },
  {
    title: "Image",
    dataIndex: "Birthday",
    scopedSlots: { customRender: "bday" }
  },
  {
    title: "Status",
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

    }
  },
  methods: {
    addNewCultures() {

    },
    updateTourGuider() {

    },
    deleteTourGuider () {
      
    }
  }
}
</script>
<style scoped>

</style>
