<div class="container">
  <div class="text-center welcome-message">
    <h2><?php echo Setting::get('home_welcome_message'); ?></h2>
    <?php if(Config::get('app.env') == 'demo'): ?>
    <p>
      Check out the RTL version of Socialite: <a href="http://socialite-rtl.laravelguru.com" target="_blank">Click Here</a>
    </p>
    <?php endif; ?>
  </div>
  <div class="row">
    <div class="col-lg-4 col-md-5 col-sm-12 col-xs-12">
      <div class="panel panel-default">
        <div class="panel-body nopadding">
          <div class="icon-boxes">
            <div class="application-image">
              <img src="<?php echo url('setting/app-icon1.png'); ?>" alt="">
            </div>
            <div class="app-files">
              <?php echo Setting::get('home_widget_one'); ?>

            </div>
          
        </div>
      </div>
    </div>
  </div>
  <div class="col-lg-4 col-md-5 col-sm-12 col-xs-12">
    <div class="panel panel-default">
      <div class="panel-body nopadding">
        <div class="icon-boxes">
          <div class="application-image">
            <img src="<?php echo url('setting/app-icon2.png'); ?>" alt="">
          </div>
          <div class="app-files">
            <?php echo Setting::get('home_widget_two'); ?>

          </div>
          
        </div>
      </div>
    </div>
  </div>
  <div class="col-lg-4 col-md-5 col-sm-12 col-xs-12">
    <div class="panel panel-default">
      <div class="panel-body nopadding">
        <div class="icon-boxes">
          <div class="application-image">
            <img src="<?php echo url('setting/app-icon3.png'); ?>" alt="">
          </div>
          <div class="app-files">
            <?php echo Setting::get('home_widget_three'); ?>

          </div>
          
        </div>
      </div>
    </div>
  </div>
</div><!-- /row -->

<div class="row tpadding-20">
  <div class="col-md-7 features-list">
    <h2><?php echo Setting::get('home_list_heading'); ?></h2>
    <div class="panel panel-default">
      <div class="panel-body">
        <ul class="list-unstyled">
          <?php if(Setting::get('home_feature_one_icon') != null || Setting::get('home_feature_one') != null): ?>
          <li>
            <i class="fa fa-<?php echo e(Setting::get('home_feature_one_icon')); ?>"></i> <?php echo e(Setting::get('home_feature_one')); ?>

          </li>
          <?php endif; ?>
          <?php if(Setting::get('home_feature_two_icon') != null || Setting::get('home_feature_two') != null): ?>
            <li>
              <i class="fa fa-<?php echo e(Setting::get('home_feature_two_icon')); ?>"></i> <?php echo e(Setting::get('home_feature_two')); ?>

            </li>
          <?php endif; ?>
          <?php if(Setting::get('home_feature_three_icon') != null || Setting::get('home_feature_three') != null): ?>
            <li>
              <i class="fa fa-<?php echo e(Setting::get('home_feature_three_icon')); ?>"></i> <?php echo e(Setting::get('home_feature_three')); ?>

            </li>
          <?php endif; ?>
          <?php if(Setting::get('home_feature_four_icon') != null || Setting::get('home_feature_four') != null): ?>
            <li>
              <i class="fa fa-<?php echo e(Setting::get('home_feature_four_icon')); ?>"></i> <?php echo e(Setting::get('home_feature_four')); ?>

            </li>
          <?php endif; ?>
          <?php if(Setting::get('home_feature_five_icon') != null || Setting::get('home_feature_five') != null): ?>
            <li>
              <i class="fa fa-<?php echo e(Setting::get('home_feature_five_icon')); ?>"></i> <?php echo e(Setting::get('home_feature_five')); ?>

            </li>
          <?php endif; ?>
          <?php if(Setting::get('home_feature_six_icon') != null || Setting::get('home_feature_six') != null): ?>
            <li>
              <i class="fa fa-<?php echo e(Setting::get('home_feature_six_icon')); ?>"></i> <?php echo e(Setting::get('home_feature_six')); ?>

            </li>
          <?php endif; ?>
          <?php if(Setting::get('home_feature_seven_icon') != null || Setting::get('home_feature_seven') != null): ?>
            <li>
              <i class="fa fa-<?php echo e(Setting::get('home_feature_seven_icon')); ?>"></i> <?php echo e(Setting::get('home_feature_seven')); ?>

            </li>
          <?php endif; ?>
          <?php if(Setting::get('home_feature_eight_icon') != null || Setting::get('home_feature_eight') != null): ?>
            <li>
              <i class="fa fa-<?php echo e(Setting::get('home_feature_eight_icon')); ?>"></i> <?php echo e(Setting::get('home_feature_eight')); ?>

            </li>
          <?php endif; ?>
          <?php if(Setting::get('home_feature_nine_icon') != null || Setting::get('home_feature_nine') != null): ?>
            <li>
              <i class="fa fa-<?php echo e(Setting::get('home_feature_nine_icon')); ?>"></i> <?php echo e(Setting::get('home_feature_nine')); ?>

            </li>
          <?php endif; ?>
          <?php if(Setting::get('home_feature_ten_icon') != null || Setting::get('home_feature_ten') != null): ?>
            <li>
              <i class="fa fa-<?php echo e(Setting::get('home_feature_ten_icon')); ?>"></i> <?php echo e(Setting::get('home_feature_ten')); ?>

            </li>
          <?php endif; ?>
        </ul>
      </div>
    </div>
  </div>
  <div class="col-md-5">

    <h2 class="register-heading">Create an Account</h2>
    <div class="panel panel-default">
      <div class="panel-body nopadding">

        <div class="login-bottom">

          <ul class="signup-errors text-danger list-unstyled"></ul>

          <form method="POST" class="signup-form" action="<?php echo e(url('/register')); ?>">
            <?php echo e(csrf_field()); ?>


            <div class="row">
              <div class="col-md-6">
                <fieldset class="form-group<?php echo e($errors->has('affiliate') ? ' has-error' : ''); ?>">
                  <?php echo e(Form::label('affiliate', trans('auth.affiliate_code'))); ?><i class="optional">(optional)</i>
                  <?php if(isset($_GET['affiliate'])): ?>
                  <?php echo e(Form::text('affiliate', $_GET['affiliate'], ['class' => 'form-control', 'id' => 'affiliate', 'disabled' =>'disabled'])); ?>

                  <?php echo e(Form::hidden('affiliate', $_GET['affiliate'])); ?>

                  <?php else: ?>
                  <?php echo e(Form::text('affiliate', NULL, ['class' => 'form-control', 'id' => 'affiliate', 'placeholder'=> trans('auth.affiliate_code')])); ?>

                  <?php endif; ?>

                  <?php if($errors->has('affiliate')): ?>
                  <span class="help-block">
                    <?php echo e($errors->first('affiliate')); ?>

                  </span>
                  <?php endif; ?>
                </fieldset>
              </div>
              <div class="col-md-6">
                <fieldset class="form-group required <?php echo e($errors->has('email') ? ' has-error' : ''); ?>">
                  <?php echo e(Form::label('email', trans('auth.email_address'))); ?> 
                  <?php echo e(Form::text('email', NULL, ['class' => 'form-control', 'id' => 'email', 'placeholder'=> trans('auth.welcome_to')])); ?>

                  <?php if($errors->has('email')): ?>
                  <span class="help-block">
                    <?php echo e($errors->first('email')); ?>

                  </span>
                  <?php endif; ?>
                </fieldset>
              </div>
            </div>

            <div class="row">
              <div class="col-md-6">
                <fieldset class="form-group required <?php echo e($errors->has('name') ? ' has-error' : ''); ?>">
                  <?php echo e(Form::label('name', trans('auth.name'))); ?> 
                  <?php echo e(Form::text('name', NULL, ['class' => 'form-control', 'id' => 'name', 'placeholder'=> trans('auth.name')])); ?>

                  <?php if($errors->has('name')): ?>
                  <span class="help-block">
                    <?php echo e($errors->first('name')); ?>

                  </span>
                  <?php endif; ?>
                </fieldset>
              </div>
              <div class="col-md-6">
                <fieldset class="form-group required <?php echo e($errors->has('gender') ? ' has-error' : ''); ?>">
                  <?php echo e(Form::label('gender', trans('common.gender'))); ?> 
                  <?php echo e(Form::select('gender', array('female' => 'Female', 'male' => 'Male', 'other' => 'None'), null, ['placeholder' => trans('auth.select_gender'), 'class' => 'form-control'])); ?>

                  <?php if($errors->has('gender')): ?>
                  <span class="help-block">
                    <?php echo e($errors->first('gender')); ?>

                  </span>
                  <?php endif; ?>
                </fieldset>
              </div>
            </div>

            <div class="row">
              <div class="col-md-6">
                <fieldset class="form-group required <?php echo e($errors->has('username') ? ' has-error' : ''); ?>">
                  <?php echo e(Form::label('username', trans('common.username'))); ?> 
                  <?php echo e(Form::text('username', NULL, ['class' => 'form-control', 'id' => 'username', 'placeholder'=> trans('common.username')])); ?>

                  <?php if($errors->has('username')): ?>
                  <span class="help-block">
                    <?php echo e($errors->first('username')); ?>

                  </span>
                  <?php endif; ?>
                </fieldset>
              </div>
              <div class="col-md-6">
                <fieldset class="form-group required <?php echo e($errors->has('password') ? ' has-error' : ''); ?>">
                  <?php echo e(Form::label('password', trans('auth.password'))); ?> 
                  <?php echo e(Form::password('password', ['class' => 'form-control', 'id' => 'password', 'placeholder'=> trans('auth.password')])); ?>

                  <?php if($errors->has('password')): ?>
                  <span class="help-block">
                    <?php echo e($errors->first('password')); ?>

                  </span>
                  <?php endif; ?>
                </fieldset>
              </div>
            </div>

            <div class="row">
              <?php if(Setting::get('birthday') == "on"): ?>
              <div class="col-md-6">
                <fieldset class="form-group">
                  <?php echo e(Form::label('birthday', trans('common.birthday'))); ?><i class="optional">(optional)</i>
                  <div class="input-group date datepicker">
                    <span class="input-group-addon addon-left calendar-addon">
                      <span class="fa fa-calendar"></span>
                    </span>
                    <?php echo e(Form::text('birthday', NULL, ['class' => 'form-control', 'id' => 'datepicker1'])); ?>

                    <span class="input-group-addon addon-right angle-addon">
                      <span class="fa fa-angle-down"></span>
                    </span>
                  </div>
                </fieldset>
              </div>
              <?php endif; ?>

              <?php if(Setting::get('city') == "on"): ?>
              <div class="col-md-6">
                <fieldset class="form-group">
                  <?php echo e(Form::label('city', trans('common.current_city'))); ?><i class="optional">(optional)</i>
                  <?php echo e(Form::text('city', NULL, ['class' => 'form-control', 'placeholder' => trans('common.current_city')])); ?>

                </fieldset>
              </div>
              <?php endif; ?>   
            </div>

            <div class="row">
              <?php if(Setting::get('captcha') == "on"): ?>
              <div class="col-md-12">
                <fieldset class="form-group<?php echo e($errors->has('captcha_error') ? ' has-error' : ''); ?>">
                  <?php echo app('captcha')->display(); ?>

                  <?php if($errors->has('captcha_error')): ?>
                  <span class="help-block">
                    <?php echo e($errors->first('captcha_error')); ?>

                  </span>
                  <?php endif; ?>
                </fieldset>
              </div>    
              <?php endif; ?>    
            </div>

            <?php echo e(Form::button(trans('auth.signup_to_dashboard'), ['type' => 'submit','class' => 'btn btn-success btn-submit'])); ?>

          </form>
        </div>  
        <?php if((env('GOOGLE_CLIENT_ID') != NULL && env('GOOGLE_CLIENT_SECRET') != NULL) ||
          (env('TWITTER_CLIENT_ID') != NULL && env('TWITTER_CLIENT_SECRET') != NULL) ||
          (env('FACEBOOK_CLIENT_ID') != NULL && env('FACEBOOK_CLIENT_SECRET') != NULL) ||
          (env('LINKEDIN_CLIENT_ID') != NULL && env('LINKEDIN_CLIENT_SECRET') != NULL) ): ?>
          <div class="divider-login">
            <div class="divider-text"> <?php echo e(trans('auth.login_via_social_networks')); ?></div>
          </div>
          <?php endif; ?>
          <ul class="list-inline social-connect">
            <?php if(env('GOOGLE_CLIENT_ID') != NULL && env('GOOGLE_CLIENT_SECRET') != NULL): ?>
            <li><a href="<?php echo e(url('google')); ?>" class="btn btn-social google-plus"><span class="social-circle"><i class="fa fa-google-plus" aria-hidden="true"></i></span></a></li> 
            <?php endif; ?>

            <?php if(env('TWITTER_CLIENT_ID') != NULL && env('TWITTER_CLIENT_SECRET') != NULL): ?>
            <li><a href="<?php echo e(url('twitter')); ?>" class="btn btn-social tw"><span class="social-circle"><i class="fa fa-twitter" aria-hidden="true"></i></span></a></li>
            <?php endif; ?>

            <?php if(env('FACEBOOK_CLIENT_ID') != NULL && env('FACEBOOK_CLIENT_SECRET') != NULL): ?>
            <li><a href="<?php echo e(url('facebook')); ?>" class="btn btn-social fb"><span class="social-circle"><i class="fa fa-facebook" aria-hidden="true"></i></span></a></li>
            <?php endif; ?>

            <?php if(env('LINKEDIN_CLIENT_ID') != NULL && env('LINKEDIN_CLIENT_SECRET') != NULL): ?> 
            <li><a href="<?php echo e(url('linkedin')); ?>" class="btn btn-social linkedin"><span class="social-circle"><i class="fa fa-linkedin" aria-hidden="true"></i></span></a></li>
            <?php endif; ?>
          </ul>
        </div>
      </div><!-- /panel -->
    </div>
  </div><!-- /row -->
</div><!-- /container -->
<?php echo Theme::asset()->container('footer')->usePath()->add('app', 'js/app.js'); ?>