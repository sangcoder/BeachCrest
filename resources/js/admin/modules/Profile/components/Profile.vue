<template>
  <div class="account-settings-info-view">
    <a-row :gutter="16">
      <a-col :md="24" :lg="16">
        <a-form layout="vertical">
          <a-form-item label="Họ và tên">
            <a-input placeholder="Họ và tên" v-model="formData.FullName"/>
          </a-form-item>
          <a-form-item label="Bio">
            <a-textarea rows="4" placeholder="You are not alone." v-model="formData.Bio"/>
          </a-form-item>

          <a-form-item label="Email" :required="false">
            <a-input placeholder="admin@beachCrest.com" v-model="formData.Email" disabled/>
          </a-form-item>

          <a-form-item>
            <a-button type="primary">Cập nhật thông tin</a-button>
            <a-button style="margin-left: 8px">Nhập lại</a-button>
          </a-form-item>
        </a-form>
      </a-col>
      <a-col :md="24" :lg="8" :style="{ minHeight: '180px', display: 'flex', justifyContent: 'center' }">
        <a-upload
          name="avatar"
          listType="picture-card"
          class="avatar-uploader"
          :showUploadList="false"
          action="/api/uploadJson"
          :beforeUpload="beforeUpload"
          @change="handleChange"
        >
          <img v-if="formData.photo" :src="/^https?:\/\//i.test(formData.photo) ? formData.photo : (/^data:image/i).test(formData.photo) ? formData.photo : '/images/' + formData.photo" alt="avatar">
          <div v-else>
            <a-icon :type="loading ? 'loading' : 'plus'"/>
            <div class="ant-upload-text">Upload</div>
          </div>
        </a-upload>
      </a-col>
    </a-row>
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
      loading: false,
      imageUrl: "",
      formData: {
        FullName: '',
        Bio: '',
        Email: '',
        photo: ''
      }
    };
  },
  created() {
    this.formData.photo = this.$store.state.user.user.photo
    this.formData.Bio = this.$store.state.user.user.bio
    this.formData.FullName = this.$store.state.user.user.name,
    this.formData.Email = this.$store.state.user.user.email
  },
  methods: {
    handleChange(info) {
      if (info.file.status === "uploading") {
        this.loading = true;
        return;
      }
      if (info.file.status === "done") {
        // Get this url from response in real world.
        getBase64(info.file.originFileObj, imageUrl => {
          this.formData.photo = imageUrl;
          this.loading = false;
        });
      }
    },
    beforeUpload(file) {

      const isLt2M = file.size / 1024 / 1024 < 2;
      if (!isLt2M) {
        this.$message.error("Ảnh phải nhỏ hơn 2MB!");
      }
      return  isLt2M;
    }
  }
};
</script>

<style scoped>
.avatar-uploader > .ant-upload {
  width: 128px;
  height: 128px;
}
.avatar-uploader img {
  width: 80px;
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
