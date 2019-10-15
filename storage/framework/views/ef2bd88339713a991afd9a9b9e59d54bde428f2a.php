<!-- Modal starts here-->
<div class="modal fade" id="usersModal" tabindex="-1" role="dialog" aria-labelledby="usersModalLabel">
    <div class="modal-dialog modal-likes" role="document">
        <div class="modal-content">
        	<i class="fa fa-spinner fa-spin"></i>
        </div>
    </div>
</div>
<div class="col-md-12">
	<div class="footer-description">
		<div class="socialite-terms text-center">
			<?php if(Auth::check()): ?>
				<a href="<?php echo e(url(Auth::user()->username.'/create-page')); ?>"><?php echo e(trans('common.create_page')); ?></a> - 
				<a href="<?php echo e(url(Auth::user()->username.'/create-group')); ?>"><?php echo e(trans('common.create_group')); ?></a>
			<?php else: ?>
				<a href="<?php echo e(url('login')); ?>"><?php echo e(trans('auth.login')); ?></a> - 
				<a href="<?php echo e(url('register')); ?>"><?php echo e(trans('auth.register')); ?></a>
			<?php endif; ?>
			<?php $__currentLoopData = App\StaticPage::active(); $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $staticpage): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
				- <a href="<?php echo e(url('page/'.$staticpage->slug)); ?>"><?php echo e($staticpage->title); ?></a>		        
		    <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>	
		    <a href="<?php echo e(url('/contact')); ?>"> - <?php echo e(trans('common.contact')); ?></a>
		</div>

		<?php if(Setting::get('footer_languages') == 'on'): ?>
			<div class="socialite-terms text-center">
				<?php echo e(trans('common.available_languages')); ?> <span>:</span>
				<?php $i = 0  ?>
				<?php $__currentLoopData = Config::get('app.locales'); $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $key => $value): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>	
					<?php echo e($value); ?> - 
				<?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>
			</div>
		<?php endif; ?>
		
		<div class="socialite-terms text-center">
			<?php echo e(trans('common.copyright')); ?> &copy; <?php echo e(date('Y')); ?> <?php echo e(Setting::get('site_name')); ?>. <?php echo e(trans('common.all_rights_reserved')); ?>

		</div>
	</div>
</div>

<?php echo Theme::asset()->container('footer')->usePath()->add('app', 'js/app.js'); ?>