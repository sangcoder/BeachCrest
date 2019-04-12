<!-- begin header -->
<!doctype html>
<html lang="en" dir="ltr">
<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="theme-color" content="#536878" />
  <link rel="manifest" href="manifest.json">
  <meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=0, viewport-fit=cover" />
  <title>@yield('title') - BeachCrest</title>
  <link rel="icon" href="favicon.png" type="image/x-icon">
  <link rel="apple-touch-icon" href="/custom-icon.png">
  <meta name="apple-mobile-web-app-capable" content="yes">
  <meta name="apple-mobile-web-app-status-bar-style" content="black">
  <meta name="apple-touch-fullscreen" content="YES">
  <meta name="mobile-web-app-capable" content="yes">
  <meta name="format-detection" content="telephone=no">
  <!-- Facebook Open Graph -->
  <meta property="og:type" content="website">
  <meta property="og:url" content="https://example.com/page.html">
  <meta property="og:title" content="Content Title">
  <meta property="og:image" content="https://example.com/image.jpg">
  <meta property="og:description" content="Description Here">
  <meta property="og:site_name" content="Site Name">
  <meta property="og:locale" content="en_US">
  <!-- Next tags are optional but recommended -->
  <meta property="og:image:width" content="1200">
  <meta property="og:image:height" content="630">
  <!-- Twitter Card -->
  <meta name="twitter:card" content="summary">
  <meta name="twitter:site" content="@site_account">
  <meta name="twitter:creator" content="@individual_account">
  <meta name="twitter:url" content="https://example.com/page.html">
  <meta name="twitter:title" content="Content Title">
  <meta name="twitter:description" content="Content description less than 200 characters">
  <meta name="twitter:image" content="https://example.com/image.jpg">
  <meta name="csrf-token" content="{{ csrf_token() }}">
  <link href='//fonts.googleapis.com' rel='dns-prefetch' crossorigin />
  <link href='//cdnjs.cloudflare.com' rel='dns-prefetch' crossorigin />
  <link href='//fonts.googleapis.com' rel='preconnect' crossorigin />
  <link href='//cdnjs.cloudflare.com' rel='preconnect' crossorigin />

  <!-- <link rel="preload" href="fonts/icomoon.ttf" as="font" type="font/woff2" crossorigin />
  <link rel="preload" href="fonts/icomoon.eot" as="font" type="font/woff2" crossorigin />
  <link rel="preload" href="fonts/icomoon.woff" as="font" type="font/woff2" crossorigin />
  <link rel="preload" href="fonts/icomoon.svg" as="font" type="font/woff2" crossorigin /> -->
  @include('layouts.loadcss')
</head>

<body class="@yield('bodyClass')">
    @include('modules.global.loading')
  <div id="wrapper">
    @section('header')
      @include('modules.global.header')
    @show

    @yield('content')

    @section('footer')
        @include('modules.global.footer')
    @show

    @section('javascript')
        @include('modules.global.javascript')
    @show  
  </div>
  @include('modules.global.no-script')
</body>

</html>
<!-- end footer -->
