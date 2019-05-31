<?php

namespace App\Enums;

use BenSampo\Enum\Enum;

final class PermissionType extends Enum
{
  // Các quyền
  const VIEW_USERS = 'Quản lý tài khoản';
  const DELETE_USERS = 'Xóa tài khoản';
  const PHANQUYENTK = 'Phân quyền tài khoản';
  const QUANLyTOUR = 'Quản lý Tour';
  const QUANLYLICHTRINH = 'Quản lý lịch trình';
  const QUANLYBOOKING = 'Quản lý Booking';
  const QUANLYNHANXET = 'Quản lý nhận xét';
  const KHONGKIEMDUYETNHANXET = 'Không kiểm duyệt nhận xét';
  const QUANLYDANHLAM = 'Quản lý danh lam thắng cảnh';
  const QUANLYDIEMDEN = 'Quản lý điểm đến';
  const QUANLYKHUYENMAI = 'Quản lý khuyến mãi';
  const QUANLYHUONGDANVIEN = 'Quản lý hướng dẫn viên';
  const THONGKE = 'Thống kê';
  const XEMTHONGTIN = 'Xem thông tin tài khoản';
}
