import User from './components/User.vue'
export default [
  {
    path: '/admin/danh-sach-tai-khoan.html',
    name: 'UserInfo',
    component: User,
    meta: { isRoles: 2, label: 'Danh sách tài khoản' }
  }
]
