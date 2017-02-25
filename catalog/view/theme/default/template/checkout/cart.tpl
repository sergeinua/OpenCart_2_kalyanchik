<?php echo $header; ?>
<div class="cart-page my-heading cart_wrapper">
<div class="container">

  <?php if ($attention) { ?>
  <div class="alert alert-info"><i class="fa fa-info-circle"></i> <?php echo $attention; ?>
    <button type="button" class="close" data-dismiss="alert">&times;</button>
  </div>
  <?php } ?>
  <?php if ($success) { ?>
  <div class="alert alert-success"><i class="fa fa-check-circle"></i> <?php echo $success; ?>
    <button type="button" class="close" data-dismiss="alert">&times;</button>
  </div>
  <?php } ?>
  <?php if ($error_warning) { ?>
  <div class="alert alert-danger"><i class="fa fa-exclamation-circle"></i> <?php echo $error_warning; ?>
    <button type="button" class="close" data-dismiss="alert">&times;</button>
  </div>
  <?php } ?>
  <div class="row"><?php echo $column_left; ?>
    <?php if ($column_left && $column_right) { ?>
    <?php $class = 'col-sm-6'; ?>
    <?php } elseif ($column_left || $column_right) { ?>
    <?php $class = 'col-sm-9'; ?>
    <?php } else { ?>
    <?php $class = 'col-sm-12'; ?>
    <?php } ?>
    <div id="content" class="<?php echo $class; ?>">

        <div class="shadow-block">
        <ul class="breadcrumb">
            <?php foreach ($breadcrumbs as $breadcrumb) { ?>
            <li><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a></li>
            <?php } ?>
        </ul>
        <h2><?php echo $heading_title; ?></h2>
        </div>
        <?php echo $content_top; ?>
        <div class="shadow-block cart_container_box">
      <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data">
        <div class="table-responsive cart_table">
          <table class="table">
            <thead>
              <tr>
                <td class="text-center hidden-xs"><?php echo $column_image; ?></td>
                <td class="text-center"><?php echo $column_name; ?></td>
                <td class="text-center hidden-xs"><?php echo $column_model; ?></td>
                <td class="text-center hidden-xs"><?php echo $column_quantity; ?></td>
                <td class="text-right hidden-sm hidden-xs"><?php echo $column_price; ?></td>
                <td class="text-right"><?php echo $column_total; ?></td>
              </tr>
            </thead>
            <tbody>
              <?php foreach ($products as $product) { ?>
              <tr>
                <td data-head="Изображение" class="text-center hidden-xs"><?php if ($product['thumb']) { ?>
                  <a href="<?php echo $product['href']; ?>"><img src="<?php echo $product['thumb']; ?>" alt="<?php echo $product['name']; ?>" title="<?php echo $product['name']; ?>" class="img-thumbnail" /></a>
                  <?php } ?></td>
                <td data-head="Название" class="text-left"><a href="<?php echo $product['href']; ?>"><?php echo $product['name']; ?></a>
                  <?php if (!$product['stock']) { ?>
                  <span class="text-danger">***</span>
                  <?php } ?>
                  <?php if ($product['option']) { ?>
                  <?php foreach ($product['option'] as $option) { ?>
                  <br />
                  <small><?php echo $option['name']; ?>: <?php echo $option['value']; ?></small>
                  <?php } ?>
                  <?php } ?>
                  <?php if ($product['reward']) { ?>
                  <br />
                  <small><?php echo $product['reward']; ?></small>
                  <?php } ?>
                  <?php if ($product['recurring']) { ?>
                  <br />
                  <span class="label label-info"><?php echo $text_recurring_item; ?></span> <small><?php echo $product['recurring']; ?></small>
                  <?php } ?></td>
                <td data-head="Модель" class="text-left hidden-xs"><?php echo $product['model']; ?></td>
                <td data-head="Количество" class="text-left hidden-xs"><div class="input-group btn-block" style="max-width: 200px;">
                    <input type="text" name="quantity[<?php echo $product['key']; ?>]" value="<?php echo $product['quantity']; ?>" size="1" class="form-control" />
                    <span class="input-group-btn">
                    <button type="submit" data-toggle="tooltip" title="<?php echo $button_update; ?>" class="btn btn-success"><i class="fa fa-refresh"></i></button>
                    <button type="button" data-toggle="tooltip" title="<?php echo $button_remove; ?>" class="btn btn-danger" onclick="cart.remove('<?php echo $product['key']; ?>');"><i class="fa fa-times-circle"></i></button></span></div></td>
                <td data-head="Цена за шт." class="text-right hidden-sm hidden-xs"><?php echo $product['price']; ?></td>
                <td data-head="Всего" class="text-right">
                    <span><?php echo $product['total']; ?></span>
                </td>
              </tr>
              <?php } ?>
              <?php foreach ($vouchers as $vouchers) { ?>
              <tr>
                <td></td>
                <td class="text-left"><?php echo $vouchers['description']; ?></td>
                <td class="text-left"></td>
                <td class="text-left"><div class="input-group btn-block" style="max-width: 200px;">
                    <input type="text" name="" value="1" size="1" disabled="disabled" class="form-control" />
                    <span class="input-group-btn"><button type="button" data-toggle="tooltip" title="<?php echo $button_remove; ?>" class="btn btn-danger" onclick="voucher.remove('<?php echo $vouchers['key']; ?>');"><i class="fa fa-times-circle"></i></button></span></div></td>
                <td class="text-right "><?php echo $vouchers['amount']; ?></td>
                <td class="text-right"><?php echo $vouchers['amount']; ?></td>
              </tr>
              <?php } ?>
            </tbody>
          </table>
        </div>
      </form>


        <?php /* if ($coupon || $voucher || $reward || $shipping) { ?>

          <h2><?php echo $text_next; ?></h2>
        <p><?php echo $text_next_choice; ?></p>
        <div class="panel-group" id="accordion"><?php echo $coupon; ?><?php echo $voucher; ?><?php echo $reward; ?><?php echo $shipping; ?></div>

        <?php }*/ ?>


        <div class="row">
          <div class="col-sm-4 col-sm-offset-8">
            <table class="table table-summary">
              <?php foreach ($totals as $total) { ?>
              <tr>
                <td class="text-right"><?php echo $total['title']; ?>:</td>
                <td class="text-right"><?php echo $total['text']; ?></td>
              </tr>
              <?php } ?>
            </table>
          </div>
        </div>
        <div class="buttons">
          <div class="pull-left"><a href="<?php echo $continue; ?>" class="btn btn-default"><?php echo $button_shopping; ?></a></div>
          <div class="pull-right"><a href="<?php echo $checkout; ?>" rel="nofollow" class="btn btn-primary"><?php echo $button_checkout; ?></a></div>
        </div>
        </div>
        <?php echo $content_bottom; ?></div>
      <?php echo $column_right; ?></div>
  </div>
  </div>
  <?php echo $footer; ?>