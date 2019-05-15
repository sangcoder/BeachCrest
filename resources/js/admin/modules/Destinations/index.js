import addDestination from '../Destinations/components/addDestination.vue'
import listDestiantion from '../Destinations/components/listDestination.vue'
import editDestination from '../Destinations/components/editDestination.vue'
export default[
  {
    path: '/admin/danh-sach-dia-diem.html',
    name: 'listDestination',
    meta: {isRoles: 2, label: 'Danh sách địa điểm'},
    component: listDestiantion,
    props: true
  },
  {
    path: '/admin/them-moi-dia-diem.html',
    name: 'AddDestiantion',
    meta: {isRoles: 2, label: 'Thêm mới địa điểm'},
    component: addDestination
  },
  {
    path: '/admin/chinh-sua-dia-danh/:id',
    name: 'editDestination',
    meta: {isRoles: 2, label: 'Chỉnh sửa địa danh'},
    component: editDestination
  }
]
