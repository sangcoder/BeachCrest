import DashboardMember from '../Dashboard/components/DashboardMember.vue'
export default [
  {
    path: '/member/client',
    name: 'DashboardMember',
    component: DashboardMember,
    meta: { isRoles: 1, label: 'Dashboard' }
  }
]
