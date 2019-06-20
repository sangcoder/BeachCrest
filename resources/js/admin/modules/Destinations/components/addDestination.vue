<template>
  <div class="addDestination">
    <div class="card">
      <div class="card-body">
        <!-- title -->
        <div class="d-md-flex align-items-center">
          <div>
            <h4 class="card-title">Thêm mới Địa điểm</h4>
            <h5 class="card-subtitle">Thêm mới một Địa điểm</h5>
          </div>
          <div class="ml-auto">
            <a-button
              type="primary"
              @click="$router.push({name: 'listDestination'})"
              icon="arrow-left"
            >Danh sách địa danh</a-button>
          </div>
        </div>
        <!-- title -->
      </div>
      <b-dropdown-divider></b-dropdown-divider>
      <b-container>
        <b-row>
          <b-col>
            <b-form>
              <b-row>
                <b-col cols="8">
                  <b-form-group id="lblDiaDanh" label="Địa danh" label-for="lblDiaDanh">
                    <a-input
                      placeholder="Nhập mô tả"
                      v-model="form.PlaceName"
                      type="text"
                      required
                    />
                  </b-form-group>
                </b-col>
                <b-col cols="4">
                  <b-form-group label="Khu vực">
                    <a-select
                      defaultValue="MienBac"
                      @change="handleChangeSelect"
                      v-model="form.Region"
                    >
                      <a-select-option
                        v-for="item in options"
                        :key="item.value"
                        :value="item.value"
                      >{{item.label}}</a-select-option>
                    </a-select>
                  </b-form-group>
                </b-col>
              </b-row>

              <b-form-group id="lbldescription" label="Mô tả ngắn" label-for="inputdesc">
                <a-input placeholder="Nhập mô tả" v-model="form.Description" type="text" required/>
              </b-form-group>
              <b-form-group label="Nội dung">
                <editor
                  api-key="9nvefd4odlvd827e3j3aed8lbunqxjc9pyzruuxa37j58j4m"
                  v-model="form.Contents"
                  :init="init"
                ></editor>
              </b-form-group>
              <b-row>
                <b-col cols="3">
                  <b-form-group label="Hình ảnh">
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
                        :src="/^https?:\/\//i.test(form.ImgUrl) ? form.ImgUrl : ((/^data:image/i).test(form.ImgUrl) ? form.ImgUrl : '/images/place/' + form.ImgUrl)"
                        alt="Destination"
                        width="128"
                      >

                      <div v-else>
                        <a-icon :type="loading ? 'loading' : 'plus'"/>
                        <div class="ant-upload-text">Upload</div>
                      </div>
                    </a-upload>
                  </b-form-group>
                </b-col>
                <b-col cols="9">
                  <b-form-group>
                    <a-button type="primary" @click="addPlace" icon="fire">Đăng ngay</a-button>
                  </b-form-group>
                </b-col>
              </b-row>
              <b-dropdown-divider></b-dropdown-divider>
            </b-form>
          </b-col>
        </b-row>
      </b-container>
    </div>
  </div>
</template>
<script>
function getBase64(img, callback) {
  const reader = new FileReader();
  reader.addEventListener("load", () => callback(reader.result));
  reader.readAsDataURL(img);
}
export default {
  data() {
    return {
      options: [
        {
          value: "MienBac",
          label: "Miền Bắc"
        },
        {
          value: "MienTrung",
          label: "Miền Trung"
        },
        {
          value: "MienNam",
          label: "Miền Nam"
        },
        {
          value: "MienTay",
          label: "Miền Tây"
        },
        {
          value: "TayBac",
          label: "Tây bắc"
        },
        {
          value: "TayNguyen",
          label: "Tây nguyên"
        }
      ],
      loading: false,
      value: "",
      form: {
        PlaceName: "",
        Description: "",
        ImageUrl: "",
        Contents: "",
        Region: "Chọn khu vực..."
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
    handleChangeSelect() {},
    addPlace() {
      let payload = {
        PlaceName: this.form.PlaceName,
        Description: this.form.Description,
        ImageUrl: this.form.ImageUrl,
        Contents: this.form.Contents,
        Region: this.form.Region
      };
      let that = this;
      this.$store.dispatch("place/addPlace", payload).then(res => {
        that.$router.push({ name: "listDestination" });
        this.$message.success("Đã thêm thành công");
      });
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
