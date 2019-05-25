import Review from './components/ReviewManager.vue'
export default [
  {
    path: '/admin/quan-ly-binh-luan.html',
    name: 'listReview',
    component: Review,
    meta: {isRoles: 2, label: 'Quản lý bình luận'}
  }
]
