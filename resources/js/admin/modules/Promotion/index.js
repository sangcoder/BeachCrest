import PromotionComponent from '../Promotion/components/Promotion.vue'

export default [
  {
    path: '/admin/khuyen-mai.html',
    name: 'listPromotion',
    meta: {isRoles: 2, label: 'Quản lý khuyến mãi'},
    component: PromotionComponent
  }
]
