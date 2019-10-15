<div class="main-content">	
	<div class="container">		
		<div class="panel panel-default contact-panel">
		
			<div class="panel-heading no-bg panel-settings">
				<h3 class="panel-title"><?php echo e(trans('common.contact')); ?></h3>

			</div>
			<div class="panel-body static-body">
				<p class="static-para">
					<?php echo e(Setting::get('contact_text', 'Contact page description can be edited in admin panel')); ?>

				</p>
				<?php echo $__env->make('flash::message', array_except(get_defined_vars(), array('__data', '__path')))->render(); ?>
				<div class="login-block static-pages">


					<!-- /contact form goes here --> 

					<div class="contact-form">
						<!-- <h3 class="av-special-heading-tag" itemprop="headline">Send us mail</h3> -->
						<div class="special-heading-border">
							<div class="special-heading-inner-border">

							</div>
						</div>
					</div>

					<form method="POST" action="<?php echo e(url('contact')); ?>" class="socialite-form">
					<?php echo e(csrf_field()); ?>

						<fieldset>
							<div class="row">
								<div class="col-md-6 col-sm-12 col-xs-12 left-form">
									<div class="form-group required <?php echo e($errors->has('name') ? ' has-error' : ''); ?>">
										<?php echo e(Form::label('name', trans('auth.name'), ['class' => 'control-label'])); ?>

										<input type="text" class="form-control" name="name" placeholder="<?php echo e(trans('messages.name_placeholder')); ?>">
										<?php if($errors->has('name')): ?>
										<span class="help-block">
											<?php echo e($errors->first('name')); ?>

										</span>
										<?php endif; ?>
									</div>
								</div>
								<div class="col-md-6 col-sm-12 col-xs-12 right-form">
									<div class="form-group required <?php echo e($errors->has('email') ? ' has-error' : ''); ?>">
										<?php echo e(Form::label('email', trans('auth.email_address'), ['class' => 'control-label'])); ?>

										<input type="email" class="form-control" name="email" placeholder="<?php echo e(trans('messages.email_placeholder')); ?>">
										<?php if($errors->has('email')): ?>
										<span class="help-block">
											<?php echo e($errors->first('email')); ?>

										</span>
										<?php endif; ?>
									</div>
								</div>

								<div class="col-md-12 col-sm-12 col-xs-12">
									<div class="form-group required <?php echo e($errors->has('subject') ? ' has-error' : ''); ?>">
										<?php echo e(Form::label('subject', trans('auth.subject'), ['class' => 'control-label'])); ?>

										<input type="text" class="form-control" placeholder="<?php echo e(trans('messages.subject_placeholder')); ?>" name="subject">
										<?php if($errors->has('subject')): ?>
										<span class="help-block">
											<?php echo e($errors->first('subject')); ?>

										</span>
										<?php endif; ?>
									</div>
								</div>

								<div class="col-md-12 col-sm-12 col-xs-12">
									<div class="form-group required <?php echo e($errors->has('message') ? ' has-error' : ''); ?>">
										<?php echo e(Form::label('message', trans('common.message'), ['class' => 'control-label'])); ?>

										<textarea class="form-control" rows="3" placeholder="<?php echo e(trans('messages.message_placeholder')); ?>" name="message"></textarea>
										<?php if($errors->has('message')): ?>
										<span class="help-block">
											<?php echo e($errors->first('message')); ?>

										</span>
										<?php endif; ?>
									</div>
								</div>
							</div>
							<div class="form-group">
								<button type="submit" class="btn btn-success btn-submit"><?php echo e(trans('auth.submit')); ?></button>
							</div>

						</fieldset>
					</form>

				</div>
				<!-- /login-block -->
			</div>
		</div>
	</div>
</div>