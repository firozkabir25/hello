

<?php $__env->startSection('content'); ?>
    <div class="card">
        <div class="card-header">
            <h5 class="mb-0 h6"><?php echo e(translate('Affiliate Withdraw Request')); ?></h5>
        </div>
        <div class="card-body">
            <table class="table aiz-table mb-0">
                <thead>
                <tr>
                    <th>#</th>
                    <th><?php echo e(translate('Date')); ?></th>
                    <th><?php echo e(translate('Name')); ?></th>
                    <th><?php echo e(translate('Email')); ?></th>
                    <th><?php echo e(translate('Amount')); ?></th>
                    <th><?php echo e(translate('Status')); ?></th>
                    <th><?php echo e(translate('options')); ?></th>
                </tr>
                </thead>
                <tbody>
                <?php $__currentLoopData = $affiliate_withdraw_requests; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $key => $affiliate_withdraw_request): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
                <?php $status = $affiliate_withdraw_request->status ; ?>
                    <tr>
                        <td><?php echo e(($key+1) + ($affiliate_withdraw_requests->currentPage() - 1)*$affiliate_withdraw_requests->perPage()); ?></td>
                        <td><?php echo e($affiliate_withdraw_request->created_at); ?></td>
                        <td><?php echo e($affiliate_withdraw_request->user->name); ?></td>
                        <td><?php echo e($affiliate_withdraw_request->user->email); ?></td>
                        <td><?php echo e(single_price($affiliate_withdraw_request->amount)); ?></td>
                        <td>
                            <?php if($status == 1): ?>
                              <span class="badge badge-inline badge-success"><?php echo e(translate('Approved')); ?></span>
                            <?php elseif($status == 2): ?>
                              <span class="badge badge-inline badge-danger"><?php echo e(translate('Rejected')); ?></span>
                            <?php else: ?>
                              <span class="badge badge-inline badge-info"><?php echo e(translate('Pending')); ?></span>
                            <?php endif; ?>
                        </td>
                        <td class="text-right">
                          <?php if($status == 0): ?>
                              <a href="#" class="btn btn-soft-primary btn-icon btn-circle btn-sm" onclick="show_affiliate_withdraw_modal('<?php echo e($affiliate_withdraw_request->id); ?>');" title="<?php echo e(translate('Pay Now')); ?>">
                                  <i class="las la-money-bill"></i>
                              </a>
                              <a href="#" class="btn btn-soft-danger btn-icon btn-circle btn-sm" onclick="affiliate_withdraw_reject_modal('<?php echo e(route('affiliate.withdraw_request.reject', $affiliate_withdraw_request->id)); ?>');" title="<?php echo e(translate('Reject')); ?>">
                                  <i class="las la-trash"></i>
                              </a>
                            <?php else: ?>
                                <?php echo e(translate('No Action Available')); ?>

                            <?php endif; ?>
                        </td>
                    </tr>
                <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>
                </tbody>
            </table>
            <div class="clearfix">
                <div class="pull-right">
                    <?php echo e($affiliate_withdraw_requests->links()); ?>

                </div>
            </div>
        </div>
    </div>
<?php $__env->stopSection(); ?>

<?php $__env->startSection('modal'); ?>

<div class="modal fade" id="affiliate_withdraw_modal">
    <div class="modal-dialog">
        <div class="modal-content" id="modal-content">

        </div>
    </div>
</div>

<div class="modal fade" id="affiliate_withdraw_reject_modal">
  <div class="modal-dialog modal-dialog-centered">
    <div class="modal-content">
    <div class="modal-header">
      <h5 class="modal-title h6"><?php echo e(translate('Affiliate Withdraw Request Reject')); ?></h5>
      <button type="button" class="close" data-dismiss="modal">
      </button>
    </div>
    <div class="modal-body">
      <p><?php echo e(translate('Are you sure, You want to reject this?')); ?></p>
    </div>
    <div class="modal-footer">
      <button type="button" class="btn btn-light" data-dismiss="modal"><?php echo e(translate('Cancel')); ?></button>
      <a href="#" id="reject_link" class="btn btn-primary"><?php echo e(translate('Reject')); ?></a>
    </div>
  </div>
  </div>
</div>

<?php $__env->stopSection(); ?>


<?php $__env->startSection('script'); ?>
    <script type="text/javascript">
        function show_affiliate_withdraw_modal(id){
            $.post('<?php echo e(route('affiliate_withdraw_modal')); ?>',{_token:'<?php echo e(@csrf_token()); ?>', id:id}, function(data){
                $('#affiliate_withdraw_modal #modal-content').html(data);
                $('#affiliate_withdraw_modal').modal('show', {backdrop: 'static'});
                AIZ.plugins.bootstrapSelect('refresh');
            });
        }
        function affiliate_withdraw_reject_modal(reject_link){
            $('#affiliate_withdraw_reject_modal').modal('show');
            document.getElementById('reject_link').setAttribute('href' , reject_link);
        }

    </script>
<?php $__env->stopSection(); ?>

<?php echo $__env->make('backend.layouts.app', \Illuminate\Support\Arr::except(get_defined_vars(), ['__data', '__path']))->render(); ?><?php /**PATH /opt/lampp/htdocs/active/resources/views/affiliate/affiliate_withdraw_requests.blade.php ENDPATH**/ ?>