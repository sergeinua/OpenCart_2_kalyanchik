<?php if ($reviews) { ?>
    <?php foreach ($reviews as $review) { ?>
        <div class="review-item">
            <div class="review-author">
                <?php echo $review['author']; ?>
            </div>
            <div class="review-date">
                <?php echo $review['date_added']; ?>
            </div>
            <div class="review-text">
                <?php echo $review['text']; ?>
            </div>

            <div class="review-rating">
                <?php for ($i = 1; $i <= 5; $i++) { ?>
                    <?php if ($review['rating'] < $i) { ?>
                        <span class="fa fa-stack"><i class="fa fa-star-o fa-stack-1x"></i></span>
                    <?php } else { ?>
                        <span class="fa fa-stack"><i class="fa fa-star fa-stack-1x"></i><i
                                class="fa fa-star-o fa-stack-1x"></i></span>
                    <?php } ?>
                <?php } ?>
            </div>
        </div>
    <?php } ?>
    <div class="text-right"><?php echo $pagination; ?></div>
<?php } else { ?>
    <p><?php echo $text_no_reviews; ?></p>
<?php } ?>