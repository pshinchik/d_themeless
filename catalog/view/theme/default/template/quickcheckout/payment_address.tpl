<!-- Quick Checkout v4.0 by Dreamvention.com quickcheckout/register.tpl -->
<div id="payment_address_wrap" <?php echo (!$data['display']) ? 'class="hide"' : ''; ?>>
<div class="box box-border">
<div class="box-heading"><i class="icon-profile"></i> <span><?php echo $data['title']; ?></span></div>
<div class="box-content">
<div class="description"><?php echo $data['description']; ?></div>
<?php if ($addresses) { ?>
<div id="payment_address_exists_1_block" class="radio-input">
  <input type="radio" name="payment_address[exists]" value="1" id="payment_address_exists_1" <?php echo ($payment_address['exists']) ? 'checked="checked"' : ''; ?> class="styled" data-refresh="1" autocomplete='off' />
  <label for="payment_address_exists_1"><?php echo $text_address_existing; ?></label>
</div>
<div id="payment_address_exists_list" <?php echo (!$payment_address['exists']) ?  'class="hide"' : ''; ?>>
  <select name="payment_address[address_id]" style="width: 100%; margin-bottom: 15px;" data-refresh="3">
    <?php foreach ($addresses as $address) { ?>
    <?php if ($address['address_id'] == $payment_address['address_id']) { ?>
    <option value="<?php echo $address['address_id']; ?>" selected="selected"> <?php echo $address['firstname']; ?> <?php echo $address['lastname']; ?>, <?php echo $address['address_1']; ?>, <?php echo $address['city']; ?>, <?php echo $address['zone']; ?>, <?php echo $address['country']; ?> </option>
    <?php } else { ?>
    <option value="<?php echo $address['address_id']; ?>"> <?php echo $address['firstname']; ?> <?php echo $address['lastname']; ?>, <?php echo $address['address_1']; ?>, <?php echo $address['city']; ?>, <?php echo $address['zone']; ?>, <?php echo $address['country']; ?> </option>
    <?php } ?>
    <?php } ?>
  </select>
</div>
<div id="payment_address_exists_0_block" class="radio-input">
  <input type="radio" name="payment_address[exists]" value="0" id="payment_address_exists_0" <?php echo (!$payment_address['exists']) ?  'checked="checked"' : ''; ?>  class="styled" data-refresh="1" autocomplete='off' />
  <label for="payment_address_exists_0"><?php echo $text_address_new; ?></label>
</div>
<?php } ?>
<div id="payment_address" <?php echo ($payment_address['exists']) ?  'class="hide"' : ''; ?> >
      <?php foreach($payment_address['fields'] as $field){
    	if(isset($field['type'])) {
    		switch ($field['type']) {
     			case "heading":
		?>
        <?php if($field['display']){ ?>
        <div class="clear"></div>
        </div>
    </div>
  </div>
  <div id="<?php echo $field['id']; ?>_input" class="box box-border sort-item <?php echo $field['id']; ?> <?php echo ($field['class'])? $field['class'] : ''; ?>" data-sort="<?php echo $field['sort_order']; ?>">
    <div class="box-heading"><i class="icon-payment-address"></i> <span><?php echo $field['title']; ?></span></div>
    <div class="box-content">
      <div>
      <?php } ?>
      <?php		break; 
      			case "label":
        ?>
      <div id="<?php echo $field['id']; ?>_input" class="label-input sort-item <?php echo (!$field['display'])? 'hide' : ''; ?> <?php echo ($field['class'])? $field['class'] : ''; ?>" data-sort="<?php echo $field['sort_order']; ?>">
        <label for="payment_address_<?php echo $field['id']; ?>"> <span class="required <?php echo (!isset($field['require']) ||  !$field['require']) ? 'hide' : ''; ?>">*</span> <span class="text"><?php echo $field['title']; ?></span> </label>
        <p name="payment_address[<?php echo $field['id']; ?>]" id="payment_address_<?php echo $field['id']; ?>" class="label-text" />
        <?php echo isset($field['value'])? $field['value'] : ''; ?>
        </p>
      </div>
      <?php		break; 
      			case "radio":
      ?>
      <?php if(isset($field['options'])){ ?>
      <div id="<?php echo $field['id']; ?>_input" class="radio-input sort-item <?php echo (!$field['display'])? 'hide' : ''; ?> <?php echo ($field['class'])? $field['class'] : ''; ?>" data-sort="<?php echo $field['sort_order']; ?>">
        <label> <span class="required <?php echo (!isset($field['require']) ||  !$field['require']) ? 'hide' : ''; ?>">*</span> <span class="text"><?php echo $field['title']; ?></span> <?php echo (!empty($field['tooltip']))? '<i class="icon-help" rel="tooltip" data-help="'.$field['tooltip'] .'"></i>' : '' ; ?></label>
        <ul>
          <?php foreach ($field['options'] as $option) { ?>
          <?php if ($option['value'] == $field['value']) { ?>
          <li>
            <input type="radio" name="payment_address[<?php echo $field['id']; ?>]" value="<?php echo $option['value']; ?>" data-require="<?php echo (isset($field['require']) && $field['require']) ? 'require' : ''; ?>" data-refresh="<?php echo ($field['refresh']) ? $field['refresh'] : 0; ?>" id="payment_address_<?php echo $field['id'].$option['value']; ?>" checked="checked" class="styled"  autocomplete='off'/>
            <label for="payment_address_<?php echo $field['id'].$option['value']; ?>"><?php echo $option['title']; ?></label>
          </li>
          <?php } else { ?>
          <li>
            <input type="radio" name="payment_address[<?php echo $field['id']; ?>]" value="<?php echo $option['value']; ?>" data-require="<?php echo (isset($field['require']) && $field['require']) ? 'require' : ''; ?>" data-refresh="<?php echo ($field['refresh']) ? $field['refresh'] : 0; ?>" id="payment_address_<?php echo $field['id'].$option['value']; ?>"  class="styled"  autocomplete='off'/>
            <label for="payment_address_<?php echo $field['id'].$option['value']; ?>"><?php echo $option['title']; ?> </label>
          </li>
          <?php } ?>
          <?php } ?>
        </ul>
      </div>
      <?php } ?>
      <?php
        	break;
    		case "checkbox":
		?>
      <div id="<?php echo $field['id']; ?>_input" class="checkbox-input sort-item <?php echo (!$field['display'])? 'hide' : ''; ?> <?php echo ($field['class'])? $field['class'] : ''; ?>" data-sort="<?php echo $field['sort_order']; ?>">
        <?php if(isset($field['value'])) {?>
		<?php if($field['value'] == 1){?>
        	<input type="checkbox" name="payment_address[<?php echo $field['id']; ?>]" id="payment_address_<?php echo $field['id']; ?>" data-require="<?php echo (isset($field['require']) && $field['require']) ? 'require' : ''; ?>" data-refresh="<?php echo ($field['refresh']) ? $field['refresh'] : 0; ?>" value="1" checked="checked" class="styled"  autocomplete='off' />
        <?php }else{?>
        	<input type="checkbox" name="payment_address[<?php echo $field['id']; ?>]" id="payment_address_<?php echo $field['id']; ?>" data-require="<?php echo (isset($field['require']) && $field['require']) ? 'require' : ''; ?>" data-refresh="<?php echo ($field['refresh']) ? $field['refresh'] : 0; ?>" value="0" class="styled"  autocomplete='off' />
        <?php } ?>
		<?php }else{?>
			<input type="checkbox" name="payment_address[<?php echo $field['id']; ?>]" id="payment_address_<?php echo $field['id']; ?>" data-require="<?php echo (isset($field['require']) && $field['require']) ? 'require' : ''; ?>" data-refresh="<?php echo ($field['refresh']) ? $field['refresh'] : 0; ?>" value="0" class="styled"  autocomplete='off' />
		<?php } ?>
        <label for="payment_address_<?php echo $field['id']; ?>"> <span class="required <?php echo (!isset($field['require']) ||  !$field['require']) ? 'hide' : ''; ?>">*</span> <span class="text"><?php echo $field['title']; ?></span> <?php echo (!empty($field['tooltip']))? '<i class="icon-help" rel="tooltip" data-help="'.$field['tooltip'] .'"></i>' : '' ; ?></label>
      </div>
      <?php
        	break;
    		case "select":
		?>
      <div id="<?php echo $field['id']; ?>_input" class="select-input sort-item <?php echo (!$field['display'])? 'hide' : ''; ?> <?php echo ($field['class'])? $field['class'] : ''; ?>" data-sort="<?php echo $field['sort_order']; ?>">
        <label for="payment_address_<?php echo $field['id']; ?>"> <span class="required <?php echo (!isset($field['require']) ||  !$field['require']) ? 'hide' : ''; ?>">*</span> <span class="text"><?php echo $field['title']; ?></span> <?php echo (!empty($field['tooltip']))? '<i class="icon-help" rel="tooltip" data-help="'.$field['tooltip'] .'"></i>' : '' ; ?></label>
        <select name="payment_address[<?php echo $field['id']; ?>]" data-require="<?php echo (isset($field['require']) && $field['require']) ? 'require' : ''; ?>" data-refresh="<?php echo ($field['refresh']) ? $field['refresh'] : 0; ?>" id="payment_address_<?php echo $field['id']; ?>">
          <option value=""><?php echo $text_select; ?></option>
          <?php if(!empty($field['options'])) { ?>
              <?php foreach ($field['options'] as $option) { ?>
                  <?php if ($option['value'] == $field['value']) { ?>
                  <option value="<?php echo $option['value']; ?>" selected="selected"><?php echo $option['name']; ?></option>
                  <?php } else { ?>
                  <option value="<?php echo $option['value']; ?>"><?php echo $option['name']; ?></option>
                  <?php } ?>
              <?php } ?>
          <?php } ?>
        </select>
      </div>
      <?php
      		break;
       		case "password":
		?>
      <div id="<?php echo $field['id']; ?>_input" class="password-input sort-item <?php echo (!$field['display'])? 'hide' : ''; ?> <?php echo ($field['class'])? $field['class'] : ''; ?>" data-sort="<?php echo $field['sort_order']; ?>">
        <label for="payment_address_<?php echo $field['id']; ?>"> <span class="required <?php echo (!isset($field['require']) ||  !$field['require']) ? 'hide' : ''; ?>">*</span> <span class="text"><?php echo $field['title']; ?></span> <?php echo (!empty($field['tooltip']))? '<i class="icon-help" rel="tooltip" data-help="'.$field['tooltip'] .'"></i>' : '' ; ?></label>
        <input type="password" name="payment_address[<?php echo $field['id']; ?>]" id="payment_address_<?php echo $field['id']; ?>" data-require="<?php echo (isset($field['require']) && $field['require']) ? 'require' : ''; ?>" data-refresh="<?php echo ($field['refresh']) ? $field['refresh'] : 0; ?>" value="<?php echo isset($field['value'])? $field['value'] : ''; ?>" />
      </div>
      <?php		break; 
      			case "textarea":
        ?>
      <div id="<?php echo $field['id']; ?>_input" class="textarea-input sort-item <?php echo (!$field['display'])? 'hide' : ''; ?> <?php echo ($field['class'])? $field['class'] : ''; ?>" data-sort="<?php echo $field['sort_order']; ?>">
        <label for="payment_address<?php echo $field['id']; ?>"> <span class="required <?php echo (!isset($field['require']) ||  !$field['require']) ? 'hide' : ''; ?>">*</span> <span class="text"><?php echo $field['title']; ?></span> <?php echo (!empty($field['tooltip']))? '<i class="icon-help" data-help="'.$field['tooltip'] .'"></i>' : '' ; ?></label>
        <textarea name="payment_address[<?php echo $field['id']; ?>]" id="payment_address_<?php echo $field['id']; ?>" data-require="<?php echo (isset($field['require']) && $field['require']) ? 'require' : ''; ?>" data-refresh="<?php echo ($field['refresh']) ? $field['refresh'] : 0; ?>"><?php echo isset($field['value'])? $field['value'] : ''; ?></textarea>
      </div>
      <?php
    		break;
            default:
   	 ?>
      <div id="<?php echo $field['id']; ?>_input" class="text-input sort-item <?php echo (!$field['display'])? 'hide' : ''; ?> <?php echo ($field['class'])? $field['class'] : ''; ?>" data-sort="<?php echo $field['sort_order']; ?>">
        <label for="payment_address_<?php echo $field['id']; ?>"> <span class="required <?php echo (!isset($field['require']) ||  !$field['require']) ? 'hide' : ''; ?>">*</span> <span class="text"><?php echo $field['title']; ?></span> <?php echo (!empty($field['tooltip']))? '<i class="icon-help" rel="tooltip" data-help="'.$field['tooltip'] .'"></i>' : '' ; ?></label>
        <input type="text" name="payment_address[<?php echo $field['id']; ?>]" id="payment_address_<?php echo $field['id']; ?>" data-require="<?php echo (isset($field['require']) && $field['require']) ? 'require' : ''; ?>" data-refresh="<?php echo ($field['refresh']) ? $field['refresh'] : 0; ?>" value="<?php echo isset($field['value'])? $field['value'] : ''; ?>" />
      </div>
      <?php } ?>
      <?php } ?>
      <?php } ?>
      <div class="clear"></div>
    </div> <!-- #payment_address -->
  </div> <!-- .box-content -->
</div> <!-- .box -->
</div> <!-- #payment_address_wrap -->
<script type="text/javascript"><!--
// $('#company_id_input').hide();
// $('#tax_id_input').hide();


<?php if(isset($payment_address['fields']['customer_group_id']['options'])) {?>
$('input[name=\'payment_address[customer_group_id]\']').live('click', function() {
  var customer_group = [];
 
<?php foreach ($payment_address['fields']['customer_group_id']['options'] as $customer_group) { ?>
  customer_group[<?php echo $customer_group['customer_group_id']; ?>] = [];
  customer_group[<?php echo $customer_group['customer_group_id']; ?>]['company_id_display'] = '<?php echo $customer_group['company_id_display']; ?>';
  customer_group[<?php echo $customer_group['customer_group_id']; ?>]['company_id_required'] = '<?php echo $customer_group['company_id_required']; ?>';
  customer_group[<?php echo $customer_group['customer_group_id']; ?>]['tax_id_display'] = '<?php echo $customer_group['tax_id_display']; ?>';
  customer_group[<?php echo $customer_group['customer_group_id']; ?>]['tax_id_required'] = '<?php echo $customer_group['tax_id_required']; ?>';
<?php } ?>  

  if (customer_group[this.value]) {
    if (customer_group[this.value]['company_id_display'] == '1') {
      $('#company_id_input').show();
    } else {
      $('#company_id_input').hide();
    }
    if (customer_group[this.value]['tax_id_display'] == '1') {
      $('#tax_id_input').show();
    } else {
      $('#tax_id_input').hide();
    }
    if (customer_group[this.value]['company_id_required'] == '1') {
      $('#payment_address_company_id').attr('data-require', 'require');
      $('label[for=\'payment_address_company_id\'] span.required.hide').removeClass('hide');
    } else {
      $('#payment_address_company_id').attr('data-require', '');
      $('label[for=\'payment_address_company_id\'] span.required').addClass('hide');
    }    
    if (customer_group[this.value]['tax_id_required'] == '1') {
      $('#payment_address_tax_id').attr('data-require', 'require');
      $('label[for=\'payment_address_tax_id\'] span.required.hide').removeClass('hide');
    } else {
      $('#payment_address_tax_id').attr('data-require', '');
      $('label[for=\'payment_address_tax_id\'] span.required').addClass('hide');
    } 
  }
});
<?php } ?>
$('input[name=\'payment_address[exists]\']').live('click', function() {
	if (this.value == '0') {
		$('#payment_address_exists_list').hide();
		$('#payment_address').show();
	} else {
		$('#payment_address_exists_list').show();
		$('#payment_address').hide();
	}
});

function refreshPaymentAddessZone(value) {

	$.ajax({
		url: 'index.php?route=module/quickcheckout/country&country_id=' + value,
		dataType: 'json',
		beforeSend: function() {

		},
		complete: function() {

		},		
		success: function(json) {

			if (json['postcode_required'] == '1') {
				$('#payment-postcode-required').show();
			} else {
				$('#payment-postcode-required').hide();
			}
			
			html = '<option value=""><?php echo $text_select; ?></option>';
			
			if (json['zone'] != '') {

				for (i = 0; i < json['zone'].length; i++) {
        			html += '<option value="' + json['zone'][i]['zone_id'] + '"';
					if (json['zone'][i]['zone_id'] == '<?php echo $payment_address['fields']['zone_id']['value']; ?>') {
	      				html += ' selected="selected"';
	    			}
	
	    			html += '>' + json['zone'][i]['name'] + '</option>';
				}
			} else {
				html += '<option value="0" selected="selected"><?php echo $text_none; ?></option>';
			}
			
			$('#payment_address_wrap select[name=\'payment_address[zone_id]\']').html(html);
		},
		error: function(xhr, ajaxOptions, thrownError) {
			console.log(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
		}
		});
}

//refreshPaymentAddessZone($('#payment_address_wrap select[name=\'payment_address[country_id]\']').val())

$('#payment_address_wrap select[name=\'payment_address[country_id]\']').bind('change', function(){
	refreshPaymentAddessZone($(this).val())	
})


$(function(){
	if($.isFunction($.fn.uniform)){
		$(" .styled, input:radio.styled").uniform().removeClass('styled');
	}
	if($.isFunction($.fn.colorbox)){
		$('.colorbox').colorbox({
			width: 640,
			height: 480
		});
	}
	if($.isFunction($.fn.fancybox)){
		$('.fancybox').fancybox({
			width: 640,
			height: 480
		});
	}
});
//--></script>
