
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <meta http-equiv="x-ua-compatible" content="ie=edge">
  <meta name="csrf-token" content="{{ csrf_token() }}">

  <title>Hệ thống quản lý Tour BeachCrest</title>
  <link rel="stylesheet" href="{{ mix('backend/css/style.css') }}">

  <!-- Google Font: Source Sans Pro -->
  <link href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,400i,700" rel="stylesheet">
  {{-- <script src="https://www.paypalobjects.com/api/checkout.js"> </script> --}}
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
