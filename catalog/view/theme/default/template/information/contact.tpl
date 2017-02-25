<?php echo $header; ?>
<div class="contact-page my-heading">
  <div class="container">
    <div class="row"><?php echo $column_left; ?>
      <?php if ($column_left && $column_right) { ?>
      <?php $class = 'col-sm-6'; ?>
      <?php } elseif ($column_left || $column_right) { ?>
      <?php $class = 'col-sm-9'; ?>
      <?php } else { ?>
      <?php $class = 'col-sm-12'; ?>
      <?php } ?>
      <div id="content" class="<?php echo $class; ?>"><?php echo $content_top; ?>
        <div class="shadow-block">
          <ul class="breadcrumb">
            <?php foreach ($breadcrumbs as $breadcrumb) { ?>
            <li><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a></li>
            <?php } ?>
          </ul>
          <h1><?php echo $heading_title; ?></h1>
        </div>
        <div class="shadow-block">
          <h3><?php echo $text_location; ?></h3>
          <div class="first-map">

            <div class="row">
                <div class="col-md-6">
                  <?php if ($image) { ?>
                  <div class="col-sm-12"><img src="<?php echo $image; ?>" alt="<?php echo $store; ?>" title="<?php echo $store; ?>" class="img-thumbnail" /></div>
                  <?php } ?>
                  <div class="col-sm-12"><span class="text-bold">г. КИЕВ</span><br />
                    <address>
                      <?php echo $address; ?>
                    </address>
                    <?php if ($geocode) { ?>
                    <a href="https://maps.google.com/maps?q=<?php echo urlencode($geocode); ?>&hl=en&t=m&z=15" target="_blank" class="btn btn-info"><i class="fa fa-map-marker"></i> <?php echo $button_map; ?></a>
                    <?php } ?>
                  </div>
                  <div class="col-sm-12"><span class="text-bold"><?php echo $text_telephone; ?></span><br>
                    <?php echo $telephone; ?><br />
                    <br />
                    <?php if ($fax) { ?>
                    <span class="text-bold"><?php echo $text_fax; ?></span><br>
                    <?php echo $fax; ?>
                    <?php } ?>
                  </div>
                  <div class="col-sm-12">
                    <?php if ($open) { ?>
                    <span class="text-bold"><?php echo $text_open; ?></span><br />
                    <?php echo $open; ?><br />
                    <br />
                    <?php } ?>
                    <?php if ($comment) { ?>
                    <span class="text-bold"><?php echo $text_comment; ?></span><br />
                    <?php echo $comment; ?>
                    <?php } ?>
                </div>


            </div>
            <div class="col-sm-6">
              <script type="text/javascript" src="https://maps.googleapis.com/maps/api/js?sensor=false"></script>

              <script type="text/javascript">
                google.maps.event.addDomListener(window, 'load', init);

                function init() {
                  var mapOptions = {
                    zoom: 14,
                    scrollwheel: false,
                    center: new google.maps.LatLng(50.43227903,30.51565289) // Лесники
                  };
                  var mapElement = document.getElementById('map');
                  var map = new google.maps.Map(mapElement, mapOptions);
                  var myLatLng = new google.maps.LatLng(50.43227903,30.51565289);
                  var beachMarker = new google.maps.Marker({
                    position: myLatLng,
                    map: map
                  });

                  //google.maps.event.addDomListener(window, 'load', initialize);
                }
              </script>

              <div id="map"></div>
            </div>

            </div>
            <?php if ($locations) { ?>
            <h3><?php echo $text_store; ?></h3>
            <div class="panel-group" id="accordion">
              <?php foreach ($locations as $location) { ?>
              <div class="panel panel-default">
                <div class="panel-heading">
                  <h4 class="panel-title"><a href="#collapse-location<?php echo $location['location_id']; ?>" class="accordion-toggle" data-toggle="collapse" data-parent="#accordion"><?php echo $location['name']; ?> <i class="fa fa-caret-down"></i></a></h4>
                </div>
                <div class="panel-collapse collapse" id="collapse-location<?php echo $location['location_id']; ?>">
                  <div class="panel-body">
                    <div class="row">
                      <?php if ($location['image']) { ?>
                      <div class="col-sm-3"><img src="<?php echo $location['image']; ?>" alt="<?php echo $location['name']; ?>" title="<?php echo $location['name']; ?>" class="img-thumbnail" /></div>
                      <?php } ?>
                      <div class="col-sm-3"><span class="text-bold"><?php echo $location['name']; ?></span><br />
                        <address>
                          <?php echo $location['address']; ?>
                        </address>
                        <?php if ($location['geocode']) { ?>
                        <a href="https://maps.google.com/maps?q=<?php echo urlencode($location['geocode']); ?>&hl=en&t=m&z=15" target="_blank" class="btn btn-info"><i class="fa fa-map-marker"></i> <?php echo $button_map; ?></a>
                        <?php } ?>
                      </div>
                      <div class="col-sm-3"> <span class="text-bold"><?php echo $text_telephone; ?></span><br>
                        <?php echo $location['telephone']; ?><br />
                        <br />
                        <?php if ($location['fax']) { ?>
                        <span class="text-bold"><?php echo $text_fax; ?></span><br>
                        <?php echo $location['fax']; ?>
                        <?php } ?>
                      </div>
                      <div class="col-sm-3">
                        <?php if ($location['open']) { ?>
                        <span class="text-bold"><?php echo $text_open; ?></span><br />
                        <?php echo $location['open']; ?><br />
                        <br />
                        <?php } ?>
                        <?php if ($location['comment']) { ?>
                        <span class="text-bold"><?php echo $text_comment; ?></span><br />
                        <?php echo $location['comment']; ?>
                        <?php } ?>
                      </div>
                    </div>
                  </div>
                </div>
              </div>
              <?php } ?>
            </div>
            <?php } ?>

            <?php echo $content_bottom; ?></div>
            <hr />
            <div class="second-map">

              <div class="row">
                  <div class="col-md-6">
                    <div class="col-sm-12"><span class="text-bold">г. ДНЕПР</span><br />
                      <address>
                         ул. Глинки, 7а, павильон, 5
                      </address>
                    </div>
                    <!-- <div class="col-sm-12"><span class="text-bold">Телефон</span><br>
                      <?php echo $telephone; ?><br />
                      <br />
                      <?php if ($fax) { ?>
                      <span class="text-bold">Режим работы</span><br>
                      <?php echo $fax; ?>
                      <?php } ?>
                    </div> -->
                    <div class="col-sm-12">
                      <?php if ($comment) { ?>
                      <span class="text-bold">Дополнительная информация</span><br />
                      dnepr_sale@kalyanchik.com.ua<p>
					  <br>Магазин в г. Днепр работает каждый день с 10:00 до 21:00.</p>
</br>
                      <?php } ?>
                  </div>


              </div>

              <div class="col-sm-6">
                <!-- <script type="text/javascript" src="https://maps.googleapis.com/maps/api/js?sensor=false"></script>

                <script type="text/javascript">
                  google.maps.event.addDomListener(window, 'onload', initSecond);

                  function initSecond() {
                    var mapOptions2 = {
                      zoom: 14,
                      scrollwheel: false,
                      center: new google.maps.LatLng(48.4662075,35.0515452) // Лесники
                    };
                    var mapElement2 = document.getElementById('map2');
                    var map2 = new google.maps.Map(mapElement2, mapOptions2);
                    var myLatLng2 = new google.maps.LatLng(48.4662075,35.05154529);
                    var beachMarker2 = new google.maps.Marker({
                      position: myLatLng2,
                      map: map2
                    });

                    //google.maps.event.addDomListener(window, 'load', initialize);
                  }
                </script>

                <div id="map2"></div> -->
                <iframe class="google-map" src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d661.3806324935789!2d35.050875471982145!3d48.46569006448381!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x40dbe2c2b5d4c1e1%3A0xa8e609072a2dde58!2z0LLRg9C70LjRhtGPINCT0LvRltC90LrQuCwgNywg0JTQvdGW0L_RgNC-zIEsINCU0L3RltC_0YDQvtC_0LXRgtGA0L7QstGB0YzQutCwINC-0LHQu9Cw0YHRgtGM!5e0!3m2!1sru!2sua!4v1471252091757" width="600" height="450" frameborder="0" style="border:0" allowfullscreen></iframe>
              </div>
              </div>
              <?php if ($locations) { ?>
              <h3><?php echo $text_store; ?></h3>
              <div class="panel-group" id="accordion">
                <?php foreach ($locations as $location) { ?>
                <div class="panel panel-default">
                  <div class="panel-heading">
                    <h4 class="panel-title"><a href="#collapse-location<?php echo $location['location_id']; ?>" class="accordion-toggle" data-toggle="collapse" data-parent="#accordion"><?php echo $location['name']; ?> <i class="fa fa-caret-down"></i></a></h4>
                  </div>
                  <div class="panel-collapse collapse" id="collapse-location<?php echo $location['location_id']; ?>">
                    <div class="panel-body">
                      <div class="row">
                        <?php if ($location['image']) { ?>
                        <div class="col-sm-3"><img src="<?php echo $location['image']; ?>" alt="<?php echo $location['name']; ?>" title="<?php echo $location['name']; ?>" class="img-thumbnail" /></div>
                        <?php } ?>
                        <div class="col-sm-3"><span class="text-bold"><?php echo $location['name']; ?></span><br />
                          <address>
                            <?php echo $location['address']; ?>
                          </address>
                          <?php if ($location['geocode']) { ?>
                          <a href="https://maps.google.com/maps?q=<?php echo urlencode($location['geocode']); ?>&hl=en&t=m&z=15" target="_blank" class="btn btn-info"><i class="fa fa-map-marker"></i> <?php echo $button_map; ?></a>
                          <?php } ?>
                        </div>
                        <div class="col-sm-3"> <span class="text-bold"><?php echo $text_telephone; ?></span><br>
                          <?php echo $location['telephone']; ?><br />
                          <br />
                          <?php if ($location['fax']) { ?>
                          <span class="text-bold"><?php echo $text_fax; ?></span><br>
                          <?php echo $location['fax']; ?>
                          <?php } ?>
                        </div>
                        <div class="col-sm-3">
                          <?php if ($location['open']) { ?>
                          <span class="text-bold"><?php echo $text_open; ?></span><br />
                          <?php echo $location['open']; ?><br />
                          <br />
                          <?php } ?>
                          <?php if ($location['comment']) { ?>
                          <span class="text-bold"><?php echo $text_comment; ?></span><br />
                          <?php echo $location['comment']; ?>
                          <?php } ?>
                        </div>
                      </div>
                    </div>
                  </div>
                </div>
                <?php } ?>
              </div>
              <?php } ?>


              <?php echo $content_bottom; ?></div><!-- 
              <div class="col-sm-6 center-container">
                <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" class="form-horizontal">
                  <fieldset>
                    <h3><?php echo $text_contact; ?></h3>
                    <div class="form-group required">
                      <label class="col-sm-2 control-label" for="input-name"><?php echo $entry_name; ?></label>
                      <div class="col-sm-10">
                        <input type="text" name="name" value="<?php echo $name; ?>" id="input-name" class="form-control" />
                        <?php if ($error_name) { ?>
                        <div class="text-danger"><?php echo $error_name; ?></div>
                        <?php } ?>
                      </div>
                    </div>
                    <div class="form-group required">
                      <label class="col-sm-2 control-label" for="input-email"><?php echo $entry_email; ?></label>
                      <div class="col-sm-10">
                        <input type="text" name="email" value="<?php echo $email; ?>" id="input-email" class="form-control" />
                        <?php if ($error_email) { ?>
                        <div class="text-danger"><?php echo $error_email; ?></div>
                        <?php } ?>
                      </div>
                    </div>
                    <div class="form-group required">
                      <label class="col-sm-2 control-label" for="input-enquiry"><?php echo $entry_enquiry; ?></label>
                      <div class="col-sm-10">
                        <textarea name="enquiry" rows="10" id="input-enquiry" class="form-control"><?php echo $enquiry; ?></textarea>
                        <?php if ($error_enquiry) { ?>
                        <div class="text-danger"><?php echo $error_enquiry; ?></div>
                        <?php } ?>
                      </div>
                    </div>
                    <?php if ($site_key) { ?>
                    <div class="form-group">
                      <div class="col-sm-offset-2 col-sm-10">
                        <div class="g-recaptcha" data-sitekey="<?php echo $site_key; ?>"></div>
                        <?php if ($error_captcha) { ?>
                        <div class="text-danger"><?php echo $error_captcha; ?></div>
                        <?php } ?>
                      </div>
                    </div>
                    <?php } ?>
                  </fieldset>
                  <div class="buttons">
                    <div class="pull-right">
                      <input class="btn btn-primary" type="submit" value="<?php echo $button_submit; ?>" />
                    </div>
                  </div>
                </form>
              </div> -->
          <?php echo $column_right; ?></div>
      </div>
    </div>
  </div>
  <?php echo $footer; ?>
