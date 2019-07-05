
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <meta http-equiv="x-ua-compatible" content="ie=edge">
  <meta name="csrf-token" content="{{ csrf_token() }}">

  <title>Hệ thống quản lý Tour BeachCrest</title>
  <link rel="stylesheet" href="{{ mix('backend/css/style.css') }}">
  <!-- Facebook Open Graph -->
  <meta property="og:type" content="website">
  <meta property="og:url" content="https://tourviet.online/">
  <meta property="og:title" content="Đặt tour online nhanh chóng, thuận lợi, chất lượng cao">
  <meta property="og:image" content="https://tourviet.online/images/tour/d797592ea70aaf578fae6891af909ff537275ec2.jpeg">
  <meta property="og:image" content="https://tourviet.online/images/tour/a34f323d7db8efa5686861e7f26aad8030f64d79.jpeg" />
  <meta property="og:image" content="https://tourviet.online/images/tour/82e52aa72542cec7c5a7ffb479dc6c4e4e6192c3.jpeg" />
  <meta property="og:description" content="Đặt tour online BeachCrest chuyên nghiệp, chất lượng cao, an toàn số một Việt Nam">
  <meta property="og:site_name" content="TourViet.Online">
  <meta property="og:locale" content="en_US">
  <meta property="fb:admins" content="100002802203533" />
  <meta name="keywords" content="Đặt tour, đặt tour Online, Tour du lịch nha trang, hòn chồng du dịch" />
  <!-- Google Font: Source Sans Pro -->
  {{-- <link href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,400i,700" rel="stylesheet"> --}}
  {{-- <script src="https://www.paypalobjects.com/api/checkout.js"> </script> --}}
  {{-- <script src="https://www.paypal.com/sdk/js?client-id=sb"></script> --}}

</head>
<body >
  
  <div id="app">
    <router-view></router-view>
  </div>
  <noscript>
    <div id="disable-javascript">
      <div class="d-table w-100 h-100">
        <div class="d-table-cell align-middle text-center">
          <div class="container">
            <h3>To use web better, please enable Javascript.</h3>
          </div>
        </div>
      </div>
    </div>
  </noscript>

<script src="{{ mix('backend/js/main.js') }}"></script>

</body>
</html>
