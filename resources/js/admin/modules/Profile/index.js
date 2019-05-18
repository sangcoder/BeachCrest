import MainProfile from './components/index.vue'
import Profile from './components/Profile.vue'
import ChangePassword from './components/ChangePassword.vue'

export default [
  {
    path: '/admin/profile',
    name: 'Account',
    component: MainProfile,
    redirect: '/admin/thong-tin-tai-khoan.html',
    meta: {isRoles: 2},
    children: [
      {
        path: '/admin/thong-tin-tai-khoan.html',
        name: 'Profile',
        component: Profile,
        meta: {isRoles: 2}
      },
      {
        path: 'admin/changpassword',
        name: 'ChangePassword',
        component: ChangePassword,
        meta: {isRoles: 2}
      }
    ]
  }
]
