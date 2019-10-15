<?php $__env->startSection('content'); ?>
<div class="content">
    <?php $__currentLoopData = $posts; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $post): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
        <div class="row d-flex justify-content-center">
            <div class="col-md-6">
                <div class="bg-white rounded shadow-sm border border-success m-1">
                    <a href="https://bootsnipp.com/snippets/GzKKE">
                        <div class="caption d-flex justify-content-between">
                            <p class="" style="margin: 10px"><?php echo e($post['displayName'] ? $post['displayName'] : "Someone"); ?> said:</p>
                            <p class="" style="margin: 10px"><?php echo e($post['created_at'] ? $post['created_at'] : ""); ?></p>
                        </div>
                        <?php if($post['youtubeURL']): ?>
                        <div class="embed-responsive embed-responsive-16by9">
                            <iframe class="embed-responsive-item" src="https://www.youtube.com/embed/<?php echo e($post['youtubeURL']); ?>" allowfullscreen></iframe>
                        </div>
                        <?php endif; ?>
                        <?php if($post['image']): ?>
                        <img class="danlazy img-fluid img-thumbnail mx-auto w-100 d-block rounded" src="<?php echo e($post['image']); ?>" width="320" height="240" alt="Portfolio Gallery with filtering category">
                        <?php endif; ?>
                        <?php if($post['audio']): ?>
                        <audio controls>
                            <source src="<?php echo e($post['audio']); ?>">
                        </audio>
                        <?php endif; ?>
                        <div class="caption d-flex justify-content-between">
                            <div  class="flex-grow-1" style="margin: 10px">
                                <?php echo e($post['content'] ? $post['content'] : "No content"); ?>

                            </div>
                            <div class=""  class="" style="margin: 10px">
                                <?php echo e($post['comments'] ? $post['comments'] : "0"); ?> Comments
                            </div>
                        </div>
                    </a>
                </div>
            </div>
        </div>
    <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>
    
</div>

<?php $__env->stopSection(); ?>
<?php $__env->startSection('scripts'); ?>
##parent-placeholder-16728d18790deb58b3b8c1df74f06e536b532695##

<?php $__env->stopSection(); ?>
<?php echo $__env->make('layouts.guest', array_except(get_defined_vars(), array('__data', '__path')))->render(); ?>