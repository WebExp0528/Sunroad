<header class="app-header navbar justify-content-start">
    <a class="navbar-brand" href="<?php echo e(url('/')); ?>">
                <img class="sunroad-logo" src="<?php echo url('setting/'.Setting::get('logo')); ?>" alt="<?php echo e(Setting::get('site_name')); ?>" title="<?php echo e(Setting::get('site_name')); ?>">
    </a>

    <ul class="nav nav-pills nav-justified flex-grow-1">
        <?php if(count(config('panel.available_languages', [])) > 1): ?>
            <li class="nav-item dropdown d-md-down-none">
                <a class="nav-link" data-toggle="dropdown" href="#" role="button" aria-haspopup="true" aria-expanded="false">
                    <?php echo e(strtoupper(app()->getLocale())); ?>

                </a>
                <div class="dropdown-menu dropdown-menu-right">
                    <?php $__currentLoopData = config('panel.available_languages'); $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $langLocale => $langName): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
                        <a class="dropdown-item" href="<?php echo e(url()->current()); ?>?change_language=<?php echo e($langLocale); ?>"><?php echo e(strtoupper($langLocale)); ?> (<?php echo e($langName); ?>)</a>
                    <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>
                </div>
            </li>
        <?php endif; ?>
        <li class="nav-item <?php echo e(request()->routeIs('page.home') ? 'active': ''); ?>">
            <a class="nav-link text-success" href="<?php echo e(route('page.home')); ?>">Home</a>
        </li>
        <li class="nav-item <?php echo e(request()->routeIs('page.messages') ? 'active': ''); ?>">
            <a class="nav-link text-success" href="<?php echo e(route('page.messages')); ?>">Messages</a>
        </li>
        <div class="rounded-circle "></div>
        <li class="nav-item <?php echo e(request()->routeIs('page.friends') ? 'active': ''); ?>">
            <a class="nav-link text-success" href="<?php echo e(route('page.friends')); ?>">Friends</a>
        </li>
        <li class="nav-item <?php echo e(request()->routeIs('page.discover') ? 'active': ''); ?>">
            <a class="nav-link text-success" href="<?php echo e(route('page.discover')); ?>">Discover</a>
        </li>
        <li class="nav-item <?php echo e(request()->routeIs('page.settings') ? 'active': ''); ?>">
            <a class="nav-link text-success" href="<?php echo e(route('page.settings')); ?>">Settings</a>
        </li>
        <li class="nav-item">
            <a class="nav-link text-success" href="<?php echo e(route('logout')); ?>">Log out</a>
        </li>
    </ul>
</header>