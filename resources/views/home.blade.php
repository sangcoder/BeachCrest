@extends('layouts.application')
@section('content')
@include('modules.mod-search')
@include('modules.mod-trending-tour')
@include('modules.mod-destination')
  <div class="container">
      <div class="row">
          <div class="col-md-12">
         <h1>hHello {{  $message  }}</h1>
          </div>
      </div>
  </div>
  <div class="body-overlay"></div>
@endsection