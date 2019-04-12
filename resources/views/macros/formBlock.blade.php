<div class="form-group">
    <label for="{{array_get($params, 'name')}}"> {{ array_get($params, 'label') }}</label>
  <div class="msg-input {{ array_get($params, 'clsInput') }}">
    <input type="{{ array_get($params, 'type') }}" class="form-control" id="{{ array_get($params, 'name') }}" name="{{ array_get($params, 'name') }}" placeholder="{{ array_get($params, 'placeholder') }}" {{ array_get($params, 'required', false) ? 'required' : '' }}>
    <div class="messages-error">
      <div> {{ array_get($errors, 'errors') }} </div>
    </div>
  </div>
</div>