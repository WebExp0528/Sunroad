<div class="sidebar bg-light">
    <nav class="sidebar-nav ps ps--active-y">

        <ul class="nav">
            <div class="card border-success mb-0">
                <div class="card-header">
                    <div class="d-flex justify-content-center" style="background-image:">
                        <img src="<?php echo e($user['photoURL'] ? url('user/avatar/'.$user['photoURL']) : url('user/avatar/default.png')); ?>" alt="No photo" class="rounded-circle img-thumbnail profile-logo">
                    </div>
                </div>
                <div class="card-body text-success">
                    <h5 class="card-title">
                    <?php if(isset($user)): ?>
                    <?php echo e($user['displayName'] ? $user['displayName'] : "No name"); ?>

                    <?php endif; ?>  
                    </h5>
                    <p class="card-text">
                    <?php if(isset($user)): ?>
                    <?php echo e($user['email']); ?>

                    <?php endif; ?> 
                    </p>
                </div>
            </div>
            <div class="card border-success mb-0">
                <div class="card-header text-dark">
                    About me!
                </div>
                <div class="card-body text-success">
                    <p class="card-text">
                    <?php if(isset($user)): ?>
                    <?php echo e($user['bio'] ? $user['bio'] : "No description"); ?>

                    <?php endif; ?> 
                    </p>
                </div>
            </div>
            <div class="card border-success mb-0">
                <div class="card-header text-dark">
                    Featured Content
                </div>
                <div class="card-body text-success">
                    
                </div>
            </div>
        </ul>

        <div class="ps__rail-x" style="left: 0px; bottom: 0px;">
            <div class="ps__thumb-x" tabindex="0" style="left: 0px; width: 0px;"></div>
        </div>
        <div class="ps__rail-y" style="top: 0px; height: 869px; right: 0px;">
            <div class="ps__thumb-y" tabindex="0" style="top: 0px; height: 415px;"></div>
        </div>
    </nav>
    <button class="sidebar-minimizer brand-minimizer" type="button"></button>
</div>