<?php echo $header; ?>
<?php if ($error_warning) { ?>
<div class="warning"><?php echo $error_warning; ?></div>
<?php } ?>
<div class="page-content">
<div class="container">
  <div class="row">

  <?php echo $column_left; ?><?php echo $column_right; ?>
<div id="content" class="col-xs-12 col-sm-9"><?php echo $content_top; ?>
  <div class="shadow-block my-heading">
  <div class="breadcrumb">
    <?php foreach ($breadcrumbs as $breadcrumb) { ?>
    <?php echo $breadcrumb['separator']; ?><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a>
    <?php } ?>
  </div>
  <h2><?php echo $heading_title; ?></h2>