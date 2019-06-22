import NewsManager from '../News/Components/NewsManaga.vue'
import ModifyNews from '../News/Components/AddNews.vue'

export default [
  {
    path: '/admin/quan-ly-tin-tuc.html',
    name: 'NewsManager',
    meta: {isRoles: 2, label: 'Quản lý tin tức'},
    component: NewsManager
  },
  {
    path: '/admin/tin-tuc',
    name: 'modidfyNews',
    meta: {isRoles: 2, label: 'Bài viết'},
    component: ModifyNews
  }
]
