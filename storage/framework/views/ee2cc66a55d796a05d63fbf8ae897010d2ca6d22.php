<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <meta name="csrf_token" content="<?php echo csrf_token(); ?>"/>
        <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no" />
        <meta name="viewport" content="user-scalable=no, initial-scale=1, maximum-scale=1, minimum-scale=1, width=device-width, height=device-height, target-densitydpi=device-dpi" />
        <meta name="keywords" content="<?php echo e(Setting::get('meta_keywords')); ?>">
        <meta name="description" content="<?php echo e(Setting::get('meta_description')); ?>">
        <link rel="icon" type="image/x-icon" href="<?php echo url('setting/'.Setting::get('favicon')); ?>">


        <title><?php echo e(Theme::get('title')); ?></title>

        <link href="<?php echo e(Theme::asset()->url('css/flag-icon.css')); ?>" rel="stylesheet">

        <?php echo Theme::asset()->styles(); ?>


        <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
        <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
        <!--[if lt IE 9]>
            <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.2/html5shiv.min.js"></script>
            <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
        <![endif]-->
        <script type="text/javascript">
        function SP_source() {
          return "<?php echo e(url('/')); ?>/";
        }

        var base_url = "<?php echo e(url('/')); ?>/";
        var theme_url = "<?php echo Theme::asset()->url(''); ?>";
        var current_username = "<?php echo e(Auth::user()->username); ?>";

        </script>
        <?php echo Theme::asset()->scripts(); ?>

        <?php if(Setting::get('google_analytics') != NULL): ?>
            <?php echo Setting::get('google_analytics'); ?>

        <?php endif; ?>
    </head>
    <body <?php if(Setting::get('enable_rtl') == 'on'): ?> class="direction-rtl" <?php endif; ?>>
        <?php echo Theme::partial('header'); ?>


        <div class="page-wrapper">
            <div class="container">
                <div class="row">

                    <div class="col-md-3">
                        <?php echo Theme::partial('admin-leftbar'); ?>

                    </div>

                    <div class="col-md-9">
                        <?php echo Theme::content(); ?>

                    </div>

                </div><!-- /row -->
            </div>
        </div><!-- /amin-content -->
        
        <?php echo Theme::partial('footer'); ?>

        <script>
            var pusherConfig = {
                token: "<?php echo e(csrf_token()); ?>",
                PUSHER_KEY: "<?php echo e(config('broadcasting.connections.pusher.key')); ?>"
            };
       </script>

        <?php echo Theme::asset()->container('footer')->scripts(); ?>

    </body>
</html>
