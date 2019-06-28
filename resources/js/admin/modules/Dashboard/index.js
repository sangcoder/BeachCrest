import Dashboard from '../Dashboard/components/Dashboard.vue'
export default [
  {
    path: '/admin/dashboard',
    name: 'Dashboard',
    component: Dashboard,
    meta: { isRoles: 2, label: 'Dashboard' }
  }
]
