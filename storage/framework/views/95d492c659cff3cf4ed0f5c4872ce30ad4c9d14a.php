<?php $__env->startSection('content'); ?>
		    <div class="card-header row gutters-5">
				<div class="col text-center text-md-left">
					<h5 class="mb-md-0 h6"><?php echo e(translate('Wallet')); ?></h5>
				</div>
		    </div>
		    <div class="card-body">
		        <table class="table aiz-table mb-0">
		            <thead>
		                <tr>
		                    <th>#</th>
		                    <th><?php echo e(translate('Wallet Amount')); ?></th>
		                    <th>Update</th>
		                </tr>
		            </thead>
                    <tbody>
                        <?php $__currentLoopData = $wallets; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $wallte): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
                            <tr>
                                <td><?php echo e($wallte->id); ?></td>
                                <td><?php echo e($wallte->customer_wallet); ?></td>
                                <td ><a href="<?php echo e(route('cwallet.edit', $wallte->id)); ?>">Update</a></td>
                            </tr>
                        <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>                            
                    </tbody>
		        </table>
		    </div>
    <?php $__env->stopSection(); ?>

<?php echo $__env->make('backend.layouts.app', \Illuminate\Support\Arr::except(get_defined_vars(), ['__data', '__path']))->render(); ?><?php /**PATH /opt/lampp/htdocs/active/resources/views/backend/customer_wallet/index.blade.php ENDPATH**/ ?>