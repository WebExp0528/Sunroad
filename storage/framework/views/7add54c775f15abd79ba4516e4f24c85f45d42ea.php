<!-- Main Content -->
<?php $__env->startSection('content'); ?>

<div class="login-block">
    <div class="panel panel-default">
        <div class="panel-body nopadding">
            <div class="login-head"><?php echo e(trans('common.reset_password')); ?>

                <div class="header-circle"><i class="fa fa-paper-plane" aria-hidden="true"></i></div>
                <div class="header-circle login-progress hidden"><i class="fa fa-spinner fa-spin" aria-hidden="true"></i></div>
            </div>
            <div class="login-bottom">
                <?php if(session('status')): ?>
                <div class="alert alert-success">
                    <?php echo e(session('status')); ?>

                </div>
                <?php endif; ?>

                <form class="form-horizontal" role="form" method="POST" action="<?php echo e(url('/password/email')); ?>">
                    <?php echo csrf_field(); ?>


                    <fieldset class="form-group <?php echo e($errors->has('email') ? ' has-error' : ''); ?>">
                        <?php echo e(Form::label('email', trans('common.email_address'))); ?>

                        <input type="email" class="form-control" name="email" value="<?php echo e(old('email')); ?>" placeholder="<?php echo e(trans('common.enter_mail')); ?>">
                        <?php if($errors->has('email')): ?>
                            <span class="help-block">
                                <strong><?php echo e($errors->first('email')); ?></strong>
                            </span>
                        <?php endif; ?>
                    </fieldset>
                    <fieldset class="form-group">
                        <?php echo e(Form::button( trans('common.send_password_reset_link') , ['type' => 'submit','class' => 'btn btn-success btn-submit'])); ?>

                    </fieldset>
                </form> 
            </div><!-- /login-bottom -->
        </div>
    </div><!-- /panel -->
</div>

<?php $__env->stopSection(); ?>

<?php echo $__env->make('layouts.app', array_except(get_defined_vars(), array('__data', '__path')))->render(); ?>