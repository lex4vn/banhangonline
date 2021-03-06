<?php 
/******************************************************
 * @package Pav ads module for Opencart 1.5.x
 * @version 1.0
 * @author http://www.pavothemes.com
 * @copyright	Copyright (C) Feb 2012 PavoThemes.com <@emai:pavothemes@gmail.com>.All rights reserved.
 * @license		GNU General Public License version 2
*******************************************************/?>
<div class="box-banners <?php echo $prefix; ?>">
	<?php if($banners['status']){?>
	<?php if($banner_layout == 'img3') { //show cols?>
		<?php foreach ($banners['params'] as $banner) { ?>
			<div class="box banner-center">
				<a href="<?php echo $banner['link']; ?>"><img src="<?php echo $banner['thumb']; ?>" alt=""></a>
				<div class="description"><?php echo htmlspecialchars_decode($banner['caption'][$language]); ?></div>
			</div>
		<?php } //end foreach ?>
	</section>
	<?php } //end if banner_layout?>
	<?php } //end if status?>

	<?php if($banners['status']){?>
	<?php if($banner_layout == 'img2'  ) { //show 4-cols?>
	<section class="img2 col-lg-12 col-md-12 col-sm-12 col-xs-12">  
		<div class="container">
			<div class="row">	
				<?php foreach ($banners['params'] as $banner) { ?>
				<div class="col-lg-3 col-md-3 col-sm-4 col-xs-12">
					<div class="box banner-center">
						<a href="<?php echo $banner['link']; ?>"><img src="<?php echo $banner['thumb']; ?>" alt=""></a>
						<div class="description"><?php echo htmlspecialchars_decode($banner['caption'][$language]); ?></div>
					</div>
				</div>
				<?php } //end foreach ?>
			</div>
		</div> 
	</section>
	<?php } //end if banner_layout?>
	<?php } //end if status?>
	
	<?php if($banners['status']){?>
	<?php $banner = $banners['params']; ?>
	<?php if($banner_layout == 'img1'  ) { //show 4-cols, 2-row?>
	<section class="img1 col-lg-12 col-md-12 col-sm-12 col-xs-12">  
		<div class="container">
			<div class="row">
				<div class="col-lg-3 col-md-3 col-sm-4 col-xs-12">
					<?php if(isset($banner[1])){ ?>
					<div class="box banner-center">
						<a href="<?php echo $banner[1]['link']; ?>"><img src="<?php echo $banner[1]['thumb']; ?>" alt=""></a>
						<div class="description"><?php echo htmlspecialchars_decode($banner[1]['caption'][$language]); ?></div>
					</div><?php } ?>
					<?php if(isset($banner[2])){ ?>
					<div class="box banner-center">
						<a href="<?php echo $banner[2]['link']; ?>"><img src="<?php echo $banner[2]['thumb']; ?>" alt=""></a>
						<div class="description"><?php echo htmlspecialchars_decode($banner[2]['caption'][$language]); ?></div>
					</div><?php } ?>
				</div>

				<div class="col-lg-3 col-md-3 col-sm-4 col-xs-12">
					<?php if(isset($banner[3])){ ?>
					<div class="box banner-center">
						<a href="<?php echo $banner[3]['link']; ?>"><img src="<?php echo $banner[3]['thumb']; ?>" alt=""></a>
						<div class="description"><?php echo htmlspecialchars_decode($banner[3]['caption'][$language]); ?></div>
					</div><?php } ?>
				</div>

				<div class="col-lg-3 col-md-3 col-sm-4 col-xs-12">
					<?php if(isset($banner[4])){ ?>
					<div class="box banner-center">
						<a href="<?php echo $banner[4]['link']; ?>"><img src="<?php echo $banner[4]['thumb']; ?>" alt=""></a>
						<div class="description"><?php echo htmlspecialchars_decode($banner[4]['caption'][$language]); ?></div>
					</div><?php } ?>
					<?php if(isset($banner[5])){ ?>
					<div class="box banner-center">
						<a href="<?php echo $banner[5]['link']; ?>"><img src="<?php echo $banner[5]['thumb']; ?>" alt=""></a>
						<div class="description"><?php echo htmlspecialchars_decode($banner[5]['caption'][$language]); ?></div>
					</div><?php } ?>
				</div>

				<div class="col-lg-3 col-md-3 col-sm-4 col-xs-12">
					<?php if(isset($banner[6])){ ?>
					<div class="box banner-center">
						<a href="<?php echo $banner[6]['link']; ?>"><img src="<?php echo $banner[6]['thumb']; ?>" alt=""></a>
						<div class="description"><?php echo htmlspecialchars_decode($banner[6]['caption'][$language]); ?></div>
					</div><?php } ?>
				</div>

			</div>
		</div> 
	</section>
	<?php } //end if banner_layout?>
	<?php } //end if status?>
</div>