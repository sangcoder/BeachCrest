@extends('layouts.application')
@section('content')
@include('modules.mod-trending-tour')
  <div class="container">

      <div class="row">
          <div class="col-md-12">
          <h1>hHello {{  $message  }}</h1>
          </div>
      </div>
  </div>
@endsection