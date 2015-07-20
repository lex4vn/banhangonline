<div id="payment-guest">
<div id="payment-guest-error">
</div>
<div class="row">
	<div class="col-lg-6 col-sm-6 col-xs-12">
		<h2><?php echo $text_your_details; ?></h2>
		<?php echo $entry_firstname; ?><br />
		<input type="text" name="firstname" value="<?php echo $firstname; ?>" class="large-field" />
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
        <input id="button-guest" type="button" value="<?php echo $button_payment_guest; ?>" class="button btn btn-theme-default"/>
	</div>
</div>
</div>


<script type="text/javascript">
$(document).ready(function() {
$('#button-guest').click( function() {
    if ($('#payment-guest input[name=\'telephone\']').val() == '') {
        $('#payment-guest-error').html('<div class="warning" style="display: none;"><?php echo $error_telephone; ?><img src="catalog/view/theme/<?php echo $this->config->get('config_template');?>/image/close.png" alt="" class="close" /></div>');
        $('.warning').fadeIn('slow');
        return false;
    }
    $.ajax({
        url: 'index.php?route=checkout/guest',
        type: 'post',
        data: $('#payment-guest input[type=\'text\'], #payment-guest textarea'),
        dataType: 'html',
        success: function(html) {
            //window.location.href = 'index.php?route=checkout/success';
        },
        error: function(xhr, ajaxOptions, thrownError) {
            alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
        }
    });
});
})
</script>