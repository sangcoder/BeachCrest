<template>
  <div class="addDestination">
    <b-container>
      <h2>Add new Desctination</h2>
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
            id="lblContents"
            label="Nội dung"
            label-for="inputContents"
          >
          <ckeditor :editor="editor" v-model="editorData" :config="editorConfig"></ckeditor>
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
</template>
<script>
import ClassicEditor from '@ckeditor/ckeditor5-build-classic';
export default {
  data () {
    return {
      form: {
        scenicName: '',
        description: '',
        photo: ''
      },
      editor: ClassicEditor,
      editorData: '<p>Content of the editor.</p>',
      editorConfig: {
        cloudServices: {
          uploadUrl: "http://url.com/token"
        }
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
