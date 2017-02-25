
<!DOCTYPE html>
<!--[if IE]><![endif]-->
<!--[if IE 8 ]><html dir="<?php echo $direction; ?>" lang="<?php echo $lang; ?>" class="ie8"><![endif]-->
<!--[if IE 9 ]><html dir="<?php echo $direction; ?>" lang="<?php echo $lang; ?>" class="ie9"><![endif]-->
<!--[if (gt IE 9)|!(IE)]><!-->
<html dir="<?php echo $direction; ?>" lang="<?php echo $lang; ?>">
<!--<![endif]-->
<head>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1">
<title><?php echo $title; ?></title>
<base href="<?php echo $base; ?>" />
<?php if ($description) { ?>
<meta name="description" content="<?php echo $description; ?>" />
<?php } ?>
<?php if ($keywords) { ?>
<meta name="keywords" content= "<?php echo $keywords; ?>" />
<?php } ?>
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<?php if ($icon) { ?>
<link href="<?php echo $icon; ?>" rel="icon" />
<?php } ?>
<?php foreach ($links as $link) { ?>
<link href="<?php echo $link['href']; ?>" rel="<?php echo $link['rel']; ?>" />
<?php }
 ?>
    <?php foreach ($alter_lang as $lang=>$href) { ?>
    <link href="<?php echo $href; ?>" hreflang="<?php echo $lang; ?>" rel="alternate" />
    <?php }?>




<?php echo $google_analytics; ?>
</head>
<body class="<?php echo $class; ?>">

<header role="banner">
    <nav id="top">
        <div class="container">
            <!-- <?php echo $currency; ?>-->
            <!-- <?php echo $language; ?> -->
            <div id="top-links" class="nav pull-right">
                <a href="#" class="btn btn-call-me module-btn" role="button" data-toggle="modal" data-target="#call-me"> <i class="fa fa-phone"></i><span>Позвоните мне</span></a>
                <ul class="list-inline">
                    <li class="dropdown">
                        <a href="<?php echo $account; ?>" title="<?php echo $text_account; ?>" class="dropdown-toggle btn-link" data-toggle="dropdown">
                            <span class="hidden-xs"><?php echo $text_account; ?></span>
                            <i class="fa fa-user"></i> <span class="hidden-xs hidden-sm hidden-md"></span>
                            <i class="fa fa-angle-down"></i>
                        </a>
                        <ul class="dropdown-menu dropdown-menu-right">
                            <?php if ($logged) { ?>
                            <li><a href="<?php echo $account; ?>"><?php echo $text_account; ?></a></li>
                            <li><a href="<?php echo $order; ?>"><?php echo $text_order; ?></a></li>
                            <li><a href="<?php echo $logout; ?>"><?php echo $text_logout; ?></a></li>
                            <?php } else { ?>
                            <li><a href="<?php echo $register; ?>"><?php echo $text_register; ?></a></li>
                            <li><a href="<?php echo $login; ?>"><?php echo $text_login; ?></a></li>
                            <?php } ?>
                        </ul>
                    </li>
                </ul>
            </div>

            <div class="btn-div">
                <button id="nav-btn" class="btn-link navbar-toggle-top-links visible-xs" data-toggle="collapse" data-target=".navbar-links-collapse" type="button" role="button">
                    <i class="fa fa-info-circle"></i>
                    <i class="fa fa-angle-down"></i>
                </button>
            </div>

            <div id="common-nav">
                 <div>
                    <div class="collapse navbar-collapse navbar-links-collapse">

                        <ul class="nav navbar-nav">
                            <?php foreach ($informations as $value) { ?>
                            <li><a href="<?php echo $value['href']?>" role="link"><?php echo $value['title']?></a></li>
                            <?php }?>
                            <li><a href="<?php echo $contact ?>" role="link">Контакты</a></li>
                            <li><a href="sitemap/" role="link">Карта сайта</a></li>
                        </ul>
                    </div>
                </div>
            </div>

        </div>
    </nav>
  <div class="container">
    <div class="row">
      <div class="col-sm-5 col-sm-push-4 col-md-5 col-md-push-4 col-lg-6 col-lg-push-3 col-xs-6">
        <div id="logo">
          <?php if ($logo) { ?>
          <a href="<?php echo $home; ?>"><img src="<?php echo $logo; ?>" title="<?php echo $name; ?>" alt="<?php echo $name; ?>" class="img-responsive" /></a>
          <?php } else { ?>
          <h1><a href="<?php echo $home; ?>"><?php echo $name; ?></a></h1>
          <?php } ?>
        </div>
      </div>
      <div class="header-contacts col-xs-6 col-sm-5 col-sm-pull-5 col-md-5 col-md-pull-5 col-lg-3 col-lg-pull-6">
            <ul>
                <li>
                    <a href="tel:0979933223" class="small-number" role="link">+380(97) <span>99-33-223</span></a>
                </li>
                <li>
                    <a class="small-number" href="tel:0669933223" role="link">+380(66) <span>99-33-223</span></a>
                </li>
                <li>

                    <a class="small-number" href="tel:0639933223" role="link">+380(63) <span>99-33-223</span></a>
                </li>
                <li class="header-address">
                    ТЦ "Олимпийский", 3 этаж, бутик 3.31
                </li>
            </ul>
      </div>

      <div class="col-xs-12 col-sm-2 col-md-2 col-lg-3">
          <?php echo $cart; ?>
      </div>

        <div class="col-sm-3 col-xs-12 col-sm-offset-9">
            <?php echo $search; ?>
        </div>
    </div>
  </div>
</header>

<div id="body-navigation">
<?php if ($categories) { ?>
<div class="container">
  <div class="menu-header col-xs-12 col-sm-12">
      <nav id="menu" role="navigation">
        <div class="navbar-header">
          <button id="body-nav-btn" class="btn btn-navbar navbar-toggle pull-left" type="button" data-toggle="collapse" data-target=".navbar-ex1-collapse"><i class="fa fa-bars"></i><span>Категории</span></button>
        </div>
        <div class="collapse body-nav-links navbar-collapse navbar-ex1-collapse">
          <ul class="body-nav">
            <?php foreach ($categories as $category) { ?>
            <?php if ($category['children']) { ?>
            <li class="dropdown"><a href="<?php echo $category['href']; ?>" class="dropdown-toggle"><?php echo $category['name']; ?></a>
              <div class="dropdown-menu menu-subcategory">
                <div class="dropdown-inner">
                  <?php foreach (array_chunk($category['children'], ceil(count($category['children']) / $category['column'])) as $children) { ?>
                  <ul class="list-unstyled">
                    <?php foreach ($children as $child) { ?>
                    <li><a href="<?php echo $child['href']; ?>"><?php echo $child['name']; ?></a></li>
                    <?php } ?>
                  </ul>
                  <?php } ?>
                </div>

              </div>
            </li>
            <?php } else { ?>
            <li><a href="<?php echo $category['href']; ?>"><?php echo $category['name']; ?></a></li>
            <?php } ?>
            <?php } ?>
          </ul>
        </div>
      </nav>
  </div>
</div>
<?php } ?>
</div>
