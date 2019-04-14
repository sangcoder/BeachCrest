<div class="modal fade" id="login-form" tabindex="-1" role="dialog" aria-labelledby="formlogin" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h4 class="modal-title" id="exampleModalLabel">Login</h4>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
            <i class="input-icon field-icon fa"><svg height="24px" width="24px" viewBox="0 0 24 24" version="1.1" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink">
              <!-- Generator: Sketch 49 (51002) - http://www.bohemiancoding.com/sketch -->
              <title>Ico_close</title>
              <desc>Created with Sketch.</desc>
              <defs></defs>
              <g id="Ico_close" stroke="none" stroke-width="1" fill="none" fill-rule="evenodd" stroke-linecap="round" stroke-linejoin="round">
                  <g id="Group" stroke="#1A2B48" stroke-width="1.5">
                      <g id="close">
                          <path d="M0.75,23.249 L23.25,0.749" id="Shape"></path>
                          <path d="M23.25,23.249 L0.75,0.749" id="Shape"></path>
                      </g>
                  </g>
              </g>
          </svg></i>
        </button>
      </div>
      <div class="modal-body">
        <form class="form" action="#" method="POST">
            {{ csrf_field() }}
            <div class="form-group">
            <input type="text" name="username" id="txtUsername" class="form-control" autocomplete="off"
              placeholder="Email or Username">
            <i class="input-icon field-icon fa">
              <svg width="18px" viewBox="0 0 24 19" version="1.1"
                xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink">
                <!-- Generator: Sketch 49 (51002) - http://www.bohemiancoding.com/sketch -->
                <title>ico_email_login_form</title>
                <desc>Created with Sketch.</desc>
                <defs></defs>
                <g id="Hotel-layout" stroke="none" stroke-width="1" fill="none" fill-rule="evenodd"
                  stroke-linecap="round" stroke-linejoin="round">
                  <g id="Log-In" transform="translate(-912.000000, -220.000000)" stroke="#A0A9B2">
                    <g id="login" transform="translate(466.000000, 80.000000)">
                      <g id="input" transform="translate(30.000000, 119.000000)">
                        <g id="Group" transform="translate(416.000000, 22.000000)">
                          <g id="ico_email_login_form">
                            <rect id="Rectangle-path" x="0.5" y="0.0101176471" width="23" height="16.9411765" rx="2">
                            </rect>
                            <polyline id="Shape" points="22.911 0.626352941 12 10.0689412 1.089 0.626352941"></polyline>
                          </g>
                        </g>
                      </g>
                    </g>
                  </g>
                </g>
              </svg></i>
          </div>
          <div class="form-group">
            <input type="password" class="form-control" name="password" autocomplete="off" placeholder="Password">
            <i class="input-icon field-icon fa">
              <svg width="16px" viewBox="0 0 18 24" version="1.1" xmlns="http://www.w3.org/2000/svg"
                xmlns:xlink="http://www.w3.org/1999/xlink">
                <!-- Generator: Sketch 49 (51002) - http://www.bohemiancoding.com/sketch -->
                <title>ico_pass_login_form</title>
                <desc>Created with Sketch.</desc>
                <defs></defs>
                <g id="Hotel-layout" stroke="none" stroke-width="1" fill="none" fill-rule="evenodd"
                  stroke-linecap="round" stroke-linejoin="round">
                  <g id="Log-In" transform="translate(-918.000000, -307.000000)" stroke="#A0A9B2">
                    <g id="login" transform="translate(466.000000, 80.000000)">
                      <g id="input" transform="translate(30.000000, 209.000000)">
                        <g id="Group" transform="translate(422.000000, 18.000000)">
                          <g id="ico_pass_login_form">
                            <path
                              d="M3.5,6 C3.5,2.96243388 5.96243388,0.5 9,0.5 C12.0375661,0.5 14.5,2.96243388 14.5,6 L14.5,9.5"
                              id="Shape"></path>
                            <path
                              d="M17.5,11.5 C17.5,10.3954305 16.6045695,9.5 15.5,9.5 L2.5,9.5 C1.3954305,9.5 0.5,10.3954305 0.5,11.5 L0.5,21.5 C0.5,22.6045695 1.3954305,23.5 2.5,23.5 L15.5,23.5 C16.6045695,23.5 17.5,22.6045695 17.5,21.5 L17.5,11.5 Z"
                              id="Shape"></path>
                            <circle id="Oval" cx="9" cy="16.5" r="1.25"></circle>
                          </g>
                        </g>
                      </g>
                    </g>
                  </g>
                </g>
              </svg>
            </i>
          </div>
          <div class="form-group">
            <button type="submit" class="btn btn-block btn-primary">Login </button>
          </div>
        </form>
        <div class="mt-2 d-flex justify-content-between">
            <div class="check-item">
              <label for="remeber-me">
                <input type="checkbox" name="remember" id="remeber-me" value="1">
                Remember me
              </label>
            </div>
            <a href="javascript:;" class="open-loss-pass" data-toggle="modal">Forgot Password?</a>
          </div>
          <div class="social-login">
            <p class="text-center">or continue with</p>
            <div class="row">
              <div class="col-sm-6">
                <a href="javascript:;" onclick="return false" class="d-block w-100">
                    <i class="input-icon field-icon fa"><svg width="100%" viewBox="0 0 140 40" version="1.1" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink">
                      <!-- Generator: Sketch 49 (51002) - http://www.bohemiancoding.com/sketch -->
                      <title>fb</title>
                      <desc>Created with Sketch.</desc>
                      <defs></defs>
                      <g id="Hotel-layout" stroke="none" stroke-width="1" fill="none" fill-rule="evenodd">
                          <g id="Log-In" transform="translate(-496.000000, -560.000000)">
                              <g id="login" transform="translate(466.000000, 80.000000)">
                                  <g id="social" transform="translate(0.000000, 417.000000)">
                                      <g id="fb" transform="translate(30.000000, 63.000000)">
                                          <rect id="Rectangle-2" fill="#395899" x="0" y="0" width="140" height="40" rx="3"></rect>
                                          <g transform="translate(26.000000, 9.000000)">
                                              <text id="Facebook" font-family="Roboto-Medium, Roboto" font-size="14" font-weight="400" fill="#F9F9F9">
                                                  <tspan x="19" y="16">Facebook</tspan>
                                              </text>
                                              <g id="facebook-logo" transform="translate(0.000000, 3.000000)" fill="#FFFFFF" fill-rule="nonzero">
                                                  <path d="M8.24940206,0.00329896907 L6.19331959,0 C3.88338144,0 2.39059794,1.53154639 2.39059794,3.90202062 L2.39059794,5.7011134 L0.323298969,5.7011134 C0.144659794,5.7011134 0,5.84593814 0,6.02457732 L0,8.63125773 C0,8.80989691 0.144824742,8.9545567 0.323298969,8.9545567 L2.39059794,8.9545567 L2.39059794,15.5320412 C2.39059794,15.7106804 2.53525773,15.8553402 2.71389691,15.8553402 L5.41113402,15.8553402 C5.5897732,15.8553402 5.73443299,15.7105155 5.73443299,15.5320412 L5.73443299,8.9545567 L8.15158763,8.9545567 C8.3302268,8.9545567 8.4748866,8.80989691 8.4748866,8.63125773 L8.47587629,6.02457732 C8.47587629,5.93880412 8.44173196,5.85665979 8.38119588,5.79595876 C8.32065979,5.73525773 8.23818557,5.7011134 8.15241237,5.7011134 L5.73443299,5.7011134 L5.73443299,4.176 C5.73443299,3.44296907 5.9091134,3.07084536 6.864,3.07084536 L8.24907216,3.07035052 C8.42754639,3.07035052 8.57220619,2.92552577 8.57220619,2.74705155 L8.57220619,0.326597938 C8.57220619,0.14828866 8.42771134,0.00362886598 8.24940206,0.00329896907 Z" id="Shape"></path>
                                              </g>
                                          </g>
                                      </g>
                                  </g>
                              </g>
                          </g>
                      </g>
                  </svg></i>
                </a>
              </div>
              <div class="col-sm-6">
                <a href="javascript:;" onclick="return false" class="d-block w-100">
                    <i class="input-icon field-icon fa"><svg width="100%" viewBox="0 0 140 40" version="1.1" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink">
                      <!-- Generator: Sketch 49 (51002) - http://www.bohemiancoding.com/sketch -->
                      <title>g+</title>
                      <desc>Created with Sketch.</desc>
                      <defs></defs>
                      <g id="Hotel-layout" stroke="none" stroke-width="1" fill="none" fill-rule="evenodd">
                          <g id="Log-In" transform="translate(-816.000000, -560.000000)">
                              <g id="login" transform="translate(466.000000, 80.000000)">
                                  <g id="social" transform="translate(0.000000, 417.000000)">
                                      <g id="g+" transform="translate(350.000000, 63.000000)">
                                          <rect id="Rectangle-2" fill="#F34A38" x="0" y="0" width="140" height="40" rx="3"></rect>
                                          <g id="Group-3" transform="translate(28.000000, 9.000000)" fill="#FFFFFF">
                                              <g id="google-plus" transform="translate(0.000000, 3.000000)" fill-rule="nonzero">
                                                  <path d="M8.74974949,9.62441417 L12.6460216,9.62441417 C11.9621032,11.5580196 10.1098039,12.9443598 7.9412597,12.9283598 C5.3100216,12.9089312 3.13434813,10.804006 3.03219847,8.17467268 C2.92270187,5.3562237 5.18387194,3.02838696 7.97842977,3.02838696 C9.25619847,3.02838696 10.4222393,3.51524411 11.3013141,4.31301281 C11.5095318,4.50201962 11.8264842,4.5032169 12.0312733,4.31045499 L13.4623481,2.96357064 C13.6861304,2.75290397 13.6869468,2.39714887 13.4638175,2.18577472 C12.0696951,0.865012814 10.1995454,0.0417747189 8.13723249,0.00150261009 C3.73853861,-0.0843749409 0.0308379286,3.52210125 0.000198472791,7.92155703 C-0.0307130918,12.3540468 3.55312364,15.9568768 7.97842977,15.9568768 C12.2341577,15.9568768 15.7107291,12.6246863 15.9435998,8.42718968 C15.9498039,8.37456383 15.9538855,6.59600601 15.9538855,6.59600601 L8.74974949,6.59600601 C8.45445698,6.59600601 8.21511004,6.83535295 8.21511004,7.13064547 L8.21511004,9.08977472 C8.21511004,9.38506724 8.4545114,9.62441417 8.74974949,9.62441417 Z" id="Shape"></path>
                                                  <path d="M22.9308299,6.38269388 L22.9308299,4.46851701 C22.9308299,4.2097415 22.7210884,4 22.4623129,4 L20.8512109,4 C20.5924354,4 20.3826939,4.2097415 20.3826939,4.46851701 L20.3826939,6.38269388 L18.468517,6.38269388 C18.2097415,6.38269388 18,6.59243537 18,6.85121088 L18,8.46231293 C18,8.72108844 18.2097415,8.93082993 18.468517,8.93082993 L20.3826939,8.93082993 L20.3826939,10.8450068 C20.3826939,11.1037823 20.5924354,11.3135238 20.8512109,11.3135238 L22.4623129,11.3135238 C22.7210884,11.3135238 22.9308299,11.1037823 22.9308299,10.8450068 L22.9308299,8.93082993 L24.8450068,8.93082993 C25.1037823,8.93082993 25.3135238,8.72108844 25.3135238,8.46231293 L25.3135238,6.85121088 C25.3135238,6.59243537 25.1037823,6.38269388 24.8450068,6.38269388 L22.9308299,6.38269388 Z" id="Shape"></path>
                                              </g>
                                              <text id="Google" font-family="Roboto-Medium, Roboto" font-size="14" font-weight="400">
                                                  <tspan x="36" y="16">Google</tspan>
                                              </text>
                                          </g>
                                      </g>
                                  </g>
                              </g>
                          </g>
                      </g>
                  </svg></i>
                </a>
              </div>
            </div>
          </div>
          <div class="text-center">
              Do not have an account?
            <a href="javascript:;" class="open-signup" data-toggle="modal">Sign up</a>
          </div>
      </div>

    </div>
  </div>
</div>