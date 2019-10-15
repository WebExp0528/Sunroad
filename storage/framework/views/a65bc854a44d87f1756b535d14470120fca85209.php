<?php $__env->startSection('title', __('Not Found')); ?>
<?php $__env->startSection('code', '404'); ?>
<?php $__env->startSection('message', __('Not Found')); ?>

<?php echo $__env->make('errors::minimal', array_except(get_defined_vars(), array('__data', '__path')))->render(); ?>