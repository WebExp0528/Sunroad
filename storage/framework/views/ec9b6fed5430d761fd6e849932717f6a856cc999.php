<?php $__env->startSection('content'); ?>
<div class="row justify-content-center">
    <div class="col-md-8">
        <div class="card-group">
            <div class="card p-4">
                <div class="card-body">
                    <form method="POST" action="<?php echo e(route('password.email')); ?>">
                        <?php echo e(csrf_field()); ?>

                        <h1>
                            <div class="login-logo">
                                <a href="#">
                                    <?php echo e(trans('global.site_title')); ?>

                                </a>
                            </div>
                        </h1>
                        <p class="text-muted"></p>
                        <div>
                            <?php echo e(csrf_field()); ?>

                            <div class="form-group has-feedback">
                                <input type="email" name="email" class="form-control" required="required"="autofocus" placeholder="<?php echo e(trans('global.login_email')); ?>">
                                <?php if($errors->has('email')): ?>
                                    <em class="invalid-feedback">
                                        <?php echo e($errors->first('email')); ?>

                                    </em>
                                <?php endif; ?>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-12 text-right">
                                <button type="submit" class="btn btn-primary btn-block btn-flat">
                                    <?php echo e(trans('global.reset_password')); ?>

                                </button>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>
<?php $__env->stopSection(); ?>
<?php echo $__env->make('layouts.app', array_except(get_defined_vars(), array('__data', '__path')))->render(); ?>