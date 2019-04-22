<body class="app header-fixed sidebar-fixed aside-menu-fixed sidebar-lg-show">
  <div id="app">
      @include('backend.modules.header')
      <div class="app-body">
          @include('backend.modules.sidebar')
          <main class="main">
              <div class="container-fluid">
                  <div class="animated fadeIn">
                      @yield('content')
                  </div>
              </div>
          </main>
      </div>
  </div>
</body>