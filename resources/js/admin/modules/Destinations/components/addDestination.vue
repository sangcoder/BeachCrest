<template>
  <div class="addDestination">
    <div class="card">
      <div class="card-body">
        <!-- title -->
        <div class="d-md-flex align-items-center">
            <div>
              <h4 class="card-title">Thêm mới địa danh</h4>
              <h5 class="card-subtitle">Thêm mới một địa danh</h5>
              </div>
              <div class="ml-auto">
                <b-button variant="primary" @click="$router.push({name: 'listDestination'})">Danh sách địa danh</b-button>
              </div>
            </div>
            <!-- title -->
        </div>
         <b-dropdown-divider></b-dropdown-divider>
        <b-container>
          <b-row>
          <b-col>
            <b-form>
              <b-form-group
              id="lblDiaDanh"
              label="Địa danh"
              label-for="lblDiaDanh"
              >
                <b-form-input
                id="lblDiaDanh"
                v-model="form.scenicName"
                type="text"
                required
                placeholder="Nhập tên địa danh"
                >
                </b-form-input>
              </b-form-group>
              <b-form-group
              id="lbldescription"
              label="Mô tả ngắn"
              label-for="inputdesc"
              >
                <b-form-input
                id="inputdesc"
                v-model="form.description"
                type="text"
                required
                placeholder="Nhập mô tả"
                >
                </b-form-input>
              </b-form-group>
              <b-form-group
              label="Nội dung"
              >
              <wysiwyg v-model="form.contents" />
              </b-form-group>
            <b-form-group>
              <el-upload
                action="https://jsonplaceholder.typicode.com/posts/"
                list-type="picture-card"
                :on-preview="handlePictureCardPreview"
                :on-remove="handleRemove">
                <i class="el-icon-plus"></i>
              </el-upload>
              <el-dialog :visible.sync="dialogVisible">
                <img width="100%" :src="dialogImageUrl" alt="">
              </el-dialog>
            </b-form-group>
            <b-form-group>
              <input type="file" @change="uploadPhoto" name="photo" class="form-input">
            </b-form-group>
            <b-form-group
            label="Trạng thái"
            >
              <el-switch
                v-model="state"
                active-color="#13ce66"
                inactive-color="#ff4949"
                active-value="1"
                inactive-value="0">
              </el-switch>
            </b-form-group>
            </b-form>
          </b-col>
        </b-row>
    </b-container>
    </div>

  </div>
</template>
<script>
export default {
  data () {
    return {
      form: {
        scenicName: '',
        description: '',
        photo: '',
        contents: ''
      },
      dialogImageUrl: '',
      dialogVisible: false,
      state: '1'
    }
  },
  methods: {
      handleRemove(file, fileList) {
        console.log(file, fileList);
      },
      handlePictureCardPreview(file) {
        this.dialogImageUrl = file.url;
        this.dialogVisible = true;
      },
      uploadPhoto(e) {
        // console.log('uploading...',e)
        let file = e.target.files[0]
        let reader = new FileReader()
        let that = this
        reader.onloadend = function() {
          // console.log('Result', reader.result)
          that.form.photo = reader.result
        }
        reader.readAsDataURL(file)
        
      }
    }
}
</script>
<style scoped>
  .addDestination {
    background: #fff;
    border-radius: 3px;
  }
</style>
