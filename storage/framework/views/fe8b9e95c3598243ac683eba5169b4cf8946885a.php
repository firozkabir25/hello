

<?php $__env->startSection('content'); ?>
<section class="py-5">
    <div class="container">
        <div class="d-flex align-items-start">
            <?php echo $__env->make('frontend.inc.user_side_nav', \Illuminate\Support\Arr::except(get_defined_vars(), ['__data', '__path']))->render(); ?>
            <div class="aiz-user-panel">
                <div class="card">
                    <div class="card-header">
                        <h5 class="mb-0 h6"><?php echo e(translate('Applied Refund Request')); ?></h5>
                    </div>
                    <div class="card-body">
                        <table class="table aiz-table mb-0">
                            <thead>
                                <tr>
                                  <th>#</th>
                                  <th><?php echo e(translate('Date')); ?></th>
                                  <th><?php echo e(translate('Order id')); ?></th>
                                  <th><?php echo e(translate('Product')); ?></th>
                                  <th><?php echo e(translate('Amount')); ?></th>
                                  <th><?php echo e(translate('Status')); ?></th>
                                </tr>
                            </thead>
                            <tbody>
                                  <?php $__currentLoopData = $refunds; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $key => $refund): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
                                      <tr>
                                          <td><?php echo e($key+1); ?></td>
                                          <td><?php echo e(date('d-m-Y', strtotime($refund->created_at))); ?></td>
                                          <td>
                                              <?php if($refund->order != null): ?>
                                                  <?php echo e($refund->order->code); ?>

                                              <?php endif; ?>
                                          </td>
                                          <td>
                                              <?php if($refund->orderDetail != null && $refund->orderDetail->product != null): ?>
                                                  <?php echo e($refund->orderDetail->product->getTranslation('name')); ?>

                                              <?php endif; ?>
                                          </td>
                                          <td>
                                              <?php if($refund->orderDetail != null): ?>
                                                  <?php echo e(single_price($refund->orderDetail->price)); ?>

                                              <?php endif; ?>
                                          </td>
                                          <td>
                                              <?php if($refund->refund_status == 1): ?>
                                                  <span class="badge badge-inline badge-success"><?php echo e(translate('Approved')); ?></span>
                                              <?php else: ?>
                                                  <span class="badge badge-inline badge-info"><?php echo e(translate('PENDING')); ?></span>
                                              <?php endif; ?>
                                          </td>
                                      </tr>
                                  <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>
                            </tbody>
                        </table>
                        <?php echo e($refunds->links()); ?>

                    </div>
                </div>
            </div>
        </div>
    </div>
</section>




<?php $__env->stopSection(); ?>

<?php echo $__env->make('frontend.layouts.app', \Illuminate\Support\Arr::except(get_defined_vars(), ['__data', '__path']))->render(); ?><?php /**PATH /opt/lampp/htdocs/active/resources/views/refund_request/frontend/refund_request/index.blade.php ENDPATH**/ ?>