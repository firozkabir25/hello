

<?php $__env->startSection('content'); ?>
<div class="row">
    <div class="col-sm-12">
        <a href="<?php echo e(route('seller_packages.create')); ?>" class="btn btn-rounded btn-info pull-right"><?php echo e(__('Add New Package')); ?></a>
    </div>
</div>

<br>

<div class="row">
    <?php $__currentLoopData = $seller_packages; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $key => $seller_package): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
        <div class="col-lg-3">
            <div class="panel">
                <div class="panel-body text-center">
                    <img alt="Package Logo" class="img-lg img-circle mar-btm" src="<?php echo e(asset($seller_package->logo)); ?>">
                    <p class="text-lg text-semibold mar-no text-main"><?php echo e($seller_package->name); ?></p>
                    <p class="text-3x"><?php echo e(single_price($seller_package->amount)); ?></p>
                    <p class="text-sm text-overflow pad-top">
                         Product Upload:
                        <span class="text-bold"><?php echo e($seller_package->product_upload); ?></span>
                    </p>
                    <p class="text-sm text-overflow pad-top">
                         Digital Product Upload:
                        <span class="text-bold"><?php echo e($seller_package->digital_product_upload); ?></span>
                    </p>
                    <p class="text-sm text-overflow pad-top">
                         Duration:
                        <span class="text-bold"><?php echo e($seller_package->duration); ?> days</span>
                    </p>
                    <div class="mar-top">
                        <a href="<?php echo e(route('seller_packages.edit', encrypt($seller_package->id))); ?>" class="btn btn-mint"><?php echo e(__('Edit')); ?></a>
                        <a onclick="confirm_modal('<?php echo e(route('seller_packages.destroy', $seller_package->id)); ?>');" class="btn btn-danger"><?php echo e(__('Delete')); ?></a>
                    </div>
                </div>
            </div>
        </div>
    <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>
</div>


<?php $__env->stopSection(); ?>

<?php echo $__env->make('backend.layouts.app', \Illuminate\Support\Arr::except(get_defined_vars(), ['__data', '__path']))->render(); ?><?php /**PATH /opt/lampp/htdocs/active/resources/views/seller_packages/index.blade.php ENDPATH**/ ?>