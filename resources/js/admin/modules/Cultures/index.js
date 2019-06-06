import Cultures from '../Cultures/components/Cultures.vue'
import AddCultures from '../Cultures/components/AddCulture.vue'

export default [
  {
    path: '/admin/danh-lam-thang-canh.html',
    name: 'listCultures',
    meta: {isRoles: 2, label: 'Danh sách danh lam thắng cảnh'},
    component: Cultures
  },
  {
    path: '/admin/danh-lam.html',
    name: 'editCultures',
    meta: {isRoles: 2, label: 'Chỉnh sửa danh lam'},
    component: AddCultures
  }
]
