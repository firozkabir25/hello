

<?php $__env->startSection('content'); ?>

    <div class="row">
        <div class="col-lg-6">
            <div class="card">
                <div class="card-header">
                    <h6 class="mb-0 h6"><?php echo e(translate('Basic Affiliate')); ?></h6>
                </div>
                <div class="card-body">
                    <form class="form-horizontal" action="<?php echo e(route('affiliate.store')); ?>" method="POST">
                        <?php echo csrf_field(); ?>
                        <div class="form-group row">
                            <input type="hidden" name="type" value="user_registration_first_purchase">
                            <div class="col-lg-4">
                                <label class="control-label"><?php echo e(translate('User Registration & First Purchase')); ?></label>
                            </div>
                            <div class="col-lg-6">
                                <?php
                                    if(\App\AffiliateOption::where('type', 'user_registration_first_purchase')->first() != null){
                                        $percentage = \App\AffiliateOption::where('type', 'user_registration_first_purchase')->first()->percentage;
                                        $status = \App\AffiliateOption::where('type', 'user_registration_first_purchase')->first()->status;
                                    }
                                    else {
                                        $percentage = null;
                                    }
                                ?>
                                <input type="number" min="0" step="0.01" max="100" class="form-control" name="percentage" value="<?php echo e($percentage); ?>" placeholder="Percentage of Order Amount" required>
                            </div>
                            <div class="col-lg-2">
                                <label class="control-label">%</label>
                            </div>
                        </div>
                        <div class="form-group row">
                            <div class="col-lg-4">
                                <label class="control-label"><?php echo e(translate('Status')); ?></label>
                            </div>
                            <div class="col-lg-8">
                                <label class="aiz-switch aiz-switch-success mb-0">
                                    <input value="1" name="status" type="checkbox" <?php if($status): ?>
                                        checked
                                    <?php endif; ?>>
                                    <span class="slider round"></span>
                                </label>
                            </div>
                        </div>
                        <div class="form-group mb-0 text-right">
                            <button type="submit" class="btn btn-sm btn-primary"><?php echo e(translate('Save')); ?></button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
        <div class="col-lg-6">
            <div class="card">
                <div class="card-header">
                    <h3 class="mb-0 h6"><?php echo e(translate('Product Sharing Affiliate')); ?></h3>
                </div>
                <div class="card-body">
                    <form action="<?php echo e(route('affiliate.store')); ?>" method="POST">
                        <?php echo csrf_field(); ?>
                        <div class="form-group row">
                          <input type="hidden" name="type" value="product_sharing">
            							<label class="col-lg-3 col-from-label"><?php echo e(translate('Product Sharing and Purchasing')); ?></label>
            							<div class="col-lg-6">
                            <?php
                                if(\App\AffiliateOption::where('type', 'product_sharing')->first() != null && \App\AffiliateOption::where('type', 'product_sharing')->first()->details != null){
                                    $commission_product_sharing = json_decode(\App\AffiliateOption::where('type', 'product_sharing')->first()->details)->commission;
                                    $commission_type_product_sharing = json_decode(\App\AffiliateOption::where('type', 'product_sharing')->first()->details)->commission_type;
                                    $status = \App\AffiliateOption::where('type', 'product_sharing')->first()->status;
                                }
                                else {
                                    $commission_product_sharing = null;
                                    $commission_type_product_sharing = null;
                                }
                            ?>
                            <input type="number" min="0" step="0.01" max="100" class="form-control" name="amount" value="<?php echo e($commission_product_sharing); ?>" placeholder="Percentage of Order Amount" required>
            							</div>
            							<div class="col-md-3">
            								<select class="form-control aiz-selectpicker" name="amount_type">
                              <option value="amount" <?php if($commission_type_product_sharing == "amount"): ?> selected <?php endif; ?>>$</option>
                              <option value="percent" <?php if($commission_type_product_sharing == "percent"): ?> selected <?php endif; ?>>%</option>
            								</select>
            							</div>
            						</div>
                        <div class="form-group row">
                          <div class="col-lg-4">
                              <label class="control-label"><?php echo e(translate('Status')); ?></label>
                          </div>
                          <div class="col-lg-8">
                              <label class="aiz-switch aiz-switch-success mb-0">
                                  <input value="1" name="status" type="checkbox" <?php if($status): ?>
                                      checked
                                  <?php endif; ?>>
                                  <span class="slider round"></span>
                              </label>
                          </div>
                        </div>
                        <div class="form-group mb-0 text-right">
                            <button type="submit" class="btn btn-sm btn-primary"><?php echo e(translate('Save')); ?></button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
    <div class="row">
        <div class="col-lg-6">
            <div class="card">
                <div class="card-header">
                    <h3 class="mb-0 h6"><?php echo e(translate('Product Sharing Affiliate (Category Wise)')); ?></h3>
                </div>
                <div class="card-body">
                    <form class="form-horizontal" action="<?php echo e(route('affiliate.store')); ?>" method="POST">
                        <?php echo csrf_field(); ?>
                        <?php
                            if(\App\AffiliateOption::where('type', 'category_wise_affiliate')->first() != null){
                                $category_wise_affiliate_status = \App\AffiliateOption::where('type', 'category_wise_affiliate')->first()->status;
                            }
                        ?>
                        <div class="form-group row">
                            <div class="col-lg-4">
                                <label class="control-label"><?php echo e(translate('Status')); ?></label>
                            </div>
                            <div class="col-lg-8">
                                <label class="aiz-switch aiz-switch-success mb-0">
                                    <input value="1" name="status" type="checkbox" <?php if($category_wise_affiliate_status): ?>
                                        checked
                                    <?php endif; ?>>
                                    <span class="slider round"></span>
                                </label>
                            </div>
                        </div>
                        <?php if(\App\AffiliateOption::where('type', 'category_wise_affiliate')->first() != null): ?>
                            <input type="hidden" name="type" value="category_wise_affiliate">
                            <?php $__currentLoopData = \App\Category::all(); $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $key => $category): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
                                <?php
                                    $found = false;
                                ?>
                                <?php if(\App\AffiliateOption::where('type', 'category_wise_affiliate')->first()->details != null): ?>
                                    <?php $__currentLoopData = json_decode(\App\AffiliateOption::where('type', 'category_wise_affiliate')->first()->details); $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $key => $data): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
                                        <?php if($data->category_id == $category->id): ?>
                                            <?php
                                                $found = true;
                                                $value = $data;
                                            ?>
                                        <?php endif; ?>
                                    <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>
                                <?php endif; ?>
                                <?php if($found): ?>
                                <div class="form-group row">
                                  <div class="col-lg-5">
                                    <input type="hidden" name="categories_id_<?php echo e($value->category_id); ?>" value="<?php echo e($value->category_id); ?>">
                                    <input type="text" class="form-control" value="<?php echo e(\App\Category::find($value->category_id)->name); ?>" readonly>
                                  </div>
                                  <div class="col-lg-4">
                                    <input type="number" min="0" step="0.01" class="form-control" name="commison_amounts_<?php echo e($value->category_id); ?>" value="<?php echo e($value->commission); ?>">
                                  </div>
                                  <div class="col-md-3">
                                    <select class="form-control aiz-selectpicker" name="commison_types_<?php echo e($value->category_id); ?>">
                                      <option value="amount" <?php if($value->commission_type == 'amount'): ?> selected <?php endif; ?>>$</option>
                                      <option value="percent" <?php if($value->commission_type == 'percent'): ?> selected <?php endif; ?>>%</option>
                                    </select>
                                  </div>
                                </div>
                                <?php else: ?>
                                  <div class="form-group row">
                                    <div class="col-lg-5">
                                      <input type="hidden" name="categories_id_<?php echo e($category->id); ?>" value="<?php echo e($category->id); ?>">
                                      <input type="text" class="form-control" value="<?php echo e($category->getTranslation('name')); ?>" readonly>
                                    </div>
                                    <div class="col-lg-4">
                                      <input type="number" min="0" step="0.01" class="form-control" name="commison_amounts_<?php echo e($category->id); ?>" value="0">
                                    </div>
                                    <div class="col-md-3">
                                      <select class="form-control aiz-selectpicker" name="commison_types_<?php echo e($category->id); ?>">
                                        <option value="amount">$</option>
                                        <option value="percent">%</option>
                                      </select>
                                    </div>
                                  </div>
                                <?php endif; ?>
                            <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>
                        <?php endif; ?>
                        <div class="form-group mb-0 text-right">
                            <button type="submit" class="btn btn-sm btn-primary"><?php echo e(translate('Save')); ?></button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
<?php $__env->stopSection(); ?>

<?php echo $__env->make('backend.layouts.app', \Illuminate\Support\Arr::except(get_defined_vars(), ['__data', '__path']))->render(); ?><?php /**PATH /opt/lampp/htdocs/active/resources/views/affiliate/index.blade.php ENDPATH**/ ?>