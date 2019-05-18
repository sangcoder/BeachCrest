import Booking from './components/Booking.vue'
import Tour from './components/TourComponents.vue'

export default [
  {
    path: '/admin/danh-sach-booking.html',
    name: 'listBooking',
    component: Booking,
    meta: {isRoles: 2, label: 'Danh sách Booking'}
  },
  {
    path: '/admin/danh-sach-tour.html',
    name: 'listTour',
    component: Tour,
    meta: {isRoles: 2, label: 'Danh sách Tour'}
  }
]
