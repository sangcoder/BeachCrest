<template>
  <div class="addDestination">
    <div class="card">
      <div class="card-body">
        <!-- title -->
        <div class="d-md-flex align-items-center">
          <div>
            <h4 class="card-title">Địa danh: {{ this.placeInfo.PlaceName }}</h4>
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
                      v-model="placeInfo.PlaceName"
                      type="text"
                      id="lblDiaDanh"
                      required
                    />
                  </b-form-group>
                </b-col>
                <b-col cols="4">
                  <b-form-group label="Khu vực">
                    <a-select
                      defaultValue="MienBac"
                      @change="handleChangeSelect"
                      v-model="placeInfo.Region"
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
                <a-input
                  placeholder="Nhập mô tả"
                  v-model="placeInfo.Description"
                  type="text"
                  id="inputdesc"
                  required
                />
              </b-form-group>
              <b-form-group label="Nội dung">
                                <editor
                api-key="9nvefd4odlvd827e3j3aed8lbunqxjc9pyzruuxa37j58j4m"
                v-model="placeInfo.Contents"
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
                      <img v-if="placeInfo" :src="placeInfo.ImgUrl" alt="Destination" width="128">
                      <div v-else>
                        <a-icon :type="loading ? 'loading' : 'plus'"/>
                        <div class="ant-upload-text">Upload</div>
                      </div>
                    </a-upload>
                  </b-form-group>
                </b-col>
                <b-col cols="9">
                  <b-form-group>
                    <a-button type="primary" @click="updatePlace" icon="edit">Sửa bài viết</a-button>
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
        }
      ],
      loading: false,
      value: "",
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
  created() {
    this.$store.dispatch("place/GetPlaceById", this.$route.params.id);
  },
  computed: {
    placeInfo() {
      return this.$store.get("place/placeInfo");
    }
  },
  methods: {
    handleChangeSelect() {},
    updatePlace() {
      let payload = {
        id: this.$route.params.id,
        PlaceName: this.placeInfo.PlaceName,
        Description: this.placeInfo.Description,
        ImageUrl: this.placeInfo.ImgUrl,
        Contents: this.placeInfo.Contents,
        Region: this.placeInfo.Region
      };
      let that = this;
      this.$store
        .dispatch("place/updatePlace", payload)
        .then(res => {
          // console.log(res)
          this.$router.push({ name: "listDestination" });
          this.$message.success("Đã sửa thành công");
        })
        .catch(err => {
          console.log(err);
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
          this.placeInfo.ImgUrl = imageUrl;
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

