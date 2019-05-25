<template>
  <div class="reviews-manager">
    <div class="card">
      <div class="card-body">
        <!-- title -->
        <div class="d-md-flex align-items-center">
          <div>
            <h4 class="card-title">
              <a-icon type="global" class="mr-2"/>Quản lý bình luận
            </h4>
            <h5 class="card-subtitle">Danh sách bình luận</h5>
          </div>
          <div class="ml-auto">
            <a-input-search
              placeholder="Tìm bình luận"
              style="width: 250px"
              @search="searchReview"
            />
          </div>
        </div>
        <!-- title -->
      </div>
    </div>
    <div class="card">
      <div class="card-body">
        <!-- title -->
        <div class="d-md-flex align-items-center justify-content-center mb-3">
          <div>
            <a-radio-group defaultValue="all" buttonStyle="solid" @change="changeTypeReview">
              <a-radio-button value="all">Tất cả</a-radio-button>
              <a-radio-button value="spam">Chưa duyệt</a-radio-button>
              <a-radio-button value="approved">Đã duyệt</a-radio-button>
            </a-radio-group>
          </div>
        </div>
        <!-- title -->
        <a-table
          :columns="columns"
          :rowKey="record => record.ReviewID"
          :dataSource="data"
          :pagination="pagination"
          :loading="loading"
          @change="handleTableChange"
        >
          <template slot="content" slot-scope="content">
            {{content.Contents | truncate(80)}}
            <span>
              <a href>{{content.tour.TourName}}</a>
            </span>
          </template>
          <template slot="dayCreate" slot-scope="dayCreate">{{dayCreate | myDate}}</template>
          <template slot="createBy" slot-scope="createBy">
            <a-avatar icon="user" :src="'/images/'+createBy.user.photo" class="mr-3"/>
            <a href="#">{{createBy.user.name | upText}}</a>
          </template>
          <template
            slot="approveBy"
            slot-scope="approveBy"
          >{{ approveBy ? approveBy : 'Chưa duyệt' }}</template>
          <template slot="modify" slot-scope="modify">
            <a-button type="primary" size="small">
              <a-icon type="edit"/>
            </a-button>
            <a-popconfirm
              title="Bạn đồng ý xóa nhận xét này?"
              @confirm="deleteReview(modify.ReviewID)"
              okText="Đồng ý"
              cancelText="Không"
              size="small"
            >
              <span>
                <a-button size="small" type="danger" icon="delete"></a-button>
              </span>
            </a-popconfirm>
          </template>
        </a-table>
      </div>
    </div>
  </div>
</template>
<script src="./Review.js"></script>
<style scoped>
</style>
