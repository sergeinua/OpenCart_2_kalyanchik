<?php echo $header; ?>
<div class="container">
<div class="my-heading product-page page-content shadow-block">

<div class="row"><?php echo $column_left; ?>
<?php if ($column_left && $column_right) { ?>
<?php $class = 'col-sm-6'; ?>
<?php } elseif ($column_left || $column_right) { ?>
<?php $class = 'col-sm-9'; ?>
<?php } else { ?>
<?php $class = 'col-sm-12'; ?>
<?php } ?>
<div id="content" class="<?php echo $class; ?>">

<ul class="breadcrumb">
    <?php foreach ($breadcrumbs as $breadcrumb) { ?>
    <li><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a></li>
    <?php } ?>
</ul>
<?php echo $content_top; ?>
<div class="product-content-margin" itemscope itemtype="http://schema.org/Product">
<div class="row">
<?php if ($column_left && $column_right) { ?>
<?php $class = 'col-sm-6'; ?>
<?php } elseif ($column_left || $column_right) { ?>
<?php $class = 'col-sm-6'; ?>
<?php } else { ?>
<?php $class = 'col-sm-9 col-xs-12'; ?>
<?php } ?>

<!-- asdsad -->



<div class="<?php echo $class; ?>">
<div class="row">
<div class="col-sm-6 col-xs-12">
    <?php
    $useragent=$_SERVER['HTTP_USER_AGENT'];
    $is_mobile = (preg_match('/(android|bb\d+|meego).+mobile|avantgo|bada\/|blackberry|blazer|compal|elaine|fennec|hiptop|iemobile|ip(hone|od)|iris|kindle|lge |maemo|midp|mmp|mobile.+firefox|netfront|opera m(ob|in)i|palm( os)?|phone|p(ixi|re)\/|plucker|pocket|psp|series(4|6)0|symbian|treo|up\.(browser|link)|vodafone|wap|windows ce|xda|xiino/i',$useragent)||preg_match('/1207|6310|6590|3gso|4thp|50[1-6]i|770s|802s|a wa|abac|ac(er|oo|s\-)|ai(ko|rn)|al(av|ca|co)|amoi|an(ex|ny|yw)|aptu|ar(ch|go)|as(te|us)|attw|au(di|\-m|r |s )|avan|be(ck|ll|nq)|bi(lb|rd)|bl(ac|az)|br(e|v)w|bumb|bw\-(n|u)|c55\/|capi|ccwa|cdm\-|cell|chtm|cldc|cmd\-|co(mp|nd)|craw|da(it|ll|ng)|dbte|dc\-s|devi|dica|dmob|do(c|p)o|ds(12|\-d)|el(49|ai)|em(l2|ul)|er(ic|k0)|esl8|ez([4-7]0|os|wa|ze)|fetc|fly(\-|_)|g1 u|g560|gene|gf\-5|g\-mo|go(\.w|od)|gr(ad|un)|haie|hcit|hd\-(m|p|t)|hei\-|hi(pt|ta)|hp( i|ip)|hs\-c|ht(c(\-| |_|a|g|p|s|t)|tp)|hu(aw|tc)|i\-(20|go|ma)|i230|iac( |\-|\/)|ibro|idea|ig01|ikom|im1k|inno|ipaq|iris|ja(t|v)a|jbro|jemu|jigs|kddi|keji|kgt( |\/)|klon|kpt |kwc\-|kyo(c|k)|le(no|xi)|lg( g|\/(k|l|u)|50|54|\-[a-w])|libw|lynx|m1\-w|m3ga|m50\/|ma(te|ui|xo)|mc(01|21|ca)|m\-cr|me(rc|ri)|mi(o8|oa|ts)|mmef|mo(01|02|bi|de|do|t(\-| |o|v)|zz)|mt(50|p1|v )|mwbp|mywa|n10[0-2]|n20[2-3]|n30(0|2)|n50(0|2|5)|n7(0(0|1)|10)|ne((c|m)\-|on|tf|wf|wg|wt)|nok(6|i)|nzph|o2im|op(ti|wv)|oran|owg1|p800|pan(a|d|t)|pdxg|pg(13|\-([1-8]|c))|phil|pire|pl(ay|uc)|pn\-2|po(ck|rt|se)|prox|psio|pt\-g|qa\-a|qc(07|12|21|32|60|\-[2-7]|i\-)|qtek|r380|r600|raks|rim9|ro(ve|zo)|s55\/|sa(ge|ma|mm|ms|ny|va)|sc(01|h\-|oo|p\-)|sdk\/|se(c(\-|0|1)|47|mc|nd|ri)|sgh\-|shar|sie(\-|m)|sk\-0|sl(45|id)|sm(al|ar|b3|it|t5)|so(ft|ny)|sp(01|h\-|v\-|v )|sy(01|mb)|t2(18|50)|t6(00|10|18)|ta(gt|lk)|tcl\-|tdg\-|tel(i|m)|tim\-|t\-mo|to(pl|sh)|ts(70|m\-|m3|m5)|tx\-9|up(\.b|g1|si)|utst|v400|v750|veri|vi(rg|te)|vk(40|5[0-3]|\-v)|vm40|voda|vulc|vx(52|53|60|61|70|80|81|83|85|98)|w3c(\-| )|webc|whit|wi(g |nc|nw)|wmlb|wonu|x700|yas\-|your|zeto|zte\-/i',substr($useragent,0,4)));

    if ($thumb || $images) { ?>
    <div class="product-image navigation_show">
        <?php


        if(!$is_mobile)
        {
        ?>
        <ul class="thumbnails">
            <?php if ($thumb) { ?>
            <li>

                <a class="thumbnail" href="<?php echo $popup; ?>" title="<?php echo $heading_title; ?>" role="button">
                                            <span class="image-link">
                                            <img src="<?php echo $thumb; ?>" title="<?php echo $heading_title; ?>" class="img-responsive"
                                                 alt="<?php echo $heading_title; ?>" id="zoom" data-zoom-image="<?php echo $popup; ?>">

                                        </span>
                </a>
                <button role="button" type="button" data-toggle="tooltip" class="like-btn"
                        title="<?php echo $button_wishlist; ?>"
                        onclick="wishlist.add('<?php echo $product_id; ?>');"><i
                            class="fa fa-heart"></i></button>

            </li>
            <?php } ?>
            <?php if ($images) { ?>
            <?php foreach ($images as $image) { ?>
            <li class="image-additional"><a class="thumbnail" href="<?php echo $image['popup']; ?>"
                                            title="<?php echo $heading_title; ?>"> <img
                            src="<?php echo $image['thumb']; ?>"
                            title="<?php echo $heading_title; ?>"
                            alt="<?php echo $heading_title; ?>"/></a>
            </li>
            <?php } ?>
            <?php } ?>
        </ul>
        <?php
        }
        else
        {
            if(!$images) {
            ?>
            <ul class="thumbnails">
                <?php
                if ($thumb) { ?>
                <li>
                    <a class="thumbnail" href="<?php echo $popup; ?>" title="<?php echo $heading_title; ?>" role="button">
                                                <span class="image-link">
                                                <img src="<?php echo $thumb; ?>" title="<?php echo $heading_title; ?>" class="img-responsive"
                                                     alt="<?php echo $heading_title; ?>">

                                            </span>
                    </a>
                    <button role="button" type="button" data-toggle="tooltip" class="like-btn"
                            title="<?php echo $button_wishlist; ?>"
                            onclick="wishlist.add('<?php echo $product_id; ?>');"><i
                                class="fa fa-heart"></i></button>

                </li>
                <?php } ?>
            </ul>
            <?php
            }
            else {
            ?>


            <ul class="thumbnails bxslider">
                <?php
                if ($thumb) { ?>
                <li>
                    <a class="thumbnail" href="<?php echo $popup; ?>" title="<?php echo $heading_title; ?>" role="button">
                        <span class="image-link">
                            <img src="<?php echo $thumb; ?>" title="<?php echo $heading_title; ?>" class="img-responsive"
                            alt="<?php echo $heading_title; ?>" id="zoom" data-zoom-image="<?php echo $popup; ?>">

                        </span>
                    </a>
                    <button role="button" type="button" data-toggle="tooltip" class="like-btn"
                            title="<?php echo $button_wishlist; ?>"
                            onclick="wishlist.add('<?php echo $product_id; ?>');"><i
                                class="fa fa-heart"></i></button>
                </li>
                <?php } ?>

                <?php if ($images) { ?>
                <?php foreach ($images as $image) { ?>
                <li>
                    <a class="thumbnail" href="<?php echo $image['popup']; ?>" title="<?php echo $heading_title; ?>" role="button">
                        <span class="image-link">
                            <img src="<?php echo $image['popup']; ?>" title="<?php echo $heading_title; ?>" class="img-responsive"
                                 alt="<?php echo $heading_title; ?>">

                        </span>
                    </a>
                    <button role="button" type="button" data-toggle="tooltip" class="like-btn"
                            title="<?php echo $button_wishlist; ?>"
                            onclick="wishlist.add('<?php echo $product_id; ?>');"><i
                            class="fa fa-heart"></i></button>
                </li>
            <?php } ?>
            <?php } ?>
        </ul>
        <?php }}?>
    </div>
    <?php
    } ?>
</div>
<?php if ($column_left && $column_right) { ?>
<?php $class = 'col-sm-6'; ?>
<?php } elseif ($column_left || $column_right) { ?>
<?php $class = 'col-sm-6'; ?>
<?php } else { ?>
<?php $class = 'col-sm-6 col-xs-12'; ?>
<?php } ?>
<div class="<?php echo $class; ?>">
<h1 itemprop="name"><?php echo $heading_title; ?></h1>
<?php if($model): ?>
    <span><?php echo 'Модель: '.$model ?></span>
    <?php endif; ?>
    <?php if ($review_status && $rating) { ?>
        <span style="display:none;" itemprop="aggregateRating" itemscope="" itemtype="http://schema.org/AggregateRating">
          <span itemprop="ratingValue"><?= $rating ?></span>
          <span itemprop="reviewCount"><?= $reviews_count ?></span>
        </span>
        <div class="rating">
            <?php for ($i = 1; $i <= 5; $i++) { ?>
                <?php if ($rating < $i) { ?>
                    <span class="fa fa-stack"><i class="fa fa-star-o fa-stack-1x"></i></span>
                <?php } else { ?>
                    <span class="fa fa-stack"><i class="fa fa-star fa-stack-1x"></i><i
                            class="fa fa-star-o fa-stack-1x"></i></span>
                <?php } ?>
            <?php } ?>
            <div class="review-count"><a href="<?= $_SERVER['REQUEST_URI'] ?>#review-block"><?php echo $reviews; ?></a></div>
        </div>
    <?php } ?>
<?php if ($price) { ?>
    <span style="display: none" itemprop="offers" itemscope="" itemtype="http://schema.org/Offer">
        <span itemprop="priceCurrency" content="UAH"></span>
        <span itemprop="price" content="<?php echo $price; ?>"></span>
    </span>
<ul class="list-unstyled product-price">
    <?php if (!$special) { ?>
    <li>
        <div class="price-in-li">Цена: <?php echo $price; ?></div>
    </li>
    <?php } else { ?>
    <li>
        <div class="price-in-li">Цена: <?php echo $special; ?></div>
    </li>
    <li>
        <span class="old-product-price"><?php echo $price; ?></span>
    </li>
    <?php } ?>

    <!--
    <?php if ($tax) { ?>
    <li><?php echo $text_tax; ?> <?php echo $tax; ?></li>
    <?php } ?>

    <?php if ($points) { ?>
    <li><?php echo $text_points; ?> <?php echo $points; ?></li>
    <?php } ?>
    <?php if ($discounts) { ?>
    <li>
        <hr>
    </li>
    <?php foreach ($discounts as $discount) { ?>
    <li><?php echo $discount['quantity']; ?><?php echo $text_discount; ?><?php echo $discount['price']; ?></li>
    <?php } ?>
    <?php } ?>
    -->

</ul>
<?php } ?>
    <div class="attr-title">
        <span style="color:#b31212"><?=$stock ?></span>
    </div>
<!-- <br> -->
<!-- TODO: to css -->

<div id="product">
    <?php if ($options) { ?>
    <!-- <hr> -->
    <!-- <div class="attr-title"><?php echo $text_option; ?></div> -->
    <?php foreach ($options as $option) { ?>
    <?php if ($option['type'] == 'select') { ?>
    <div class="form-group<?php echo ($option['required'] ? ' required' : ''); ?>">
        <label class="control-label attr-title"
               for="input-option<?php echo $option['product_option_id']; ?>"><?php echo $option['name']; ?></label>
        <select name="option[<?php echo $option['product_option_id']; ?>]"
                id="input-option<?php echo $option['product_option_id']; ?>" class="form-control">
            <option value=""><?php echo $text_select; ?></option>
            <?php foreach ($option['product_option_value'] as $option_value) { ?>
            <option value="<?php echo $option_value['product_option_value_id']; ?>"><?php echo $option_value['name']; ?>
                <?php if ($option_value['price']) { ?>
                (<?php echo $option_value['price_prefix']; ?><?php echo $option_value['price']; ?>)
                <?php } ?>
            </option>
            <?php } ?>
        </select>
    </div>
    <?php } ?>
    <?php if ($option['type'] == 'radio') { ?>
    <div class="form-group<?php echo ($option['required'] ? ' required' : ''); ?>">
        <label class="control-label attr-title"><?php echo $option['name']; ?></label>

        <div id="input-option<?php echo $option['product_option_id']; ?>">
            <?php foreach ($option['product_option_value'] as $option_value) { ?>
            <div class="radio">
                <label>
                    <input type="radio" name="option[<?php echo $option['product_option_id']; ?>]"
                           value="<?php echo $option_value['product_option_value_id']; ?>"/>
                    <?php echo $option_value['name']; ?>
                    <?php if ($option_value['price']) { ?>
                    (<?php echo $option_value['price_prefix']; ?><?php echo $option_value['price']; ?>)
                    <?php } ?>
                </label>
            </div>
            <?php } ?>
        </div>
    </div>
    <?php } ?>
    <?php if ($option['type'] == 'checkbox') { ?>
    <div class="form-group<?php echo ($option['required'] ? ' required' : ''); ?>">
        <label class="control-label attr-title"><?php echo $option['name']; ?></label>

        <div id="input-option<?php echo $option['product_option_id']; ?>">
            <?php foreach ($option['product_option_value'] as $option_value) { ?>
            <div class="checkbox">
                <label>
                    <input type="checkbox" name="option[<?php echo $option['product_option_id']; ?>][]"
                           value="<?php echo $option_value['product_option_value_id']; ?>"/>
                    <?php echo $option_value['name']; ?>
                    <?php if ($option_value['price']) { ?>
                    (<?php echo $option_value['price_prefix']; ?><?php echo $option_value['price']; ?>)
                    <?php } ?>
                </label>
            </div>
            <?php } ?>
        </div>
    </div>
    <?php } ?>
    <?php if ($option['type'] == 'image') { ?>
    <div class="form-group<?php echo ($option['required'] ? ' required' : ''); ?>">
        <label class="control-label attr-title"><?php echo $option['name']; ?></label>

        <div id="input-option<?php echo $option['product_option_id']; ?>">
            <?php foreach ($option['product_option_value'] as $option_value) { ?>
            <div class="radio">
                <label>
                    <input type="radio" name="option[<?php echo $option['product_option_id']; ?>]"
                           value="<?php echo $option_value['product_option_value_id']; ?>"/>
                    <img src="<?php echo $option_value['image']; ?>"
                         alt="<?php echo $option_value['name'] . ($option_value['price'] ? ' ' . $option_value['price_prefix'] . $option_value['price'] : ''); ?>"
                         class="img-thumbnail"/> <?php echo $option_value['name']; ?>
                    <?php if ($option_value['price']) { ?>
                    (<?php echo $option_value['price_prefix']; ?><?php echo $option_value['price']; ?>)
                    <?php } ?>
                </label>
            </div>
            <?php } ?>
        </div>
    </div>
    <?php } ?>
    <?php if ($option['type'] == 'text') { ?>
    <div class="form-group<?php echo ($option['required'] ? ' required' : ''); ?>">
        <label class="control-label attr-title"
               for="input-option<?php echo $option['product_option_id']; ?>"><?php echo $option['name']; ?></label>
        <input type="text" name="option[<?php echo $option['product_option_id']; ?>]"
               value="<?php echo $option['value']; ?>" placeholder="<?php echo $option['name']; ?>"
               id="input-option<?php echo $option['product_option_id']; ?>" class="form-control"/>
    </div>
    <?php } ?>
    <?php if ($option['type'] == 'textarea') { ?>
    <div class="form-group<?php echo ($option['required'] ? ' required' : ''); ?>">
        <label class="control-label attr-title"
               for="input-option<?php echo $option['product_option_id']; ?>"><?php echo $option['name']; ?></label>
        <textarea name="option[<?php echo $option['product_option_id']; ?>]" rows="5"
                  placeholder="<?php echo $option['name']; ?>"
                  id="input-option<?php echo $option['product_option_id']; ?>"
                  class="form-control"><?php echo $option['value']; ?></textarea>
    </div>
    <?php } ?>
    <?php if ($option['type'] == 'file') { ?>
    <div class="form-group<?php echo ($option['required'] ? ' required' : ''); ?>">
        <label class="control-label attr-title"><?php echo $option['name']; ?></label>
        <button type="button" id="button-upload<?php echo $option['product_option_id']; ?>"
                data-loading-text="<?php echo $text_loading; ?>" class="btn btn-default btn-block"><i
                    class="fa fa-upload"></i> <?php echo $button_upload; ?></button>
        <input type="hidden" name="option[<?php echo $option['product_option_id']; ?>]" value=""
               id="input-option<?php echo $option['product_option_id']; ?>"/>
    </div>
    <?php } ?>
    <?php if ($option['type'] == 'date') { ?>
    <div class="form-group<?php echo ($option['required'] ? ' required' : ''); ?>">
        <label class="control-label attr-title"
               for="input-option<?php echo $option['product_option_id']; ?>"><?php echo $option['name']; ?></label>

        <div class="input-group date">
            <input type="text" name="option[<?php echo $option['product_option_id']; ?>]"
                   value="<?php echo $option['value']; ?>" data-date-format="YYYY-MM-DD"
                   id="input-option<?php echo $option['product_option_id']; ?>" class="form-control"/>
                                <span class="input-group-btn">
                                <button class="btn btn-default" type="button"><i class="fa fa-calendar"></i></button>
                                </span></div>
    </div>
    <?php } ?>
    <?php if ($option['type'] == 'datetime') { ?>
    <div class="form-group<?php echo ($option['required'] ? ' required' : ''); ?>">
        <label class="control-label attr-title"
               for="input-option<?php echo $option['product_option_id']; ?>"><?php echo $option['name']; ?></label>

        <div class="input-group datetime">
            <input type="text" name="option[<?php echo $option['product_option_id']; ?>]"
                   value="<?php echo $option['value']; ?>" data-date-format="YYYY-MM-DD HH:mm"
                   id="input-option<?php echo $option['product_option_id']; ?>" class="form-control"/>
                                <span class="input-group-btn">
                                <button type="button" class="btn btn-default"><i class="fa fa-calendar"></i></button>
                                </span></div>
    </div>
    <?php } ?>
    <?php if ($option['type'] == 'time') { ?>
    <div class="form-group<?php echo ($option['required'] ? ' required' : ''); ?>">
        <label class="control-label attr-title"
               for="input-option<?php echo $option['product_option_id']; ?>"><?php echo $option['name']; ?></label>

        <div class="input-group time">
            <input type="text" name="option[<?php echo $option['product_option_id']; ?>]"
                   value="<?php echo $option['value']; ?>" data-date-format="HH:mm"
                   id="input-option<?php echo $option['product_option_id']; ?>" class="form-control"/>
                                <span class="input-group-btn">
                                <button type="button" class="btn btn-default"><i class="fa fa-calendar"></i></button>
                                </span></div>
    </div>
    <?php } ?>
    <?php } ?>
    <?php } ?>
    <?php if ($recurrings) { ?>
    <hr>
    <div class="attr-recurring"><?php echo $text_payment_recurring ?></div>

    <div class="form-group required">
        <select name="recurring_id" class="form-control">
            <option value=""><?php echo $text_select; ?></option>
            <?php foreach ($recurrings as $recurring) { ?>
            <option value="<?php echo $recurring['recurring_id'] ?>"><?php echo $recurring['name'] ?></option>
            <?php } ?>
        </select>

        <div class="help-block" id="recurring-description"></div>
    </div>
    <?php } ?>

    <div class="form-group display-none">
        <label class="control-label" for="input-quantity"><?php echo $entry_qty; ?></label>
        <input type="text" name="quantity" value="<?php echo $minimum; ?>" size="2" id="input-quantity"
               class="form-control"/>
        <input type="hidden" name="product_id" value="<?php echo $product_id; ?>"/>

    </div>
    <?php if ($minimum > 1) { ?>
    <div class="alert alert-info"><i class="fa fa-info-circle"></i> <?php echo $text_minimum; ?></div>
    <?php } ?>
</div>

    <button type="button" style ="margin-bottom: 4px;" id="button-cart" class="btn module-btn" role="button">
        <?php echo $button_cart; ?>
    </button>
    <br>
    <form id="oneclick-order">
        <div class="row">
            <div class="col-md-6">
                <input type="hidden" name="product_name" value="<?php echo $heading_title ?>">
                <input type="text" name="telephone_num" id="telephone_num" class="form-control input-form" placeholder="Номер телефона">
            </div>
            <div class="col-md-6">
                <button class="btn btn-oneclick-order">Заказать в один клик</button>
            </div>
        </div>
    </form>

    <script>
        $('#oneclick-order').on('submit',function(e){
            e.preventDefault();
            var data = $(this).serialize();
            $.ajax({
                method:'post',
                url:'http://kalyanchik.com.ua/index.php?route=common/home/oneclick',
                data:data,
                success:function(r){
                    if(r==1){
                        $('#oneclick-order').empty().append('<div class="order-success">Спасибо,мы с вами свяжемся в ближайшее время</div>');
                    }else{
                        $('.order-error').remove();
                        $('#oneclick-order').after('<div class="order-error">Введите номер телефона!</div>')
                    }
                }
            })
        })
    </script>
<!--
<ul class="list-unstyled">
    <?php if ($manufacturer) { ?>
    <li><?php echo $text_manufacturer; ?> <a href="<?php echo $manufacturers; ?>"><?php echo $manufacturer; ?></a></li>
    <?php } ?>
    <li><?php echo $text_model; ?> <?php echo $model; ?></li>
        <?php if ($reward) { ?>
    <li><?php echo $text_reward; ?> <?php echo $reward; ?></li>
    <?php } ?>
        <li><?php echo $text_stock; ?> <?php echo $stock; ?></li>
</ul>
-->
<!--TODO: сделать проверку на наличие аттрибутов, если их нет, не выводить и  -->


<div class="attr-title">
    Основные характеристики
</div>

<div class="attr-body">
    <?php foreach ($attribute_groups as $attribute_group) { ?>
    <div class="attr-string">

        <div class="attr-group-title"><?php echo $attribute_group['name']; ?>
            <?php foreach ($attribute_group['attribute'] as $attribute) { ?>
        </div>
        <div class="attr-gr"><?php echo $attribute['name']; ?></div>
        <div class="attr-name"><?php echo $attribute['text']; ?><?php } ?></div>

    </div>
    <?php } ?>

</div>

<!--
<div id="product">
    <?php if ($options) { ?>
    <hr>
    <div class="attr-title"><?php echo $text_option; ?></div>
    <?php foreach ($options as $option) { ?>
    <?php if ($option['type'] == 'select') { ?>
    <div class="form-group<?php echo ($option['required'] ? ' required' : ''); ?>">
        <label class="control-label"
               for="input-option<?php echo $option['product_option_id']; ?>"><?php echo $option['name']; ?></label>
        <select name="option[<?php echo $option['product_option_id']; ?>]"
                id="input-option<?php echo $option['product_option_id']; ?>" class="form-control">
            <option value=""><?php echo $text_select; ?></option>
            <?php foreach ($option['product_option_value'] as $option_value) { ?>
            <option value="<?php echo $option_value['product_option_value_id']; ?>"><?php echo $option_value['name']; ?>
                <?php if ($option_value['price']) { ?>
                (<?php echo $option_value['price_prefix']; ?><?php echo $option_value['price']; ?>)
                <?php } ?>
            </option>
            <?php } ?>
        </select>
    </div>
    <?php } ?>
    <?php if ($option['type'] == 'radio') { ?>
    <div class="form-group<?php echo ($option['required'] ? ' required' : ''); ?>">
        <label class="control-label"><?php echo $option['name']; ?></label>

        <div id="input-option<?php echo $option['product_option_id']; ?>">
            <?php foreach ($option['product_option_value'] as $option_value) { ?>
            <div class="radio">
                <label>
                    <input type="radio" name="option[<?php echo $option['product_option_id']; ?>]"
                           value="<?php echo $option_value['product_option_value_id']; ?>"/>
                    <?php echo $option_value['name']; ?>
                    <?php if ($option_value['price']) { ?>
                    (<?php echo $option_value['price_prefix']; ?><?php echo $option_value['price']; ?>)
                    <?php } ?>
                </label>
            </div>
            <?php } ?>
        </div>
    </div>
    <?php } ?>
    <?php if ($option['type'] == 'checkbox') { ?>
    <div class="form-group<?php echo ($option['required'] ? ' required' : ''); ?>">
        <label class="control-label"><?php echo $option['name']; ?></label>

        <div id="input-option<?php echo $option['product_option_id']; ?>">
            <?php foreach ($option['product_option_value'] as $option_value) { ?>
            <div class="checkbox">
                <label>
                    <input type="checkbox" name="option[<?php echo $option['product_option_id']; ?>][]"
                           value="<?php echo $option_value['product_option_value_id']; ?>"/>
                    <?php echo $option_value['name']; ?>
                    <?php if ($option_value['price']) { ?>
                    (<?php echo $option_value['price_prefix']; ?><?php echo $option_value['price']; ?>)
                    <?php } ?>
                </label>
            </div>
            <?php } ?>
        </div>
    </div>
    <?php } ?>
    <?php if ($option['type'] == 'image') { ?>
    <div class="form-group<?php echo ($option['required'] ? ' required' : ''); ?>">
        <label class="control-label"><?php echo $option['name']; ?></label>

        <div id="input-option<?php echo $option['product_option_id']; ?>">
            <?php foreach ($option['product_option_value'] as $option_value) { ?>
            <div class="radio">
                <label>
                    <input type="radio" name="option[<?php echo $option['product_option_id']; ?>]"
                           value="<?php echo $option_value['product_option_value_id']; ?>"/>
                    <img src="<?php echo $option_value['image']; ?>"
                         alt="<?php echo $option_value['name'] . ($option_value['price'] ? ' ' . $option_value['price_prefix'] . $option_value['price'] : ''); ?>"
                         class="img-thumbnail"/> <?php echo $option_value['name']; ?>
                    <?php if ($option_value['price']) { ?>
                    (<?php echo $option_value['price_prefix']; ?><?php echo $option_value['price']; ?>)
                    <?php } ?>
                </label>
            </div>
            <?php } ?>
        </div>
    </div>
    <?php } ?>
    <?php if ($option['type'] == 'text') { ?>
    <div class="form-group<?php echo ($option['required'] ? ' required' : ''); ?>">
        <label class="control-label"
               for="input-option<?php echo $option['product_option_id']; ?>"><?php echo $option['name']; ?></label>
        <input type="text" name="option[<?php echo $option['product_option_id']; ?>]"
               value="<?php echo $option['value']; ?>" placeholder="<?php echo $option['name']; ?>"
               id="input-option<?php echo $option['product_option_id']; ?>" class="form-control"/>
    </div>
    <?php } ?>
    <?php if ($option['type'] == 'textarea') { ?>
    <div class="form-group<?php echo ($option['required'] ? ' required' : ''); ?>">
        <label class="control-label"
               for="input-option<?php echo $option['product_option_id']; ?>"><?php echo $option['name']; ?></label>
        <textarea name="option[<?php echo $option['product_option_id']; ?>]" rows="5"
                  placeholder="<?php echo $option['name']; ?>"
                  id="input-option<?php echo $option['product_option_id']; ?>"
                  class="form-control"><?php echo $option['value']; ?></textarea>
    </div>
    <?php } ?>
    <?php if ($option['type'] == 'file') { ?>
    <div class="form-group<?php echo ($option['required'] ? ' required' : ''); ?>">
        <label class="control-label"><?php echo $option['name']; ?></label>
        <button type="button" id="button-upload<?php echo $option['product_option_id']; ?>"
                data-loading-text="<?php echo $text_loading; ?>" class="btn btn-default btn-block"><i
                    class="fa fa-upload"></i> <?php echo $button_upload; ?></button>
        <input type="hidden" name="option[<?php echo $option['product_option_id']; ?>]" value=""
               id="input-option<?php echo $option['product_option_id']; ?>"/>
    </div>
    <?php } ?>
    <?php if ($option['type'] == 'date') { ?>
    <div class="form-group<?php echo ($option['required'] ? ' required' : ''); ?>">
        <label class="control-label"
               for="input-option<?php echo $option['product_option_id']; ?>"><?php echo $option['name']; ?></label>

        <div class="input-group date">
            <input type="text" name="option[<?php echo $option['product_option_id']; ?>]"
                   value="<?php echo $option['value']; ?>" data-date-format="YYYY-MM-DD"
                   id="input-option<?php echo $option['product_option_id']; ?>" class="form-control"/>
                                <span class="input-group-btn">
                                <button class="btn btn-default" type="button"><i class="fa fa-calendar"></i></button>
                                </span></div>
    </div>
    <?php } ?>
    <?php if ($option['type'] == 'datetime') { ?>
    <div class="form-group<?php echo ($option['required'] ? ' required' : ''); ?>">
        <label class="control-label"
               for="input-option<?php echo $option['product_option_id']; ?>"><?php echo $option['name']; ?></label>

        <div class="input-group datetime">
            <input type="text" name="option[<?php echo $option['product_option_id']; ?>]"
                   value="<?php echo $option['value']; ?>" data-date-format="YYYY-MM-DD HH:mm"
                   id="input-option<?php echo $option['product_option_id']; ?>" class="form-control"/>
                                <span class="input-group-btn">
                                <button type="button" class="btn btn-default"><i class="fa fa-calendar"></i></button>
                                </span></div>
    </div>
    <?php } ?>
    <?php if ($option['type'] == 'time') { ?>
    <div class="form-group<?php echo ($option['required'] ? ' required' : ''); ?>">
        <label class="control-label"
               for="input-option<?php echo $option['product_option_id']; ?>"><?php echo $option['name']; ?></label>

        <div class="input-group time">
            <input type="text" name="option[<?php echo $option['product_option_id']; ?>]"
                   value="<?php echo $option['value']; ?>" data-date-format="HH:mm"
                   id="input-option<?php echo $option['product_option_id']; ?>" class="form-control"/>
                                <span class="input-group-btn">
                                <button type="button" class="btn btn-default"><i class="fa fa-calendar"></i></button>
                                </span></div>
    </div>
    <?php } ?>
    <?php } ?>
    <?php } ?>
    <?php if ($recurrings) { ?>
    <hr>
    <div class="attr-recurring"><?php echo $text_payment_recurring ?></div>

    <div class="form-group required">
        <select name="recurring_id" class="form-control">
            <option value=""><?php echo $text_select; ?></option>
            <?php foreach ($recurrings as $recurring) { ?>
            <option value="<?php echo $recurring['recurring_id'] ?>"><?php echo $recurring['name'] ?></option>
            <?php } ?>
        </select>

        <div class="help-block" id="recurring-description"></div>
    </div>
    <?php } ?>

    <div class="form-group display-none">
        <label class="control-label" for="input-quantity"><?php echo $entry_qty; ?></label>
        <input type="text" name="quantity" value="<?php echo $minimum; ?>" size="2" id="input-quantity"
               class="form-control"/>
        <input type="hidden" name="product_id" value="<?php echo $product_id; ?>"/>

    </div>
    <?php if ($minimum > 1) { ?>
    <div class="alert alert-info"><i class="fa fa-info-circle"></i> <?php echo $text_minimum; ?></div>
    <?php } ?>
</div> -->


</div>

<?php if(trim(strip_tags($description))): ?>
<div class="col-xs-12">
    <div class="product-description">
        <div class="attr-title">Описание</div>
        <?php echo $description; ?>
    </div>
</div>
<?php endif; ?>
</div>
</div>

<div class="col-md-3 col-xs-12">
    <div class="faculty-information shadow-block">
        <ul class="list-unstyled text-center delivery-list col-xs-6 col-sm-6 col-md-12 col-lg-12">
<!--            <li class="delivery-aa">Доставка по Киеву</li>-->
<!--            <li class="delivery-ua">Доставка по Украине</li>-->
            <li class="delivery-free">
                <a rel="nofollow" href="/delivery">Получи бесплатную доставку</a>
            </li>
        </ul>
        <ul class="list-unstyled text-center preference-list col-xs-6 col-sm-6 col-md-12 col-lg-12">
            <li class="best-price">Лучшая цена</li>
            <li class="never-sleep">Работаем 7 дней в неделю</li>
            <li class="quality">Гарантия качества</li>
        </ul>
    </div>
</div>
<!-- end -->





</div>
</div>
</div>

</div>


<div class="recomended-goods">
    <?php if ($products) { ?>
    <div class="row">

        <div class="recomended-goods-content">
            <div class="col-xs-12 ">
                <div class="attr-title recomended-title"><?php echo $text_related; ?></div>
            </div>
            <?php
             $is_slider = (($is_mobile && count($products) > 1) || (!$is_mobile && count($products) > 4));
            ?>
            <div class=" <?php if($is_slider) echo'slider';?>"><!-- slider_begin -->
            <?php $i = 0; ?>
            <?php foreach ($products as $product) { ?>
            <?php if ($column_left && $column_right) { ?>
            <?php $class = 'col-lg-6 col-md-6 col-sm-12 col-xs-12'; ?>
            <?php } elseif ($column_left || $column_right) { ?>
            <?php $class = 'col-lg-4 col-md-4 col-sm-6 col-xs-12'; ?>
            <?php } else { ?>
            <?php $class = 'col-sm-3 col-xs-6'; ?>
            <?php } ?>
            <div class="mobile-xs <?php echo $class; ?>">
                <div class="shadow-block recomended-good-card">
                    <div class="product-thumb transition">
                        <div class="row">
                            <div class="col-xs-12 relative">
                                <div class="col-xs-12">
                                    <div class="image">
                                        <a href="<?php echo $product['href']; ?>" role="button">
                                    <span class="image-link">
                                            <img src="<?php echo $product['thumb']; ?>"
                                                 alt="<?php echo $product['name']; ?>"
                                                 title="<?php echo $product['name']; ?>"
                                                 class="img-responsive">
                                    <button class="like-btn" role="button" type="button" data-toggle="tooltip"
                                            title="<?php echo $button_wishlist; ?>"
                                            onclick="wishlist.add('<?php echo $product['product_id']; ?>');"><i
                                                class="fa fa-heart"></i>
                                    </button>
                                        </a>
                                    </div>
                                </div>
                                <div class="col-xs-12">
                                    <div class="caption">
                                        <div class="title-recomended-good"><a
                                                    href="<?php echo $product['href']; ?>"><?php echo $product['name']; ?></a>
                                        </div>

                                        <!--<p><?php echo $product['description']; ?></p>-->

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

                                            <?php if($product['reviews']){ ?>
                                                <a href="<?php echo $product['href']; ?>#review-block">
                                                    <div class="list-reviews-count"><?= $product['reviews'] ?></div>
                                                </a>
                                            <?php } ?>
                                        </div>

                                        <?php if ($product['price']) { ?>
                                        <div class="price">
                                            <?php if (!$product['special']) { ?>
                                            <?php echo $product['price']; ?>
                                            <?php } else { ?>
                                            <span class="price-new"><?php echo $product['special']; ?></span> <span
                                                    class="price-old"><?php echo $product['price']; ?></span>
                                            <?php } ?>

                                        </div>
                                        <?php } ?>
                                    </div>
                                    <div class="footer-recomended-cart">
                                        <button class="btn btn-primary btn-recomended-cart" type="button"
                                                onclick="cart.add('<?php echo $product['product_id']; ?>', '<?php echo $product['minimum']; ?>');"
                                                role="button" data-loading-text="Загрузка..">
                                            <span><?php echo $button_cart; ?></span> </i>
                                        </button>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <?php if (($column_left && $column_right) && ($i % 2 == 0)) { ?>
            <div class=""></div>
            <?php } elseif (($column_left || $column_right) && ($i % 3 == 0)) { ?>
            <div class=""></div>
            <?php } elseif ($i % 4 == 0) { ?>
            <div class=""></div>
            <?php } ?>
            <?php $i++; ?>
            <?php } ?>
            </div><!-- slider_end -->
        </div>
    </div>
    <?php } ?>
</div>

    <div class="product-content-margin" id="review-block">
        <div class="row">
            <div class="col-sm-6">
                <form class="form-horizontal">
                    <div class="attr-title"><?php echo $text_write; ?></div>
                    <?php if ($review_guest) { ?>
                        <?php if (!$logged) { ?>
                            <div class="form-group required">
                                <div class="col-sm-12">
                                    <input type="text" name="name" value="" placeholder="<?php echo $entry_name; ?>" id="input-name" class="form-control"/>
                                </div>
                            </div>
                            <div class="form-group required">
                                <div class="col-sm-12">
                                    <input type="text" name="email" value="" placeholder="<?php echo $entry_email; ?>" id="input-email" class="form-control"/>
                                </div>
                            </div>
                        <?php } ?>
                        <div class="form-group required">
                            <div class="col-sm-12">
                                <div class="mobile-rating-pad">
                                <textarea name="text" rows="5" id="input-review" class="form-control" placeholder="<?php echo $entry_review; ?>"></textarea>
                                <?php /*
                                <div class="help-block"><?php echo $text_note; ?></div>
                                */ ?>
                            </div>
                            </div>
                        </div>
                        <div class="form-group required">
                            <div class="col-sm-12">
                                <div class="mobile-rating-pad">
                                <div><span class="text-danger">*</span>&nbsp;<?php echo $entry_rating; ?></div>

                                <?php echo $entry_bad; ?>
                                <?php for ($i=1; $i<=5; $i++){ ?>
                                <span class="my-radio">
                                    <input type="radio" name="rating" id="rating-radio-<?= $i ?>" value="<?= $i ?>">
                                    <label for="rating-radio-<?= $i ?>"></label>
                                </span>
                                <?php }?>
                                <?php echo $entry_good; ?></div>
                            </div>
                        </div>
                        <?php if ($site_key) { ?>
                            <div class="form-group">
                                <div class="col-sm-12">
                                    <div class="g-recaptcha" data-sitekey="<?php echo $site_key; ?>" data-callback="recaptchaCallback"></div>
                                </div>
                            </div>
                            <input type="hidden" id="recaptcha-response">
                        <?php } ?>
                        <div class="buttons clearfix">
                            <div class="pull-right">
                                <button type="button" id="button-review"
                                        data-loading-text="<?php echo $text_loading; ?>"
                                        class="btn btn-primary"><?php echo $button_continue; ?></button>
                            </div>
                        </div>
                    <?php } else { ?>
                        <?php echo $text_login; ?>
                    <?php } ?>
                </form>
            </div>
            <div class="col-sm-6">
                <div id="review"></div>
            </div>
        </div>
    </div>

<?php if ($tags) { ?>
<p><?php echo $text_tags; ?>
    <?php for ($i = 0; $i < count($tags); $i++) { ?>
    <?php if ($i < (count($tags) - 1)) { ?>
    <a href="<?php echo $tags[$i]['href']; ?>"><?php echo $tags[$i]['tag']; ?></a>,
    <?php } else { ?>
    <a href="<?php echo $tags[$i]['href']; ?>"><?php echo $tags[$i]['tag']; ?></a>
    <?php } ?>
    <?php } ?>
</p>
<?php } ?>
<?php echo $content_bottom; ?></div>
<?php echo $column_right; ?></div>
</div>
</div>
</div>

<script>
    $(document).ready(function(){
        $('.slider').bxSlider({
            slideWidth: 260,
            minSlides: 1,
            maxSlides: 4,
            slideMargin: 0
        });
        if( $(window).innerWidth() >= 640) {
            $('.project-title').parents('.row').each(function() {
                var childItems = $(this).find('.project-title');
                var maxHeight = 0;
                childItems.each(function() {
                    var height = $(this).outerHeight();
                    if (height > maxHeight) {
                        maxHeight = height;
                    }
                });
                childItems.height(maxHeight);
            });
        }
    });
</script>

    <script>
        function recaptchaCallback(a){
            $('#recaptcha-response').val(a)
        }
    </script>
<script type="text/javascript"><!--
    $('select[name=\'recurring_id\'], input[name="quantity"]').change(function () {
        $.ajax({
            url: 'index.php?route=product/product/getRecurringDescription',
            type: 'post',
            data: $('input[name=\'product_id\'], input[name=\'quantity\'], select[name=\'recurring_id\']'),
            dataType: 'json',
            beforeSend: function () {
                $('#recurring-description').html('');
            },
            success: function (json) {
                $('.alert, .text-danger').remove();

                if (json['success']) {
                    $('#recurring-description').html(json['success']);
                }
            }
        });
    });
    //--></script>
<script type="text/javascript"><!--
    $('#button-cart').on('click', function () {
        $.ajax({
            url: 'index.php?route=checkout/cart/add',
            type: 'post',
            data: $('#product input[type=\'text\'], #product input[type=\'hidden\'], #product input[type=\'radio\']:checked, #product input[type=\'checkbox\']:checked, #product select, #product textarea'),
            dataType: 'json',
            beforeSend: function () {
                $('#button-cart').button('loading');
            },
            complete: function () {

            },
            success: function (json) {
                $('.alert, .text-danger').remove();
                $('.form-group').removeClass('has-error');

                if (json['error']) {
                    $('#button-cart').button('reset');
                    if (json['error']['option']) {
                        for (i in json['error']['option']) {
                            var element = $('#input-option' + i.replace('_', '-'));

                            if (element.parent().hasClass('input-group')) {
                                element.parent().after('<div class="text-danger">' + json['error']['option'][i] + '</div>');
                            } else {
                                element.after('<div class="text-danger">' + json['error']['option'][i] + '</div>');
                            }
                            $('#button-cart').after('<span style="padding-left:5px;" class="text-danger"> ' + json['error']['option'][i] + '</span>');
                        }
                    }

                    if (json['error']['recurring']) {
                        $('select[name=\'recurring_id\']').after('<div class="text-danger">' + json['error']['recurring'] + '</div>');
                    }

                    // Highlight any found errors
                    $('.text-danger').parent().addClass('has-error');
                }

                if (json['success']) {

                   // $('.breadcrumb').after('<div class="alert alert-success">' + json['success'] + '<button type="button" class="close" data-dismiss="alert">&times;</button></div>');
                    $('#added-to-cart .productj').load('index.php?route=product/product/productj&pid=<?php echo $product_id; ?>',function(){
                        $('#added-to-cart').modal();
                        $('#button-cart').button('reset');
                    });
                    $('#cart > button').html('<span id="cart-total"> ' + json['total'] + '</span>');

                    //$('html, body').animate({scrollTop: 0}, 'slow');

                    $('#cart > ul').load('index.php?route=common/cart/info ul li');
                }
            }
        });
    });
    //--></script>
<script type="text/javascript"><!--
    $('.date').datetimepicker({
        pickTime: false
    });

    $('.datetime').datetimepicker({
        pickDate: true,
        pickTime: true
    });

    $('.time').datetimepicker({
        pickDate: false
    });

    $('button[id^=\'button-upload\']').on('click', function () {
        var node = this;

        $('#form-upload').remove();

        $('body').prepend('<form enctype="multipart/form-data" id="form-upload" style="display: none;"><input type="file" name="file" /></form>');

        $('#form-upload input[name=\'file\']').trigger('click');

        if (typeof timer != 'undefined') {
            clearInterval(timer);
        }

        timer = setInterval(function () {
            if ($('#form-upload input[name=\'file\']').val() != '') {
                clearInterval(timer);

                $.ajax({
                    url: 'index.php?route=tool/upload',
                    type: 'post',
                    dataType: 'json',
                    data: new FormData($('#form-upload')[0]),
                    cache: false,
                    contentType: false,
                    processData: false,
                    beforeSend: function () {
                        $(node).button('loading');
                    },
                    complete: function () {
                        $(node).button('reset');
                    },
                    success: function (json) {
                        $('.text-danger').remove();

                        if (json['error']) {
                            $(node).parent().find('input').after('<div class="text-danger">' + json['error'] + '</div>');
                        }

                        if (json['success']) {
                            alert(json['success']);

                            $(node).parent().find('input').attr('value', json['code']);
                        }
                    },
                    error: function (xhr, ajaxOptions, thrownError) {
                        alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
                    }
                });
            }
        }, 500);
    });
    //--></script>
<script type="text/javascript"><!--
    $('#review').delegate('.pagination a', 'click', function (e) {
        e.preventDefault();

        $('#review').fadeOut('slow');

        $('#review').load(this.href);

        $('#review').fadeIn('slow');
    });

    $('#review').load('index.php?route=product/product/review&product_id=<?php echo $product_id; ?>');

    $('#button-review').on('click', function () {
        $.ajax({
            url: 'index.php?route=product/product/write&product_id=<?php echo $product_id; ?>',
            type: 'post',
            dataType: 'json',
            data: 'name=' + encodeURIComponent($('input[name=\'name\']').val()) + '&email=' + encodeURIComponent($('input[name=\'email\']').val()) + '&text=' + encodeURIComponent($('textarea[name=\'text\']').val()) + '&rating=' + encodeURIComponent($('input[name=\'rating\']:checked').val() ? $('input[name=\'rating\']:checked').val() : '') + '&g-recaptcha-response=' + encodeURIComponent($('#recaptcha-response').val()),
            beforeSend: function () {
                $('#button-review').button('loading');
            },
            complete: function () {
                $('#button-review').button('reset');
            },
            success: function (json) {
                $('.alert-success, .alert-danger').remove();

                if (json['error']) {
                    $('#review-block h2').after('<div class="alert alert-danger"><i class="fa fa-exclamation-circle"></i> ' + json['error'] + '</div>');
                    grecaptcha.reset();
                }

                if (json['success']) {
                    $('#review-block h2').after('<div class="alert alert-success"><i class="fa fa-check-circle"></i> ' + json['success'] + '</div>');

                    $('input[name=\'name\']').val('');
                    $('input[name=\'email\']').val('');
                    $('textarea[name=\'text\']').val('');
                    $('input[name=\'rating\']:checked').prop('checked', false);
                }
            }
        });
    });

    $(document).ready(function () {
        $('.thumbnails').magnificPopup({
            type: 'image',
            delegate: 'a',
            gallery: {
                enabled: true
            }
        });
    });
    //--></script>
<script>
    $('#zoom').elevateZoom({
        cursor: "crosshair"
    });
</script>
<?php echo $footer; ?>
