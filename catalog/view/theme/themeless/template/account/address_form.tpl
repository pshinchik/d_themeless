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
		<?php echo $column_left; ?><?php echo $column_right; ?>
			<div id="content"><?php echo $content_top; ?><!-- content -->
			  <h1><?php echo $heading_title; ?></h1>
			  <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data">
				<fieldset>
				<legend><?php echo $text_edit_address; ?></legend>
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
					  <label class="control-label"><?php echo $entry_company; ?></label>
					  <div class="controls"><input type="text" name="company" value="<?php echo $company; ?>" /></div>
					</div>
					<?php if ($company_id_display) { ?>
					<div class="control-group">
					  <label class="control-label"><?php echo $entry_company_id; ?></label>
					  <div class="controls"><input type="text" name="company_id" value="<?php echo $company_id; ?>" />
						<?php if ($error_company_id) { ?>
						<span class="error"><?php echo $error_company_id; ?></span>
						<?php } ?></div>
					</div>
					<?php } ?>
					<?php if ($tax_id_display) { ?>
					<div class="control-group">
					  <label class="control-label"><?php echo $entry_tax_id; ?></label>
					  <div class="controls"><input type="text" name="tax_id" value="<?php echo $tax_id; ?>" />
						<?php if ($error_tax_id) { ?>
						<span class="error"><?php echo $error_tax_id; ?></span>
						<?php } ?></div>
					</div>
					<?php } ?>
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
					<div class="control-group">
					  <label class="control-label"><?php echo $entry_default; ?></label>
					  <div class="controls"><?php if ($default) { ?>
						<input type="radio" name="default" value="1" checked="checked" />
						<?php echo $text_yes; ?>
						<input type="radio" name="default" value="0" />
						<?php echo $text_no; ?>
						<?php } else { ?>
						<input type="radio" name="default" value="1" />
						<?php echo $text_yes; ?>
						<input type="radio" name="default" value="0" checked="checked" />
						<?php echo $text_no; ?>
						<?php } ?></div>
					</div>
				  </div>
				</div>
				<div class="buttons">
				  <div class="left"><a href="<?php echo $back; ?>" class="button"><?php echo $button_back; ?></a> <input type="submit" value="<?php echo $button_continue; ?>" class="button" />
				  </div>
				</div>
			  </form>
			  <?php echo $content_bottom; ?>
			</div>
		</div>
	</div>
</div>	
<script type="text/javascript"><!--
$('select[name=\'country_id\']').bind('change', function() {
	$.ajax({
		url: 'index.php?route=account/address/country&country_id=' + this.value,
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
<?php echo $footer; ?>