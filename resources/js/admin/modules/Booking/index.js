import Booking from './components/Booking'

export default [
  {
    path: '/admin/danh-sach-booking.html',
    name: 'listBooking',
    component: Booking,
    meta: {isRoles: 2, label: 'Danh sách Booking'}
  }
]
