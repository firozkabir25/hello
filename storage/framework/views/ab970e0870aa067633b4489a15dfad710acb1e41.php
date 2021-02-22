

<?php $__env->startSection('content'); ?>

    <div class="col-lg-10 col-lg-offset-1">
        <div class="panel">
            <div class="panel-heading">
                <h3 class="panel-title"><?php echo e(__('Create New Seller Package')); ?></h3>
            </div>

            <!--Horizontal Form-->
            <!--===================================================-->
            <form class="form-horizontal" action="<?php echo e(route('seller_packages.store')); ?>" method="POST" enctype="multipart/form-data">
            	<?php echo csrf_field(); ?>
                <div class="panel-body">
                    <div class="form-group">
                        <label class="col-sm-2 control-label" for="name"><?php echo e(__('Package Name')); ?></label>
                        <div class="col-sm-10">
                            <input type="text" placeholder="<?php echo e(__('Name')); ?>" id="name" name="name" class="form-control" required>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label" for="amount"><?php echo e(__('Amount')); ?></label>
                        <div class="col-sm-10">
                            <input type="number" min="0" step="0.01" placeholder="<?php echo e(__('Amount')); ?>" id="amount" name="amount" class="form-control" required>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label" for="product_upload"><?php echo e(__('Product Upload')); ?></label>
                        <div class="col-sm-10">
                            <input type="number" min="0" step="1" placeholder="<?php echo e(__('Product Upload')); ?>" id="product_upload" name="product_upload" class="form-control" required>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label" for="digital_product_upload"><?php echo e(__('Digital Product Upload')); ?></label>
                        <div class="col-sm-10">
                            <input type="number" min="0" step="1" placeholder="<?php echo e(__('Digital Product Upload')); ?>" id="digital_product_upload" name="digital_product_upload" class="form-control" required>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label" for="duration"><?php echo e(__('Duration')); ?></label>
                        <div class="col-sm-10">
                            <input type="number" min="0" step="1" placeholder="<?php echo e(__('Validity in number of days')); ?>" id="duration" name="duration" class="form-control" required>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label" for="logo"><?php echo e(__('Package Logo')); ?></label>
                        <div class="col-sm-10">
                            <input type="file" id="logo" name="logo" class="form-control">
                        </div>
                    </div>
                </div>
                <div class="panel-footer text-right">
                    <button class="btn btn-purple" type="submit"><?php echo e(__('Save')); ?></button>
                </div>
            </form>
            <!--===================================================-->
            <!--End Horizontal Form-->

        </div>
    </div>

<?php $__env->stopSection(); ?>

<?php echo $__env->make('backend.layouts.app', \Illuminate\Support\Arr::except(get_defined_vars(), ['__data', '__path']))->render(); ?><?php /**PATH /opt/lampp/htdocs/active/resources/views/seller_packages/create.blade.php ENDPATH**/ ?>