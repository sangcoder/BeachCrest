import Vue from 'vue'
import Router from 'vue-router'
// Import Component
import Page404 from '../pages/Page404.vue'
import Admin from '../pages/admin.vue'
import Login from '../pages/login.vue'
import store from '../store/index'

// import module admin
import User from '../admin/modules/User'
import UserInfo from '../pages/UserInfo.vue'

import Destination from '../admin/modules/Destinations/components/listDestination.vue'
// Yêu cầu có quyền mới được vào
// function requireAuth (from, to,  next) {
//   if (store.get('user/user') && store.get('user/user').id) {
//     next()
//   } else {
//     next('/admin/login')
//   }
// }
function requireAuth (to, from, next) {
  if (store.get('user/user') && store.get('user/user').id) {
    next()
  } else {
    if (store.get('user/userLoadStatus') === 3) {
      next('/admin/login')
    } else {
      store.dispatch('user/getUser')
      store.watch(store.getters['user/getUserLoadStatus'], n => {
        if (store.get('user/userLoadStatus') === 2) {
          next()
        } else if (store.get('user/userLoadStatus') === 3) {
          next('/admin/login')
        }
      })
    }
  }
}

// Ko yêu cầu quyền
function requireNonAuth (to, from, next) {
  if (store.get('user/user') && store.get('user/user').id) {
    next('/admin')
  } else {
    if (store.get('user/userLoadStatus') === 3) {
      next()
    } else {
      store.dispatch('user/getUser')
      store.watch(store.getters['user/getUserLoadStatus'], n => {
        if (store.get('user/userLoadStatus') === 2) {
          next('/admin')
        } else if (store.get('user/userLoadStatus') === 3) {
          next()
        }
      })
    }
  }
}

// Yêu cầu quyền admin
// function requireAdmin (from, to, next) {
//   next()
// }

Vue.use(Router)

export default new Router({
  mode: 'history',
  linkActiveClass: 'active',
  routes: [
    {
      path: '/admin',
      name: 'Admin',
      component: Admin,
      beforeEnter: requireAuth,
      children: [...User,
        {
          path: '/admin/thong-tin-user.html',
          name: 'UserInfo',
          component: UserInfo
        },
        {
          path: '/admin/danh-sach-diem-den.html',
          name: 'Destination',
          component: Destination
        }
      ]
    },
    {
      path: '/admin/404',
      name: 'Page404',
      component: Page404
    },
    {
      path: '/admin/login',
      name: 'Login',
      beforeEnter: requireNonAuth,
      component: Login
    },
    {
      path: '*',
      name: '404',
      component: Page404
    }
  ]
})
