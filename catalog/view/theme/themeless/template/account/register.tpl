<?php echo $header; ?>
<div class="home-breadcrumb">
	<div class="layout"><!-- layout -->
		<div class="wrap"><!-- layout -->
			<div class="breadcrumb">
				<?php  foreach ($breadcrumbs as  $breadcrumb) { ?>
				<?php echo $breadcrumb['separator']; ?> <span itemscope itemtype="http://data-vocabulary.org/Breadcrumb"> 
				<?php if (end($breadcrumbs) == $breadcrumb) { ?> 
				<span itemprop="title"> <?php echo $breadcrumb['text']; ?> </span>
				<?php }else { ?>
				<a href="<?php echo $breadcrumb['href']; ?>" itemprop="url"> <span itemprop="title"> <?php echo $breadcrumb['text']; ?> </span> </a>
				 <?php } ?>
				 </span>
				<?php } ?>
			</div>
		</div><!-- wrap end -->
	</div><!-- layout end -->
</div>
<div id="content_holder"><!-- content_holder -->
	<div class="layout"><!-- layout -->
		<div class="wrap"><!-- wrap -->
		<?php if ($error_warning) { ?>
		<div class="warning"><?php echo $error_warning; ?></div>
		<?php } ?>	
		<?php echo $column_left; ?><?php echo $column_right ?>	
			<div id="content"><?php echo $content_top; ?><!-- content -->
				  <h1><?php echo $heading_title; ?></h1>
				  <p><?php echo $text_account_already; ?></p>
				  <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data">
					<fieldset>
					<legend><?php echo $text_your_details; ?></legend>
					<div class="content">
					  <div class="form-horizontal">
						<div class="control-group">
						  <label class="control-label"><span class="required">*</span> <?php echo $entry_firstname; ?></label>
						  <div class="controls"><input type="text" name="firstname" value="<?php echo $firstname; ?>" />
							<?php if ($error_firstname) { ?>
							<span class="error"><?php echo $error_firstname; ?></span>
							<?php } ?></div>
						</div>
						<div class="control-group">
						  <label class="control-label"><span class="required">*</span> <?php echo $entry_lastname; ?></label>
						  <div class="controls"><input type="text" name="lastname" value="<?php echo $lastname; ?>" />
							<?php if ($error_lastname) { ?>
							<span class="error"><?php echo $error_lastname; ?></span>
							<?php } ?></div>
						</div>
						<div class="control-group">
						  <label class="control-label"><span class="required">*</span> <?php echo $entry_email; ?></label>
						  <div class="controls"><input type="text" name="email" value="<?php echo $email; ?>" />
							<?php if ($error_email) { ?>
							<span class="error"><?php echo $error_email; ?></span>
							<?php } ?></div>
						</div>
						<div class="control-group">
						  <label class="control-label"><span class="required">*</span> <?php echo $entry_telephone; ?></label>
						  <div class="controls"><input type="text" name="telephone" value="<?php echo $telephone; ?>" />
							<?php if ($error_telephone) { ?>
							<span class="error"><?php echo $error_telephone; ?></span>
							<?php } ?></div>
						</div>
						<div class="control-group">
						  <label class="control-label"><?php echo $entry_fax; ?></label>
						  <div class="controls"><input type="text" name="fax" value="<?php echo $fax; ?>" /></div>
						</div>
					  </div>
					</div>
					</fieldset>
					<fieldset>
					<legend><?php echo $text_your_address; ?></legend>
					<div class="content">
					  <div class="form-horizontal">
						<div class="control-group">
						  <label class="control-label"><?php echo $entry_company; ?></label>
						  <div class="controls"><input type="text" name="company" value="<?php echo $company; ?>" /></div>
						</div>        
						<div class="control-group" style="display: <?php echo (count($customer_groups) > 1 ? 'block' : 'none'); ?>;">
						  <label class="control-label"><?php echo $entry_customer_group; ?></label>
						  <div class="controls"><?php foreach ($customer_groups as $customer_group) { ?>
							<?php if ($customer_group['customer_group_id'] == $customer_group_id) { ?>
							<input type="radio" name="customer_group_id" value="<?php echo $customer_group['customer_group_id']; ?>" id="customer_group_id<?php echo $customer_group['customer_group_id']; ?>" checked="checked" />
							<label for="customer_group_id<?php echo $customer_group['customer_group_id']; ?>"><?php echo $customer_group['name']; ?></label>
							<br />
							<?php } else { ?>
							<input type="radio" name="customer_group_id" value="<?php echo $customer_group['customer_group_id']; ?>" id="customer_group_id<?php echo $customer_group['customer_group_id']; ?>" />
							<label for="customer_group_id<?php echo $customer_group['customer_group_id']; ?>"><?php echo $customer_group['name']; ?></label>
							<br />
							<?php } ?>
							<?php } ?>
						  </div>
						</div>      
						<div class="control-group" id="company-id-display">
						  <label class="control-label"><span id="company-id-required" class="required">*</span> <?php echo $entry_company_id; ?></label>
						  <div class="controls"><input type="text" name="company_id" value="<?php echo $company_id; ?>" />
							<?php if ($error_company_id) { ?>
							<span class="error"><?php echo $error_company_id; ?></span>
							<?php } ?></div>
						</div>
						<div class="control-group" id="tax-id-display">
						  <label class="control-label"><span id="tax-id-required" class="required">*</span> <?php echo $entry_tax_id; ?></label>
						  <div class="controls"><input type="text" name="tax_id" value="<?php echo $tax_id; ?>" />
							<?php if ($error_tax_id) { ?>
							<span class="error"><?php echo $error_tax_id; ?></span>
							<?php } ?></div>
						</div>
						<div class="control-group">
						  <label class="control-label"><span class="required">*</span> <?php echo $entry_address_1; ?></label>
						  <div class="controls"><input type="text" name="address_1" value="<?php echo $address_1; ?>" />
							<?php if ($error_address_1) { ?>
							<span class="error"><?php echo $error_address_1; ?></span>
							<?php } ?></div>
						</div>
						<div class="control-group">
						  <label class="control-label"><?php echo $entry_address_2; ?></label>
						  <div class="controls"><input type="text" name="address_2" value="<?php echo $address_2; ?>" /></div>
						</div>
						<div class="control-group">
						  <label class="control-label"><span class="required">*</span> <?php echo $entry_city; ?></label>
						  <div class="controls"><input type="text" name="city" value="<?php echo $city; ?>" />
							<?php if ($error_city) { ?>
							<span class="error"><?php echo $error_city; ?></span>
							<?php } ?></div>
						</div>
						<div class="control-group">
						  <label class="control-label"><span id="postcode-required" class="required">*</span> <?php echo $entry_postcode; ?></label>
						  <div class="controls"><input type="text" name="postcode" value="<?php echo $postcode; ?>" />
							<?php if ($error_postcode) { ?>
							<span class="error"><?php echo $error_postcode; ?></span>
							<?php } ?></div>
						</div>
						<div class="control-group">
						  <label class="control-label"><span class="required">*</span> <?php echo $entry_country; ?></label>
						  <div class="controls"><select name="country_id">
							  <option value=""><?php echo $text_select; ?></option>
							  <?php foreach ($countries as $country) { ?>
							  <?php if ($country['country_id'] == $country_id) { ?>
							  <option value="<?php echo $country['country_id']; ?>" selected="selected"><?php echo $country['name']; ?></option>
							  <?php } else { ?>
							  <option value="<?php echo $country['country_id']; ?>"><?php echo $country['name']; ?></option>
							  <?php } ?>
							  <?php } ?>
							</select>
							<?php if ($error_country) { ?>
							<span class="error"><?php echo $error_country; ?></span>
							<?php } ?></div>
						</div>
						<div class="control-group">
						  <label class="control-label"><span class="required">*</span> <?php echo $entry_zone; ?></label>
						  <div class="controls"><select name="zone_id">
							</select>
							<?php if ($error_zone) { ?>
							<span class="error"><?php echo $error_zone; ?></span>
							<?php } ?></div>
						</div>
					  </div>
					</div>
					</fieldset>
					<fieldset>
					<legend><?php echo $text_your_password; ?></legend>
					<div class="content">
					  <div class="form-horizontal">
						<div class="control-group">
						  <label class="control-label"><span class="required">*</span> <?php echo $entry_password; ?></label>
						  <div class="controls"><input type="password" name="password" value="<?php echo $password; ?>" />
							<?php if ($error_password) { ?>
							<span class="error"><?php echo $error_password; ?></span>
							<?php } ?></div>
						</div>
						<div class="control-group">
						  <label class="control-label"><span class="required">*</span> <?php echo $entry_confirm; ?></label>
						  <div class="controls"><input type="password" name="confirm" value="<?php echo $confirm; ?>" />
							<?php if ($error_confirm) { ?>
							<span class="error"><?php echo $error_confirm; ?></span>
							<?php } ?></div>
						</div>
					  </div>
					</div>
					</fieldset>
					<fieldset>
					<legend><?php echo $text_newsletter; ?></legend>
					<div class="content">
					  <div class="form-horizontal">
						<div class="control-group">
						  <label class="control-label"><?php echo $entry_newsletter; ?></label>
						  <div class="controls"><?php if ($newsletter) { ?>
							<input type="radio" name="newsletter" value="1" checked="checked" class="styled" />
							<?php echo $text_yes; ?>
							<input type="radio" name="newsletter" value="0" class="styled" />
							<?php echo $text_no; ?>
							<?php } else { ?>
							<input type="radio" name="newsletter" value="1" class="styled" />
							<?php echo $text_yes; ?>
							<input type="radio" name="newsletter" value="0" checked="checked" class="styled" />
							<?php echo $text_no; ?>
							<?php } ?></div>
						</div>
					  </div>
					</div>
					</fieldset>
					<?php if ($text_agree) { ?>
					<div class="buttons">
					  <div class="right"><?php echo $text_agree; ?>
						<?php if ($agree) { ?>
						<input type="checkbox" name="agree" value="1" checked="checked" class="styled" />
						<?php } else { ?>
						<input type="checkbox" name="agree" value="1" class="styled" />
						<?php } ?>
						<input type="submit" value="<?php echo $button_continue; ?>" class="button" />
					  </div>
					</div>
					<?php } else { ?>
					<div class="buttons">
					  <div class="right">
						<input type="submit" value="<?php echo $button_continue; ?>" class="button" />
					  </div>
					</div>
					<?php } ?>
				  </form>
				  <?php echo $content_bottom; ?>
			</div>
		</div>
	</div>
</div>
<script type="text/javascript"><!--
$('input[name=\'customer_group_id\']:checked').live('change', function() {
	var customer_group = [];
	
<?php foreach ($customer_groups as $customer_group) { ?>
	customer_group[<?php echo $customer_group['customer_group_id']; ?>] = [];
	customer_group[<?php echo $customer_group['customer_group_id']; ?>]['company_id_display'] = '<?php echo $customer_group['company_id_display']; ?>';
	customer_group[<?php echo $customer_group['customer_group_id']; ?>]['company_id_required'] = '<?php echo $customer_group['company_id_required']; ?>';
	customer_group[<?php echo $customer_group['customer_group_id']; ?>]['tax_id_display'] = '<?php echo $customer_group['tax_id_display']; ?>';
	customer_group[<?php echo $customer_group['customer_group_id']; ?>]['tax_id_required'] = '<?php echo $customer_group['tax_id_required']; ?>';
<?php } ?>	

	if (customer_group[this.value]) {
		if (customer_group[this.value]['company_id_display'] == '1') {
			$('#company-id-display').show();
		} else {
			$('#company-id-display').hide();
		}
		
		if (customer_group[this.value]['company_id_required'] == '1') {
			$('#company-id-required').show();
		} else {
			$('#company-id-required').hide();
		}
		
		if (customer_group[this.value]['tax_id_display'] == '1') {
			$('#tax-id-display').show();
		} else {
			$('#tax-id-display').hide();
		}
		
		if (customer_group[this.value]['tax_id_required'] == '1') {
			$('#tax-id-required').show();
		} else {
			$('#tax-id-required').hide();
		}	
	}
});

$('input[name=\'customer_group_id\']:checked').trigger('change');
//--></script> 
<script type="text/javascript"><!--
$('select[name=\'country_id\']').bind('change', function() {
	$.ajax({
		url: 'index.php?route=account/register/country&country_id=' + this.value,
		dataType: 'json',
		beforeSend: function() {
			$('select[name=\'country_id\']').after('<span class="wait">&nbsp;<img src="catalog/view/theme/default/image/loading.gif" alt="" /></span>');
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
//--></script> 
<script type="text/javascript"><!--
$('.colorbox').colorbox({
	width: 640,
	height: 480
});
//--></script> 
<?php echo $footer; ?>