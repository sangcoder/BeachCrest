import ReviewAPI from '../reviewsService'

const columns = [{
  title: 'ID',
  dataIndex: 'ReviewID',
  sorter: true,
  width: '3%'
},
{
  title: 'Đăng bởi',
  scopedSlots: {customRender: 'createBy'}
},
{
  title: 'Nội dung',
  scopedSlots: { customRender: 'content' },
  width: '40%'

}, {
  title: 'Ngày đăng',
  dataIndex: 'created_at',
  scopedSlots: { customRender: 'dayCreate' }

},
{
  title: 'Duyệt bởi',
  scopedSlots: { customRender: 'approveBy' }
},
{
  title: 'Thao tác',
  scopedSlots: {customRender: 'modify'}
}
]
export default {
  data () {
    return {
      loading: false,
      pagination: {
        showQuickJumper: true,
        showSizeChanger: true,
        pageSizeOptions: ['10', '20', '30', '40'],
        showTotal: total => `Total ${total} items`,
        showSizeChange: (current, pageSize) => (this.pageSize = pageSize)
      },
      data: [],
      columns
    }
  },
  created () {
    this.fetchReview()
  },
  methods: {
    handleTableChange (pagination, filters, sorter) {
      this.loading = true
      const pager = { ...this.pagination }
      pager.current = pagination.current
      this.pagination = pager
      ReviewAPI.getListReview(this.pagination.current).then(res => {
        this.data = res.data.data
        this.loading = false
      })
    },
    fetchReview (page, params = {}) {
      this.loading = true
      ReviewAPI.getListReview(page).then(res => {
        this.loading = false
        this.data = res.data.data
        const pagination = { ...this.pagination }
        pagination.total = res.data.meta.total
        pagination.pageSize = res.data.meta.per_page
        this.pagination = pagination
      })
    },
    changeTypeReview (value) {
      this.loading = true
      let params = {
        type: value.target.value
      }
      ReviewAPI.getListReview(1, params).then(res => {
        this.loading = false
        this.data = res.data.data
        const pagination = { ...this.pagination }
        pagination.total = res.data.meta.total
        this.pagination = pagination
      })
    },
    acceptComment (review) {
      this.loading = true
      let payload = {
        Contents: review.Contents,
        Rating: review.Rating,
        spam: review.spam,
        ApproveBy: this.$store.state.user.user.id
      }
      ReviewAPI.acceptReview(review.ReviewID, payload).then(res => {
        this.fetchReview(this.pagination.current)
        this.loading = false
      })
    },
    deleteReview (id) {
      this.loading = true
      ReviewAPI.deleteReview(id).then(res => {
        this.fetchReview(this.pagination.current)
        this.$message.success('Đã xóa bình luận')
        this.loading = false
      })
    },
    gotoTour (id) {
      window.open('/view?tour=' + id, '_blank')
    },
    searchReview (value) {
      this.loading = true
      ReviewAPI.getReviewByTour(value).then(res => {
        this.data = res.data.data
        const pagination = { ...this.pagination }
        pagination.total = res.data.meta.total
        this.pagination = pagination
        this.loading = false
      }).catch(err => {
        this.$message.error('ID Tour không hợp lệ!')
        this.loading = false
      })
    }
  }
}
