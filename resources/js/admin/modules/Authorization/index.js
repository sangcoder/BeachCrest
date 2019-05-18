import Authorization from './components/Authorization.vue'

export default [
  {
    path: '/admin/phan-quyen.html',
    name: 'Authorization',
    component: Authorization,
    meta: {isRoles: 2, label: 'Phân quyền'}
  }
]
