<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <title><?php echo Setting::get('site_title'); ?></title>

    <link href="http://socialite.dev/themes/default/assets/css/style.d843a54abab569eaede4ed3a69a9b943.css" rel="stylesheet">

</head>
<body id="app-layout">
    <nav class="navbar socialite navbar-default no-bg" style="position: relative;">
    <div class="container-fluid">
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
        <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-4">
            
                            
            <?php if(Auth::guest()): ?>
            <ul class="nav navbar-nav navbar-right">
                <li class="logout">
                    <a href="<?php echo e(url('/register')); ?>"><i class="fa fa-sign-in" aria-hidden="true"></i> <?php echo e(trans('common.join')); ?></a>
                </li>
                <li class="logout">
                    <a href="<?php echo e(url('/login')); ?>"><i class="fa fa-unlock" aria-hidden="true"></i> <?php echo e(trans('common.signin')); ?></a>
                </li>
                <?php if(Config::get('app.env') == 'demo'): ?>
                    <li class="logout">
                        <a href="http://socialite-rtl.laravelguru.com" target="_blank"><?php echo e(trans('common.rtl_version')); ?></a>
                    </li>
                <?php endif; ?>
            </ul>
            <?php else: ?>
            <ul class="nav navbar-nav navbar-right" id="navbar-right">
                    <li class="dropdown user-image socialite">
                        <a href="<?php echo e(url(Auth::user()->username)); ?>" class="dropdown-toggle no-padding" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">
                            <img src="<?php echo e(Auth::user()->avatar); ?>" alt="<?php echo e(Auth::user()->name); ?>" class="img-radius img-30" title="<?php echo e(Auth::user()->name); ?>">

                            <span class="user-name"><?php echo e(Auth::user()->name); ?></span><i class="fa fa-angle-down" aria-hidden="true"></i></a>
                            <ul class="dropdown-menu">
                                <?php if(Auth::user()->hasRole('admin')): ?>
                                <li class="<?php echo e(Request::segment(1) == 'admin' ? 'active' : ''); ?>"><a href="<?php echo e(url('admin')); ?>"><i class="fa fa-user-secret" aria-hidden="true"></i><?php echo e(trans('common.admin')); ?></a></li>
                                <?php endif; ?>
                                <li class="<?php echo e((Request::segment(1) == Auth::user()->username && Request::segment(2) == '') ? 'active' : ''); ?>"><a href="<?php echo e(url(Auth::user()->username)); ?>"><i class="fa fa-user" aria-hidden="true"></i><?php echo e(trans('common.my_profile')); ?></a></li>

                                <li class="<?php echo e(Request::segment(2) == 'pages-groups' ? 'active' : ''); ?>"><a href="<?php echo e(url(Auth::user()->username.'/pages-groups')); ?>"><i class="fa fa-bars" aria-hidden="true"></i><?php echo e(trans('common.my_pages_groups')); ?></a></li>

                                <li class="<?php echo e(Request::segment(3) == 'general' ? 'active' : ''); ?>"><a href="<?php echo e(url('/'.Auth::user()->username.'/settings/general')); ?>"><i class="fa fa-cog" aria-hidden="true"></i><?php echo e(trans('common.settings')); ?></a></li>

                                <li><a href="<?php echo e(url('/logout')); ?>"><i class="fa fa-unlock" aria-hidden="true"></i><?php echo e(trans('common.logout')); ?></a></li>
                            </ul>
                        </li>
                   <!--  <li class="logout">
                        <a href="<?php echo e(url('/logout')); ?>"><i class="fa fa-sign-out" aria-hidden="true"></i></a>
                    </li> -->
                </ul>
                <?php endif; ?>
            </div><!-- /.navbar-collapse -->
        </div><!-- /.container-fluid -->
    </nav>  
    

    <?php echo $__env->yieldContent('content'); ?>

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

</body>
</html>
