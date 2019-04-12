@include('modules.global.topmenu')
<header id="header" class="module" data-module="header">
    <nav class="container navbar navbar-expand-lg" role="navigation">
      <div class="header-mobile">
        <div class="col-mb-8">
          <a id="header-logo" class="navbar-brand" title="index" href="index.html">
            <img src="images/logo.svg" alt="index">
          </a>
        </div>
        <div class="col-mb-4">
          <button class="navbar-toggler hamburger-menu" type="button" data-toggle="collapse" data-target="#main-menu" aria-controls="main-menu"
            aria-expanded="false" aria-label="Toggle navigation">
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
            <span class="icomoon icon-close-menu d-none"></span>
          </button>
        </div>
      </div>
      @include('modules.global.menu')
    </nav>
  </header>
  