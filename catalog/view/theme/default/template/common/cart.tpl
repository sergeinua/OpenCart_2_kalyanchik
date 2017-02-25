<div id="cart" class="btn-group btn-block">
  <button type="button" data-toggle="dropdown" data-loading-text="<?php echo $text_loading; ?>" class="btn-cart"><span id="cart-total"><?php echo $text_items; ?></span></button>
  <ul class="dropdown-menu open-cart pull-right">
    <?php if ($products || $vouchers) { ?>
    <li>
      <table class="table">
        <?php foreach ($products as $product) { ?>
        <tr>
          <td class="text-center cart-image"><?php if ($product['thumb']) { ?>
            <a href="<?php echo $product['href']; ?>"><img src="<?php echo $product['thumb']; ?>" alt="<?php echo $product['name']; ?>" title="<?php echo $product['name']; ?>" class="img-thumbnail" /></a>
            <?php } ?></td>
          <td class="text-left cart-name"><a href="<?php echo $product['href']; ?>"><?php echo $product['name']; ?></a>
            <?php if ($product['option']) { ?>
            <?php foreach ($product['option'] as $option) { ?>
            <br />
            - <small><?php echo $option['name']; ?> <?php echo $option['value']; ?></small>
            <?php } ?>
            <?php } ?>
            <?php if ($product['recurring']) { ?>
            <br />
            - <small><?php echo $text_recurring; ?> <?php echo $product['recurring']; ?></small>
            <?php } ?></td>
          <td class="text-right cart-number">x <?php echo $product['quantity']; ?></td>
          <td class="text-right cart-price"><?php echo $product['total']; ?></td>
          <td class="text-center cart-delete"><button type="button" onclick="cart.remove('<?php echo $product['key']; ?>');" title="<?php echo $button_remove; ?>" class="btn btn-cart-delete"><i class="fa fa-times"></i></button></td>
        </tr>
        <?php } ?>
        <?php foreach ($vouchers as $voucher) { ?>
        <tr>
          <td class="text-center"></td>
          <td class="text-left"><?php echo $voucher['description']; ?></td>
          <td class="text-right">x&nbsp;1</td>
          <td class="text-right"><?php echo $voucher['amount']; ?></td>
          <td class="text-center text-danger"><button type="button" onclick="voucher.remove('<?php echo $voucher['key']; ?>');" title="<?php echo $button_remove; ?>" class="btn btn-danger btn-xs"><i class="fa fa-times"></i></button></td>
        </tr>
        <?php } ?>
      </table>
    </li>
    <li>
      <div>
        <table class="table table-bordered margin-bottom-none">
          <?php foreach ($totals as $total) { ?>
          <tr class="">
            <td class="text-right"><span class="total-cart-price-title"><?php echo $total['title']; ?></span></td>
            <td class="text-right"><span class="total-cart-price-number"><?php echo $total['text']; ?></span></td>
          </tr>
          <?php } ?>
        </table>
        <div class="footer-cart text-center">
            <a href="<?php echo $cart; ?>"><i class="fa fa-shopping-cart"></i> <?php echo $text_cart; ?></a>
            <a href="<?php echo $checkout; ?>" rel="nofollow"><i class="fa fa-share"></i> <?php echo $text_checkout; ?></a>
        </div>
      </div>
    </li>
    <?php } else { ?>
    <li>
      <span class="empty-cart text-center"><?php echo $text_empty; ?></span>
    </li>
    <?php } ?>
  </ul>
</div>
