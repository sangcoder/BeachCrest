<template>
  <div class="addDestination">
    <div class="card">
      <div class="card-body">
        <!-- title -->
        <div class="d-md-flex align-items-center">
            <div>
              <h4 class="card-title">Thêm mới Địa điểm</h4>
              <h5 class="card-subtitle">Thêm mới một  Địa điểm</h5>
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
                  v-model="form.PlaceName"
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
                    <el-select v-model="form.Region" placeholder="Chọn khu vực" name="khuvuc">
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
                v-model="form.Description"
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
              <wysiwyg v-model="form.Contents" />
              </b-form-group>
              <b-row>
                <b-col cols="3">
                <b-form-group
                  label="Hình ảnh"
                  >
                    <div class="avatar-uploader">
                      <div tabindex="0" class="el-upload el-upload--text" @click="fakeClick">
                        <img v-if="form.ImageUrl" :src="form.ImageUrl" class="avatar">
                        <i v-else class="el-icon-plus avatar-uploader-icon"></i>
                        <input type="file" @change="uploadPhoto" name="file" class="el-upload__input" id="realUpload">
                        </div></div>
                  </b-form-group>
                </b-col>
                <b-col cols="9">
                <b-form-group>
                  <el-button @click="addPlace" type="primary" class="mt-3" icon="el-icon-document-add">Đăng ngay</el-button>
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

      form: new Form({
        PlaceName: '',
        Description: '',
        ImageUrl: '',
        Contents: '',
        Region: ''
      }),

    }
  },
  methods: {
    fakeClick () {
      document.getElementById('realUpload').click()
    },
      uploadPhoto(e) {
        let file = e.target.files[0]
        let reader = new FileReader()
        let that = this
        reader.onloadend = function() {
          // console.log('Result', reader.result)
          that.form.ImageUrl = reader.result
        }
        reader.readAsDataURL(file)
      },
      addPlace () {
        let payload = {
          PlaceName: this.form.PlaceName,
          Description:this.form.Description,
          ImageUrl:this.form.ImageUrl,
          Contents:this.form.Contents, 
          Region:this.form.Region
        }
        let that = this
        this.$store.dispatch('place/addPlace', payload).then(res => {
        that.$router.push({name: 'listDestination'})
        this.$message.success('Đã thêm thành công')
        })
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
