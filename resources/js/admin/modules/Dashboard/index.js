import Dashboard from '../Dashboard/components/Dashboard.vue'

export default [
  {
    path: '/admin/Dashboard',
    name: 'Dashboard',
    component: Dashboard,
    meta: { isRoles: 2, label: 'Dashboard' }
  }
]
