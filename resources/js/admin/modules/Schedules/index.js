import Schedule from './components/Schedules'

export default [
  {
    path: '/admin/danh-sach-lich-trinh.html',
    name: 'listSchedules',
    component: Schedule,
    meta: {isRoles: 2, label: 'Danh sách lịch trình'}
  }
]
