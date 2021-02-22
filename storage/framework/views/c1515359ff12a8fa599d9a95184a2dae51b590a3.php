

<?php $__env->startSection('content'); ?>

    <div class="row">
        <div class="col-lg-12">
            <div class="card">
                <div class="card-body">
                    <table class="table aiz-table mb-0">
                        <thead>
                            <tr>
                                <th>#</th>
                                <th width="20%"><?php echo e(translate('Name')); ?></th>
                                <th><?php echo e(translate('Points')); ?></th>
                                <th><?php echo e(translate('Convert Status')); ?></th>
                                <th><?php echo e(translate('Earned At')); ?></th>
                                <th class="text-right" width="10%"><?php echo e(translate('Options')); ?></th>
                            </tr>
                        </thead>
                        <tbody>
                            <?php $__currentLoopData = $club_points; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $key => $club_point): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
                                <tr>
                                    <td><?php echo e(($key+1) + ($club_points->currentPage() - 1)*$club_points->perPage()); ?></td>
                                    <?php if($club_point->user != null): ?>
                                        <td><?php echo e($club_point->user->name); ?></td>
                                    <?php endif; ?>
                                    <td><?php echo e($club_point->points); ?></td>
                                    <td>
                                        <?php if($club_point->convert_status == 1): ?>
                                            <div class="label label-table label-info">
                                                <?php echo e(translate('Converted')); ?>

                                            </div>
                                        <?php else: ?>
                                            <div class="label label-table label-info">
                                                <?php echo e(translate('Pending')); ?>

                                            </div>
                                        <?php endif; ?>
                                    </td>
                                    <td><?php echo e($club_point->created_at); ?></td>
                                    <td class="text-right">
        								<a class="btn btn-soft-primary btn-icon btn-circle btn-sm" href="<?php echo e(route('club_point.details', encrypt($club_point->id))); ?>" title="<?php echo e(translate('View')); ?>">
        									<i class="las la-eye"></i>
        								</a>
  				                   </td>
                                </tr>
                            <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>
                        </tbody>
                    </table>
                    <div class="aiz-pagination">
                        <?php echo e($club_points->appends(request()->input())->links()); ?>

                    </div>
                </div>
            </div>
        </div>
    </div>


<?php $__env->stopSection(); ?>

<?php echo $__env->make('backend.layouts.app', \Illuminate\Support\Arr::except(get_defined_vars(), ['__data', '__path']))->render(); ?><?php /**PATH /opt/lampp/htdocs/active/resources/views/club_points/index.blade.php ENDPATH**/ ?>