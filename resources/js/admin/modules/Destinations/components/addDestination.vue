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
            label-for="inputDiaDanh"
            description="Địa danh"
            >
            <b-form-input
            id="lblDiaDanh"
            v-model="form.inpdiadanh"
            type="text"
            required
            placeholder="Nhập tên địa danh"
            >
            </b-form-input>
            </b-form-group>

          </b-form>
           <b-row class="mt-2">
            <b-col sm="2">
              <label for="textarea-default">Default:</label>
            </b-col>
            <b-col sm="10">
              <b-form-textarea
                id="textarea-default"
                placeholder="Default textarea"
              ></b-form-textarea>
            </b-col>
          </b-row>
        </b-col>
      </b-row>
    </b-container>
  </div>
</template>
<script>
export default {
  
}
</script>