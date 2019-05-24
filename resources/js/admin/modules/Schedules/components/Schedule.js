import ScheduleAPI from '../scheduleServices'
import moment from 'moment'

const columns = [
  {
    title: 'ID',
    dataIndex: 'id',
    sorter: true
  },
  {
    title: 'Lịch trình',
    scopedSlots: { customRender: 'Contents' },
    width: '30%'
  },
  {
    title: 'Ngày Tạo',
    dataIndex: 'created_at',
    scopedSlots: { customRender: 'createAt' }
  },
  {
    title: 'Cập nhật',
    dataIndex: 'updated_at',
    scopedSlots: { customRender: 'updateAt' }
  },
  {
    title: 'Modify',
    scopedSlots: { customRender: 'modify' },
    width: '15%'
  }
]
export default {
  data () {
    return {
      data: [],
      pagination: {
        showQuickJumper: true,
        showSizeChanger: true,
        pageSizeOptions: ['10', '20', '30', '40'],
        showTotal: total => `Total ${total} items`,
        showSizeChange: (current, pageSize) => (this.pageSize = pageSize)
      },
      loading: false,
      visibleSchedule: false,
      visibleGuider: false,
      columns,
      editMode: false,
      listGuider: [],
      selectedRowKeys: [],
      listGuiderID: [],
      formData: {
        id: '',
        Contents: ''
      },
      formScheduleGuider: {
        GuiderID: '',
        StartTime: moment(),
        EndTime: moment(),
        Contents: ''

      }
    }
  },
  created () {
    this.fetchSchedule()
  },
  methods: {
    moment,
    fetchSchedule (page) {
      this.loading = true
      ScheduleAPI.getListSchedules(page).then(res => {
        const pagination = { ...this.pagination }
        pagination.total = res.data.meta.total
        this.pagination = pagination
        this.data = res.data.data
        this.loading = false
        this.loading = false
      })
    },
    handleTableChange (pagination, filters, sorter) {
      const pager = { ...this.pagination }
      pager.current = pagination.current
      this.pagination = pager
      this.loading = true
      let params = {
        orderById: sorter.order
      }
      ScheduleAPI.getListSchedules(this.pagination.current, params).then(
        res => {
          this.data = res.data.data
          this.loading = false
        }
      )
    },
    submitSchedule () {
      let payload = {
        Contents: this.formData.Contents
      }
      if (!this.editMode) {
        ScheduleAPI.addSchedule(payload).then(res => {
          this.visibleSchedule = false
          this.$message.success('Thêm lịch trình thành công')
          this.fetchSchedule(this.pagination.current)
        })
      } else {
        ScheduleAPI.updateSchedule(this.formData.id, payload).then(res => {
          this.visibleSchedule = false
          this.$message.success('Sửa lịch trình thành công!')
          this.fetchSchedule(this.pagination.current)
        })
      }
    },
    fetchGuider () {
      ScheduleAPI.getGuider().then(res => {
        this.listGuider = res.data.data
      })
    },
    fetchGuiderById (id) {
      ScheduleAPI.getListGuiderById(id).then(res => {
        this.listGuiderID = res.data.data
      })
    },
    addGuiderModal (schedule) {
      this.visibleGuider = true
      this.formData.id = schedule.id
      this.fetchGuider()
      this.fetchGuiderById(schedule.id)
    },
    addGuiderSchedule () {
      let payload = {
        GuiderID: this.formScheduleGuider.GuiderID,
        StartTime: moment(this.formScheduleGuider.StartTime).format('YYYY-MM-DD HH:mm:ss'),
        EndTime: moment(this.formScheduleGuider.EndTime).format('YYYY-MM-DD HH:mm:ss'),
        Contents: this.formScheduleGuider.Contents
      }
      ScheduleAPI.addGuiderToSchedule(this.formData.id, payload).then(res => {
        this.fetchGuiderById(this.formData.id)
      })
    },
    addGuider () {

    },
    viewSchedule (item) {
      this.formScheduleGuider.GuiderID = item.GuiderID
      this.formScheduleGuider.StartTime = moment(item.StartTime)
      this.formScheduleGuider.EndTime = moment(item.EndTime)
      this.formScheduleGuider.Contents = item.Contents
    },
    onSelectChange (selectedRowKeys) {
      this.selectedRowKeys = selectedRowKeys
    },
    updateSchedule (schedule) {
      this.visibleSchedule = true
      this.editMode = true
      this.formData.Contents = schedule.Contents
      this.formData.id = schedule.id
    },
    deleteSchelduleGuider (idSchedule, idTourguider) {
      let payload = {
        GuiderID: idTourguider
      }
      ScheduleAPI.deleteGuiderToSchedule(idSchedule, payload).then(res => {
        this.$message.success('Đã xóa hướng dẫn viên ra khỏi lịch trình.')
        this.fetchGuiderById(this.formData.id)
      })
    },
    addSchedule () {
      this.visibleSchedule = true
      this.editMode = false
      this.formData.Contents = ''
    },
    deleteSchedule (id) {
      ScheduleAPI.deleteSchedule(id).then(res => {
        this.$message.success('Xóa thành công!')
        this.fetchSchedule(this.pagination.current)
      })
    },
    seachTourGuider (value) { },
    downloadExel () { },
    // Datepicker
    range (start, end) {
      const result = []
      for (let i = start; i < end; i++) {
        result.push(i)
      }
      return result
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
    }
  }
}
