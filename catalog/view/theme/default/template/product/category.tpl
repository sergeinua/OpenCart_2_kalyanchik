<?php echo $header; ?>
<div class="category-page my-heading page-content">
    <div class="container">
        <!-- TODO: доделать col-sm-4 col-md-3 для страницы категории -->
        <div class="row"><?php echo $column_left; ?>
            <?php if ($column_left && $column_right) { ?>
            <?php $class = 'col-sm-6'; ?>
            <?php } elseif ($column_left || $column_right) { ?>
            <?php $class = 'col-sm-12 col-md-9'; ?>
            <?php } else { ?>
            <?php $class = 'col-sm-12'; ?>
            <?php } ?>
            <div id="content" class="<?php echo $class; ?>"><?php echo $content_top; ?>
                <div class="header-category-page shadow-block">
                    <h1><?php echo $heading_title; ?></h1>
                    <ul class="breadcrumb">
                        <?php foreach ($breadcrumbs as $breadcrumb) { ?>
                        <li><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a></li>
                        <?php } ?>
                    </ul>
                    <?php if ($products) { ?>
                    <div class="col-md-offset-7 col-md-2 text-right bread_one_line">
                        <label class="control-label sort-price" for="input-sort"><?php echo $text_sort; ?></label>
                    </div>
                    <div class="col-md-3 text-right bread_one_line_right">
                        <select id="input-sort" class="form-control" onchange="location = this.value;">
                            <?php foreach ($sorts as $sorts) { ?>
                            <?php if ($sorts['value'] == $sort . '-' . $order) { ?>
                            <option value="<?php echo $sorts['href']; ?>"
                                    selected="selected"><?php echo $sorts['text']; ?></option>
                            <?php } else { ?>
                            <option value="<?php echo $sorts['href']; ?>"><?php echo $sorts['text']; ?></option>
                            <?php } ?>
                            <?php } ?>
                        </select>
                    </div>
                    <?php } ?>



                <?php if ($categories) { ?>
                <div class="catalog h3"><?php echo $text_refine; ?></div>
                <?php if (count($categories) <= 5) { ?>

                    <div class="col-sm-12">
                        <ul class="subcategory-list">
                            <?php foreach ($categories as $category) { ?>
                            <li class='subcategory-list-item'><a href="<?php echo $category['href']; ?>"><span><img src="<?php echo $category['thumb'] ?>" alt=""/></span><?php echo $category['name']; ?></a></li>
                            <?php } ?>
                        </ul>
                    </div>

                <?php } else { ?>


                    <div class="col-sm-12">
                        <ul class="subcategory-list">
                            <?php foreach ($categories as $category) { ?>
                            <li class='subcategory-list-item'><a href="<?php echo $category['href']; ?>"><span><img src="<?php echo $category['thumb'] ?>" alt=""/></span><?php echo $category['name']; ?></a></li>
                            <?php } ?>
                        </ul>
                    </div>


                <?php } ?>
                <?php } ?>
                </div>
                

                <div class="clearfix">
                    <button id="btn-offcanvas" class="btn btn-offcanvas visible-xs pull-left" type="button" role="button" data-toggle="offcanvas" data-target="#myNavmenu" data-canvas="body">
                        <i class="fa fa-align-left pull-left"></i>
                        <span>Фильтр</span>
                    </button>

                </div>

                <?php if ($products) { ?>
                <!-- <p><a href="<?php echo $compare; ?>" id="compare-total"><?php echo $text_compare; ?></a></p> -->


                <div class="border-bottom mobile-xs">
                    <div class="row">
                        <?php foreach ($products as $product) { ?>
                        <div class="product-layout category product-grid col-lg-4 col-md-4 col-sm-6 col-xs-12">
                            <div class="module-good product-thumb">
                                <div class="image">
                                    <a href="<?php echo $product['href']; ?>">
                                    <span class="image-link category_image">
                                        <img src="<?php echo $product['thumb']; ?>"
                                             alt="<?php echo $product['name']; ?>"
                                             title="<?php echo $product['name']; ?>" class="img-responsive">
                                    </span>
                                    </a>
                                    <button class="like-btn" role="button" type="button" data-toggle="tooltip"
                                            title="<?php echo $button_wishlist; ?>"
                                            onclick="wishlist.add('<?php echo $product['product_id']; ?>');"><i
                                                class="fa fa-heart"></i>
                                    </button>

                                </div>
                                <div class="caption">
                                    <!-- <div class="good-rating">
                                            <?php if($product['rating']){ ?>
                                                <div class="rating">
                                                    <?php for ($i = 1; $i <= 5; $i++) { ?>
                                                        <?php if ($product['rating'] < $i) { ?>
                                                            <span class="fa fa-stack"><i class="fa fa-star-o fa-stack-1x"></i></span>
                                                        <?php } else { ?>
                                                            <span class="fa fa-stack"><i class="fa fa-star fa-stack-1x"></i><i class="fa fa-star-o fa-stack-1x"></i></span>

                                                        <?php } ?>
                                                    <?php } ?>
                                                </div>
                                            <?php } ?>

                                            <?php if($product['reviews']){ ?>
                                                <a href="<?php echo $product['href']; ?>#review-block">
                                                    <div class="list-reviews-count"><?= $product['reviews'] ?></div>
                                                </a>
                                            <?php } ?>
                                        </div> -->
                                    <div class="good-name"><a
                                                href="<?php echo $product['href']; ?>"><?php echo $product['name']; ?></a>
                                    </div>
                                    

                                    <!--
                                                                        <p><?php echo $product['description']; ?></p>
                                                                        <?php if ($product['rating']) { ?>
                                                                        <div class="rating">
                                                                            <?php for ($i = 1; $i <= 5; $i++) { ?>
                                                                            <?php if ($product['rating'] < $i) { ?>
                                                                            <span class="fa fa-stack"><i class="fa fa-star-o fa-stack-2x"></i></span>
                                                                            <?php } else { ?>
                                                                            <span class="fa fa-stack"><i class="fa fa-star fa-stack-2x"></i><i
                                                                                        class="fa fa-star-o fa-stack-2x"></i></span>
                                                                            <?php } ?>
                                                                            <?php } ?>
                                                                        </div>
                                                                        <?php } ?>
                                        -->
                                    <div class="basic-information">
                                        <?php if ($product['price']) { ?>
                                        <div class="price" <?php if(!$product['quantity']) echo 'style="background:lightgrey"'?>>
                                            <?php if (!$product['special']) { ?>
                                            <?php echo $product['price']; ?>
                                            <?php } else { ?>
                                            <span class="price-new"><?php echo $product['special']; ?></span> <span
                                                    class="price-old"><?php echo $product['price']; ?></span>
                                            <?php } ?>
                                            <!--<?php if ($product['tax']) { ?>
                                            <span class="price-tax"><?php echo $text_tax; ?> <?php echo $product['tax']; ?></span>
                                            <?php } ?>
                                            -->
                                        </div>
                                        <?php } ?>
                                        <div class="cart-button-block">
                                            <button class="btn cart-btn" type="button"
                                                    onclick="cart.add('<?php echo $product['product_id']; ?>', '<?php echo $product['minimum']; ?>');"
                                                    role="button">
                                                <i class="fa fa-shopping-cart"></i> </span>
                                            </button>
                                        </div>
                                        <?php
                                        if(!$product['quantity']) {
                                            ?>
                                            <span class="empty">Продано</span>
                                            <?php
                                        }
                                        ?>

                                    </div>
                                </div>
                            </div>
                        </div>
                        <?php } ?>
                    </div>
                </div>
                <!-- TODO: убрать пагинацию когда меньше 2 страниц -->
                <div class="row">
                    <div id="pagination-block" class="col-sm-12 text-right"><?php echo $pagination; ?></div>
                </div>
                <?php } ?>





                <?php if (!$categories && !$products) { ?>
                <div class="shadow-block">
                <p><?php echo $text_empty; ?></p>

                <div class="buttons">
                    <div class="pull-right"><a href="<?php echo $continue; ?>"
                                               class="btn btn-primary"><?php echo $button_continue; ?></a></div>
                </div>
                </div>
                <?php } ?>


                <?php if ($thumb || strip_tags($description)) { ?>
                <div class="row">
                    <?php if (strip_tags($description)) { ?>
                    <div class="col-sm-12 hidden-xs">
                        <div class="category-description shadow-block">
                            <?php echo $description; ?>
                        </div>
                    </div>
                    <?php } ?>
                </div>
                <?php } ?>

                <?php echo $content_bottom; ?></div>
            <?php echo $column_right; ?></div>
    </div>
</div>
<?php echo $footer; ?>
