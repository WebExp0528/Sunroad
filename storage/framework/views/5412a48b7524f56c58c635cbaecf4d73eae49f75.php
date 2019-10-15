<div class="post-filters">
	<div class="panel panel-default">
		<div class="panel-heading">
			<h3 class="panel-title"><?php echo e(trans('common.dashboard')); ?></h3>
		</div>
		<div class="panel-body table-responsive">
				<table class="annual-statistics table text-center">
					<tr>
						<td class="registered"><?php echo e(trans('admin.users_registered')); ?></td>
						<td>
							<div class="widget-sales">
								<div class="no-of-sales"><?php echo e($today_user_count); ?></div>
								<div class="sales">
									<a href="#" class="text-primary"><?php echo e(trans('admin.today')); ?></a>
								</div>
							</div>
						</td>
						<td>
							<div class="widget-sales">
								<div class="no-of-sales"><?php echo e($month_user_count); ?></div>
								<div class="sales">
									<a href="#" class="text-primary"><?php echo e(trans('admin.this_month')); ?></a>
								</div>
							</div>
						</td>
						<td>
							<div class="widget-sales">
								<div class="no-of-sales"><?php echo e($year_user_count); ?></div>
								<div class="sales">
									<a href="#" class="text-primary"><?php echo e(trans('admin.this_year')); ?></a>
								</div>
							</div>
						</td>
						<td>
							<div class="widget-sales">
								<div class="no-of-sales"><?php echo e($total_user_count); ?></div>
								<div class="sales">
									<a href="#" class="text-success"><?php echo e(trans('admin.total')); ?></a>
								</div>
							</div>
						</td>
					</tr>

					<tr>
						<td class="registered"><?php echo e(trans('admin.pages_created')); ?></td>
						<td>
							<div class="widget-sales">
								<div class="no-of-sales"><?php echo e($today_page_count); ?></div>
								<div class="sales">
									<a href="#" class="text-primary"><?php echo e(trans('admin.today')); ?></a>
								</div>
							</div>
						</td>
						<td>
							<div class="widget-sales">
								<div class="no-of-sales"><?php echo e($month_page_count); ?></div>
								<div class="sales">
									<a href="#" class="text-primary"><?php echo e(trans('admin.this_month')); ?></a>
								</div>
							</div>
						</td>
						<td>
							<div class="widget-sales">
								<div class="no-of-sales"><?php echo e($year_page_count); ?></div>
								<div class="sales">
									<a href="#" class="text-primary"><?php echo e(trans('admin.this_year')); ?></a>
								</div>
							</div>
						</td>
						<td>
							<div class="widget-sales">
								<div class="no-of-sales"><?php echo e($total_page_count); ?></div>
								<div class="sales">
									<a href="#" class="text-success"><?php echo e(trans('admin.total')); ?></a>
								</div>
							</div>
						</td>
					</tr>
					<tr>
						<td class="registered"><?php echo e(trans('admin.groups_created')); ?></td>
						<td>
							<div class="widget-sales">
								<div class="no-of-sales"><?php echo e($today_group_count); ?></div>
								<div class="sales">
									<a href="#" class="text-primary"><?php echo e(trans('admin.today')); ?></a>
								</div>
							</div>
						</td>
						<td>
							<div class="widget-sales">
								<div class="no-of-sales"><?php echo e($month_group_count); ?></div>
								<div class="sales">
									<a href="#" class="text-primary"><?php echo e(trans('admin.this_month')); ?></a>
								</div>
							</div>
						</td>
						<td>
							<div class="widget-sales">
								<div class="no-of-sales"><?php echo e($year_group_count); ?></div>
								<div class="sales">
									<a href="#" class="text-primary"><?php echo e(trans('admin.this_year')); ?></a>
								</div>
							</div>
						</td>
						<td>
							<div class="widget-sales">
								<div class="no-of-sales"><?php echo e($total_group_count); ?></div>
								<div class="sales">
									<a href="#" class="text-success"><?php echo e(trans('admin.total')); ?></a>
								</div>
							</div>
						</td>
					</tr>
					<tr>
						<td class="registered"><?php echo e(trans('admin.posts_posted')); ?></td>
						<td>
							<div class="widget-sales">
								<div class="no-of-sales"><?php echo e($today_post_count); ?></div>
								<div class="sales">
									<a href="#" class="text-primary"><?php echo e(trans('admin.today')); ?></a>
								</div>
							</div>
						</td>
						<td>
							<div class="widget-sales">
								<div class="no-of-sales"><?php echo e($month_post_count); ?></div>
								<div class="sales">
									<a href="#" class="text-primary"><?php echo e(trans('admin.this_month')); ?></a>
								</div>
							</div>
						</td>
						<td>
							<div class="widget-sales">
								<div class="no-of-sales"><?php echo e($year_post_count); ?></div>
								<div class="sales">
									<a href="#" class="text-primary"><?php echo e(trans('admin.this_year')); ?></a>
								</div>
							</div>
						</td>
						<td>
							<div class="widget-sales">
								<div class="no-of-sales"><?php echo e($total_post_count); ?></div>
								<div class="sales">
									<a href="#" class="text-success"><?php echo e(trans('admin.total')); ?></a>
								</div>
							</div>
						</td>
					</tr>
					<tr>
						<td class="registered"><?php echo e(trans('admin.comments_posted')); ?></td>
						<td>
							<div class="widget-sales">
								<div class="no-of-sales"><?php echo e($today_comment_count); ?></div>
								<div class="sales">
									<a href="#" class="text-primary"><?php echo e(trans('admin.today')); ?></a>
								</div>
							</div>
						</td>
						<td>
							<div class="widget-sales">
								<div class="no-of-sales"><?php echo e($month_comment_count); ?></div>
								<div class="sales">
									<a href="#" class="text-primary"><?php echo e(trans('admin.this_month')); ?></a>
								</div>
							</div>
						</td>
						<td>
							<div class="widget-sales">
								<div class="no-of-sales"><?php echo e($year_comment_count); ?></div>
								<div class="sales">
									<a href="#" class="text-primary"><?php echo e(trans('admin.this_year')); ?></a>
								</div>
							</div>
						</td>
						<td>
							<div class="widget-sales">
								<div class="no-of-sales"><?php echo e($total_comment_count); ?></div>
								<div class="sales">
									<a href="#" class="text-success"><?php echo e(trans('admin.total')); ?></a>
								</div>
							</div>
						</td>
					</tr>
					<tr>
						<td class="registered"><?php echo e(trans('admin.posts_shared')); ?></td>
						<td>
							<div class="widget-sales">
								<div class="no-of-sales"><?php echo e($today_shared_count); ?></div>
								<div class="sales">
									<a href="#" class="text-primary"><?php echo e(trans('admin.today')); ?></a>
								</div>
							</div>
						</td>
						<td>
							<div class="widget-sales">
								<div class="no-of-sales"><?php echo e($month_shared_count); ?></div>
								<div class="sales">
									<a href="#" class="text-primary"><?php echo e(trans('admin.this_month')); ?></a>
								</div>
							</div>
						</td>
						<td>
							<div class="widget-sales">
								<div class="no-of-sales"><?php echo e($year_shared_count); ?></div>
								<div class="sales">
									<a href="#" class="text-primary"><?php echo e(trans('admin.this_year')); ?></a>
								</div>
							</div>
						</td>
						<td>
							<div class="widget-sales">
								<div class="no-of-sales"><?php echo e($total_shared_count); ?></div>
								<div class="sales">
									<a href="#" class="text-success"><?php echo e(trans('admin.total')); ?></a>
								</div>
							</div>
						</td>
					</tr>
					<tr>
						<td class="registered"><?php echo e(trans('admin.posts_liked')); ?></td>
						<td>
							<div class="widget-sales">
								<div class="no-of-sales"><?php echo e($today_like_count); ?></div>
								<div class="sales">
									<a href="#" class="text-primary"><?php echo e(trans('admin.today')); ?></a>
								</div>
							</div>
						</td>
						<td>
							<div class="widget-sales">
								<div class="no-of-sales"><?php echo e($month_like_count); ?></div>
								<div class="sales">
									<a href="#" class="text-primary"><?php echo e(trans('admin.this_month')); ?></a>
								</div>
							</div>
						</td>
						<td>
							<div class="widget-sales">
								<div class="no-of-sales"><?php echo e($year_like_count); ?></div>
								<div class="sales">
									<a href="#" class="text-primary"><?php echo e(trans('admin.this_year')); ?></a>
								</div>
							</div>
						</td>
						<td>
							<div class="widget-sales">
								<div class="no-of-sales"><?php echo e($total_like_count); ?></div>
								<div class="sales">
									<a href="#" class="text-success"><?php echo e(trans('admin.total')); ?></a>
								</div>
							</div>
						</td>
					</tr>
					<tr>
						<td class="registered"><?php echo e(trans('admin.posts_reported')); ?></td>
						<td>
							<div class="widget-sales">
								<div class="no-of-sales"><?php echo e($today_report_count); ?></div>
								<div class="sales">
									<a href="#" class="text-primary"><?php echo e(trans('admin.today')); ?></a>
								</div>
							</div>
						</td>
						<td>
							<div class="widget-sales">
								<div class="no-of-sales"><?php echo e($month_report_count); ?></div>
								<div class="sales">
									<a href="#" class="text-primary"><?php echo e(trans('admin.this_month')); ?></a>
								</div>
							</div>
						</td>
						<td>
							<div class="widget-sales">
								<div class="no-of-sales"><?php echo e($year_report_count); ?></div>
								<div class="sales">
									<a href="#" class="text-primary"><?php echo e(trans('admin.this_year')); ?></a>
								</div>
							</div>
						</td>
						<td>
							<div class="widget-sales">
								<div class="no-of-sales"><?php echo e($total_report_count); ?></div>
								<div class="sales">
									<a href="#" class="text-success"><?php echo e(trans('admin.total')); ?></a>
								</div>
							</div>
						</td>
					</tr>
				</table>
				<!--end-table-->
				
		</div>
	</div>
</div>