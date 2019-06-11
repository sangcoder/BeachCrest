<template>
  <div class="add-cultures">
    <div class="card">
      <div class="card-body">
        <div class="d-md-flex align-items-center">
          <div>
            <h4 class="card-title">
              <a-icon type="global" class="mr-2"/>Thêm mới danh lam thắng cảnh
            </h4>
            <h5 class="card-subtitle">Thêm mới các địa danh cho Tour</h5>
          </div>
          <div class="ml-auto">
            <a-button-group>
              <a-button type="primary">
                <a-icon type="left"/>Quay lại
              </a-button>
              <a-button type="primary">
                Go forward
                <a-icon type="right"/>
              </a-button>
            </a-button-group>
          </div>
        </div>
        <!-- /title -->
      </div>
    </div>
    <a-spin :spinning="spinning">
      <div class="card">
        <h4
          class="CultureName"
        >{{formData.CulturesName === '' ? 'Tên danh lam thắng cảnh': formData.CulturesName}}</h4>
        <div class="card-body">
          <b-row>
            <b-col md="8">
              <b-form-group label="Tên tour">
                <a-input v-model="formData.CulturesName" placeholder="Nhập tên tour"/>
              </b-form-group>
            </b-col>
            <b-col md="4">
              <b-form-group label="Khu vực">
                <a-select
                  showSearch
                  placeholder="Chọn điểm đến ..."
                  style="width: 100%;"
                  v-model="formData.Place_ID"
                  optionFilterProp="children"
                  :filterOption="filterOption"
                >
                  <a-select-option
                    v-for="place in placeData"
                    :key="place.PlaceID"
                    :value="place.PlaceID"
                  >{{place.PlaceName}}</a-select-option>
                </a-select>
              </b-form-group>
            </b-col>
            <b-col cols="12">
              <b-form-group label="Mô tả">
                <a-textarea
                  placeholder="Nhập mô tả"
                  v-model="formData.CultureDescription"
                  :autosize="{ minRows: 2, maxRows: 6 }"
                />
              </b-form-group>
            </b-col>
            <b-col md="9">
              <b-form-group label="Nội dung">
                <editor
                  api-key="9nvefd4odlvd827e3j3aed8lbunqxjc9pyzruuxa37j58j4m"
                  v-model="formData.Contents"
                  :init="init"
                ></editor>
              </b-form-group>
            </b-col>
            <b-col md="3" class="sidebar-left">
              <b-form-group label="Ảnh đại diện">
                <a-upload
                  name="avatar"
                  listType="picture-card"
                  class="avatar-uploader"
                  :showUploadList="false"
                  action="/api/uploadJson"
                  @change="handleChange"
                >
                  <img
                    v-if="formData.featherImage"
                    :src="/^https?:\/\//i.test(formData.featherImage) ? formData.featherImage : '/images/cultures/' + formData.featherImage"
                    alt="Feather Image"
                  >
                  <div v-else>
                    <a-icon :type="loading ? 'loading' : 'plus'"/>
                    <div class="ant-upload-text">Tải ảnh lên</div>
                  </div>
                </a-upload>
              </b-form-group>
              <b-form-group label="Trạng thái">
                <a-radio-group defaultValue="0" v-model="formData.State" buttonStyle="solid">
                  <a-radio-button value="0">Nháp</a-radio-button>
                  <a-radio-button value="1">Xuất bản</a-radio-button>
                </a-radio-group>
              </b-form-group>
              <div class="publish">
                <a-button
                  type="primary"
                  icon="download"
                  size="large"
                  @click="submitCultures"
                >Xuất bản</a-button>
              </div>
            </b-col>
          </b-row>
        </div>
      </div>
    </a-spin>
  </div>
</template>
<script>
import CultureAPI from "../cultureService";
import Axios from "axios";
function getBase64(img, callback) {
  const reader = new FileReader();
  reader.addEventListener("load", () => callback(reader.result));
  reader.readAsDataURL(img);
}
export default {
  data() {
    return {
      loading: false,
      spinning: false,
      placeData: [],
      detailCulture: {},
      editMode: this.$route.query.type === "edit" ? true : false,
      formData: {
        CultureId: this.$route.query.cultureId
          ? this.$route.query.cultureId
          : -1,
        CulturesName: "",
        Contents: "",
        featherImage: "",
        Place_ID: "",
        CultureDescription: "",
        State: "0",
        create_at: "",
        updated_at: ""
      },
      init: {
        selector: "textarea",
        height: 880,
        paste_data_images: true,
        plugins: [
          "advlist autolink lists link image charmap print preview hr anchor pagebreak",
          "searchreplace wordcount visualblocks visualchars code fullscreen",
          "insertdatetime media nonbreaking save table directionality",
          "emoticons template paste textpattern"
        ],
        toolbar1:
          "insertfile undo redo | styleselect | bold italic | alignleft aligncenter alignright alignjustify | bullist numlist outdent indent | link image",
        toolbar2: "print preview media | forecolor backcolor emoticons",
        image_title: true,
        automatic_uploads: true,
        images_upload_url: "/api/upload/tinymce",
        file_picker_types: "image",
        file_picker_callback: function(cb, value, meta) {
          var input = document.createElement("input");
          input.setAttribute("type", "file");
          input.setAttribute("accept", "image/*");
          input.onchange = function() {
            var file = this.files[0];
            var reader = new FileReader();
            reader.readAsDataURL(file);
            reader.onload = function() {
              var id = "blobid" + new Date().getTime();
              var blobCache = tinymce.activeEditor.editorUpload.blobCache;
              var base64 = reader.result.split(",")[1];
              var blobInfo = blobCache.create(id, file, base64);
              blobCache.add(blobInfo);
              cb(base64);
            };
          };
          input.click();
        }
      }
    };
  },
  created() {
    this.fetchPlace();
    if (this.editMode) {
      this.fetchCultureById(this.$route.query.cultureId);
    }
  },
  computed: {},
  methods: {
    filterOption(input, option) {
      return (
        option.componentOptions.children[0].text
          .toLowerCase()
          .indexOf(input.toLowerCase()) >= 0
      );
    },
    handleChange(info) {
      if (info.file.status === "uploading") {
        this.loading = true;
        return;
      }
      if (info.file.status === "done") {
        getBase64(info.file.originFileObj, imageUrl => {
          this.formData.featherImage = imageUrl;
          this.loading = false;
        });
      }
    },
    submitCultures() {
      if (this.editMode) {
        this.spinning = true;
        CultureAPI.editCulture(this.formData.CultureId, this.formData).then(
          res => {
            this.$message.success('Sửa thành công!')
            this.spinning = false
          }
        );
      } else {
        CultureAPI.addCulture(this.formData).then(res => {
            this.$router.push({name: 'listCultures'})
        });
      }
    },
    fetchPlace() {
      return CultureAPI.getListPlace().then(res => {
        this.placeData = res.data.data;
      });
    },
    fetchCultureById(id) {
      this.spinning = true;
      CultureAPI.getCultureById(id).then(res => {
        this.formData.CulturesName = res.data.ScenicName;
        this.formData.Place_ID = res.data.place_id;
        this.formData.CultureDescription = res.data.Description;
        this.formData.Contents = res.data.Contents;
        this.formData.featherImage = res.data.ImgUrl;
        this.formData.State = `${res.data.state}`;
        this.formData.create_at = res.data.created_at;
        this.formData.updated_at = res.data.updated_at;
        this.spinning = false;
      });
    }
  }
};
</script>
<style>
.add-cultures .ant-upload.ant-upload-select-picture-card {
  width: 100% !important;
  height: 200px !important;
}
.add-cultures .ant-upload.ant-upload-select-picture-card img {
  width: 200px !important;
  height: 160px !important;
}
</style>

<style lang="css" scoped>
.CultureName {
  background: cadetblue;
  padding: 7px 10px;
  color: #fff;
}
.publish {
  display: flex;
  align-items: center;
  justify-content: center;
  background: #f0f2f5;
  padding: 33px;
  border: 1px dashed #1890ff;
}
.sidebar-left {
  background: palegoldenrod;
  padding: 20px;
  border-radius: 3px;
}
</style>