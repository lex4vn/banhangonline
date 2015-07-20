<div class="col-lg-6 col-md-6 col-sm-6 col-xs-12">
    <div class="care-tl">
        <h2><?php echo $heading_title; ?></h2>
    </div>
    <div class="row">
        <?php foreach ($images as $image) { ?>
        <div class="sper col-lg-3 col-md-3 col-sm-3 col-xs-6">
            <img alt="<?php echo $image['name']; ?>" src="<?php echo $image['image']; ?>">
            <div>
                <p class="name"><?php echo $image['name']; ?></p>
                <?php if($image['phone']){ ?>
                <p><?php echo $image['phone']; ?></p>
                <?php } ?>
                <p>
                    <?php if($image['skype']){ ?>
                    <a href="skype:<?php echo $image['skype']; ?>?chat"><i class="fa fa-skype"></i></a>
                    <?php } ?>

                    <?php if($image['yahoo']){ ?>
                    <a href="ymsgr:sendIM?<?php echo $image['yahoo']; ?>"><i class="fa fa-smile-o"></i></a>
                    <?php } ?>
                </p>
            </div>
        </div>
        <?php } ?>
    </div>
</div>


