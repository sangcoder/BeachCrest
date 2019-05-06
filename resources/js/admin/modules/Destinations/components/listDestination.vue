<template>
  <div class="destination-list">
    <b-container>
     <h2>Quản lý điểm đến</h2>
     <b-button @click="$router.push({name: 'AddDestiantion'})">
       Thêm mới
     </b-button>
      <b-col>
        <el-table
          :data="tableData"
          :default-sort = "{prop: 'date', order: 'descending'}"
          border
          style="width: 100%">
          <el-table-column
            prop="date"
            sortable
            label="Date"
            width="180">
          </el-table-column>
          <el-table-column
            prop="name"
            label="Name"
            width="180">
          </el-table-column>
          <el-table-column
            prop="address"
            label="Address">
          </el-table-column>
          <el-table-column
            label="Image"
            width="120"
          >
          <template slot-scope="scope">
            <div class="avatar" style="width: 32px; height: 32px;">
              <img :src="scope.row.image" alt="" style="width:32px;">
            </div>
           </template>
          </el-table-column>
        </el-table>
      </b-col>
    </b-container>
  </div>
</template>
<script>
  export default {
    data() {
      return {
        tableData: [{
          date: '2016-05-03',
          name: 'Tom',
          address: 'No. 189, Grove St, Los Angeles',
          image: '/images/man.png'
        }, {
          date: '2016-05-02',
          name: 'Tom',
          address: 'No. 189, Grove St, Los Angeles',
          image: '/images/man.png'
        }, {
          date: '2016-05-04',
          name: 'Tom',
          address: 'No. 189, Grove St, Los Angeles',
          image: '/images/man.png'
        }, {
          date: '2016-05-01',
          name: 'Tom',
          address: 'No. 189, Grove St, Los Angeles',
          image: '/images/man.png'
        }]
      }
    }
  }
</script>

<style scoped>
  .destination-list {
    background: #fff;
    padding: 20px 0;
    border-radius: 5px;
  }
  .destination-list h2 {
    color: #5191fa;
    border-bottom: 2px solid;
    display: inline-block;
    margin-bottom: 20px;
  }
</style>
