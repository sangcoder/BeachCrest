export default {
  items: [
    {
      name: 'Bảng điều khiển',
      url: '/admin/dashboard',
      icon: 'icon-speedometer',
      isRoles: 1
    },
    {
      name: 'Thông tin tài khoản',
      url: '/auth/thong-tin-tai-khoan.html',
      icon: 'icon-user',
      isRoles: 1
    },
    {
      name: 'Quản lý tài khoản',
      icon: 'icon-user',
      isRoles: 2,
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
      isRoles: 2,
      children:
      [
        {
          name: 'Danh sách Tour',
          url: '/admin/danh-sach-tour.html',
          icon: 'icon-list',
          isRoles: 2
        },
        {
          name: 'Quản lý Booking',
          url: '/admin/danh-sach-booking.html',
          icon: 'icon-notebook',
          isRoles: 2
        },
        {
          name: 'Lịch trình',
          url: '/admin/danh-sach-lich-trinh.html',
          icon: 'icon-calendar',
          isRoles: 2
        }
      ]
    },
    {
      name: 'Quản lý Review',
      url: '/admin/quan-ly-binh-luan.html',
      icon: 'icon-badge',
      isRoles: 2
    },
    {
      name: 'Quản lý điểm đến',
      icon: 'icon-map',
      isRoles: 2,
      children:
      [
        {
          name: 'Điểm đến',
          icon: 'icon-direction',
          url: '/admin/danh-sach-dia-diem.html'
        },
        {
          name: 'Danh lam thắng cảnh',
          icon: 'icon-direction',
          url: '/admin/danh-lam-thang-canh.html'
        }
      ]
    },
    {
      name: 'Quản lý khuyến mãi',
      icon: 'icon-options-vertical',
      isRoles: 2,
      url: '/admin/khuyen-mai.html'
    },
    {
      name: 'Hướng dẫn viên',
      icon: 'icon-info',
      isRoles: 2,
      url: '/admin/huong-dan-vien.html'
    },
    {
      name: 'Quản lý tin tức',
      icon: 'icon-info',
      isRoles: 2,
      url: '/admin/quan-ly-tin-tuc.html'
    },
    {
      name: 'Thống kê',
      icon: 'icon-pie-chart',
      isRoles: 2,
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
