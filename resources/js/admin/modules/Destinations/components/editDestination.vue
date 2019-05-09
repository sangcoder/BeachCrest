<template>
  <div class="addDestination">
    <div class="card">
      <div class="card-body">
        <!-- title -->
        <div class="d-md-flex align-items-center">
            <div>
              <h4 class="card-title">Sửa bài viết {{ this.$route.params.id }} </h4>
              <h5 class="card-subtitle">Sửa bài viết  Địa điểm</h5>
              </div>
              <div class="ml-auto">
                <b-button variant="primary" @click="$router.push({name: 'listDestination'})"><i class="el-icon-back"></i> Danh sách địa danh</b-button>
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
                  <b-form-group
                  id="lblDiaDanh"
                  label="Địa danh"
                  label-for="lblDiaDanh"
                  >
                  <b-form-input
                  id="lblDiaDanh"
                  v-model="placeInfo.PlaceName"
                  type="text"
                  name="diadanh"
                  required
                  placeholder="Nhập tên địa danh"
                  >
                </b-form-input>
              </b-form-group>
                </b-col>
                <b-col cols="4">
                  <b-form-group
                  label="Khu vực"
                  >
                    <el-select v-model="placeInfo.Region" placeholder="Chọn khu vực" name="khuvuc">
                      <el-option
                        v-for="item in options"
                        :key="item.value"
                        :label="item.label"
                        :value="item.value">
                      </el-option>
                    </el-select>
                  </b-form-group>
                </b-col>
              </b-row>

              <b-form-group
              id="lbldescription"
              label="Mô tả ngắn"
              label-for="inputdesc"
              >
                <b-form-input
                id="inputdesc"
                v-model="placeInfo.Description"
                type="text"
                required
                placeholder="Nhập mô tả"
                name="mota"
                >
                </b-form-input>
              </b-form-group>
              <b-form-group
              label="Nội dung"
              >
              <wysiwyg v-model="placeInfo.Contents" />
              </b-form-group>
              <b-row>
                <b-col cols="3">
                <b-form-group
                  label="Hình ảnh"
                  >
                    <div class="avatar-uploader">
                      <div tabindex="0" class="el-upload el-upload--text" @click="fakeClick">
                        <img v-if="placeInfo" :src="placeInfo.ImgUrl" class="avatar">
                        <i v-else class="el-icon-plus avatar-uploader-icon"></i>
                        <input type="file" @change="uploadPhoto" name="file" class="el-upload__input" id="realUpload">
                        </div></div>
                  </b-form-group>
                </b-col>
                <b-col cols="9">
                <b-form-group>
                  <el-button @click="updatePlace" type="primary" class="mt-3" icon="el-icon-document-add">Sửa bài viết</el-button>
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
export default {
  data () {
    return {
      options: [{
        value: 'MienBac',
        label: 'Miền Bắc'
      }, {
        value: 'MienTrung',
        label: 'Miền Trung'
      }, {
        value: 'MienNam',
        label: 'Miền Nam'
      }],
      value: '',
      form: new Form({
        PlaceName: '',
        Description: '',
        ImageUrl: '',
        Contents: '',
        Region: ''
      }) ,
      dialogImageUrl: '',
      dialogVisible: false,
      imageUrl: ''
    }
  },
  created() {
    this.$store.dispatch('place/GetPlaceById',this.$route.params.id)
  },
  computed: {
    placeInfo () {
      return this.$store.get('place/placeInfo')
    }
  },
  methods: {
    updatePlace () {
      let payload = {
        id: this.$route.params.id,
        PlaceName: this.placeInfo.PlaceName,
        Description:this.placeInfo.Description,
        ImageUrl:this.placeInfo.ImgUrl,
        Contents:this.placeInfo.Contents, 
        Region:this.placeInfo.Region
      }
      let that = this
      this.$store.dispatch('place/updatePlace', payload).then(res => {
        console.log(res)
        that.$router.push({name: 'listDestination'})
        console.log(res + 'thanh cong')
      })
      .catch(err => {
        console.log(err)
      })
    },
    fakeClick () {
      document.getElementById('realUpload').click()
    },
      uploadPhoto(e) {
        // console.log('uploading...',e)
        let file = e.target.files[0]
        let reader = new FileReader()
        let that = this
        reader.onloadend = function() {
          // console.log('Result', reader.result)
          that.imageUrl = reader.result
          that.placeInfo.ImgUrl = that.imageUrl
        }
        reader.readAsDataURL(file)
      }
    }
}
</script>
<style>
  .avatar-uploader .el-upload {
    border: 1px dashed #d9d9d9;
    border-radius: 6px;
    cursor: pointer;
    position: relative;
    overflow: hidden;
  }
  .avatar-uploader .el-upload:hover {
    border-color: #409EFF;
  }
  .avatar-uploader-icon {
    font-size: 28px;
    color: #8c939d;
    width: 178px;
    height: 178px;
    line-height: 178px;
    text-align: center;
  }
  .avatar {
    width: 178px;
    height: 178px;
    display: block;
  }
</style>
