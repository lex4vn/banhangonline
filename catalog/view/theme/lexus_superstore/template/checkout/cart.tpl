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
	<?php if ($attention) { ?>
	<div class="attention"><?php echo $attention; ?><img src="catalog/view/theme/<?php echo $this->config->get('config_template');?>/image/close.png" alt="" class="close" /></div>
	<?php } ?>

	<?php if ($success) { ?>
	<div class="success"><?php echo $success; ?><img src="catalog/view/theme/<?php echo $this->config->get('config_template');?>/image/close.png" alt="" class="close" /></div>
	<?php } ?>

	<?php if ($error_warning) { ?>
	<div class="warning"><?php echo $error_warning; ?><img src="catalog/view/theme/<?php echo $this->config->get('config_template');?>/image/close.png" alt="" class="close" /></div>
	<?php } ?>
   
 
	<div id="content">
		<?php echo $content_top; ?>
		<h1>
			<?php echo $heading_title; ?>
			<?php if ($weight) { ?>
				&nbsp;(<?php echo $weight; ?>)
			<?php } ?>
		</h1>
		
		<div class="checkout wrapper no-margin">		
			<form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" role="form">
				<div class="cart-info table-responsive">
					<table class="table table-bordered table-hover">
						<thead>
							<tr>
								<td class="image"><?php echo $column_image; ?></td>
								<td class="name"><?php echo $column_name; ?></td>
								<td class="model"><?php echo $column_model; ?></td>
								<td class="quantity"><?php echo $column_quantity; ?></td>
								<td class="price"><?php echo $column_price; ?></td>
								<td class="total"><?php echo $column_total; ?></td>
							</tr>
						</thead>
						<tbody>
							<?php foreach ($products as $product) { ?>
							<?php if($product['recurring']): ?>
							<tr>
								<td colspan="6" style="border:none;">
									<image src="catalog/view/theme/<?php echo $this->config->get('config_template');?>/image/reorder.png" alt="" title="" style="float:left;" />
									<span style="float:left;line-height:18px; margin-left:10px;"> 
									<strong><?php echo $text_recurring_item ?></strong>
									<?php echo $product['profile_description'] ?>
								</td>
							</tr>
							<?php endif; ?>


							<tr>
								<td class="image" data-label="<?php echo $column_image; ?>">
									<?php if ($product['thumb']) { ?>
										<a href="<?php echo $product['href']; ?>">
											<img src="<?php echo $product['thumb']; ?>" alt="<?php echo $product['name']; ?>" title="<?php echo $product['name']; ?>" />
										</a>
									<?php } ?>
								</td>
								<td class="name" data-label="<?php echo $column_name; ?>">
									<a href="<?php echo $product['href']; ?>">
										<?php echo $product['name']; ?>
									</a>
									<?php if (!$product['stock']) { ?>
										<span class="stock">***</span>
									<?php } ?>
									<div class="cart-option">
										<?php foreach ($product['option'] as $option) { ?>
										- <small><?php echo $option['name']; ?>: <?php echo $option['value']; ?></small><br />
										<?php } ?>

										<?php if($product['recurring']): ?>
										- <small><?php echo $text_payment_profile ?>: <?php echo $product['profile_name'] ?></small>
										<?php endif; ?>
									</div>
									
									<?php if ($product['reward']) { ?>
										<small><?php echo $product['reward']; ?></small>
									<?php } ?>
								</td>
									
								<td class="model" data-label="<?php echo $column_model; ?>"><?php echo $product['model']; ?></td>
								<td class="quantity" data-label="<?php echo $column_quantity; ?>" >
									<input type="text" name="quantity[<?php echo $product['key']; ?>]" value="<?php echo $product['quantity']; ?>" size="1" />
									&nbsp;
									<input type="image" src="catalog/view/theme/<?php echo $this->config->get('config_template');?>/image/update.png" alt="<?php echo $button_update; ?>" title="<?php echo $button_update; ?>" />
									&nbsp;<a href="<?php echo $product['remove']; ?>"><img src="catalog/view/theme/<?php echo $this->config->get('config_template');?>/image/remove.png" alt="<?php echo $button_remove; ?>" title="<?php echo $button_remove; ?>" /></a>
								</td>
								<td class="price" data-label="<?php echo $column_price; ?>"  ><?php echo $product['price']; ?></td>
								<td class="total" data-label="<?php echo $column_total; ?>"  ><?php echo $product['total']; ?></td>
							</tr>
							<?php } ?>
						
							<?php foreach ($vouchers as $vouchers) { ?>
							<tr>
								<td class="image"></td>
								<td class="name"><?php echo $vouchers['description']; ?></td>
								<td class="model"></td>
								<td class="quantity">
									<input type="text" name="" value="1" size="1" disabled="disabled" />
									&nbsp;<a href="<?php echo $vouchers['remove']; ?>"><img src="catalog/view/theme/<?php echo $this->config->get('config_template');?>/image/remove.png" alt="<?php echo $button_remove; ?>" title="<?php echo $button_remove; ?>" /></a>
								</td>
								<td class="price"><?php echo $vouchers['amount']; ?></td>
								<td class="total"><?php echo $vouchers['amount']; ?></td>
							</tr>
							<?php } ?>
						</tbody>
					</table>
				</div>
			</form>


            <div class="row">
			<?php if (!$logged) { ?>
                <form id="payment_now_form" action="<?php echo $action_confirm; ?>" method="post" enctype="multipart/form-data" role="form">
                <div class="col-lg-6 col-sm-6 col-xs-12">
				<div id="payment_now">
                    <div id="payment-guest">
                        <div id="payment-guest-error">
                        </div>
                        <div class="row">
                            <div class="col-lg-6 col-sm-6 col-xs-12">
                                <h2><?php echo $text_next; ?></h2>
                                <?php echo $entry_fullname; ?><br />
                                <input type="text" name="firstname" value="" class="large-field" />
                                <br />
                                <br />
                                <?php echo $entry_email; ?><br />
                                <input type="text" name="email" value="<?php echo $email; ?>" class="large-field" />
                                <br />
                                <br />
                                <span class="required">(*)</span> <?php echo $entry_telephone; ?><br />
                                <input type="text" name="telephone" value="<?php echo $telephone; ?>" class="large-field" />
                                <br />
                                <br />
                            </div>

                            <div class="col-lg-6 col-sm-6 col-xs-12">
                                <h2>&nbsp;</h2>
                                <?php echo $entry_address_1; ?><br />
                                <input type="text" name="address_1" value="<?php echo $address_1; ?>" class="large-field" />
                                <br />
                                <br />
                                <?php echo $entry_address_2; ?><br />
                                <textarea name="address_2" value="<?php echo $address_2; ?>" class="large-field" ></textarea>
                                <br />
                                <br />
                                <input id="button-guest" type="button" value="<?php echo $button_payment; ?>" class="button btn btn-theme-default"/>
                            </div>
                        </div>
                    </div>
                </div>
                </div>
                </form>
		<?php } ?>
                <div class="col-lg-6 col-sm-6 col-xs-12">
                    <?php foreach ($totals as $total) { ?>
                        <div class="cart-totals"><b><?php echo $total['title']; ?></b> <?php echo $total['text']; ?></div>
                    <?php } ?>
                </div>
            </div>
		<?php echo $content_bottom; ?>

		</div>	
    </div>

  
<script type="text/javascript">
<!--
$(document).ready(function() {
    $('#button-guest').click( function() {
        if ($('#payment-guest input[name=\'telephone\']').val() == '') {
            $('#payment-guest-error').html('<div class="warning" style="display: none;"><?php echo $error_telephone; ?><img src="catalog/view/theme/<?php echo $this->config->get('config_template');?>/image/close.png" alt="" class="close" /></div>');
            $('.warning').fadeIn('slow');
            return false;
        }
        $('#payment_now_form').submit();
    });
})
$('input[name=\'next\']').bind('change', function() {
	$('.cart-module > div').hide();
	
	$('#' + this.value).show();
});
//-->
</script>

<?php if ($shipping_status) { ?>
<script type="text/javascript">

$('#button-quote').live('click', function() {
	$.ajax({
		url: 'index.php?route=checkout/cart/quote',
		type: 'post',
		data: 'country_id=' + $('select[name=\'country_id\']').val() + '&zone_id=' + $('select[name=\'zone_id\']').val() + '&postcode=' + encodeURIComponent($('input[name=\'postcode\']').val()),
		dataType: 'json',		
		beforeSend: function() {
			$('#button-quote').attr('disabled', true);
			$('#button-quote').after('<span class="wait">&nbsp;<img src="catalog/view/theme/<?php echo $this->config->get('config_template');?>/image/loading.gif" alt="" /></span>');
		},
		complete: function() {
			$('#button-quote').attr('disabled', false);
			$('.wait').remove();
		},		
		success: function(json) {
			$('.success, .warning, .attention, .error').remove();			
						
			if (json['error']) {
				if (json['error']['warning']) {
					$('#notification').html('<div class="warning" style="display: none;">' + json['error']['warning'] + '<img src="catalog/view/theme/<?php echo $this->config->get('config_template');?>/image/close.png" alt="" class="close" /></div>');
					
					$('.warning').fadeIn('slow');
					
					$('html, body').animate({ scrollTop: 0 }, 'slow'); 
				}	
							
				if (json['error']['country']) {
					$('select[name=\'country_id\']').after('<span class="error">' + json['error']['country'] + '</span>');
				}	
				
				if (json['error']['zone']) {
					$('select[name=\'zone_id\']').after('<span class="error">' + json['error']['zone'] + '</span>');
				}
				
				if (json['error']['postcode']) {
					$('input[name=\'postcode\']').after('<span class="error">' + json['error']['postcode'] + '</span>');
				}					
			}
			
			if (json['shipping_method']) {
				html  = '<h2><?php echo $text_shipping_method; ?></h2>';
				html += '<form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" role="form">';
				html += '  <table class="radio">';
				
				for (i in json['shipping_method']) {
					html += '<tr>';
					html += '  <td colspan="3"><b>' + json['shipping_method'][i]['title'] + '</b></td>';
					html += '</tr>';
				
					if (!json['shipping_method'][i]['error']) {
						for (j in json['shipping_method'][i]['quote']) {
							html += '<tr class="highlight">';
							
							if (json['shipping_method'][i]['quote'][j]['code'] == '<?php echo $shipping_method; ?>') {
								html += '<td><input type="radio" name="shipping_method" value="' + json['shipping_method'][i]['quote'][j]['code'] + '" id="' + json['shipping_method'][i]['quote'][j]['code'] + '" checked="checked" /></td>';
							} else {
								html += '<td><input type="radio" name="shipping_method" value="' + json['shipping_method'][i]['quote'][j]['code'] + '" id="' + json['shipping_method'][i]['quote'][j]['code'] + '" /></td>';
							}
								
							html += '  <td><label for="' + json['shipping_method'][i]['quote'][j]['code'] + '">' + json['shipping_method'][i]['quote'][j]['title'] + '</label></td>';
							html += '  <td style="text-align: right;"><label for="' + json['shipping_method'][i]['quote'][j]['code'] + '">' + json['shipping_method'][i]['quote'][j]['text'] + '</label></td>';
							html += '</tr>';
						}		
					} else {
						html += '<tr>';
						html += '  <td colspan="3"><div class="error">' + json['shipping_method'][i]['error'] + '</div></td>';
						html += '</tr>';						
					}
				}
				
				html += '  </table>';
				html += '  <br />';
				html += '  <input type="hidden" name="next" value="shipping" />';
				
				<?php if ($shipping_method) { ?>
				html += '  <input type="submit" value="<?php echo $button_shipping; ?>" id="button-shipping" class="button btn btn-theme-default" />';	
				<?php } else { ?>
				html += '  <input type="submit" value="<?php echo $button_shipping; ?>" id="button-shipping" class="button btn btn-theme-default" disabled="disabled" />';	
				<?php } ?>
							
				html += '</form>';
				
				$.colorbox({
					overlayClose: true,
					opacity: 0.5,
					width: '600px',
					height: '400px',
					href: false,
					html: html
				});
				
				$('input[name=\'shipping_method\']').bind('change', function() {
					$('#button-shipping').attr('disabled', false);
				});
			}
		}
	});
});
//-->
</script> 


<script type="text/javascript">
<!--
$('select[name=\'country_id\']').bind('change', function() {
	$.ajax({
		url: 'index.php?route=checkout/cart/country&country_id=' + this.value,
		dataType: 'json',
		beforeSend: function() {
			$('select[name=\'country_id\']').after('<span class="wait">&nbsp;<img src="catalog/view/theme/<?php echo $this->config->get('config_template');?>/image/loading.gif" alt="" /></span>');
		},
		complete: function() {
			$('.wait').remove();
		},			
		success: function(json) {
			if (json['postcode_required'] == '1') {
				$('#postcode-required').show();
			} else {
				$('#postcode-required').hide();
			}
			
			html = '<option value=""><?php echo $text_select; ?></option>';
			
			if (json['zone'] != '') {
				for (i = 0; i < json['zone'].length; i++) {
        			html += '<option value="' + json['zone'][i]['zone_id'] + '"';
	    			
					if (json['zone'][i]['zone_id'] == '<?php echo $zone_id; ?>') {
	      				html += ' selected="selected"';
	    			}
	
	    			html += '>' + json['zone'][i]['name'] + '</option>';
				}
			} else {
				html += '<option value="0" selected="selected"><?php echo $text_none; ?></option>';
			}
			
			$('select[name=\'zone_id\']').html(html);
		},
		error: function(xhr, ajaxOptions, thrownError) {
			alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
		}
	});
});

$('select[name=\'country_id\']').trigger('change');
//-->
</script>
<?php } ?>

</section> 


<?php if( $SPAN[2] ): ?>
	<aside class="col-lg-<?php echo $SPAN[2];?> col-md-<?php echo $SPAN[2];?> col-sm-12 col-xs-12">	
		<?php echo $column_right; ?>
	</aside>
<?php endif; ?>

</div></div>

<?php echo $footer; ?>