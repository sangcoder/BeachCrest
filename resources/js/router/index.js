import Vue from 'vue'
import Router from 'vue-router'
import NProgress from 'nprogress'
// Import Component
import Page404 from '../pages/Page404.vue'
import Admin from '../pages/admin.vue'
import Login from '../pages/login.vue'
import store from '../store/index'

// import module admin
import User from '../admin/modules/User'
import Destination from '../admin/modules/Destinations'
import Promotion from '../admin/modules/Promotion'
import TourGuider from '../admin/modules/TourGuiders'
// Yêu cầu có quyền mới được vào
// function requireAuth (from, to,  next) {
//   if (store.get('user/user') && store.get('user/user').id) {
//     next()
//   } else {
//     next('/admin/login')
//   }
// }
function requireAuth (to, from, next) {
  if (store.get('user/user') && store.get('user/user').id && store.get('user/user').permistion.some(item => item.permission_id === to.meta.isRoles)) {
    next()
  } else {
    if (store.get('user/userLoadStatus') === 3) {
      next('/admin/login')
    } else {
      store.dispatch('user/getUser')
      store.watch(store.getters['user/getUserLoadStatus'], n => {
        if (store.get('user/userLoadStatus') === 2) {
          if (store.get('user/user') && store.get('user/user').permistion && store.get('user/user').permistion.length > 0 && store.get('user/user').permistion.some(item => item.permission_id === to.meta.isRoles)) {
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
  if (store.get('user/user') && store.get('user/user').id && store.get('user/user').id && store.get('user/user').permistion.some(item => item.permission_id === to.meta.isRoles)) {
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
const router = new Router({
  mode: 'history',
  linkActiveClass: 'active',
  routes: [
    {
      path: '/admin',
      name: 'Admin',
      component: Admin,
      meta: {isRoles: 2},
      beforeEnter: requireAuth,
      children: [...User, ...Destination, ...Promotion, ...TourGuider]
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
router.beforeResolve((to, from, next) => {
  if (to.name) {
    NProgress.start()
  }
  next()
})

router.afterEach((to, from) => {
  setTimeout(() => {
    NProgress.done()
  }, 2000)
})

export default router
