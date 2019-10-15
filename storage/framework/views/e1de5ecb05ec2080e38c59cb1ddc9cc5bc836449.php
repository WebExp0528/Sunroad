<?php $__env->startSection('content'); ?>
<div class="login-block d-flex justify-content-center">
    <div class="card text-dark bg-light mb-3 " style="width: 500px;">
            <div class="card-header text-center font-weight-bold">
                <h2><?php echo e(trans('auth.login_welcome_heading')); ?></h2>
            </div>
            <div class="card-body">
                <div class="login-errors text-danger"><?php echo e($errors->has('credential') ? $errors->first('credential') : ''); ?></div>
                <form method="POST" class="login-form" action="<?php echo e(url('/login')); ?>">
                    <?php echo e(csrf_field()); ?>

                    <fieldset class="form-group<?php echo e($errors->has('email') ? ' has-error' : ''); ?>">
                        <?php echo e(Form::label('email', trans('auth.enter_email_or_username'))); ?>

                        <?php echo e(Form::text('email', NULL, ['class' => 'form-control', 'id' => 'email', 'placeholder'=> trans('auth.enter_email_or_username')])); ?>

                    </fieldset>
                    <fieldset class="form-group<?php echo e($errors->has('password') ? ' has-error' : ''); ?>">
                        <?php echo e(Form::label('password', trans('auth.password'))); ?>

                        <?php echo e(Form::password('password', ['class' => 'form-control', 'id' => 'password', 'placeholder'=> trans('auth.password')])); ?>

                    </fieldset>
                    <?php echo e(Form::button( trans('common.signin') , ['type' => 'submit','class' => 'btn btn-success btn-submit'])); ?>

                </form>
            </div>  
            <div class="card-footer">
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
                <div class="problem-login">
                    <div class="pull-left"><?php echo e(trans('auth.dont_have_an_account_yet')); ?><a href="<?php echo e(url('/register')); ?>"> <?php echo e(trans('auth.get_started')); ?></a></div>
                    <div class="pull-right"><a href="<?php echo e(url('/password/reset')); ?>"><?php echo e(trans('auth.forgot_password').'?'); ?></a></div>
                    <div class="clearfix"></div>
                </div>
            </div>
    </div>
    
</div><!-- /login-block -->

<?php $__env->stopSection(); ?>
<?php echo $__env->make('layouts.app', array_except(get_defined_vars(), array('__data', '__path')))->render(); ?>