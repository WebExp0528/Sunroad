<div class="list-group list-group-navigation socialite-group">
    <a href="<?php echo e(url('/admin')); ?>" class="list-group-item">

        <div class="list-icon socialite-icon <?php echo e((Request::segment(1) == 'admin' && Request::segment(2)==null) ? 'active' : ''); ?>">
            <i class="fa fa-dashboard"></i>
        </div>
        <div class="list-text">
            <span class="badge pull-right"></span>
            <?php echo e(trans('common.dashboard')); ?>

            <div class="text-muted">
                <?php echo e(trans('common.application_statistics')); ?>

            </div>
        </div>
        <span class="clearfix"></span>
    </a>
    <a href="<?php echo e(url('/admin/general-settings')); ?>" class="list-group-item">

        <div class="list-icon socialite-icon <?php echo e(Request::segment(2) == 'general-settings' ? 'active' : ''); ?>">
            <i class="fa fa-shield"></i>
        </div>
        <div class="list-text">
            <span class="badge pull-right"></span>
            <?php echo e(trans('common.website_settings')); ?>

            <div class="text-muted">
             <?php echo e(trans('common.general_website_settings')); ?>

         </div>
     </div>
     <span class="clearfix"></span>
 </a>
 <a href="<?php echo e(url('/admin/user-settings')); ?>" class="list-group-item">

    <div class="list-icon socialite-icon <?php echo e(Request::segment(2) == 'user-settings' ? 'active' : ''); ?>">
        <i class="fa fa-user-secret"></i>
    </div>
    <div class="list-text">
        <span class="badge pull-right"></span>
        <?php echo e(trans('common.user_settings')); ?>

        <div class="text-muted">
            <?php echo e(trans('common.user_settings_text')); ?>

        </div>
    </div>
    <span class="clearfix"></span>
</a>
    <a href="<?php echo e(url('/admin/custom-pages')); ?>" class="list-group-item">

        <div class="list-icon socialite-icon <?php echo e(Request::segment(2) == 'custom-pages' ? 'active' : ''); ?>">
            <i class="fa fa-files-o"></i>
        </div>
        <div class="list-text">
            <span class="badge pull-right"></span>
            <?php echo e(trans('common.custom_pages')); ?>

            <div class="text-muted">
                <?php echo e(trans('common.custom_pages_text')); ?>

            </div>
        </div>
        <span class="clearfix"></span>
    </a>

    <a href="<?php echo e(url('/admin/wallpapers')); ?>" class="list-group-item">
  
        <div class="list-icon socialite-icon <?php echo e(Request::segment(2) == 'wallpapers' ? 'active' : ''); ?>">
            <i class="fa fa-picture-o"></i>
        </div>
        <div class="list-text">
            <span class="badge pull-right"></span>
            <?php echo e(trans('common.wallpapers')); ?>

            <div class="text-muted">
                <?php echo e(trans('common.wallpapers_text')); ?>

            </div>
        </div>
        <span class="clearfix"></span>
    </a> 
    
    <a href="<?php echo e(url('/admin/themes')); ?>" class="list-group-item">
  
        <div class="list-icon socialite-icon <?php echo e(Request::segment(2) == 'themes' ? 'active' : ''); ?>">
            <i class="fa fa-picture-o"></i>
        </div>
        <div class="list-text">
            <span class="badge pull-right"></span>
            <?php echo e(trans('common.themes')); ?>

            <div class="text-muted">
                <?php echo e(trans('common.themes_text')); ?>

            </div>
        </div>
        <span class="clearfix"></span>
    </a>
<a href="<?php echo e(url('/admin/page-settings')); ?>" class="list-group-item">

    <div class="list-icon socialite-icon <?php echo e(Request::segment(2) == 'page-settings' ? 'active' : ''); ?>">
        <i class="fa fa-comments"></i>
    </div>
    <div class="list-text">
        <span class="badge pull-right"></span>
        <?php echo e(trans('common.page_settings')); ?>

        <div class="text-muted">
            <?php echo e(trans('common.page_settings_text')); ?>

        </div>
    </div>
    <span class="clearfix"></span>
</a>
<a href="<?php echo e(url('/admin/group-settings')); ?>" class="list-group-item">

    <div class="list-icon socialite-icon <?php echo e(Request::segment(2) == 'group-settings' ? 'active' : ''); ?>">
        <i class="fa fa-group"></i>
    </div>
    <div class="list-text">
        <span class="badge pull-right"></span>
        <?php echo e(trans('common.group_settings')); ?>

        <div class="text-muted">
            <?php echo e(trans('common.group_settings_text')); ?>

        </div>
    </div>
    <span class="clearfix"></span>
</a>
<a href="<?php echo e(url('/admin/event-settings')); ?>" class="list-group-item">

    <div class="list-icon socialite-icon <?php echo e(Request::segment(2) == 'event-settings' ? 'active' : ''); ?>">
        <i class="fa fa-calendar"></i>
    </div>
    <div class="list-text">
        <span class="badge pull-right"></span>
        <?php echo e(trans('common.event_settings')); ?>

        <div class="text-muted">
            <?php echo e(trans('common.event_settings_text')); ?>

        </div>
    </div>
    <span class="clearfix"></span>
</a>
<a href="<?php echo e(url('/admin/announcements')); ?>" class="list-group-item">

    <div class="list-icon socialite-icon <?php echo e(Request::segment(2) == 'announcements' ? 'active' : ''); ?>">
        <i class="fa fa-bullhorn"></i>
    </div>
    <div class="list-text">
        <span class="badge pull-right"></span>
        <?php echo e(trans('common.announcements')); ?>

        <div class="text-muted">
            <?php echo e(trans('common.announcements_text')); ?>

        </div>
    </div>
    <span class="clearfix"></span>
</a>

    <a href="<?php echo e(url('/admin/users')); ?>" class="list-group-item">

        <div class="list-icon socialite-icon <?php echo e(Request::segment(2) == 'users' ? 'active' : ''); ?>">
            <i class="fa fa-user-plus"></i>
        </div>
        <div class="list-text">
            <span class="badge pull-right"></span>
            <?php echo e(trans('common.manage_users')); ?>

            <div class="text-muted">
                <?php echo e(trans('common.manage_users_text')); ?>

            </div>
        </div>
        <span class="clearfix"></span>
    </a>
    <a href="<?php echo e(url('/admin/pages')); ?>" class="list-group-item">

        <div class="list-icon socialite-icon <?php echo e(Request::segment(2) == 'pages' ? 'active' : ''); ?>">
            <i class="fa fa-file-text"></i>
        </div>
        <div class="list-text">
            <span class="badge pull-right"></span>
            <?php echo e(trans('common.manage_pages')); ?>

            <div class="text-muted">
                <?php echo e(trans('common.manage_pages_text')); ?>

            </div>
        </div>
        <span class="clearfix"></span>
    </a>
    <a href="<?php echo e(url('/admin/groups')); ?>" class="list-group-item">

        <div class="list-icon socialite-icon <?php echo e(Request::segment(2) == 'groups' ? 'active' : ''); ?>">
            <i class="fa fa-group"></i>
        </div>
        <div class="list-text">
            <span class="badge pull-right"></span>
            <?php echo e(trans('common.manage_groups')); ?>

            <div class="text-muted">
                <?php echo e(trans('common.manage_groups_text')); ?>

            </div>
        </div>
        <span class="clearfix"></span>
    </a>
     <a href="<?php echo e(url('/admin/events')); ?>" class="list-group-item">

        <div class="list-icon socialite-icon <?php echo e(Request::segment(2) == 'events' ? 'active' : ''); ?>">
            <i class="fa fa-calendar-o"></i>
        </div>
        <div class="list-text">
            <span class="badge pull-right"></span>
            <?php echo e(trans('common.manage_events')); ?>

            <div class="text-muted">
                <?php echo e(trans('common.manage_events_text')); ?>

            </div>
        </div>
        <span class="clearfix"></span>
    </a>
    <a href="<?php echo e(url('/admin/manage-reports')); ?>" class="list-group-item">

        <div class="list-icon socialite-icon <?php echo e(Request::segment(2) == 'manage-reports' ? 'active' : ''); ?>">
            <i class="fa fa-bug"></i>
        </div>
        
        <div class="list-text">
            <?php if(Auth::user()->getReportsCount() > 0): ?>
            <span class="badge pull-right"><?php echo e(Auth::user()->getReportsCount()); ?></span>
            <?php endif; ?>            
            <?php echo e(trans('common.manage_reports')); ?>

            <div class="text-muted">
                <?php echo e(trans('common.manage_reports_text')); ?>

            </div>             
        </div>
        <span class="clearfix"></span>
    </a>   

    <a href="<?php echo e(url('/admin/manage-ads')); ?>" class="list-group-item">

        <div class="list-icon socialite-icon <?php echo e(Request::segment(2) == 'manage-ads' ? 'active' : ''); ?>">
            <i class="fa fa-send"></i>
        </div>
        <div class="list-text">
            <span class="badge pull-right"></span>
            <?php echo e(trans('common.manage_ads')); ?>

            <div class="text-muted">
                <?php echo e(trans('common.manage_ads_text')); ?>

            </div>
        </div>
        <span class="clearfix"></span>
    </a>
    <a href="<?php echo e(url('/admin/get-env')); ?>" class="list-group-item">

        <div class="list-icon socialite-icon <?php echo e(Request::segment(2) == 'get-env' ? 'active' : ''); ?>">
            <i class="fa fa-cogs"></i>
        </div>
        <div class="list-text">
            <span class="badge pull-right"></span>
            <?php echo e(trans('common.environment_settings')); ?>

            <div class="text-muted">
                <?php echo e(trans('common.edit_on_risk')); ?>

            </div>
        </div>
        <span class="clearfix"></span>
    </a>
    <a href="<?php echo e(url('/admin/update-database')); ?>" class="list-group-item">

        <div class="list-icon socialite-icon <?php echo e(Request::segment(2) == 'update-database' ? 'active' : ''); ?>">
            <i class="fa fa-database"></i>
        </div>
        <div class="list-text">
            <span class="badge pull-right"></span>
            Database Update 
            <div class="text-muted">
                database update 
            </div>
        </div>
        <span class="clearfix"></span>
    </a>
</div>



