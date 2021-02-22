

<?php $__env->startSection('content'); ?>
    <div class="card">
        <div class="card-header">
            <h5 class="mb-0 h6"><?php echo e(translate('Refferal Users')); ?></h5>
        </div>
        <div class="card-body">
            <table class="table aiz-table mb-0">
                <thead>
                <tr>
                    <th>#</th>
                    <th><?php echo e(translate('Name')); ?></th>
                    <th><?php echo e(translate('Phone')); ?></th>
                    <th><?php echo e(translate('Email Address')); ?></th>
                    <th><?php echo e(translate('Reffered By')); ?></th>
                </tr>
                </thead>
                <tbody>
                <?php $__currentLoopData = $refferal_users; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $key => $refferal_user): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
                    <?php if($refferal_user != null): ?>
                        <tr>
                            <td><?php echo e(($key+1) + ($refferal_users->currentPage() - 1)*$refferal_users->perPage()); ?></td>
                            <td><?php echo e($refferal_user->name); ?></td>
                            <td><?php echo e($refferal_user->phone); ?></td>
                            <td><?php echo e($refferal_user->email); ?></td>
                            <td>
                                <?php if(\App\User::find($refferal_user->referred_by) != null): ?>
                                    <?php echo e(\App\User::find($refferal_user->referred_by)->name); ?> (<?php echo e(\App\User::find($refferal_user->referred_by)->email); ?>)
                                <?php endif; ?>
                            </td>
                        </tr>
                    <?php endif; ?>
                <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>
                </tbody>
            </table>
            <div class="aiz-pagination">
                <?php echo e($refferal_users->appends(request()->input())->links()); ?>

            </div>
        </div>
    </div>

<?php $__env->stopSection(); ?>

<?php echo $__env->make('backend.layouts.app', \Illuminate\Support\Arr::except(get_defined_vars(), ['__data', '__path']))->render(); ?><?php /**PATH /opt/lampp/htdocs/active/resources/views/affiliate/refferal_users.blade.php ENDPATH**/ ?>