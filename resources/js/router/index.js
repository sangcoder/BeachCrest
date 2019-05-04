import Vue from 'vue'
import Router from 'vue-router'
// Import Component
import Page404 from '../pages/Page404.vue'
import Admin from '../pages/admin.vue'
import Login from '../pages/login.vue'
import store from '../store/index'

// import module admin
import User from '../admin/modules/User'
import Destination from '../admin/modules/Destinations'

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
          console.log('to', to)
          if (store.get('user/user').permistion.some(item => item.permission_id === to.meta.isRoles)) {
            next()
          } else {
            next('/admin/404')
          }
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
      children: [...User, ...Destination]
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
