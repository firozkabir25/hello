

<?php $__env->startSection('content'); ?>

<div class="card">
    <div class="card-header">
        <h5 class="mb-0 h6"><?php echo e(translate('Refund Request All')); ?></h5>
    </div>
    <div class="card-body">
        <table class="table aiz-table">
            <thead>
                <tr>
                    <th>#</th>
                    <th><?php echo e(translate('Order Code')); ?></th>
                    <th><?php echo e(translate('Seller Name')); ?></th>
                    <th><?php echo e(translate('Product')); ?></th>
                    <th><?php echo e(translate('Price')); ?></th>
                    <th><?php echo e(translate('Seller Approval')); ?></th>
                    <th><?php echo e(translate('Admin Approval')); ?></th>
                    <th><?php echo e(translate('Refund Status')); ?></th>
                </tr>
            </thead>
            <tbody>
                <?php $__currentLoopData = $refunds; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $key => $refund): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
                    <tr>
                        <td><?php echo e(($key+1) + ($refunds->currentPage() - 1)*$refunds->perPage()); ?></td>
                        <td>
                          <?php if($refund->order != null): ?>
                              <?php echo e($refund->order->code); ?>

                          <?php else: ?>
                              <?php echo e(translate('Order deleted')); ?>

                          <?php endif; ?>
                        </td>
                        <td>
                            <?php if($refund->seller != null): ?>
                                <?php echo e($refund->seller->name); ?>

                            <?php endif; ?>
                        </td>
                        <td>
                            <?php if($refund->orderDetail != null && $refund->orderDetail->product != null): ?>
                              <a href="<?php echo e(route('product', $refund->orderDetail->product->slug)); ?>" target="_blank" class="media-block">
                                <div class="form-group row">
                                  <div class="col-md-5">
                                    <img src="<?php echo e(uploaded_asset($refund->orderDetail->product->thumbnail_img)); ?>" alt="Image" class="w-50px">
                                  </div>
                                  <div class="col-md-7">
                                    <div class="media-body"><?php echo e($refund->orderDetail->product->getTranslation('name')); ?></div>
                                  </div>
                                </div>
                              </a>
                            <?php endif; ?>
                        </td>
                        <td>
                            <?php if($refund->orderDetail != null): ?>
                                <?php echo e(single_price($refund->orderDetail->price)); ?>

                            <?php endif; ?>
                        </td>
                        <td>
                            <?php if($refund->seller_approval == 1): ?>
                              <span class="badge badge-inline badge-success"><?php echo e(translate('Approved')); ?></span>
                            <?php else: ?>
                              <span class="badge badge-inline badge-warning"><?php echo e(translate('Pending')); ?></span>
                            <?php endif; ?>
                        </td>
                        <td>
                            <?php if($refund->admin_approval == 1): ?>
                              <span class="badge badge-inline badge-success"><?php echo e(translate('Approved')); ?></span>
                            <?php endif; ?>
                        </td>
                        <td>
                            <?php if($refund->refund_status == 1): ?>
                              <span class="badge badge-inline badge-success"><?php echo e(translate('Paid')); ?></span>
                            <?php else: ?>
                              <span class="badge badge-inline badge-warning"><?php echo e(translate('Non-Paid')); ?></span>
                            <?php endif; ?>
                        </td>
                    </tr>
                <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>
            </tbody>
        </table>
        <div class="clearfix">
            <div class="pull-right">
                <?php echo e($refunds->appends(request()->input())->links()); ?>

            </div>
        </div>
    </div>
</div>

<?php $__env->stopSection(); ?>

<?php echo $__env->make('backend.layouts.app', \Illuminate\Support\Arr::except(get_defined_vars(), ['__data', '__path']))->render(); ?><?php /**PATH /opt/lampp/htdocs/active/resources/views/refund_request/paid_refund.blade.php ENDPATH**/ ?>