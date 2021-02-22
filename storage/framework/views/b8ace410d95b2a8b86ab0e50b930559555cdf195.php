

<?php $__env->startSection('content'); ?>

<div class="aiz-titlebar text-left mt-2 mb-3">
	<div class="row align-items-center">
		<div class="col-md-6">
			<h1 class="h3"><?php echo e(translate('All Pick-up Points')); ?></h1>
		</div>
		<div class="col-md-6 text-md-right">
			<a href="<?php echo e(route('pick_up_points.create')); ?>" class="btn btn-circle btn-info">
				<span><?php echo e(translate('Add New Pick-up Point')); ?></span>
			</a>
		</div>
	</div>
</div>

<div class="card">
	<div class="card-header row gutters-5">
		<div class="col text-center text-md-left">
			<h5 class="mb-md-0 h6"><?php echo e(translate('Brands')); ?></h5>
		</div>
		<div class="col-md-4">
			<form class="" id="sort_pickup_points" action="" method="GET">
				<div class="input-group input-group-sm">
					<input type="text" class="form-control" id="search" name="search"<?php if(isset($sort_search)): ?> value="<?php echo e($sort_search); ?>" <?php endif; ?> placeholder="<?php echo e(translate('Type name & Enter')); ?>">
				</div>
			</form>
		</div>
	</div>
    <div class="card-body">
        <table class="table aiz-table mb-0">
            <thead>
                <tr>
                    <th width="10%">#</th>
                    <th><?php echo e(translate('Name')); ?></th>
                    <th><?php echo e(translate('Manager')); ?></th>
                    <th><?php echo e(translate('Location')); ?></th>
                    <th><?php echo e(translate('Pickup Station Contact')); ?></th>
                    <th><?php echo e(translate('Status')); ?></th>
                    <th width="10%" class="text-right"><?php echo e(translate('Options')); ?></th>
                </tr>
            </thead>
            <tbody>
                <?php $__currentLoopData = $pickup_points; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $key => $pickup_point): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
                    <tr>
						<td><?php echo e(($key+1) + ($pickup_points->currentPage() - 1)*$pickup_points->perPage()); ?></td>
                        <td><?php echo e($pickup_point->getTranslation('name')); ?></td>
                        <?php if($pickup_point->staff != null && $pickup_point->staff->user != null): ?>
                            <td><?php echo e($pickup_point->staff->user->name); ?></td>
                        <?php else: ?>
                            <td><div class="badge badge-inline badge-danger">
                                <?php echo e(translate('No Manager')); ?>

                            </div></td>
                        <?php endif; ?>
                        <td><?php echo e($pickup_point->getTranslation('address')); ?></td>
                        <td><?php echo e($pickup_point->phone); ?></td>
                        <td>
                            <?php if($pickup_point->pick_up_status != 1): ?>
                                <div class="badge badge-inline badge-danger">
                                    <?php echo e(translate('Close')); ?>

                                </div>
                            <?php else: ?>
                                <div class="badge badge-inline badge-success">
                                    <?php echo e(translate('Open')); ?>

                                </div>
                            <?php endif; ?>
                        </td>
						<td class="text-right">
							<a class="btn btn-soft-primary btn-icon btn-circle btn-sm" href="<?php echo e(route('pick_up_points.edit', ['id'=>$pickup_point->id, 'lang'=>env('DEFAULT_LANGUAGE')] )); ?>" title="<?php echo e(translate('Edit')); ?>">
								<i class="las la-edit"></i>
							</a>
							<a href="#" class="btn btn-soft-danger btn-icon btn-circle btn-sm confirm-delete" data-href="<?php echo e(route('pick_up_points.destroy', $pickup_point->id)); ?>" title="<?php echo e(translate('Delete')); ?>">
								<i class="las la-trash"></i>
							</a>
						</td>
                    </tr>
                <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>
            </tbody>
        </table>
		<div class="aiz-pagination">
			<?php echo e($pickup_points->appends(request()->input())->links()); ?>

		</div>
    </div>
</div>

<?php $__env->stopSection(); ?>

<?php $__env->startSection('modal'); ?>
    <?php echo $__env->make('modals.delete_modal', \Illuminate\Support\Arr::except(get_defined_vars(), ['__data', '__path']))->render(); ?>
<?php $__env->stopSection(); ?>

<?php $__env->startSection('script'); ?>
    <script type="text/javascript">
        function sort_pickup_points(el){
            $('#sort_pickup_points').submit();
        }
    </script>
<?php $__env->stopSection(); ?>

<?php echo $__env->make('backend.layouts.app', \Illuminate\Support\Arr::except(get_defined_vars(), ['__data', '__path']))->render(); ?><?php /**PATH /opt/lampp/htdocs/active/resources/views/backend/setup_configurations/pickup_point/index.blade.php ENDPATH**/ ?>