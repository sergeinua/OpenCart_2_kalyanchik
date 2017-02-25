
<!DOCTYPE html>
<!--[if IE]><![endif]-->
<!--[if IE 8 ]><html dir="<?php echo $direction; ?>" lang="<?php echo $lang; ?>" class="ie8"><![endif]-->
<!--[if IE 9 ]><html dir="<?php echo $direction; ?>" lang="<?php echo $lang; ?>" class="ie9"><![endif]-->
<!--[if (gt IE 9)|!(IE)]><!-->
<html dir="<?php echo $direction; ?>" lang="<?php echo $lang; ?>">
<!--<![endif]-->
<head>
<!-- Google Analytics Content Experiment code -->
<!-- <script>function utmx_section(){}function utmx(){}(function(){var
k='107796667-2',d=document,l=d.location,c=d.cookie;
if(l.search.indexOf('utm_expid='+k)>0)return;
function f(n){if(c){var i=c.indexOf(n+'=');if(i>-1){var j=c.
indexOf(';',i);return escape(c.substring(i+n.length+1,j<0?c.
length:j))}}}var x=f('__utmx'),xx=f('__utmxx'),h=l.hash;d.write(
'<sc'+'ript src="'+'http'+(l.protocol=='https:'?'s://ssl':
'://www')+'.google-analytics.com/ga_exp.js?'+'utmxkey='+k+
'&utmx='+(x?x:'')+'&utmxx='+(xx?xx:'')+'&utmxtime='+new Date().
valueOf()+(h?'&utmxhash='+escape(h.substr(1)):'')+
'" type="text/javascript" charset="utf-8"><\/sc'+'ript>')})();
</script><script>utmx('url','A/B');</script> -->
<!-- End of Google Analytics Content Experiment code -->

<!-- Start of google analytics -->
<?php echo $google_analytics; ?>
<!-- End of google analytics -->
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1">
<title><?php echo $title; ?></title>
<base href="<?php echo $base; ?>" />

<?php if ($description) { ?>
<meta name="description" content="<?php echo $description; ?>" />
<?php } ?>
    <meta property="og:title" content="<?php echo $description; ?>" />
    <meta property="og:type" content="website" />
    <?php foreach ($links as $link) { ?>
    <meta property="og:url" content="<?php echo $link['href']; ?>" />
    <?php } ?>
    <meta property="og:site_name" content="<?php echo $title; ?>" />
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
<script src="catalog/view/javascript/jquery/jquery-2.1.1.min.js" type="text/javascript"></script>
<script src="catalog/view/javascript/common.js" type="text/javascript"></script>
<script>
window.addEventListener('DOMContentLoaded', function() {
  var locationHash = window.location.hash || location.hash;

  var path = {
      jsPath: "./catalog/view/javascript/",
      cssPath: "./catalog/view/theme/default/stylesheet/"
  };

  function setAttributes(el, options) {
      Object.keys(options).forEach(function(attr) {
          el.setAttribute(attr, options[attr]);
      })
  }

  if( locationHash.match('#v2') ) {
      var linkTag = document.createElement('link'),
          scriptTag = document.createElement('script');

      scriptTag.setAttribute('src', path.jsPath + 'versionTwo.js');
      document.body.appendChild(scriptTag);

      setAttributes(linkTag, {'rel':'stylesheet','href': path.cssPath + 'versionTwo.css'});
      document.head.appendChild(linkTag);
  }
});
</script>
<script src="catalog/view/javascript/jquery-ui.min.js" type="text/javascript"></script>
<script src="catalog/view/javascript/bootstrap/js/bootstrap.min.js" type="text/javascript"></script>
<link href="catalog/view/javascript/font-awesome/css/font-awesome.min.css" rel="stylesheet">
<link href="catalog/view/theme/default/stylesheet/dist/hkh.gen.css" rel="stylesheet">
<!-- style for brands page -->
<link rel="stylesheet" href="catalog/view/theme/default/stylesheet/dist/brand.css">
<!-- style for brands page -->
<link href="slider/jquery.bxslider.css" rel="stylesheet">
<script src="slider/jquery.bxslider.js" type="text/javascript"></script>
<script src="slider/jquery.bxslider.min.js" type="text/javascript"></script>
<script src="catalog/view/javascript/jquery.elevatezoom.js" type="text/javascript"></script>

<?php foreach ($styles as $style) { ?>
<link href="<?php echo $style['href']; ?>" type="text/css" rel="<?php echo $style['rel']; ?>" media="<?php echo $style['media']; ?>" />
<?php } ?>

    <script src="catalog/view/javascript/jquery.maskedinput.js" type="text/javascript"></script>

    <script src="catalog/view/javascript/myscripts.js" type="text/javascript"></script>
<?php foreach ($scripts as $script) { ?>
<script src="<?php echo $script; ?>" type="text/javascript"></script>
<?php } ?>

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
                        <a href="<?php echo $account; ?>" rel="nofollow" title="<?php echo $text_account; ?>" class="dropdown-toggle btn-link" data-toggle="dropdown">
                            <span class="hidden-xs"><?php echo $text_account; ?></span>
                            <i class="fa fa-user"></i> <span class="hidden-xs hidden-sm hidden-md"></span>
                            <i class="fa fa-angle-down"></i>
                        </a>
                        <ul class="dropdown-menu dropdown-menu-right">
                            <?php if ($logged) { ?>
                            <li><a href="<?php echo $account; ?>" rel="nofollow"><?php echo $text_account; ?></a></li>
                            <li><a href="<?php echo $order; ?>"><?php echo $text_order; ?></a></li>
                            <li><a href="<?php echo $logout; ?>"><?php echo $text_logout; ?></a></li>
                            <?php } else { ?>
                            <li><a href="<?php echo $register; ?>" rel="nofollow"><?php echo $text_register; ?></a></li>
                            <li><a href="<?php echo $login; ?>" rel="nofollow"><?php echo $text_login; ?></a></li>
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
                            <li><a href="<?php echo $value['href']?>" rel="nofollow" role="link"><?php echo $value['title']?></a></li>
                            <?php }?>
                            <li><a href="<?php echo $contact ?>" rel="nofollow" role="link">Контакты</a></li>
                            <li><a href="http://kalyanchik.com.ua/sitemap/" rel="nofollow" role="link">Карта сайта</a></li>

                        </ul>
                    </div>
                </div>
            </div>

        </div>
    </nav>
  <div class="container">
    <div class="row">
      <div class="col-sm-5 col-sm-push-4 col-md-5 col-md-push-4 col-lg-6 col-lg-push-3 col-xs-6 logo_container">
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
        <div class="body-nav-links">
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
