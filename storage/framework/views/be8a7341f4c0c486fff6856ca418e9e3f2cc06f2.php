<nav class="navbar socialite navbar-default no-bg guest-nav">
	<div class="container">
		<!-- Brand and toggle get grouped for better mobile display -->
		<div class="navbar-header">
			<button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-4" aria-expanded="false">
				<span class="sr-only">Toggle navigation</span>
				<span class="icon-bar"></span>
				<span class="icon-bar"></span>
				<span class="icon-bar"></span>
			</button>
			<a class="navbar-brand socialite" href="<?php echo e(url('/')); ?>">
				<img class="socialite-logo" src="<?php echo url('setting/'.Setting::get('logo')); ?>" alt="<?php echo e(Setting::get('site_name')); ?>" title="<?php echo e(Setting::get('site_name')); ?>">
			</a>
		</div>
		<?php if(Auth::guest()): ?>
		<div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">			
			<form method="POST" class="login-form navbar-form navbar-right" action="<?php echo e(url('/login')); ?>">
				<?php echo e(csrf_field()); ?>

				<fieldset class="form-group mail-form <?php echo e($errors->has('email') ? ' has-error' : ''); ?>">
					<?php echo e(Form::text('email', NULL, ['class' => 'form-control', 'id' => 'email', 'placeholder'=> trans('auth.enter_email_or_username')])); ?>

				</fieldset>
				<fieldset class="form-group<?php echo e($errors->has('password') ? ' has-error' : ''); ?>">
					<?php echo e(Form::password('password', ['class' => 'form-control', 'id' => 'password', 'placeholder'=> trans('auth.password')])); ?>

					<a href="<?php echo e(url('/password/reset')); ?>" class="forgot-password">Forgot your password</a>
				</fieldset>
				<?php echo e(Form::button( trans('common.signin') , ['type' => 'submit','class' => 'btn btn-success btn-submit'])); ?>

			</form>
		</div>
		<?php endif; ?>
		
	</div><!-- /.container-fluid -->
</nav>	
