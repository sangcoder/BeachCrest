import addDestination from '../Destinations/components/addDestination.vue'
import listDestiantion from '../Destinations/components/listDestination.vue'
export default[
  {
    path: '/admin/them-moi-dia-danh.html',
    name: 'AddDestiantion',
    meta: {isRoles: 2},
    component: addDestination
  },
  {
    path: '/admin/danh-sach-dia-danh.html',
    name: 'listDestination',
    meta: {isRoles: 2},
    component: listDestiantion
  }
]
