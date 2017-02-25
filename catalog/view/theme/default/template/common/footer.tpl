﻿<footer role="contentinfo">
  <div class="container">
    <div class="row">
        <?php /*
<?php if ($informations) { ?>


 <div class="col-sm-3">
 <ul class="list-unstyled">
   <?php foreach ($informations as $information) { ?>
   <li><a href="<?php echo $information['href']; ?>"><?php echo $information['title']; ?></a></li>

   <?php } ?>
 </ul>
</div>
<?php } ?>
     <div class="col-sm-3">
       <h5><?php echo $text_service; ?></h5>
       <ul class="list-unstyled">
         <li><a href="<?php echo $contact; ?>"><?php echo $text_contact; ?></a></li>
         <li><a href="<?php echo $return; ?>"><?php echo $text_return; ?></a></li>
         <li><a href="<?php echo $sitemap; ?>"><?php echo $text_sitemap; ?></a></li>
       </ul>
     </div>

       <div class="col-sm-3">
       <h5><?php echo $text_extra; ?></h5>
       <ul class="list-unstyled">
         <li><a href="<?php echo $manufacturer; ?>"><?php echo $text_manufacturer; ?></a></li>
         <li><a href="<?php echo $voucher; ?>"><?php echo $text_voucher; ?></a></li>
         <li><a href="<?php echo $affiliate; ?>"><?php echo $text_affiliate; ?></a></li>
         <li><a href="<?php echo $special; ?>"><?php echo $text_special; ?></a></li>
       </ul>
     </div>
       <div class="col-sm-3">
       <h5><?php echo $text_account; ?></h5>
       <ul class="list-unstyled">
         <li><a href="<?php echo $account; ?>"><?php echo $text_account; ?></a></li>
         <li><a href="<?php echo $order; ?>"><?php echo $text_order; ?></a></li>
         <li><a href="<?php echo $wishlist; ?>"><?php echo $text_wishlist; ?></a></li>
         <li><a href="<?php echo $newsletter; ?>"><?php echo $text_newsletter; ?></a></li>
       </ul>
     </div>
 -->*/ ?>

        <div class="col-xs-12 footer-logo">
            <img class="img-responsive" src="/catalog/view/theme/default/image/logo-footer.png" alt="">
        </div>
        <div class="col-xs-12 text-center footer-information first-string">
            Интернет-магазин кальянов «Кальянчик»
        </div>

        <div class="col-xs-12">
            <div class="row">
            <ul class="footer-contacts">
                <li class="col-xs-12 col-sm-4 col-lg-3 col-lg-push-1">
                   <a href="tel:0979933223" class="small-number" role="link">+380(97) <span>99-33-223</span></a>
                </li>
                <li class="col-xs-12 col-sm-4 col-lg-3 col-lg-push-1">
                    <a class="small-number" href="tel:0669933223" role="link">+380(66) <span>99-33-223</span></a>
                </li>
                <li class="col-xs-12 col-sm-4 col-lg-3 col-lg-push-1">
                    <a class="small-number" href="tel:0639933223" role="link">+380(63) <span>99-33-223</span></a>
                </li>
            </ul>
            </div>
        </div>

        <div class="col-xs-12 text-center footer-information footer-adress">
            ТЦ "Олимпийский", 3 этаж, бутик 3.31
        </div>

        <div class="col-xs-12">
            <div class="social">
                <ul>
                    <li><a class="fb" rel="nofollow" title="Facebook" role="link" target="_blank" href="https://www.facebook.com/kalyanchik.com.ua"></a></li>
                    <li><a class="vk" rel="nofollow" title="Вконтакте" role="link" target="_blank" href="https://vk.com/kalyanchik_com_ua"></a></li>
                    <li><!-- <a class="gp" title="Google+" role="link" target="_blank" href="https://plus.google.com/b/111437339535756423501/105862147617123993875/posts?gmbpt=true&pageId=111437339535756423501&_ga=1.250678982.1905178793.1452690253"></a> -->
                    <a class="gp" rel="nofollow" href="https://plus.google.com/u/1/109247289708434163631" target="_blank" rel="author"></a></li>
                </ul>
            </div>
        </div>
    </div>

  </div>

  <div class="copyrights container">
        <div class="row">
            <div id="copy" class="col-xs-12 col-sm-6">
                2015-2016 © Интернет-магазин кальянов «Кальянчик»
            </div>
            <div id="reclamare" class="col-xs-12 col-sm-6">
                <a rel="nofollow" href="http://www.reclamare.ua/" title="Создание сайтов в Киеве" role="link">Создание сайтов: Студия Reclamare</a>
            </div>
        </div>
  </div>
    <div class="modal fade" id="added-to-cart" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
        <div class="modal-dialog  modal-sm" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span
                                aria-hidden="true">&times;</span></button>
                    <p class="modal-title" id="myModalLabel">Товар добавлен в корзину</p>
                </div>
                <div class="modal-body">
                    <div class="productj product-thumb">

                    </div>
                    <div class="modal-cart text-center">
                        <!--a href="http://kalyanchik.com.ua/cart/"><i class="fa fa-shopping-cart"></i> Перейти в корзину</a-->
                        <a href="http://kalyanchik.com.ua/simplecheckout/" rel="nofollow"><i class="fa fa-share"></i> Оформить заказ</a>
                    </div>
                </div>

            </div>
        </div>
    </div>
    <div class="modal fade " id="call-me" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span
                                aria-hidden="true">&times;</span></button>
                    <p class="modal-title" id="myModalLabel">Оставьте вашу заявку и мы перезвоним!</p>
                </div>
                <div class="modal-body">
                    <form method="post" class="form-vertical" action="<?php echo $form_callback_action; ?>">
                        <fieldset>
                            <div class="form-group required">
                                <div class="col-sm-6">
                                    <input type="text" name="name" value="" id="input-name" class="form-control input-form" placeholder="Ваше имя" required>
                                </div>
                            </div>
                            <div class="form-group form-group-last required">
                                <div class="col-sm-6">
                                    <input type="text" name="tel" value="" id="callback-tel" class="form-control input-form" placeholder="Номер телефона" required>
                                </div>
                            </div>
                        </fieldset>
                        <div class="modal-footer">
                            <button type="submit" class="btn btn-primary" onsubmit="callsend.send()">Отправить</button>
                        </div>
                    </form>
                </div>

            </div>
        </div>
    </div>

<!--script type="text/javascript">
  (function(d, w, s) {
        var widgetId = '23592', gcw = d.createElement(s); gcw.type = 'text/javascript'; gcw.async = true;
        gcw.src = '//widgets.binotel.com/getcall/widgets/'+ widgetId +'.js';
        var sn = d.getElementsByTagName(s)[0]; sn.parentNode.insertBefore(gcw, sn);
  })(document, window, 'script');
</script-->
<!--script>
    $( document ).ready(function() {
        var btn = $('#call-me > div > div > div.modal-body > form > div > button');
        btn.on('click', function(e){
            if($('#input-name').val() == '' || $('#callback-tel').val() == '') {
                ga('send', 'event', 'click', 'click', 'call_me_btn_fail', 1);
            } else {
                ga('send', 'event', 'click', 'click', 'call_me_btn_success', 1);
            }
        });
    });
</script-->

<script async src="https://crm.streamtele.com/widget/getwidget/c6ed4f0f1b96b0bc6dc1bb7e331831ca" type="text/javascript"&gt;&lt;/script&gt;<span class="sew5wnpnyroutqp"></span><span class="sew7s7582qgxhu8"></span>
<script>
    $( document ).ready(function() {
        var els = document.querySelectorAll("a[href='"+document.URL+"']");
        for (var i = 0, l = els.length; i < l; i++) {
            var el = els[i];
            el.style["pointer-events"] = 'none';
            el.style["cursor"] = 'default';
            el.onclick = function(){return false};
        }
        var exists = $('#pagination-block').html().length;
        var url = window.location.origin + window.location.pathname;
        var page = getUrlParameter('page');
        //pagination exists
        if(exists) {
            page = (page.replace(/\D/g,''));
            //first page
            if(parseInt(page) == 1 || !page){
                url = url + '?page=2/';
                $("head").append('<meta name="robots" content="INDEX, FOLLOW" />');
                $("head").append('<link rel="next" href="' + url + '">');
            }
            //the rest
            if(parseInt(page) > 1){
                var prev_page = parseInt(page) - 1;
                var next_page = parseInt(page) + 1;
                var main_url = url + '?page=1/';
                var url_prev = url + '?page=' + prev_page + '/';
                var url_next = url + '?page=' + next_page + '/';
                var next_exist = $('a[href$="page=' + next_page + '"]').length;
                $("head").append('<meta name="robots" content="NOINDEX, FOLLOW" />');
                $("head").append('<link rel="prev" href="' + url_prev + '">');
                if(next_exist)
                {
                    $("head").append('<link rel="next" href="' + url_next + '">');
                }
            }
        }
    });
    var getUrlParameter = function getUrlParameter(sParam) {
        var sPageURL = decodeURIComponent(window.location.search.substring(1)),
                sURLVariables = sPageURL.split('&'),
                sParameterName,
                i;

        for (i = 0; i < sURLVariables.length; i++) {
            sParameterName = sURLVariables[i].split('=');

            if (sParameterName[0] === sParam) {
                return sParameterName[1] === undefined ? true : sParameterName[1];
            }
        }
    };
</script>
</footer>


</body></html>