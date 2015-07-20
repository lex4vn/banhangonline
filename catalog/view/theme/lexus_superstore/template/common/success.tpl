<?php require( DIR_TEMPLATE.$this->config->get('config_template')."/template/common/config.tpl" ); ?>
<?php echo $header; ?>
<?php require( DIR_TEMPLATE.$this->config->get('config_template')."/template/common/breadcrumb.tpl" );  ?>

<div class="container">
<div class="row">

	<?php if( $SPAN[0] ): ?>
	<aside class="col-lg-<?php echo $SPAN[0];?> col-md-<?php echo $SPAN[0];?> col-sm-12 col-xs-12">
		<?php echo $column_left; ?>
	</aside>
	<?php endif; ?>

	<section class="col-lg-<?php echo $SPAN[1];?> col-md-<?php echo $SPAN[1];?> col-sm-12 col-xs-12">		
		<div id="content">
			<?php echo $content_top; ?>
			<h1><?php echo $heading_title; ?></h1>    
			<div class="wrapper underline">
				<?php echo $text_message; ?>
			</div>
			<div class="buttons">
				<div class="right"><a href="<?php echo $continue; ?>" class="button btn btn-theme-default"><?php echo $button_continue; ?></a></div>
			</div>
			<?php echo $content_bottom; ?>
		</div>
	</section> 

	<?php if( $SPAN[2] ): ?>
		<aside class="col-lg-<?php echo $SPAN[2];?> col-md-<?php echo $SPAN[2];?> col-sm-12 col-xs-12">	
			<?php echo $column_right; ?>
		</aside>
	<?php endif; ?>
	
</div></div>
<!-- Facebook Conversion Code for Thanh toán - VTM --> <script>(function() { var _fbq = window._fbq || (window._fbq = []); if (!_fbq.loaded) { var fbds = document.createElement('script'); fbds.async = true; fbds.src = '//connect.facebook.net/en_US/fbds.js'; var s = document.getElementsByTagName('script')[0]; s.parentNode.insertBefore(fbds, s); _fbq.loaded = true; } })(); window._fbq = window._fbq || []; window._fbq.push(['track', '6024321067562', {'value':'0.00','currency':'VND'}]); </script> <noscript><img height="1" width="1" alt="" style="display:none" src="https://www.facebook.com/tr?ev=6024321067562&amp;cd[value]=0.00&amp;cd[currency]=VND&amp;noscript=1" /></noscript>
<?php echo $footer; ?>