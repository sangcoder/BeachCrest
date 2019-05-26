<template>
  <div class="section schedules">
    <div class="card">
      <div class="card-body">
        <!-- title -->
        <div class="d-md-flex align-items-center">
          <div>
            <h4 class="card-title">
              <a-icon type="global" class="mr-2"/>Lịch trình
            </h4>
            <h5 class="card-subtitle">Danh sách lịch trình của Tour</h5>
          </div>
          <div class="ml-auto">
            <a-button type="primary" @click="addSchedule" icon="plus">Thêm mới lịch trình</a-button>
            <a-button type="default" @click="downloadExel()" icon="file-excel">Export</a-button>
          </div>
        </div>
        <!-- title -->
      </div>
    </div>
    <div class="card">
      <div class="card-body">
        <div class="d-md-flex align-items-center">
          <div class="ml-auto">
            <a-input-search
              placeholder="input search text"
              style="width: 250px; margin-bottom: 10px;"
              @search="seachTourGuider"
            />
          </div>
        </div>
        <a-table
          :columns="columns"
          :rowKey="record => record.id"
          :dataSource="data"
          :pagination="pagination"
          :loading="loading"
          @change="handleTableChange"
          :rowSelection="{selectedRowKeys: selectedRowKeys, onChange: onSelectChange}"
        >
          <template slot="Contents" slot-scope="schedule">
            <a href="#" @click="updateSchedule(schedule)">{{ schedule.Contents | truncate(80) }}</a>
          </template>
          <template slot="createAt" slot-scope="createAt">{{createAt | myDate}}</template>
          <template slot="updateAt" slot-scope="updateAt">{{updateAt | myDate}}</template>
          <template slot="modify" slot-scope="modify">
            <a-button
              size="small"
              type="primary"
              icon="usergroup-add"
              @click="addGuiderModal(modify)"
            ></a-button>
            <a-popconfirm
              title="Bạn muốn xóa lịch trình ?"
              @confirm="deleteSchedule(modify.id)"
              okText="Yes"
              cancelText="No"
            >
              <a-button size="small" type="danger" icon="delete"></a-button>
            </a-popconfirm>
          </template>
        </a-table>
      </div>
    </div>
    <a-modal
      :title="editMode ? 'Sửa lịch trình' :'Thêm lịch trình'"
      v-model="visibleSchedule"
      @ok="submitSchedule"
      :maskClosable="false"
    >
      <b-form-group label="Lịch trình">
        <a-textarea
          placeholder="Nhập mô tả ngắn về lịch trình"
          v-model="formData.Contents"
          :autosize="{ minRows: 2, maxRows: 4 }"
        />
      </b-form-group>
    </a-modal>
    <a-modal
      title="Thêm hướng dẫn viên vào lịch trình"
      v-model="visibleGuider"
      @ok="addGuider"
      :width="760"
      :maskClosable="false"
    >
      <b-form-group label="Hướng dẫn viên">
        <a-select
          showSearch
          placeholder="Chọn hướng dẫn viên"
          optionFilterProp="children"
          style="width: 100%;"
          v-model="formScheduleGuider.GuiderID"
        >
          <a-select-option
            v-for="item in listGuider"
            :key="item.GuiderID"
            :value="item.GuiderID"
          >{{item.GuiderName}}</a-select-option>
        </a-select>
      </b-form-group>
      <b-row>
        <b-col md="6">
          <b-form-group label="Thời gian bắt đầu">
            <a-date-picker
              format="YYYY-MM-DD HH:mm:ss"
              :disabledDate="disabledDate"
              :disabledTime="disabledDateTime"
              :showTime="{ defaultValue: moment('00:00:00', 'HH:mm:ss') }"
              size="large"
              style="width: 100%;"
              v-model="formScheduleGuider.StartTime"
            />
          </b-form-group>
        </b-col>
        <b-col md="6">
          <b-form-group label="Thời gian kết thúc">
            <a-date-picker
              format="YYYY-MM-DD HH:mm:ss"
              :disabledDate="disabledDate"
              :disabledTime="disabledDateTime"
              :showTime="{ defaultValue: moment('00:00:00', 'HH:mm:ss') }"
              size="large"
              style="width: 100%;"
              v-model="formScheduleGuider.EndTime"
            />
          </b-form-group>
        </b-col>
      </b-row>
      <b-form-group label="Nội dung lịch trình">
        <a-textarea
          placeholder="Nhập nội dung lịch trình..."
          :autosize="{ minRows: 2, maxRows: 6 }"
          v-model="formScheduleGuider.Contents"
        />
      </b-form-group>
      <b-form-group>
        <a-button type="primary" @click="addGuiderSchedule">Thêm hướng dẫn viên</a-button>
      </b-form-group>
      <table class="table table-hover">
        <tbody>
          <tr>
            <th>ID</th>
            <th>Hướng dẫn viên</th>
            <th>Bắt đầu</th>
            <th>Kết thúc</th>
            <th>Modify</th>
          </tr>
          <tr v-for="item in listGuiderID" :key="item.GuiderID">
            <td>{{ item.GuiderID }}</td>
            <td>{{ item.GuiderName | upText }}</td>
            <td>{{ item.StartTime| myDate }}</td>
            <td>{{ item.StartTime | myDate }}</td>
            <td>
              <a-divider type="vertical"/>
              <a href="#" @click="viewSchedule(item)">Xem</a>
              <a-divider type="vertical"/>
              <a href="#" @click="deleteSchelduleGuider(formData.id, item.GuiderID)">Xóa</a>
            </td>
          </tr>
        </tbody>
      </table>
    </a-modal>
  </div>
</template>

<script src="./Schedule.js"></script>