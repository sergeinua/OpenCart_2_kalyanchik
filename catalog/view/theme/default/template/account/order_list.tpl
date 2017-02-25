<?php echo $header; ?>
<div class="order-page-info my-heading">
<div class="container">

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
      <?php if ($orders) { ?>
        <div class="shadow-block">
      <div class="table-responsive">
        <table class="table">
          <thead>
            <tr>
              <td class="text-center"><?php echo $column_order_id; ?></td>
              <td class="text-center hidden-xs"><?php echo $column_status; ?></td>
              <td class="text-center"><?php echo $column_date_added; ?></td>
              <td class="text-center hidden-xs"><?php echo $column_product; ?></td>
              <td class="text-center hidden-xs"><?php echo $column_customer; ?></td>
              <td class="text-right"><?php echo $column_total; ?></td>
              <td></td>
            </tr>
          </thead>
          <tbody>
            <?php foreach ($orders as $order) { ?>
            <tr>
              <td class="text-center">#<?php echo $order['order_id']; ?></td>
              <td class="text-center hidden-xs"><?php echo $order['status']; ?></td>
              <td class="text-center"><?php echo $order['date_added']; ?></td>
              <td class="text-center hidden-xs"><?php echo $order['products']; ?></td>
              <td class="text-center hidden-xs"><?php echo $order['name']; ?></td>
              <td class="text-right"><?php echo $order['total']; ?></td>
              <td class="text-right"><a href="<?php echo $order['href']; ?>" data-toggle="tooltip" title="<?php echo $button_view; ?>" class="btn btn-info"><i class="fa fa-eye"></i></a></td>
            </tr>
            <?php } ?>
          </tbody>
        </table>
      </div>
      <div class="text-right"><?php echo $pagination; ?></div>
      <?php } else { ?>
      <p><?php echo $text_empty; ?></p>
      <?php } ?>
      <div class="buttons clearfix">
        <div class="pull-right"><a href="<?php echo $continue; ?>" class="btn btn-primary"><?php echo $button_continue; ?></a></div>
      </div>
        </div>
      <?php echo $content_bottom; ?></div>
    <?php echo $column_right; ?></div>
</div>
</div>
<?php echo $footer; ?>