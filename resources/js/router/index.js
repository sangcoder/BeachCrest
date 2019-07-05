import Vue from 'vue'
import Router from 'vue-router'
import NProgress from 'nprogress'
// Import page
import Page404 from '../pages/Page404.vue'
import Admin from '../pages/admin.vue'
import Login from '../pages/login.vue'
import Register from '../pages/Register.vue'
import store from '../store/index'
import Client from '../pages/Client.vue'
import ActiveMember from '../pages/ActiveMember.vue'
import ForgotPassword from '../pages/ForgotPassword.vue'
import PasswordReset from '../pages/PasswordReset.vue'

// import module admin
import User from '../admin/modules/User'
import Destination from '../admin/modules/Destinations'
import Promotion from '../admin/modules/Promotion'
import TourGuider from '../admin/modules/TourGuiders'
import Cultures from '../admin/modules/Cultures'
import Dashboard from '../admin/modules/Dashboard'
import DashboardMember from '../admin/modules/Dashboard/member'
import Authorization from '../admin/modules/Authorization'
import Tour from '../admin/modules/Tours'
import Schedule from '../admin/modules/Schedules'
import Review from '../admin/modules/Reviews'
import BookingManga from '../admin/modules/Booking'
import NewManger from '../admin/modules/News'
import HistoryBooking from '../admin/modules/Profile/components/HistoryBooking.vue'
import MainStatics from '../admin/modules/Statics'
// Import profile
import Profile from '../admin/modules/Profile'
// Import Client Module
import Home from '../frontend/modules/Home'
import Detail from '../frontend/modules/Detail'
import Booking from '../frontend/modules/Booking'
import Search from '../frontend/modules/Search'
import ViewNew from '../frontend/modules/News'

function requireAuth (to, from, next) {
  if (store.get('user/user') && store.get('user/user').id && store.get('user/user').permistion.some(item => item.role_id === to.meta.isRoles)) {
    next()
  } else {
    if (store.get('user/userLoadStatus') === 3) {
      next('/auth/login')
    } else {
      store.dispatch('user/getUser')
      store.watch(store.getters['user/getUserLoadStatus'], n => {
        if (store.get('user/userLoadStatus') === 2) {
          if (store.get('user/user') && store.get('user/user').permistion && store.get('user/user').permistion.length > 0 && store.get('user/user').permistion.some(item => item.role_id === to.meta.isRoles)) {
            next()
          } else {
            next('/404')
          }
        } else if (store.get('user/userLoadStatus') === 3) {
          next('/auth/login')
        }
      })
    }
  }
}

// Ko yêu cầu quyền
function requireNonAuth (to, from, next) {
  if (store.get('user/user') && store.get('user/user').id && store.get('user/user').permistion.some(item => item.role_id === to.meta.isRoles)) {
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

// Check login in homepage
function nonRequire (from, to, next) {
  if (store.get('user/userLoadStatus') === 3) {
    next()
  } else {
    store.dispatch('user/getUser')
    store.watch(store.getters['user/getUserLoadStatus'], n => {
      if (store.get('user/userLoadStatus') === 2) {
        next()
      } else if (store.get('user/userLoadStatus') === 3) {
        next()
      }
    })
  }
}

Vue.use(Router)
const router = new Router({
  mode: 'history',
  scrollBehavior: () => ({ y: 0 }),
  linkActiveClass: 'active',
  routes: [
    {
      path: '/',
      name: 'Home',
      component: Client,
      redirect: '/index.html',
      beforeEnter: nonRequire,
      children: [ ...Home, ...Detail, ...Booking, ...Search, ...ViewNew ]
    },
    {
      path: '/admin',
      name: 'Admin',
      redirect: '/admin/dashboard',
      component: Admin,
      meta: {isRoles: 2},
      beforeEnter: requireAuth,
      children: [...Dashboard, ...User, ...Authorization,
        ...Destination, ...Promotion, ...TourGuider,
        ...Cultures, ...Tour, ...Schedule, ...Review, ...BookingManga, ...NewManger, ...MainStatics
      ]
    },
    {
      path: '/member',
      name: 'MemberArea',
      redirect: '/member/client',
      component: Admin,
      meta: {isRoles: 1},
      beforeEnter: requireAuth,
      children: [...DashboardMember, ...Profile, {
        path: '/auth/lich-su-booking.html',
        name: 'historyBooking',
        component: HistoryBooking,
        meta: {isRoles: 1}
      }]
    },
    {
      path: '/404',
      name: 'Page404',
      component: Page404
    },
    {
      path: '/auth/login',
      name: 'Login',
      beforeEnter: requireNonAuth,
      component: Login
    },
    {
      path: '/auth/register',
      name: 'Register',
      component: Register
    },
    {
      path: '/auth/active/:token',
      name: ActiveMember,
      component: ActiveMember
    },
    {
      path: '/forgot/password',
      name: 'ForgotPassword',
      component: ForgotPassword
    },
    {
      path: '/reset-password/:token',
      name: 'ResetPassword',
      component: PasswordReset
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
