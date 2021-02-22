<?php $__env->startSection('content'); ?>

<div class="aiz-titlebar text-left mt-2 mb-3">
    <h3 class="mb-0 h3"><?php echo e(translate('Update Customer wallet')); ?></h3>
</div>
    <div>
        <form method="POST" action="<?php echo e(route('cwallet.update', $wallets->id)); ?>"> 
            <?php echo csrf_field(); ?>
            <?php echo method_field('PUT'); ?>
                <div class="col-md-3">
                    <label>Customer Wallet :</label>
                </div>
                <div class="col-sm-9">
                    <input type="text" class="form-control" name="customer_wallet" value="<?php echo e($wallets->customer_wallet); ?>"></br>
                    <button type="submit" class=" btn btn-primary">Update</button>
                </div>
        </form>
    </div>
   

<?php $__env->stopSection(); ?>
<?php echo $__env->make('backend.layouts.app', \Illuminate\Support\Arr::except(get_defined_vars(), ['__data', '__path']))->render(); ?><?php /**PATH /opt/lampp/htdocs/active/resources/views/backend/customer_wallet/edit.blade.php ENDPATH**/ ?>