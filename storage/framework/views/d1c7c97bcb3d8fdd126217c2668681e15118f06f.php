

<?php $__env->startSection('content'); ?>

    <div class="col-lg-8 mx-auto">
        <div class="card">
            <div class="card-header">
                <h5 class="mb-0 h6"><?php echo e(translate('Pickup Point Information')); ?></h5>
            </div>
            <form action="<?php echo e(route('pick_up_points.store')); ?>" method="POST">
            	<?php echo csrf_field(); ?>
                <div class="card-body">
                    <div class="form-group row row">
                        <label class="col-sm-3 col-from-label" for="name"><?php echo e(translate('Name')); ?></label>
                        <div class="col-sm-9">
                            <input type="text" placeholder="<?php echo e(translate('Name')); ?>" id="name" name="name" class="form-control" required>
                        </div>
                    </div>
                    <div class="form-group row row">
                        <label class="col-sm-3 col-from-label" for="address"><?php echo e(translate('Location')); ?></label>
                        <div class="col-sm-9">
                            <textarea name="address" rows="8" class="form-control" required></textarea>
                        </div>
                    </div>
                    <div class="form-group row row">
                        <label class="col-sm-3 col-from-label" for="phone"><?php echo e(translate('Phone')); ?></label>
                        <div class="col-sm-9">
                            <input type="text" placeholder="<?php echo e(translate('Phone')); ?>" id="phone" name="phone" class="form-control" required>
                        </div>
                    </div>
                    <div class="form-group row row">
                        <label class="col-sm-3 col-from-label"><?php echo e(translate('Pickup Point Status')); ?></label>
                        <div class="col-sm-3">
                            <label class="aiz-switch aiz-switch-success mb-0" style="margin-top:5px;">
                        		<input value="1" type="checkbox" name="pick_up_status">
                        		<span class="slider round"></span>
                            </label>
                        </div>
                    </div>
                    <div class="form-group row row">
                        <label class="col-sm-3 col-from-label" for="name"><?php echo e(translate('Pick-up Point Manager')); ?></label>
                        <div class="col-sm-9">
                            <select name="staff_id" class="form-control aiz-selectpicker" required>
                                <?php $__currentLoopData = \App\Staff::all(); $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $staff): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
                                    <?php if($staff->user != null): ?>
                                        <option value="<?php echo e($staff->id); ?>"><?php echo e($staff->user->name); ?></option>
                                    <?php endif; ?>
                                <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>
                            </select>
                        </div>
                    </div>
                    <div class="form-group mb-0 text-right">
                        <button type="submit" class="btn btn-primary"><?php echo e(translate('Save')); ?></button>
                    </div>
                </div>
            </form>
        </div>
    </div>

<?php $__env->stopSection(); ?>

<?php echo $__env->make('backend.layouts.app', \Illuminate\Support\Arr::except(get_defined_vars(), ['__data', '__path']))->render(); ?><?php /**PATH /opt/lampp/htdocs/active/resources/views/backend/setup_configurations/pickup_point/create.blade.php ENDPATH**/ ?>