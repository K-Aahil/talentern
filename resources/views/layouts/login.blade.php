<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<title>Login</title>

<!-- Stylesheets -->
<link href="{{ asset('front/assets/landing/css/bootstrap.css')}}" rel="stylesheet">
<link href="{{ asset('front/assets/landing/css/style.css')}}" rel="stylesheet">
<link href="{{ asset('front/assets/landing/css/responsive.css')}}" rel="stylesheet">

<link rel="shortcut icon" href="{{ asset('front/assets/landing/images/favicon.png')}}" type="image/x-icon">
<link rel="icon" href="{{ asset('front/assets/landing/images/favicon.png')}}" type="image/x-icon">

<!-- Responsive -->
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0">

<style>

</style>
</head>

<body>

<div class="page-wrapper">

    <!-- Preloader -->
    <div class="preloader"></div>
    <!-- Info Section -->
    <div class="login-section">
        <div id="imgLogin" class="image-layer" style="background-image: url({{asset('assets/images/background/auth_new.png')}}); background-size: 800px; margin-left: 20px;"></div>
        <div class="outer-box">
             <!-- Login Form -->
            <div class="login-form default-form">
                <div class="form-inner">
                    <div>
                    <a href="{{ url('/login') }}"></a>
                    </div>
                    <div class="logo mr-3"><a href="{{ url('/') }}"><img src={{asset('assets/images/app-logo.png') }} alt="icon" style="margin-bottom: 10px;" title="" width="154px" height="50px"></a></div>
                    <div class="mb-4">
                        <h4 class="text-muted"  style="font-weight: 600; font-size: 28px; margin-bottom: 0!important;">
                            @lang('auth.page.welcome')
                        </h4>
                        <p class="text-muted">@lang('auth.page.enterDetails')</p>
                    </div>
                    
                    @yield('conten')
                    
                    <div class="bottom-box ">
                        <div class="text-cnter">@lang('auth.page.dontHaveAccount') <a href="register">@lang('auth.page.signup')</a></div>
                       
                        <div class="divider"><span>or</span></div>
                        
                    
                        <div class="btn-box row">
                                <div class="col-lg-6 col-md-12">
                                    <a href="#" class="theme-btn social-btn-two facebook-btn"><i class="fab fa-facebook-f"></i> Log In via Facebook</a>
                                </div>
                                <div class="col-lg-6 col-md-12">
                                    <a href="#" class="theme-btn social-btn-two google-btn"><i class="fab fa-google"></i> Log In via Gmail</a>
                                </div>
                        </div>
                    </div>
                </div>
            </div>
            <!--End Login Form -->
        </div>
    </div>
    <!-- End Info Section -->


</div><!-- End Page Wrapper -->


<script src="{{ asset('front/assets/landing/js/jquery.js') }}"></script> 
<script src="{{ asset('front/assets/landing/js/popper.min.js') }}"></script>
<script src="{{ asset('front/assets/landing/js/chosen.min.js') }}"></script>
<script src="{{ asset('front/assets/landing/js/bootstrap.min.js') }}"></script>
<script src="{{ asset('front/assets/landing/js/jquery-ui.min.js') }}"></script>
<script src="{{ asset('front/assets/landing/js/jquery.fancybox.js') }}"></script>
<script src="{{ asset('front/assets/landing/js/jquery.modal.min.js') }}"></script>
<script src="{{ asset('front/assets/landing/js/mmenu.polyfills.js') }}"></script>
<script src="{{ asset('front/assets/landing/js/mmenu.js') }}"></script>
<script src="{{ asset('front/assets/landing/js/appear.js') }}"></script>
<script src="{{ asset('front/assets/landing/js/owl.js') }}"></script>
<script src="{{ asset('front/assets/landing/js/wow.js') }}"></script>
<script src="{{ asset('front/assets/landing/js/script.js') }}"></script>
</body>
</html>


