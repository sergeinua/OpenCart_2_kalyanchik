<div class="featured-module mobile-xs my-module">
    <div class="title"><?php echo $heading_title; ?></div>

    <div class="row">
        <?php foreach ($products as $product) { ?>
        <div class="product-layout col-lg-4 col-md-4 col-sm-6 col-xs-12">
            <div class="module-good product-thumb transition">
                <div class="image">
                    <a href="<?php echo $product['href']; ?>">
                        <span class="image-link" ><img src="<?php echo $product['thumb']; ?>"
                                                                                  alt="<?php echo $product['name']; ?>"
                                                                                  title="<?php echo $product['name']; ?>"
                                                                                  class="img-responsive">

                        </span>
                    </a>
                    <button class="like-btn" type="button" data-toggle="tooltip" title="<?php echo $button_wishlist; ?>"
                            onclick="wishlist.add('<?php echo $product['product_id']; ?>');"><i class="fa fa-heart"></i>
                    </button>
                </div>

                <div class="caption">
                    <div class="good-rating">
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
                    </div>
                    <div class="good-name"><a href="<?php echo $product['href']; ?>"><?php echo $product['name']; ?></a>
                    </div>
                    <!--
                      <p><?php echo $product['description']; ?></p>
                    <?php if ($product['rating']) { ?>
                    <div class="rating">
                      <?php for ($i = 1; $i <= 5; $i++) { ?>
                      <?php if ($product['rating'] < $i) { ?>
                      <span class="fa fa-stack"><i class="fa fa-star-o fa-stack-2x"></i></span>
                      <?php } else { ?>
                      <span class="fa fa-stack"><i class="fa fa-star fa-stack-2x"></i><i class="fa fa-star-o fa-stack-2x"></i></span>
                      <?php } ?>
                      <?php } ?>
                    </div>
                    <?php } ?>
                    -->
                    
                    <div class="basic-information">
                        <?php if ($product['price']) { ?>
                        <?php if (!$product['special']) { ?>
                        <div class="price" <?php if(!$product['quantity']) echo 'style="background:lightgrey"'?>>

                            <?php echo $product['price']; ?>
                        </div>
                        <?php } else { ?>
                        <div class="price price-faculty">
                            <span class="price-new"><?php echo $product['special']; ?></span> <span
                                    class="price-old"><?php echo $product['price']; ?></span>
                        </div>
                        <?php } ?>
                        <?php if ($product['tax']) { ?>
                        <span class="price-tax"><?php echo $text_tax; ?> <?php echo $product['tax']; ?></span>
                        <?php } ?>

                        <?php } ?>

                        <div class="cart-button-block">
                            <button class="btn cart-btn" type="button"
                                    onclick="cart.add('<?php echo $product['product_id']; ?>',1,this);"><i
                                        class="fa fa-shopping-cart"></i>
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
        <div class="col-xs-12">
            <!-- TODO: сделать ссылку на раздел кальяны -->
            <div class="footer-module">
                <a class="btn module-btn" href="<?php  echo $link_to_catalog ?>" role="link">перейти в каталог</a>
            </div>
        </div>
    </div>
</div>
