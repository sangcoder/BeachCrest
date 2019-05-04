export default {
  items: [
    {
      name: 'Bảng điều khiển',
      url: '/admin/dashboard',
      icon: 'icon-speedometer',
      isRoles: 2
    },
    {
      name: 'Quản lý tài khoản',
      icon: 'icon-user',
      children: [
        {
          name: 'Danh sách',
          url: '/admin/danh-sach-tai-khoan.html',
          icon: 'icon-list'
        },
        {
          name: 'Phân quyền',
          url: '/admin/phan-quyen.html',
          icon: 'icon-user-following'
        }
      ]
    }, 
    {
      name: 'Quản lý Tour',
      icon: 'icon-grid',
      children: 
      [
        {
          name: 'Danh sách Tour',
          url: '/admin/danh-sach-tour.html',
          icon: 'icon-list'
        },
        {
          name: 'Quản lý Booking',
          url: '/admin/quan-ly-booking.html',
          icon: 'icon-notebook'
        },
        {
          name: 'Lịch trình',
          url: '/admin/quan-ly-lich-trinh.html',
          icon: 'icon-calendar'
        }
      ]
    },
    {
      name: 'Quản lý Review',
      icon: 'icon-badge',
      children: [
        {
          name: 'Danh sách Review',
          icon: 'icon-list'
        }
      ]
    },
    {
      name: 'Quản lý điểm đến',
      icon: 'icon-map',
      children: 
      [
        {
        name: 'Điểm đến',
        icon: 'icon-direction',
        url: '/admin/danh-sach-diem-den.html'
        }
      ]
    },
    {
      name: 'Thống kê',
      icon: 'icon-pie-chart',
      children: 
      [
        {
          name: 'Doanh thu',
          icon: 'icon-fire',
          url: '/admin/thong-ke-doanh-thu.html'
        },
        {
          name: 'Lượng khách',
          icon: 'icon-graph',
          url: '/admin/thong-ke-luong-khach.html'
        }
      ]
    },
    {
      name: 'Đổi mật khẩu',
      icon: 'icon-settings',
      url: '/admin/change-password'
    },
    {
      name: 'Đăng xuất',
      icon: 'icon-logout',
      url: 'admin/logout'
    }
  ]
}
