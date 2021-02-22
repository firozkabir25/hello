<div class="panel-body card-body">
    <div class="aiz-pos-cart-list c-scrollbar c-scrollbar-light">
        <table class="table table-bordered mb-0 mar-no" cellspacing="0" width="100%">
            <thead>
                <tr>
                    <th width="60%"><?php echo e(translate('Product')); ?></th>
                    <th width="10%"><?php echo e(translate('QTY')); ?></th>
                    <th><?php echo e(translate('Price')); ?></th>
                    <th><?php echo e(translate('Subtotal')); ?></th>
                    <th class="text-right"><?php echo e(translate('Remove')); ?></th>
                </tr>
            </thead>
            <tbody>
                <?php if(Session::has('posCart')): ?>
                    <?php
                        $subtotal = 0;
                        $tax = 0;
                        $shipping = 0;
                    ?>
                    <?php $__empty_1 = true; $__currentLoopData = Session::get('posCart'); $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $key => $cartItem): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); $__empty_1 = false; ?>
                        <?php
                            $subtotal += $cartItem['price']*$cartItem['quantity'];
                            $tax += $cartItem['tax']*$cartItem['quantity'];
                            $shipping += $cartItem['shipping']*$cartItem['quantity'];
                            if(Session::get('shipping', 0) == 0){
                                $shipping = 0;
                            }
                        ?>
                        <tr>
                            <td>
                                <span class="media">
                                    <div class="media-left">
                                        <img class="mr-3" height="60" src="<?php echo e(uploaded_asset(\App\Product::find($cartItem['id'])->thumbnail_img)); ?>" >
                                    </div>
                                    <div class="media-body">
                                        <?php echo e(\App\Product::find($cartItem['id'])->name); ?> (<?php echo e($cartItem['variant']); ?>)
                                    </div>
                                </span>
                            </td>
                            <td>
                                <div class="">
                                    <input type="number" class="form-control text-center" placeholder="1" id="qty-<?php echo e($key); ?>" value="<?php echo e($cartItem['quantity']); ?>" onchange="updateQuantity(<?php echo e($key); ?>)" min="1">
                                </div>
                            </td>
                            <td><?php echo e(single_price($cartItem['price'])); ?></td>
                            <td><?php echo e(single_price($cartItem['price']*$cartItem['quantity'])); ?></td>
                            <td class="text-right">
                                <button type="button" class="btn btn-circle btn-icon btn-sm btn-danger" onclick="removeFromCart(<?php echo e($key); ?>)"><i class="las la-trash-alt"></i></button>
                            </td>
                        </tr>
                    <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); if ($__empty_1): ?>
                        <tr>
                            <td colspan="5" class="text-center">
                                <i class="las la-frown la-3x opacity-50"></i>
                                <p>No Product Added</p>
                            </td>
                        </tr>
                    <?php endif; ?>
                <?php endif; ?>
            </tbody>
        </table>
    </div>
</div>
<div class="card-footer bord-top">
    <table class="table mar-no" cellspacing="0" width="100%">
        <thead>
            <tr>
                <th class="text-center"><?php echo e(translate('Sub Total')); ?></th>
                <th class="text-center"><?php echo e(translate('Total Tax')); ?></th>
                <th class="text-center"><?php echo e(translate('Total Shipping')); ?></th>
                <th class="text-center"><?php echo e(translate('Discount')); ?></th>
                <th class="text-center"><?php echo e(translate('Total')); ?></th>
            </tr>
        </thead>
        <tbody>
            <tr>
                <td class="text-center"><?php echo e(single_price($subtotal)); ?></td>
                <td class="text-center"><?php echo e(single_price($tax)); ?></td>
                <td class="text-center"><?php echo e(single_price($shipping)); ?></td>
                <td class="text-center"><?php echo e(single_price(Session::get('pos_discount', 0))); ?></td>
                <td class="text-center"><?php echo e(single_price($subtotal+$tax+$shipping - Session::get('pos_discount', 0))); ?></td>
            </tr>
        </tbody>
    </table>
</div>
<?php /**PATH /opt/lampp/htdocs/active/resources/views/pos/cart.blade.php ENDPATH**/ ?>