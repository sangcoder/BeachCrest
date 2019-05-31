import MainProfile from './components/index.vue'
import Profile from './components/Profile.vue'
import ChangePassword from './components/ChangePassword.vue'

export default [
  {
    path: '/auth/profile',
    name: 'Account',
    component: MainProfile,
    redirect: '/auth/thong-tin-tai-khoan.html',
    meta: {isRoles: 1},
    children: [
      {
        path: '/auth/thong-tin-tai-khoan.html',
        name: 'Profile',
        component: Profile,
        meta: {isRoles: 1}
      },
      {
        path: 'auth/changpassword',
        name: 'ChangePassword',
        component: ChangePassword,
        meta: {isRoles: 1}
      }
    ]
  }
]
