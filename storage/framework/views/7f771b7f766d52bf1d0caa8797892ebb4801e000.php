

<?php $__env->startSection('content'); ?>
    
    <div class="home-banner-area mb-4 pt-3">
        <div class="container">
            <div class="row gutters-10 position-relative">
                <div class="col-lg-3 position-static d-none d-lg-block">
                    <?php echo $__env->make('frontend.partials.category_menu', \Illuminate\Support\Arr::except(get_defined_vars(), ['__data', '__path']))->render(); ?>
                </div>

                <?php
                    $num_todays_deal = count(filter_products(\App\Product::where('published', 1)->where('todays_deal', 1 ))->get());
                    $featured_categories = \App\Category::where('featured', 1)->get();
                ?>

                <div class="<?php if($num_todays_deal > 0): ?> col-lg-7 <?php else: ?> col-lg-9 <?php endif; ?>">
                    <?php if(get_setting('home_slider_images') != null): ?>
                        <div class="aiz-carousel dots-inside-bottom mobile-img-auto-height" data-arrows="true" data-dots="true" data-autoplay="true" data-infinite="true">
                            <?php $slider_images = json_decode(get_setting('home_slider_images'), true);  ?>
                            <?php $__currentLoopData = $slider_images; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $key => $value): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
                                <div class="carousel-box">
                                    <a href="<?php echo e(json_decode(get_setting('home_slider_links'), true)[$key]); ?>">
                                        <img
                                            class="d-block mw-100 lazyload img-fit rounded shadow-sm"
                                            src="<?php echo e(static_asset('assets/img/placeholder-rect.jpg')); ?>"
                                            data-src="<?php echo e(uploaded_asset($slider_images[$key])); ?>"
                                            alt="<?php echo e(env('APP_NAME')); ?> promo"
                                            <?php if(count($featured_categories) == 0): ?>
                                            height="457"
                                            <?php else: ?>
                                            height="315"
                                            <?php endif; ?>
                                            onerror="this.onerror=null;this.src='<?php echo e(static_asset('assets/img/placeholder-rect.jpg')); ?>';"
                                        >
                                    </a>
                                </div>
                            <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>
                        </div>
                    <?php endif; ?>
                    <?php if(count($featured_categories) > 0): ?>
                        <ul class="list-unstyled mb-0 row gutters-5">
                            <?php $__currentLoopData = $featured_categories; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $key => $category): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
                                <li class="minw-0 col-4 col-md mt-3">
                                    <a href="<?php echo e(route('products.category', $category->slug)); ?>" class="d-block rounded bg-white p-2 text-reset shadow-sm">
                                        <img
                                            src="<?php echo e(static_asset('assets/img/placeholder.jpg')); ?>"
                                            data-src="<?php echo e(uploaded_asset($category->banner)); ?>"
                                            alt="<?php echo e($category->getTranslation('name')); ?>"
                                            class="lazyload img-fit"
                                            height="78"
                                            onerror="this.onerror=null;this.src='<?php echo e(static_asset('assets/img/placeholder-rect.jpg')); ?>';"
                                        >
                                        <div class="text-truncate fs-12 fw-600 mt-2 opacity-70"><?php echo e($category->getTranslation('name')); ?></div>
                                    </a>
                                </li>
                            <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>
                        </ul>
                    <?php endif; ?>
                </div>

                <?php if($num_todays_deal > 0): ?>
                <div class="col-lg-2 order-3 mt-3 mt-lg-0">
                    <div class="bg-white rounded shadow-sm">
                        <div class="bg-soft-primary rounded-top p-3 d-flex align-items-center justify-content-center">
                            <span class="fw-600 fs-16 mr-2 text-truncate">
                                <?php echo e(translate('Todays Deal')); ?>

                            </span>
                            <span class="badge badge-primary badge-inline"><?php echo e(translate('Hot')); ?></span>
                        </div>
                        <div class="c-scrollbar-light overflow-auto h-lg-400px p-2 bg-primary rounded-bottom">
                            <div class="gutters-5 lg-no-gutters row row-cols-2 row-cols-lg-1">
                            <?php $__currentLoopData = filter_products(\App\Product::where('published', 1)->where('todays_deal', '1'))->get(); $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $key => $product): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
                                <?php if($product != null): ?>
                                <div class="col mb-2">
                                    <a href="<?php echo e(route('product', $product->slug)); ?>" class="d-block p-2 text-reset bg-white h-100 rounded">
                                        <div class="row gutters-5 align-items-center">
                                            <div class="col-lg">
                                                <div class="img">
                                                    <img
                                                        class="lazyload img-fit h-140px h-lg-80px"
                                                        src="<?php echo e(static_asset('assets/img/placeholder.jpg')); ?>"
                                                        data-src="<?php echo e(uploaded_asset($product->thumbnail_img)); ?>"
                                                        alt="<?php echo e($product->getTranslation('name')); ?>"
                                                        onerror="this.onerror=null;this.src='<?php echo e(static_asset('assets/img/placeholder.jpg')); ?>';"
                                                    >
                                                </div>
                                            </div>
                                            <div class="col-lg">
                                                <div class="fs-16">
                                                    <span class="d-block text-primary fw-600"><?php echo e(home_discounted_base_price($product->id)); ?></span>
                                                    <?php if(home_base_price($product->id) != home_discounted_base_price($product->id)): ?>
                                                        <del class="d-block opacity-70"><?php echo e(home_base_price($product->id)); ?></del>
                                                    <?php endif; ?>
                                                </div>
                                            </div>
                                        </div>
                                    </a>
                                </div>
                                <?php endif; ?>
                            <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>
                            </div>
                        </div>
                    </div>
                </div>
                <?php endif; ?>

            </div>
        </div>
    </div>


    
    <?php if(get_setting('home_banner1_images') != null): ?>
    <div class="mb-4">
        <div class="container">
            <div class="row gutters-10">
                <?php $banner_1_imags = json_decode(get_setting('home_banner1_images')); ?>
                <?php $__currentLoopData = $banner_1_imags; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $key => $value): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
                    <div class="col-xl col-md-6">
                        <div class="mb-3 mb-lg-0">
                            <a href="<?php echo e(json_decode(get_setting('home_banner1_links'), true)[$key]); ?>" class="d-block text-reset">
                                <img src="<?php echo e(static_asset('assets/img/placeholder-rect.jpg')); ?>" data-src="<?php echo e(uploaded_asset($banner_1_imags[$key])); ?>" alt="<?php echo e(env('APP_NAME')); ?> promo" class="img-fluid lazyload">
                            </a>
                        </div>
                    </div>
                <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>
            </div>
        </div>
    </div>
    <?php endif; ?>


    
    <?php
        $flash_deal = \App\FlashDeal::where('status', 1)->where('featured', 1)->first();
    ?>
    <?php if($flash_deal != null && strtotime(date('Y-m-d H:i:s')) >= $flash_deal->start_date && strtotime(date('Y-m-d H:i:s')) <= $flash_deal->end_date): ?>
    <section class="mb-4">
        <div class="container">
            <div class="px-2 py-4 px-md-4 py-md-3 bg-white shadow-sm rounded">

                <div class="d-flex flex-wrap mb-3 align-items-baseline border-bottom">
                    <h3 class="h5 fw-700 mb-0">
                        <span class="border-bottom border-primary border-width-2 pb-3 d-inline-block"><?php echo e(translate('Flash Sale')); ?></span>
                    </h3>
                    <div class="aiz-count-down ml-auto ml-lg-3 align-items-center" data-date="<?php echo e(date('Y/m/d H:i:s', $flash_deal->end_date)); ?>"></div>
                    <a href="<?php echo e(route('flash-deal-details', $flash_deal->slug)); ?>" class="ml-auto mr-0 btn btn-primary btn-sm shadow-md w-100 w-md-auto"><?php echo e(translate('View More')); ?></a>
                </div>

                <div class="aiz-carousel gutters-10 half-outside-arrow" data-items="6" data-xl-items="5" data-lg-items="4"  data-md-items="3" data-sm-items="2" data-xs-items="2" data-arrows='true' data-infinite='true'>
                    <?php $__currentLoopData = $flash_deal->flash_deal_products; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $key => $flash_deal_product): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
                        <?php
                            $product = \App\Product::find($flash_deal_product->product_id);
                        ?>
                        <?php if($product != null && $product->published != 0): ?>
                            <div class="carousel-box">
                                <div class="aiz-card-box border border-light rounded hov-shadow-md my-2 has-transition">
                                    <div class="position-relative">
                                        <a href="<?php echo e(route('product', $product->slug)); ?>" class="d-block">
                                            <img
                                                class="img-fit lazyload mx-auto h-140px h-md-210px"
                                                src="<?php echo e(static_asset('assets/img/placeholder.jpg')); ?>"
                                                data-src="<?php echo e(uploaded_asset($product->thumbnail_img)); ?>"
                                                alt="<?php echo e($product->getTranslation('name')); ?>"
                                                onerror="this.onerror=null;this.src='<?php echo e(static_asset('assets/img/placeholder.jpg')); ?>';"
                                            >
                                        </a>
                                        <div class="absolute-top-right aiz-p-hov-icon">
                                            <a href="javascript:void(0)" onclick="addToWishList(<?php echo e($product->id); ?>)" data-toggle="tooltip" data-title="<?php echo e(translate('Add to wishlist')); ?>" data-placement="left">
                                                <i class="la la-heart-o"></i>
                                            </a>
                                            <a href="javascript:void(0)" onclick="addToCompare(<?php echo e($product->id); ?>)" data-toggle="tooltip" data-title="<?php echo e(translate('Add to compare')); ?>" data-placement="left">
                                                <i class="las la-sync"></i>
                                            </a>
                                            <a href="javascript:void(0)" onclick="showAddToCartModal(<?php echo e($product->id); ?>)" data-toggle="tooltip" data-title="<?php echo e(translate('Add to cart')); ?>" data-placement="left">
                                                <i class="las la-shopping-cart"></i>
                                            </a>
                                        </div>
                                    </div>
                                    <div class="p-md-3 p-2 text-left">
                                        <div class="fs-15">
                                            <?php if(home_base_price($product->id) != home_discounted_base_price($product->id)): ?>
                                                <del class="fw-600 opacity-50 mr-1"><?php echo e(home_base_price($product->id)); ?></del>
                                            <?php endif; ?>
                                            <span class="fw-700 text-primary"><?php echo e(home_discounted_base_price($product->id)); ?></span>
                                        </div>
                                        <div class="rating rating-sm mt-1">
                                            <?php echo e(renderStarRating($product->rating)); ?>

                                        </div>
                                        <h3 class="fw-600 fs-13 text-truncate-2 lh-1-4 mb-0 h-35px">
                                            <a href="<?php echo e(route('product', $product->slug)); ?>" class="d-block text-reset"><?php echo e($product->getTranslation('name')); ?></a>
                                        </h3>
                                        <?php if(\App\Addon::where('unique_identifier', 'club_point')->first() != null && \App\Addon::where('unique_identifier', 'club_point')->first()->activated): ?>
                                            <div class="rounded px-2 mt-2 bg-soft-primary border-soft-primary border">
                                                <?php echo e(translate('Club Point')); ?>:
                                                <span class="fw-700 float-right"><?php echo e($product->earn_point); ?></span>
                                            </div>
                                        <?php endif; ?>
                                    </div>
                                </div>
                            </div>
                        <?php endif; ?>
                    <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>
                </div>
            </div>
        </div>
    </section>
    <?php endif; ?>


    
    <div id="section_featured">

    </div>

    
    <div id="section_best_selling">

    </div>


    
    <?php if(get_setting('home_banner2_images') != null): ?>
    <div class="mb-4">
        <div class="container">
            <div class="row gutters-10">
                <?php $banner_2_imags = json_decode(get_setting('home_banner2_images')); ?>
                <?php $__currentLoopData = $banner_2_imags; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $key => $value): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
                    <div class="col-xl col-md-6">
                        <div class="mb-3 mb-lg-0">
                            <a href="<?php echo e(json_decode(get_setting('home_banner2_links'), true)[$key]); ?>" class="d-block text-reset">
                                <img src="<?php echo e(static_asset('assets/img/placeholder-rect.jpg')); ?>" data-src="<?php echo e(uploaded_asset($banner_2_imags[$key])); ?>" alt="<?php echo e(env('APP_NAME')); ?> promo" class="img-fluid lazyload">
                            </a>
                        </div>
                    </div>
                <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>
            </div>
        </div>
    </div>
    <?php endif; ?>

    
    <div id="section_home_categories">

    </div>

    
    <?php if(\App\BusinessSetting::where('type', 'classified_product')->first()->value == 1): ?>
        <?php
            $customer_products = \App\CustomerProduct::where('status', '1')->where('published', '1')->take(10)->get();
        ?>
           <?php if(count($customer_products) > 0): ?>
               <section class="mb-4">
                   <div class="container">
                       <div class="px-2 py-4 px-md-4 py-md-3 bg-white shadow-sm rounded">
                            <div class="d-flex mb-3 align-items-baseline border-bottom">
                                <h3 class="h5 fw-700 mb-0">
                                    <span class="border-bottom border-primary border-width-2 pb-3 d-inline-block"><?php echo e(translate('Classified Ads')); ?></span>
                                </h3>
                                <a href="<?php echo e(route('customer.products')); ?>" class="ml-auto mr-0 btn btn-primary btn-sm shadow-md"><?php echo e(translate('View More')); ?></a>
                            </div>
                           <div class="aiz-carousel gutters-10 half-outside-arrow" data-items="6" data-xl-items="5" data-lg-items="4"  data-md-items="3" data-sm-items="2" data-xs-items="2" data-arrows='true' data-infinite='true'>
                               <?php $__currentLoopData = $customer_products; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $key => $customer_product): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
                                   <div class="carousel-box">
                                        <div class="aiz-card-box border border-light rounded hov-shadow-md my-2 has-transition">
                                            <div class="position-relative">
                                                <a href="<?php echo e(route('customer.product', $customer_product->slug)); ?>" class="d-block">
                                                    <img
                                                        class="img-fit lazyload mx-auto h-140px h-md-210px"
                                                        src="<?php echo e(static_asset('assets/img/placeholder.jpg')); ?>"
                                                        data-src="<?php echo e(uploaded_asset($customer_product->thumbnail_img)); ?>"
                                                        alt="<?php echo e($customer_product->getTranslation('name')); ?>"
                                                        onerror="this.onerror=null;this.src='<?php echo e(static_asset('assets/img/placeholder.jpg')); ?>';"
                                                    >
                                                </a>
                                                <div class="absolute-top-left pt-2 pl-2">
                                                    <?php if($customer_product->conditon == 'new'): ?>
                                                       <span class="badge badge-inline badge-success"><?php echo e(translate('new')); ?></span>
                                                    <?php elseif($customer_product->conditon == 'used'): ?>
                                                       <span class="badge badge-inline badge-danger"><?php echo e(translate('Used')); ?></span>
                                                    <?php endif; ?>
                                                </div>
                                            </div>
                                            <div class="p-md-3 p-2 text-left">
                                                <div class="fs-15 mb-1">
                                                    <span class="fw-700 text-primary"><?php echo e(single_price($customer_product->unit_price)); ?></span>
                                                </div>
                                                <h3 class="fw-600 fs-13 text-truncate-2 lh-1-4 mb-0 h-35px">
                                                    <a href="<?php echo e(route('customer.product', $customer_product->slug)); ?>" class="d-block text-reset"><?php echo e($customer_product->getTranslation('name')); ?></a>
                                                </h3>
                                            </div>
                                       </div>
                                   </div>
                               <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>
                           </div>
                       </div>
                   </div>
               </section>
           <?php endif; ?>
       <?php endif; ?>

    
    <?php if(get_setting('home_banner3_images') != null): ?>
    <div class="mb-4">
        <div class="container">
            <div class="row gutters-10">
                <?php $banner_3_imags = json_decode(get_setting('home_banner3_images')); ?>
                <?php $__currentLoopData = $banner_3_imags; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $key => $value): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
                    <div class="col-xl col-md-6">
                        <div class="mb-3 mb-lg-0">
                            <a href="<?php echo e(json_decode(get_setting('home_banner3_links'), true)[$key]); ?>" class="d-block text-reset">
                                <img src="<?php echo e(static_asset('assets/img/placeholder-rect.jpg')); ?>" data-src="<?php echo e(uploaded_asset($banner_3_imags[$key])); ?>" alt="<?php echo e(env('APP_NAME')); ?> promo" class="img-fluid lazyload">
                            </a>
                        </div>
                    </div>
                <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>
            </div>
        </div>
    </div>
    <?php endif; ?>

    
    <?php if(\App\BusinessSetting::where('type', 'vendor_system_activation')->first()->value == 1): ?>
    <div id="section_best_sellers">

    </div>
    <?php endif; ?>

    
    <section class="mb-4">
        <div class="container">
            <div class="row gutters-10">
                <?php if(get_setting('top10_categories') != null): ?>
                    <div class="col-lg-6">
                        <div class="d-flex mb-3 align-items-baseline border-bottom">
                            <h3 class="h5 fw-700 mb-0">
                                <span class="border-bottom border-primary border-width-2 pb-3 d-inline-block"><?php echo e(translate('Top 10 Categories')); ?></span>
                            </h3>
                            <a href="<?php echo e(route('categories.all')); ?>" class="ml-auto mr-0 btn btn-primary btn-sm shadow-md"><?php echo e(translate('View All Categories')); ?></a>
                        </div>
                        <div class="row gutters-5">
                            <?php $top10_categories = json_decode(get_setting('top10_categories')); ?>
                            <?php $__currentLoopData = $top10_categories; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $key => $value): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
                                <?php $category = \App\Category::find($value); ?>
                                <?php if($category != null): ?>
                                    <div class="col-sm-6">
                                        <a href="<?php echo e(route('products.category', $category->slug)); ?>" class="bg-white border d-block text-reset rounded p-2 hov-shadow-md mb-2">
                                            <div class="row align-items-center no-gutters">
                                                <div class="col-3 text-center">
                                                    <img
                                                        src="<?php echo e(static_asset('assets/img/placeholder.jpg')); ?>"
                                                        data-src="<?php echo e(uploaded_asset($category->banner)); ?>"
                                                        alt="<?php echo e($category->getTranslation('name')); ?>"
                                                        class="img-fluid img lazyload h-60px"
                                                        onerror="this.onerror=null;this.src='<?php echo e(static_asset('assets/img/placeholder-rect.jpg')); ?>';"
                                                    >
                                                </div>
                                                <div class="col-7">
                                                    <div class="text-truncat-2 pl-3 fs-14 fw-600 text-left"><?php echo e($category->getTranslation('name')); ?></div>
                                                </div>
                                                <div class="col-2 text-center">
                                                    <i class="la la-angle-right text-primary"></i>
                                                </div>
                                            </div>
                                        </a>
                                    </div>
                                <?php endif; ?>
                            <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>
                        </div>
                    </div>
                <?php endif; ?>
                <?php if(get_setting('top10_categories') != null): ?>
                    <div class="col-lg-6">
                        <div class="d-flex mb-3 align-items-baseline border-bottom">
                            <h3 class="h5 fw-700 mb-0">
                                <span class="border-bottom border-primary border-width-2 pb-3 d-inline-block"><?php echo e(translate('Top 10 Brands')); ?></span>
                            </h3>
                            <a href="<?php echo e(route('brands.all')); ?>" class="ml-auto mr-0 btn btn-primary btn-sm shadow-md"><?php echo e(translate('View All Brands')); ?></a>
                        </div>
                        <div class="row gutters-5">
                            <?php $top10_brands = json_decode(get_setting('top10_brands')); ?>
                            <?php $__currentLoopData = $top10_brands; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $key => $value): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
                                <?php $brand = \App\Brand::find($value); ?>
                                <?php if($brand != null): ?>
                                    <div class="col-sm-6">
                                        <a href="<?php echo e(route('products.brand', $brand->slug)); ?>" class="bg-white border d-block text-reset rounded p-2 hov-shadow-md mb-2">
                                            <div class="row align-items-center no-gutters">
                                                <div class="col-4 text-center">
                                                    <img
                                                        src="<?php echo e(static_asset('assets/img/placeholder.jpg')); ?>"
                                                        data-src="<?php echo e(uploaded_asset($brand->logo)); ?>"
                                                        alt="<?php echo e($brand->getTranslation('name')); ?>"
                                                        class="img-fluid img lazyload h-60px"
                                                        onerror="this.onerror=null;this.src='<?php echo e(static_asset('assets/img/placeholder-rect.jpg')); ?>';"
                                                    >
                                                </div>
                                                <div class="col-6">
                                                    <div class="text-truncate-2 pl-3 fs-14 fw-600 text-left"><?php echo e($brand->getTranslation('name')); ?></div>
                                                </div>
                                                <div class="col-2 text-center">
                                                    <i class="la la-angle-right text-primary"></i>
                                                </div>
                                            </div>
                                        </a>
                                    </div>
                                <?php endif; ?>
                            <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>
                        </div>
                    </div>
                <?php endif; ?>
            </div>
        </div>
    </section>

<?php $__env->stopSection(); ?>

<?php $__env->startSection('script'); ?>
    <script>
        $(document).ready(function(){
            $.post('<?php echo e(route('home.section.featured')); ?>', {_token:'<?php echo e(csrf_token()); ?>'}, function(data){
                $('#section_featured').html(data);
                AIZ.plugins.slickCarousel();
            });
            $.post('<?php echo e(route('home.section.best_selling')); ?>', {_token:'<?php echo e(csrf_token()); ?>'}, function(data){
                $('#section_best_selling').html(data);
                AIZ.plugins.slickCarousel();
            });
            $.post('<?php echo e(route('home.section.home_categories')); ?>', {_token:'<?php echo e(csrf_token()); ?>'}, function(data){
                $('#section_home_categories').html(data);
                AIZ.plugins.slickCarousel();
            });

            <?php if(\App\BusinessSetting::where('type', 'vendor_system_activation')->first()->value == 1): ?>
            $.post('<?php echo e(route('home.section.best_sellers')); ?>', {_token:'<?php echo e(csrf_token()); ?>'}, function(data){
                $('#section_best_sellers').html(data);
                AIZ.plugins.slickCarousel();
            });
            <?php endif; ?>
        });
    </script>
<?php $__env->stopSection(); ?>

<?php echo $__env->make('frontend.layouts.app', \Illuminate\Support\Arr::except(get_defined_vars(), ['__data', '__path']))->render(); ?><?php /**PATH /opt/lampp/htdocs/active/resources/views/frontend/index.blade.php ENDPATH**/ ?>