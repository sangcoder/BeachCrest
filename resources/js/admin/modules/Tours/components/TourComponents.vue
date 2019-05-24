<template>
  <div class="TourManagerment">
    <SearchTour/>
    <div class="card">
      <div class="card-body">
        <!-- title -->
        <div class="d-md-flex align-items-center">
          <div>
            <h4 class="card-title">
              <a-icon type="global" class="mr-2"/>Quản lý Tour
            </h4>
            <h5 class="card-subtitle">Danh sách Tour hệ thống</h5>
          </div>
          <div class="ml-auto">
            <a-button type="primary" @click="addTour" icon="plus">Thêm mới Tour</a-button>
            <a-button
              type="danger"
              icon="delete"
              @click="deleteMore"
              v-show="deleteMoreButton"
            >Xóa nhiều</a-button>
            <a-button type="default" @click="exportTour()" icon="file-excel">Export</a-button>
          </div>
        </div>
        <!-- title -->
        <a-table
          :columns="columns"
          :rowKey="record => record.TourID"
          :dataSource="data"
          :pagination="pagination"
          :loading="loading"
          :rowSelection="{selectedRowKeys: selectedRowKeys, onChange: onSelectChange, onSelectAll: selectAll}"
          @change="handleTableChange"
        >
          <template slot="Image" slot-scope="Image">
            <a-avatar
              :size="64"
              shape="square"
              icon="camera"
              :src="'/images/tour/' + JSON.parse(Image.ImageUrl)[0]"
            />
          </template>
          <template slot="TourName" slot-scope="TourName">
            <a href="#" @click="updateTour(TourName)">{{ TourName.TourName | truncate(45)}}</a>
          </template>
          <template slot="priceAdult" slot-scope="priceAdult">{{priceAdult | toCurrency}}</template>
          <template slot="priceKid" slot-scope="priceKid">{{ priceKid | toCurrency }}</template>
          <template slot="discount" slot-scope="discount">
            <a-tag color="#87d068">{{discount +'%'}}</a-tag>
          </template>
          <template slot="modify" slot-scope="modify">
            <a-button
              type="default"
              :style="{background: '#f50', color: '#fff', border: 'none'}"
              size="small"
              icon="gift"
              @click="(showModalPromotion(modify.TourID))"
            ></a-button>
            <a-popconfirm
              title="Bạn đồng ý xóa tour này?"
              @confirm="deleteTour(modify.TourID)"
              @cancel="cancel"
              okText="Đồng ý"
              cancelText="Không"
            >
              <span>
                <a-button size="small" type="danger" icon="delete"></a-button>
              </span>
            </a-popconfirm>
          </template>
        </a-table>
      </div>
    </div>
    <a-modal
      :title="editMode ? 'Sửa thông tin Tour' : 'Thêm mới Tour'"
      v-model="visible"
      @ok="submitForm"
      :width="760"
      :maskClosable="false"
      okText="Hoàn tất"
      cancelText="Hủy bỏ"
    >
      <b-form-group label="Tên Tour:">
        <a-input size="large" v-model="formData.TourName" placeholder="Nhập tên tour"/>
      </b-form-group>
      <b-form-group label="Mô tả ngắn">
        <a-input
          size="large"
          v-model="formData.TourDescription"
          placeholder="Nhập mô tả ngắn về Tour"
        />
      </b-form-group>
      <b-row>
        <b-col md="6">
          <b-form-group label="Ngày bắt đầu">
            <a-date-picker
              format="YYYY-MM-DD HH:mm:ss"
              :disabledDate="disabledDate"
              :disabledTime="disabledDateTime"
              :showTime="{ defaultValue: moment('00:00:00', 'HH:mm:ss') }"
              size="large"
              style="width: 100%;"
              v-model="formData.DateDeparture"
            />
          </b-form-group>
        </b-col>
        <b-col md="6">
          <b-form-group label="Ngày kết thúc">
            <a-date-picker
              format="YYYY-MM-DD HH:mm:ss"
              :disabledDate="disabledDate"
              :disabledTime="disabledDateTime"
              :showTime="{ defaultValue: moment('00:00:00', 'HH:mm:ss') }"
              size="large"
              style="width: 100%;"
              v-model="formData.DateBack"
            />
          </b-form-group>
        </b-col>
      </b-row>
      <b-form-group label="Lưu ý">
        <a-textarea
          v-model="formData.Note"
          placeholder="Những chú yếu về Tour"
          :autosize="{ minRows: 2, maxRows: 6 }"
        />
      </b-form-group>
      <b-form-group>
        <div class="clearfix">
          <a-upload
            action="/api/uploadJson"
            listType="picture-card"
            :fileList="formData.ImageUrl"
            @preview="handlePreview"
            @change="handleChangeImage"
            v-model="formData.ImageUrl"
          >
            <div v-if="formData.ImageUrl.length < 5">
              <a-icon type="plus"/>
              <div class="ant-upload-text">Upload</div>
            </div>
          </a-upload>
          <a-modal :visible="previewVisible" :footer="null" @cancel="handleCancel">
            <img alt="example" style="width: 100%" :src="previewImage">
          </a-modal>
        </div>
      </b-form-group>
      <b-row>
        <b-col md="4">
          <b-form-group label="Số lượng người">
            <a-input-number
              size="large"
              :min="1"
              :max="100000"
              :defaultValue="3"
              @change="onChangePerson"
              style="width:100%;"
              v-model="formData.NumberPerson"
            />
          </b-form-group>
        </b-col>
        <b-col md="4">
          <b-form-group label="Giá người lớn (VND)">
            <a-input v-model="formData.PriceAdult" size="large" placeholder="Giá người lớn"/>
          </b-form-group>
        </b-col>
        <b-col md="4">
          <b-form-group label="Giá trẻ nhỏ (VND)">
            <a-input v-model="formData.PriceKid" size="large" placeholder="Giá trẻ nhỏ"/>
          </b-form-group>
        </b-col>
      </b-row>
      <b-row>
        <b-col md="4">
          <b-form-group label="Lịch trình">
            <a-input-search
              placeholder="Nhập mã lịch trình"
              style="width: 100%;"
              @search="handleSchedule"
            />
          </b-form-group>
        </b-col>
        <b-col md="8">
          <b-form-group label="Mô tả">
            <a-textarea placeholder="Nội dung lịch trình..." :rows="4" :value="DataSchedule.length > 0 ? DataSchedule[0].Contents : ''" />
          </b-form-group>
        </b-col>
      </b-row>
    </a-modal>
    <a-modal
      title="Khuyến mãi"
      v-model="hidenModal"
      @ok="addPromotion"
      okText="Áp dụng khuyến mãi"
      cancelText="Hủy bỏ"
    >
      <b-form-group label="Khuyến mãi">
        <a-select
          showSearch
          :value="value"
          placeholder="Tìm khuyến mãi"
          style="width: 100%"
          size="large"
          :defaultActiveFirstOption="false"
          :showArrow="false"
          :filterOption="false"
          @search="handleSearch"
          @change="handleChange"
          :notFoundContent="null"
          v-model="promotionData.PromotionID"
        >
          <a-select-option v-for="d in dataSelectbox" :key="d.value">{{d.text}}</a-select-option>
        </a-select>
      </b-form-group>
      <b-row>
        <b-col md="6">
          <b-form-group label="Phần trăm">
            <a-input-number
              :defaultValue="10"
              :min="0"
              :max="100"
              :formatter="value => `${value}%`"
              :parser="value => value.replace('%', '')"
              style="width: 100%;"
              size="large"
              v-model="promotionData.Discount"
            />
          </b-form-group>
        </b-col>
        <b-col md="6">
          <b-form-group label="Ngày hết hạn">
            <a-date-picker
              format="YYYY-MM-DD HH:mm:ss"
              :disabledDate="disabledDate"
              :disabledTime="disabledDateTime"
              :showTime="{ defaultValue: moment('00:00:00', 'HH:mm:ss') }"
              size="large"
              style="width: 100%;"
              v-model="promotionData.ExpriedDate"
            />
          </b-form-group>
        </b-col>
      </b-row>
    </a-modal>
  </div>
</template>
<script src="./Tour.js"></script>