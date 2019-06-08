import SearchTour from './SearchTour'
import moment from 'moment'
import TourAPI from '../tourServices'
import Axios from 'axios'
import Multiselect from 'vue-multiselect'

const columns = [
  {
    title: 'ID',
    dataIndex: 'TourID',
    sorter: true,
    width: '2%'
  },
  {
    title: 'Image',
    scopedSlots: { customRender: 'Image' }
  },
  {
    title: 'Name',
    // dataIndex: 'TourName',
    width: '25%',
    scopedSlots: { customRender: 'TourName' }
  },
  {
    title: 'Thời gian',
    dataIndex: 'TourTime',
    width: '15%'
  },
  // {
  //   title: 'Ngày bắt đầu',
  //   dataIndex: 'DateDeparture',
  //   filters: [
  //     { text: 'Mới nhất', value: 'lastest' },
  //     { text: 'Cũ nhất', value: 'oldest' }
  //   ]
  // },
  // {
  //   title: 'Ngày kết thúc',
  //   dataIndex: 'DateBack',
  //   scopedSlots: { customRender: 'DateBack' }
  // },
  {
    title: 'Người',
    slots: { title: 'customTitle' },
    dataIndex: 'NumberPerson',
    sorter: true
  },
  {
    title: 'Người lớn',
    dataIndex: 'PriceAdult',
    scopedSlots: { customRender: 'priceAdult' }
  },
  {
    title: 'Trẻ nhỏ',
    dataIndex: 'PriceKid',
    scopedSlots: { customRender: 'priceKid' }
  },
  {
    title: 'KM',
    dataIndex: 'Discount',
    scopedSlots: { customRender: 'discount' }
  },
  {
    title: 'Modify',
    scopedSlots: { customRender: 'modify' },
    width: '12%'
  }
]
// Debounce function search ajax
let timeout
let currentValue

function fetchPromotion (value, callback) {
  if (timeout) {
    clearTimeout(timeout)
    timeout = null
  }
  currentValue = value
  function fakeRequest () {
    Axios.get('/api/promotion/search?q=' + value).then(res => {
      if (currentValue === value) {
        const result = res.data.data
        const data = []
        result.forEach(r => {
          data.push({
            value: r.PromotionID,
            text: r.Contents
          })
        })
        callback(data)
      }
    })
  }
  timeout = setTimeout(fakeRequest, 300)
}

export default {
  components: {
    SearchTour,
    Multiselect
  },
  data () {
    return {
      pagination: {
        showQuickJumper: true,
        showSizeChanger: true,
        pageSizeOptions: ['10', '20', '30', '40'],
        showTotal: total => `Total ${total} items`,
        showSizeChange: (current, pageSize) => (this.pageSize = pageSize)
      },
      isLoading: false,
      editMode: false,
      loading: false,
      data: [],
      selectedValue: [],
      visible: false,
      columns,
      deleteMoreButton: false,
      selectedRowKeys: [],
      previewVisible: false,
      previewImage: '',
      hidenModal: false,
      dataSelectbox: [],
      AllSchedule: [],
      options: [],
      list: [],
      ContentSchedule: '',
      value: undefined,
      formData: {
        TourID: '',
        TourName: '',
        TourDescription: '',
        DateDeparture: moment(),
        DateBack: moment(),
        Note: '',
        ImageUrl: [],
        NumberPerson: 0,
        PriceAdult: '',
        PriceKid: '',
        Unit: 'VND',
        ScheduleId: ''
      },
      promotionData: {
        PromotionID: '',
        TourID: '',
        Discount: 0,
        ExpriedDate: moment()
      }
    }
  },
  created () {
    this.fetchTour()
  },
  methods: {
    moment,
    filterOption (input, option) {
      return (
        option.componentOptions.children[0].text
          .toUpperCase()
          .indexOf(input.toUpperCase()) >= 0
      )
    },
    range (start, end) {
      const result = []
      for (let i = start; i < end; i++) {
        result.push(i)
      }
      return result
    },
    fetchTour (page) {
      this.loading = true
      TourAPI.getListTour(page).then(res => {
        this.loading = false
        this.data = res.data.data
        const pagination = { ...this.pagination }
        pagination.total = res.data.meta.total
        pagination.pageSize = res.data.meta.per_page
        this.pagination = pagination
      })
    },
    handleTableChange (pagination, filters, sorter) {
      const pager = { ...this.pagination }
      pager.current = pagination.current
      this.pagination = pager
      this.loading = true
      let params = {
        orderById: sorter.order,
        orderByDeparture: filters.DateDeparture
      }
      TourAPI.getListTour(this.pagination.current, params).then(res => {
        this.data = res.data.data
        this.loading = false
      })
    },
    fetchSchedules () {
      TourAPI.getAllSchedule().then(res => {
        this.AllSchedule = res.data.data
      })
    },
    fetchCulture () {
      TourAPI.getListCulture().then(res => {
        this.options = res.data.data
      })
    },
    onSelectChange (selectedRowKeys) {
      this.selectedRowKeys = selectedRowKeys
    },
    selectAll (selected, selectedRows, changeRows) {
      if (selected) {
        this.deleteMoreButton = true
      } else {
        this.deleteMoreButton = false
      }
    },
    handleListSchedule (value) {
      this.AllSchedule.forEach((item, index) => {
        if (item.id === value) {
          this.ContentSchedule = item.Contents
        }
      })
    },
    showModalPromotion (id) {
      this.hidenModal = true
      this.promotionData.TourID = id
    },
    addTour () {
      this.visible = true
      this.editMode = false
      this.fetchSchedules()
      this.fetchCulture()
      // Clear field
      this.formData.TourName = ''
      this.formData.TourDescription = ''
      this.formData.DateDeparture = moment()
      this.formData.DateBack = moment()
      this.formData.Note = ''
      this.formData.ImageUrl = []
      this.formData.NumberPerson = ''
      this.formData.PriceAdult = ''
      this.formData.PriceKid = ''
      this.formData.Price = ''
    },
    deleteTour (id) {
      TourAPI.deleteTour(id).then(res => {
        this.$message.success('Xóa thành công!')
        this.fetchTour(this.pagination.current)
      })
    },
    updateTour (tour) {
      this.visible = true
      this.editMode = true
      this.fetchSchedules()
      this.fetchCulture()
      this.formData.TourID = tour.TourID
      this.formData.TourName = tour.TourName
      this.formData.TourDescription = tour.TourDescription
      this.formData.DateDeparture = moment(tour.DateDeparture)
      this.formData.DateBack = moment(tour.DateBack)
      this.formData.Note = tour.Note
      this.formData.NumberPerson = tour.NumberPerson
      this.formData.PriceAdult = tour.PriceAdult
      this.formData.PriceKid = tour.PriceKid
      let fl = JSON.parse(tour.ImageUrl)
      this.formData.ImageUrl = []
      fl.forEach((item, index) => {
        this.formData.ImageUrl.push({
          uid: index,
          name: item,
          status: 'done',
          url: '/images/tour/' + item,
          thumbUrl: '/images/tour/' + item
        })
      })
    },
    submitForm () {
      // cui bap
      let payload = {
        TourName: this.formData.TourName,
        TourDescription: this.formData.TourDescription,
        DateDeparture: moment(this.formData.DateDeparture).format(
          'YYYY-MM-DD HH:mm:ss'
        ),
        DateBack: moment(this.formData.DateBack).format('YYYY-MM-DD HH:mm:ss'),
        Note: this.formData.Note,
        ImageUrl: this.formData.ImageUrl,
        NumberPerson: this.formData.NumberPerson,
        PriceAdult: this.formData.PriceAdult,
        PriceKid: this.formData.PriceKid,
        Unit: this.formData.Unit,
        ScheduleId: this.formData.ScheduleId,
        ListCultures: this.selectedValue
      }
      if (!this.editMode) {
        TourAPI.addNewTour(payload).then(res => {
          this.visible = false
          this.fetchTour(this.pagination.current)
          this.$message.success('Thêm thành công')
        })
      } else {
        TourAPI.updateTour(this.formData.TourID, payload).then(res => {
          this.visible = false
          this.fetchTour(this.pagination.current)
          this.$message.success('Sửa thành công')
        })
      }
    },
    exportTour () {},
    deleteMore () {},
    addPromotion () {
      let payload = {
        PromotionID: this.promotionData.PromotionID,
        TourID: this.promotionData.TourID,
        Discount: this.promotionData.Discount,
        ExpriedDate: moment(this.promotionData.ExpriedDate).format('YYYY-MM-DD HH:mm:ss')
      }
      TourAPI.addPromotion(this.promotionData.TourID, payload).then(res => {
        this.hidenModal = false
        this.fetchTour(this.pagination.current)
        this.$message.success('Thêm khuyến mãi thành công')
      })
    },
    disabledDate (current) {
      // Can not select days before today and today
      return current && current < moment().startOf('day')
    },
    disabledDateTime () {
      return {
        // disabledHours: () => this.range(0, 24).splice(4, 20),
        // disabledMinutes: () => this.range(30, 60),
        // disabledSeconds: () => [55, 56]
      }
    },
    handleCancel () {
      this.previewVisible = false
    },
    handlePreview (file) {
      this.previewImage = file.url || file.thumbUrl
      this.previewVisible = true
    },
    handleChangeImage ({ fileList }) {
      // this.fileList = fileList
      this.formData.ImageUrl = fileList
    },
    // Search khuyến mãi
    handleSearch (value) {
      fetchPromotion(value, data => (this.dataSelectbox = data))
    },
    handleChange (value) {
      this.value = value
      fetchPromotion(value, data => (this.dataSelectbox = data))
    },
    onChangePerson () {},
    cancel () {}
  }
}
