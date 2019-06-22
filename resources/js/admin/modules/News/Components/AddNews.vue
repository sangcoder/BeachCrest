<template>
  <div class="modify-news">
    <a-spin :spinning="spinning" tip="Đang xử lý...">
      <b-row>
        <b-col md="8" class="left-item">
          <div class="card">
            <div class="card-body">
              <h4 class="card-title">Tên bài viết</h4>
              <div class="news">
                <b-row>
                  <b-col cols="12">
                    <b-form-group label="Tên bài viết">
                      <a-input v-model="form.Title" size="large" placeholder="Nhập tên bài viết"/>
                    </b-form-group>
                    <b-form-group label="Nội dung bài viết">
                      <editor
                        api-key="9nvefd4odlvd827e3j3aed8lbunqxjc9pyzruuxa37j58j4m"
                        v-model="form.Contents"
                        :init="init"
                      ></editor>
                    </b-form-group>
                    <div class="addButton">
                      <a-button size="large" @click="submitNews" type="primary">Đăng ngay</a-button>
                    </div>
                  </b-col>
                </b-row>
              </div>
            </div>
          </div>
        </b-col>
        <b-col md="4" class="right-item">
          <div class="card">
            <div class="card-body">
              <h4 class="card-title">Thông tin bài viết</h4>
              <div class="news-sidebar">
                <b-form-group label="Ảnh đại diện bài viết">
                  <a-upload
                    name="avatar"
                    listType="picture-card"
                    class="avatar-uploader"
                    :showUploadList="false"
                    action="/api/uploadJson"
                    :beforeUpload="beforeUpload"
                    @change="handleChange"
                  >
                    <img
                      v-if="form.ImgUrl"
                      :src="/^https?:\/\//i.test(form.ImgUrl) ? form.ImgUrl : ((/^data:image/i).test(form.ImgUrl) ? form.ImgUrl :  form.ImgUrl)"
                      alt="Destination"
                      width="128"
                    >

                    <div v-else>
                      <a-icon :type="loading ? 'loading' : 'plus'"/>
                      <div class="ant-upload-text">Tải lên</div>
                    </div>
                  </a-upload>
                </b-form-group>
                <b-form-group label="Trạng tháí">
                  <a-radio-group defaultValue="0" v-model="form.State" buttonStyle="solid">
                    <a-radio-button value="0">Nháp</a-radio-button>
                    <a-radio-button value="1">Xuất bản</a-radio-button>
                  </a-radio-group>
                </b-form-group>
                <b-form-group v-if="info">
                  Đăng bởi:
                  <strong>{{info.name}}</strong>
                </b-form-group>
              </div>
            </div>
          </div>
        </b-col>
      </b-row>
    </a-spin>
  </div>
</template>
<script>
import NewsAPI from "../newsService";
function getBase64(img, callback) {
  const reader = new FileReader();
  reader.addEventListener("load", () => callback(reader.result));
  reader.readAsDataURL(img);
}
export default {
  created() {
    if (this.editMode && this.$route.query.news) {
      this.fetchNews(this.$route.query.news);
    }
  },
  data() {
    return {
      loading: false,
      editMode: this.$route.query.type === "edit" ? true : false,
      // dataNews: {},
      spinning: false,
      info: {
        id: "",
        name: ""
      },
      form: {
        newsID: this.$route.query.news ? this.$route.query.news : -1,
        Title: "",
        Contents: "",
        ImgUrl: "",
        State: "0"
      },
      init: {
        selector: "textarea",
        height: 480,
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
  methods: {
    fetchNews(id) {
      NewsAPI.getNewById(id).then(res => {
        // this.dataNews = res..data.data
        this.form.Title = res.data.data.Title;
        this.form.ImgUrl = res.data.data.ImgUrl;
        this.form.Contents = res.data.data.Contents;
        this.form.State = `${res.data.data.State}`;
        this.info.id = res.data.data.info.id;
        this.info.name = res.data.data.info.name;
      });
    },
    submitNews() {
      if (this.editMode) {
        this.spinning = true;
        NewsAPI.updateNews(this.form.newsID, this.form).then(res => {
          this.spinning = false;
          this.$notification["success"]({
            message: "Thành công",
            description: "Cập nhật thành công"
          }).catch(err => {
            this.$notification["error"]({
              message: "Thất bại",
              description: "Đã xảy ra lỗi"
            });
            console.log("error" + err);
          });
        });
      } else {
        this.spinning = true;
        NewsAPI.addNews(this.form).then(res => {
          this.spinning = false;
          this.$notification["success"]({
            message: "Thành công",
            description: "Cập nhật thành công"
          });
        }).catch(err => {
            this.$notification["error"]({
              message: "Thất bại",
              description: "Đã xảy ra lỗi"
            });
            console.log("error" + err);
          });
      }
    },
    handleChange(info) {
      if (info.file.status === "uploading") {
        this.loading = true;
        return;
      }
      if (info.file.status === "done") {
        // Get this url from response in real world.
        getBase64(info.file.originFileObj, imageUrl => {
          this.form.ImgUrl = imageUrl;
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
    }
  }
};
</script>
<style lang="css" scoped>
.modify-news .ant-upload.ant-upload-select-picture-card {
  width: 100% !important;
  height: 200px !important;
}
.modify-news .ant-upload.ant-upload-select-picture-card img {
  width: 200px !important;
  height: 160px !important;
}
</style>