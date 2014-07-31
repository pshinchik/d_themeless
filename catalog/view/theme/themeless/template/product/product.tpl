<?php echo $header; ?>
<div class="home-breadcrumb">
	<div class="layout"><!-- layout -->
		<div class="wrap"><!-- wrap -->
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
			<div id="content2"><?php echo $content_top; ?><!-- content -->
				<div class="product-info row"><!-- product-info -->
					<div class="col-sm-6 product-image">
						<?php if ($thumb || $images) { ?>
							<div class="left">
							  <?php if ($thumb) { ?>
							  <div class="image"><a href="<?php echo $popup; ?>" title="<?php echo $heading_title; ?>" class="colorbox" rel="colorbox"><img src="<?php echo $thumb; ?>" title="<?php echo $heading_title; ?>" alt="<?php echo $heading_title; ?>" id="image" /></a></div>
							  <?php } ?>
							  <?php if ($images) { ?>
							  <div class="image-additional">
								<?php foreach ($images as $image) { ?>
								<a href="<?php echo $image['popup']; ?>" title="<?php echo $heading_title; ?>" class="colorbox" rel="colorbox"><img src="<?php echo $image['thumb']; ?>" title="<?php echo $heading_title; ?>" alt="<?php echo $heading_title; ?>" /></a>
								<?php } ?>
							  </div>
							  <?php } ?>
							</div>
						<?php } ?>
					</div>
					
					<div class="right col-sm-6 product-block-static">
					<h1 class="page-title"><?php echo $heading_title; ?></h1>	
						<div class="description">
							<div class="col-sm-12">
								<div class="stock">
									<span class="text"><?php if($stock_availability){ ?> <i class="icon-check"></i> <?php }else{ ?> <i class="icon-check"></i> <?php } ?></span>
									<span class="value" itemprop="availability" content="<?php if($stock_availability){ echo 'in_stock'; }else{ echo 'out_of_stock'; } ?>"><?php echo $stock; ?></span>
								</div>
							</div>
							<div class="col-sm-12 product-price-block">
								<?php if ($price) { ?>
									<?php if (!$special) { ?>
									<span class="price-new label label-info"><?php echo $price; ?></span>
									<?php } else { ?>
									<span class="price-old"><?php echo $price; ?></span> 
									<span class="price-new label label-warning" style="font-size: inherit"><?php echo $special; ?></span>
									<?php } ?>
									<br />
									<!--<?php if ($tax) { ?>
									<span class="price-tax"><?php echo $text_tax; ?> <?php echo $tax; ?></span><br />
									<?php } ?>
									<?php if ($points) { ?>
									<span class="reward"><small><?php echo $text_points; ?> <?php echo $points; ?></small></span>
									<?php } ?>
									<?php if ($discounts) { ?>
									<br />
									<div class="discount breadcrumb">
									  <?php foreach ($discounts as $discount) { ?>
									  <?php echo sprintf($text_discount, $discount['quantity'], $discount['price']); ?><br />
									  <?php } ?>
									</div>
									<?php } ?>-->
								<?php } ?>
							</div>						
							<?php if ($review_status) { ?>
							<div class="review">
								<div class="row">
									<div class="col-sm-12">
										<img src="catalog/view/theme/themeless/image/stars-<?php echo $rating; ?>.png" alt="<?php echo $reviews; ?>" />
										<a onclick="$('a[href=\'#tab-review\']').trigger('click');" class="btn btn-link"><?php echo $text_write; ?></a>
									</div>
								</div>
							</div>
							<?php } ?>
							
							<div class="btn-group">
								<a onclick="addToWishList('<?php echo $product_id; ?>');" class="btn btn-link" title="<?php echo $button_wishlist; ?>">
									<span class="icon icon-icon-heart"></span>
									<?php echo $button_wishlist; ?>
								</a>
								<a onclick="addToCompare('<?php echo $product_id; ?>');" class="btn btn-link" title="<?php echo $button_compare; ?>">								
									<span class="icon icon-icon-compare"></span>
									<?php echo $button_compare; ?>
								</a>
							</div>
							<!--<div class="col-sm-12">   
								<span class="icon icon-barcode"></span> <?php echo $text_model; ?>
								<?php echo $model; ?>
							</div>
							<div class="col-sm-12">
								<?php if ($manufacturer) { ?>
									<span class="icon icon-certificate"></span> <?php echo $text_manufacturer; ?>
									<a href="<?php echo $manufacturers; ?>"><?php echo $manufacturer; ?></a>
								<?php } ?>
							</div>
							<div class="col-sm-12">		
								<?php if ($reward) { ?> 
									<span class="icon icon-bookmark"></span> <?php echo $text_reward; ?>
									<?php echo $reward; ?>
								<?php } ?>
								<div class="col-sm-12">
									<span class="icon icon-map-marker"></span> <?php echo $text_stock; ?>
									<?php echo $stock; ?>
								</div>   
							</div>-->
						
						<?php if ($options) { ?>
						<div class="options-block">	
						<div class="options">
							<div class="form-horizontal">
							<?php foreach ($options as $option) { ?>
							<?php if ($option['type'] == 'select') { ?>
							<div id="option-<?php echo $option['product_option_id']; ?>" class="option control-group">
								<div class="row">
									<span class="control-label col-sm-6">
										<?php if ($option['required']) { ?>
										<span class="required">*</span>
										<?php } ?>
										<b><?php echo $option['name']; ?>:</b>
									</span>
									<div class="controls col-sm-6">
										<select name="option[<?php echo $option['product_option_id']; ?>]" class="col-sm-10">
											<option value=""><?php echo $text_select; ?></option>
											<?php foreach ($option['option_value'] as $option_value) { ?>
											<option value="<?php echo $option_value['product_option_value_id']; ?>"><?php echo $option_value['name']; ?>
											<?php if ($option_value['price']) { ?>
											(<?php echo $option_value['price_prefix']; ?><?php echo $option_value['price']; ?>)
											<?php } ?>
											</option>
											<?php } ?>
										</select>
									</div>
								</div>	
							</div>
							<?php } ?>
							<?php if ($option['type'] == 'radio') { ?>
							<div id="option-<?php echo $option['product_option_id']; ?>" class="option control-group">
								<div class="row">
									<span class="control-label col-sm-6"><?php if ($option['required']) { ?>
										<span class="required">*</span>
										<?php } ?>
										<b><?php echo $option['name']; ?>:</b>
									</span>
									<div class="controls col-sm-6">
										<?php foreach ($option['option_value'] as $option_value) { ?>
										<label for="option-value-<?php echo $option_value['product_option_value_id']; ?>" class="radio">
										<input type="radio" name="option[<?php echo $option['product_option_id']; ?>]" value="<?php echo $option_value['product_option_value_id']; ?>" id="option-value-<?php echo $option_value['product_option_value_id']; ?>" class="styled" />
										<?php echo $option_value['name']; ?>
										<?php if ($option_value['price']) { ?>
										(<?php echo $option_value['price_prefix']; ?><?php echo $option_value['price']; ?>)
										<?php } ?>
										</label><br />
										<?php } ?>
									</div>
								</div>
							</div>
							<?php } ?>
							<?php if ($option['type'] == 'checkbox') { ?>
							<div id="option-<?php echo $option['product_option_id']; ?>" class="option control-group">
								<div class="row">
									<span class="control-label col-sm-6">
										<?php if ($option['required']) { ?>
										<span class="required">*</span>
										<?php } ?>
										<b><?php echo $option['name']; ?>:</b>
									</span>
									<div class="controls col-sm-6">
										<?php foreach ($option['option_value'] as $option_value) { ?>
										<label for="option-value-<?php echo $option_value['product_option_value_id']; ?>" class="checkbox">
										<input type="checkbox" name="option[<?php echo $option['product_option_id']; ?>][]" value="<?php echo $option_value['product_option_value_id']; ?>" id="option-value-<?php echo $option_value['product_option_value_id']; ?>" class="styled" />
										<?php echo $option_value['name']; ?>
										<?php if ($option_value['price']) { ?>
										(<?php echo $option_value['price_prefix']; ?><?php echo $option_value['price']; ?>)
										<?php } ?>
										</label>
										<?php } ?>
									</div>
								</div>	
							</div>
							<?php } ?>
							<?php if ($option['type'] == 'image') { ?>
							<div id="option-<?php echo $option['product_option_id']; ?>" class="option control-group">
								<div class="row">
									<span class="control-label col-sm-6">
										<?php if ($option['required']) { ?>
										<span class="required">*</span>
										<?php } ?>
										<b><?php echo $option['name']; ?>:</b>
									</span>
									<div class="controls col-sm-6">
										<table class="option-image">
											<?php foreach ($option['option_value'] as $option_value) { ?>
											<tr>
											  <td style="width: 1px;"><input type="radio" name="option[<?php echo $option['product_option_id']; ?>]" value="<?php echo $option_value['product_option_value_id']; ?>" id="option-value-<?php echo $option_value['product_option_value_id']; ?>" /></td>
											  <td><label for="option-value-<?php echo $option_value['product_option_value_id']; ?>"><img src="<?php echo $option_value['image']; ?>" alt="<?php echo $option_value['name'] . ($option_value['price'] ? ' ' . $option_value['price_prefix'] . $option_value['price'] : ''); ?>" /></label></td>
											  <td><label for="option-value-<?php echo $option_value['product_option_value_id']; ?>"><?php echo $option_value['name']; ?>
												  <?php if ($option_value['price']) { ?>
												  (<?php echo $option_value['price_prefix']; ?><?php echo $option_value['price']; ?>)
												  <?php } ?>
												</label></td>
											</tr>
											<?php } ?>
										</table>
									</div>
								</div>
							</div>
							<?php } ?>
							<?php if ($option['type'] == 'text') { ?>
							<div id="option-<?php echo $option['product_option_id']; ?>" class="option control-group">
								<div class="row">
									<span class="control-label col-sm-6">
										<?php if ($option['required']) { ?>
										<span class="required">*</span>
										<?php } ?>
										<b><?php echo $option['name']; ?>:</b>
									</span>
									<div class="controls col-sm-6">
										<input type="text" name="option[<?php echo $option['product_option_id']; ?>]" value="<?php echo $option['option_value']; ?>" class="col-sm-10 styled" />
									</div>
								</div>  
							</div>
							<?php } ?>
							<?php if ($option['type'] == 'textarea') { ?>
							<div id="option-<?php echo $option['product_option_id']; ?>" class="option control-group">
								<div class="row">
									<span class="control-label col-sm-6">
									  <?php if ($option['required']) { ?>
									  <span class="required">*</span>
									  <?php } ?>
									  <b><?php echo $option['name']; ?>:</b>
									</span>
									<div class="controls col-sm-6">
										<textarea name="option[<?php echo $option['product_option_id']; ?>]" cols="40" rows="5" class="col-sm-10"><?php echo $option['option_value']; ?></textarea>
									</div>
								</div>
							</div>
							<?php } ?>
							<?php if ($option['type'] == 'file') { ?>
							<div id="option-<?php echo $option['product_option_id']; ?>" class="option control-group">
								<div class="row">
									<span class="control-label">
										<?php if ($option['required']) { ?>
										<span class="required">*</span>
										<?php } ?>
										<b><?php echo $option['name']; ?>:</b>
									</span>
									<div class="controls">
										<input type="button" value="<?php echo $button_upload; ?>" id="button-option-<?php echo $option['product_option_id']; ?>" class="button btn">
										<input type="hidden" name="option[<?php echo $option['product_option_id']; ?>]" value="" />
									</div>
								</div>
							</div>
							<?php } ?>
							<?php if ($option['type'] == 'date') { ?>
							<div id="option-<?php echo $option['product_option_id']; ?>" class="option control-group">
								<div class="row">
									<span class="control-label col-sm-6">
										<?php if ($option['required']) { ?>
										<span class="required">*</span>
										<?php } ?>
										<b><?php echo $option['name']; ?>:</b>
									</span>
									<div class="controls col-sm-6">
										<input type="text" name="option[<?php echo $option['product_option_id']; ?>]" value="<?php echo $option['option_value']; ?>" class="date col-sm-6" />
									</div>
								</div>  
							</div>
							<?php } ?>
							<?php if ($option['type'] == 'datetime') { ?>
							<div id="option-<?php echo $option['product_option_id']; ?>" class="option control-group">
								<div class="row">
									<span class="control-label col-sm-6">
										<?php if ($option['required']) { ?>
										<span class="required">*</span>
										<?php } ?>
										<b><?php echo $option['name']; ?>:</b>
									</span>
									<div class="controls col-sm-6">
										<input type="text" name="option[<?php echo $option['product_option_id']; ?>]" value="<?php echo $option['option_value']; ?>" class="datetime col-sm-8" />
									</div>
								</div>	
							</div>
							<?php } ?>
							<?php if ($option['type'] == 'time') { ?>
							<div id="option-<?php echo $option['product_option_id']; ?>" class="option control-group">
								<div class="row">
									<span class="control-label col-sm-6">
										<?php if ($option['required']) { ?>
										<span class="required">*</span>
										<?php } ?>
										<b><?php echo $option['name']; ?>:</b>
									</span>
									<div class="controls col-sm-6">
										<input type="text" name="option[<?php echo $option['product_option_id']; ?>]" value="<?php echo $option['option_value']; ?>" class="time col-sm-4" />
									</div>
								</div>	
							</div>
							<?php } ?>
							<?php } ?>
							</div>
						</div>
						</div>
						<?php } ?>
						
						<!--<div class="cart">
							<div class="row">
								<div class="col-sm-2"><span><span class="icon icon-share-alt"></span> <?php echo $text_qty; ?></span></div>
								<div class="col-sm-3">
									<input type="text" name="quantity" size="2" value="<?php echo $minimum; ?>" class="col-sm-12" />
									<input type="hidden" name="product_id" size="2" value="<?php echo $product_id; ?>" />
								</div>
								<div class="col-sm-7">          		
									<a id="button-cart" class="button btn btn-primary btn-block"><span class="icon icon-white icon-shopping-cart"></span> <?php echo $button_cart; ?></a>
								</div>
							</div>
							<div><small class=""><?php echo $text_minimum; ?></small></div>
							<div class="row">
								<div class="col-sm-6"><a onclick="addToWishList('<?php echo $product_id; ?>');" class="btn btn-link"><span class="icon icon-heart"></span> <?php echo $button_wishlist; ?></a></div>
								<div class="col-sm-6"><a onclick="addToCompare('<?php echo $product_id; ?>');" class="btn btn-link"><span class="icon icon-eye-close"></span> <?php echo $button_compare; ?></a></div>
							</div>
						</div>-->
						
						<div class="cart">
							<div class="row">
								<div class="cart-quantity" >
								  <span class="text-quantity"><?php echo $text_qty; ?></span>
								  <div class="value-quantity-control-buttons">
								  <i class="value-quantity-control icon-chevron-left"></i>
								  
								  <input type="text" name="quantity" size="2" class="value-quantity input-small" value="<?php echo $minimum; ?>" />
								  <input type="hidden" name="product_id" size="2" value="<?php echo $product_id; ?>" />
								  
								  <i class="value-quantity-control icon-chevron-right"></i>
										 
								  </div>
								</div>
								<script>
									$('.value-quantity-control').live('click', function(){
										if($(this).hasClass('icon-chevron-right')){
											$('.value-quantity').attr('value',  parseInt($('.value-quantity').attr('value'))+parseInt(1) )
											}else{
												if($('.value-quantity').attr('value') > parseInt(<?php echo $minimum; ?>)){
													$('.value-quantity').attr('value',  parseInt($('.value-quantity').attr('value'))-parseInt(1) )
												}
											}
										})
								</script>
								<div class="cart-buy">       
									<button id="button-cart" class="button btn btn-buy btn-large" ><?php echo $button_cart; ?></button>
								</div>
								<div class="extra-actions thumbnail">
									<?php if ($minimum > 1) { ?>
									<div class="clear"></div>
									<div class="minimum"><?php echo $text_minimum; ?></div>
									<?php } ?> 
								</div><!--thumbnail-->
							</div>   
						</div>
						</div>
					</div>
					<div class="clear"></div>
					<ul class="nav nav-tabs tabs">
						<li class="active"><a href="#tab-description" data-toggle="tab"><?php echo $tab_description; ?></a></li>
						<?php if ($attribute_groups) { ?>
						<li><a href="#tab-attribute" data-toggle="tab"><?php echo $tab_attribute; ?></a></li>
						<?php } ?>
						<?php if ($review_status) { ?>
						<li><a href="#tab-review" data-toggle="tab"><?php echo $tab_review; ?></a></li>
						<?php } ?>
					</ul>
				<div class="tab-content">
					<div id="tab-description" class="tab-pane active"><?php echo $description; ?></div>
					<?php if ($attribute_groups) { ?>
					<div id="tab-attribute" class="tab-pane">
						<table class="attribute table table-striped">
						  <?php foreach ($attribute_groups as $attribute_group) { ?>
						  <thead>
							<tr>
							  <th colspan="2"><?php echo $attribute_group['name']; ?></th>
							</tr>
						  </thead>
						  <tbody>
							<?php foreach ($attribute_group['attribute'] as $attribute) { ?>
							<tr>
							  <td><?php echo $attribute['name']; ?></td>
							  <td><?php echo $attribute['text']; ?></td>
							</tr>
							<?php } ?>
						  </tbody>
						  <?php } ?>
						</table>
					</div>
					<?php } ?>
					
					<?php if ($review_status) { ?>
					<div id="tab-review" class="tab-pane">
							<div id="review">
								<?php if ($reviews_output) { ?>
									<?php foreach ($reviews_output as $review) { ?>
									<div class="review-list" itemscope itemtype="http://data-vocabulary.org/Review">
									  <span itemprop="itemreviewed" style="display:none"><?php echo $review['product_name']; ?></span>
									  <div class="author"><span class="name" itemprop="reviewer"><?php echo $review['author']; ?></span> <span class="text_on"><?php echo $text_on; ?></span> <span class="date_added"  itemprop="dtreviewed" datetime="<?php echo $review['date_added']; ?>"><?php echo $review['date_added']; ?></span></div>
									  <div class="rating"><i class="icon-large-stars-<?php echo $review['rating']; ?>"></i> </div><span itemprop="rating" style="display:none"><?php echo $review['rating']; ?></span>
									  <span itemprop="summary" style="display:none"><?php echo $review['text']; ?></span>
									  <div class="text" itemprop="description" ><?php echo $review['text']; ?></div>
									</div>
									<?php } ?>
								<?php } ?>
							</div>
						<fieldset>
						<legend id="review-title"><?php echo $text_write; ?></legend>
							<div class="form-horizontal">
								<div class="control-group">
									<label class="control-label"><?php echo $entry_name; ?></label>
									<div class="controls">
										<input type="text" name="name" class="name" id="review_name" value="" />
									</div>
								</div>
								<div class="control-group">
									<label class="control-label"><?php echo $entry_review; ?></label>
									<div class="controls">
										<textarea name="text" rows="8" cols="40"></textarea><br />
										<small><?php echo $text_note; ?></small>
									</div>
								</div>
								<div class="control-group">
									<label class="control-label"><?php echo $entry_rating; ?></label>
									<div class="controls-rating">
										<div class="rating">
											<div class="radio-div">
											<input id="user_rating_1" class="radio-star" type="radio" name="rating" value="1" />
											<input id="user_rating_2" class="radio-star" type="radio" name="rating" value="2" />
											<input id="user_rating_3" class="radio-star" type="radio" name="rating" value="3" />
											<input id="user_rating_4" class="radio-star" type="radio" name="rating" value="4" />
											<input id="user_rating_5" class="radio-star" type="radio" name="rating" value="5" />
											</div>

											<div class="star-div span-large-stars-0">
												<i class="span-large-stars-0"></i>
											</div>
										</div>
										
										<script>
										/*stars rating*/	
										jQuery('.radio-star').hover(
												/*навел*/
												function(){
													var stars = jQuery(this).val();
													jQuery('.star-div').html('<i class="span-large-stars-'+ stars +'"></i>')
													
												},
												/*убрал*/
												function(){
													var start = jQuery('input:radio[name=rating]:checked').val()
													
													if(typeof  start == 'undefined' ){start = 0; } 
													jQuery('.star-div').html('<i class="span-large-stars-'+ start +'"></i>')
												
												})
										jQuery('.radio-star').click(function(){
											/*убираем checked у всех элементов*/
											jQuery('.radio-star').each(function(){
												jQuery(this).attr( 'checked', false )
											})
											
											/*добавляем checked необходимому элементу*/
											jQuery(this).attr( 'checked', true )
											
											/*Отображаем количество звёзд*/
											
											jQuery(this).each(function(){
												if(jQuery(this).attr("checked")=="checked"){
													var s = jQuery(this).val();
													//alert (s);
													jQuery('.star-div').stop().html('<i class="span-large-stars-'+ s +'"></i>')
												}
											})
											
										})       
										</script>
										<div class="clear"></div>
									</div>
								<div class="control-group">
									<label class="control-label"><?php echo $entry_captcha; ?></label>
									<div class="controls">
										<input type="text" name="captcha" value="" /><br /><br />
										<img src="index.php?route=product/product/captcha" alt="" id="captcha" />
									</div>
								</div>
								<div class="review-button">
									<a id="button-review" class="button btn btn-primary"><span class="icon icon-white icon-ok"></span> <?php echo $button_continue; ?></a>
								</div>
							</div>
						</fieldset>
					</div>
					<?php } ?>
					</div>
				</div>
				
				<?php if ($products) { ?>
					<div id="tab-related" class="tab-pane">
						<div class="box-product row">
							<?php $i=0; foreach ($products as $product) { 
								if( ($i % 4) == 0) echo '<div style="clear: both;padding: 5px;"></div>';
							?>
							<div class="col-sm-3 img-polaroid"<?php if( ($i % 4) == 0) echo ' style="margin-left: 0px;"'; $i++;?>>
							<?php if ($product['thumb']) { ?>
							<div class="image"><a href="<?php echo $product['href']; ?>"><img src="<?php echo $product['thumb']; ?>" alt="<?php echo $product['name']; ?>" /></a></div>
							<?php } ?>
							<div class="name"><a href="<?php echo $product['href']; ?>"><?php echo $product['name']; ?></a></div>
							<?php if ($product['price']) { ?>
							<div class="price">
							<?php if (!$product['special']) { ?>
							<?php echo $product['price']; ?>
							<?php } else { ?>
							<span class="price-old"><?php echo $product['price']; ?></span> <span class="price-new"><?php echo $product['special']; ?></span>
							<?php } ?>
							</div>
							<?php } ?>
							<div class="cart">
								<a onclick="addToCart('<?php echo $product['product_id']; ?>');" class="button btn"><span class="icon icon-shopping-cart"></span> <?php echo $button_cart; ?></a>
							</div>
							</div>
						<?php } ?>
						</div>
					</div>
				<?php } ?>
				
					<?php if ($tags) { ?>
					<div class="tags"><b><?php echo $text_tags; ?></b>
						<?php for ($i = 0; $i < count($tags); $i++) { ?>
						<?php if ($i < (count($tags) - 1)) { ?>
							<a href="<?php echo $tags[$i]['href']; ?>" class="label label-info"><span class="icon icon-white icon-tags"></span> <?php echo $tags[$i]['tag']; ?></a>
						<?php } else { ?>
							<a href="<?php echo $tags[$i]['href']; ?>" class="label label-info"><span class="icon icon-white icon-tags"></span> <?php echo $tags[$i]['tag']; ?></a>
						<?php } ?>
						<?php } ?>
					</div>
					<?php } ?>
					<?php echo $content_bottom; ?>
				</div><!-- product-info end -->
			</div><!-- content end -->
		</div><!-- wrap end -->
	</div><!-- layout end -->
</div><!-- content_holder end -->
<script type="text/javascript"><!--
$('.colorbox').colorbox({
	overlayClose: true,
	opacity: 0.5
});
//--></script> 
<script type="text/javascript"><!--
$('#button-cart').bind('click', function() {
	$.ajax({
		url: 'index.php?route=checkout/cart/add',
		type: 'post',
		data: $('.product-info input[type=\'text\'], .product-info input[type=\'hidden\'], .product-info input[type=\'radio\']:checked, .product-info input[type=\'checkbox\']:checked, .product-info select, .product-info textarea'),
		dataType: 'json',
		success: function(json) {
			$('.success, .warning, .attention, information, .error').remove();
			if (json['error']) {
				if (json['error']['option']) {
					for (i in json['error']['option']) {
						$('#option-' + i).after('<span class="error">' + json['error']['option'][i] + '</span>');
					}
				}
			} 
			if (json['success']) {
				$('#notification').html('<div class="success alert alert-success" style="display: none;">' + json['success'] + '<span class="close icon-delete"></span></div>');
				$('.success').fadeIn('slow');				
				$('#cart-total').html(json['total']);
				$('#notification_holder').fadeIn();
				$('html, body').animate({ scrollTop: 0 }, 'slow',function(){
					$('#cart .heading a').addClass('btn-large').addClass('btn-warning');
				
					setTimeout(function(){
							$('#cart .heading a').removeClass('btn-large').removeClass('btn-warning');
						},3000);
				}); 	
			}	
		}		
	});
});
//--></script>
<?php if ($options) { ?>
<script type="text/javascript" src="catalog/view/javascript/jquery/ajaxupload.js"></script>
<?php foreach ($options as $option) { ?>
<?php if ($option['type'] == 'file') { ?>
<script type="text/javascript"><!--
new AjaxUpload('#button-option-<?php echo $option['product_option_id']; ?>', {
	action: 'index.php?route=product/product/upload',
	name: 'file',
	autoSubmit: true,
	responseType: 'json',
	onSubmit: function(file, extension) {
		$('#button-option-<?php echo $option['product_option_id']; ?>').after('<img src="catalog/view/theme/default/image/loading.gif" class="loading" style="padding-left: 5px;" />');
		$('#button-option-<?php echo $option['product_option_id']; ?>').attr('disabled', true);
	},
	onComplete: function(file, json) {
		$('#button-option-<?php echo $option['product_option_id']; ?>').attr('disabled', false);
		
		$('.error').remove();
		
		if (json['success']) {
			alert(json['success']);
			
			$('input[name=\'option[<?php echo $option['product_option_id']; ?>]\']').attr('value', json['file']);
		}
		
		if (json['error']) {
			$('#option-<?php echo $option['product_option_id']; ?>').after('<span class="error">' + json['error'] + '</span>');
		}
		
		$('.loading').remove();	
	}
});
//--></script>
<?php } ?>
<?php } ?>
<?php } ?>
<script type="text/javascript"><!--
$('#review .pagination a').live('click', function() {
	$('#review').fadeOut('slow');
		
	$('#review').load(this.href);
	
	$('#review').fadeIn('slow');
	
	return false;
});			

$('#review').load('index.php?route=product/product/review&product_id=<?php echo $product_id; ?>');

$('#button-review').bind('click', function() {
	$.ajax({
		url: 'index.php?route=product/product/write&product_id=<?php echo $product_id; ?>',
		type: 'post',
		dataType: 'json',
		data: 'name=' + encodeURIComponent($('input[name=\'name\']').val()) + '&text=' + encodeURIComponent($('textarea[name=\'text\']').val()) + '&rating=' + encodeURIComponent($('input[name=\'rating\']').val() ? $('input[name=\'rating\']').val() : '') + '&captcha=' + encodeURIComponent($('input[name=\'captcha\']').val()),
		beforeSend: function() {
			$('.success, .warning').remove();
			$('#button-review').attr('disabled', true);
			$('#review-title').after('<div class="attention"><img src="catalog/view/theme/default/image/loading.gif" alt="" /> <?php echo $text_wait; ?></div>');
		},
		complete: function() {
			$('#button-review').attr('disabled', false);
			$('.attention').remove();
		},
		success: function(data) {
			if (data['error']) {
				$('#review-title').after('<div class="warning">' + data['error'] + '</div>');
			}
			
			if (data['success']) {
				$('#review-title').after('<div class="success">' + data['success'] + '</div>');
								
				$('input[name=\'name\']').val('');
				$('textarea[name=\'text\']').val('');
				$('input[name=\'rating\']:checked').attr('checked', '');
				$('input[name=\'captcha\']').val('');
			}
		}
	});
});
//--></script> 

<script type="text/javascript" src="catalog/view/javascript/jquery/ui/jquery-ui-timepicker-addon.js"></script> 
<script type="text/javascript"><!--
if ($.browser.msie && $.browser.version == 6) {
	$('.date, .datetime, .time').bgIframe();
}

$('.date').datepicker({dateFormat: 'yy-mm-dd'});
$('.datetime').datetimepicker({
	dateFormat: 'yy-mm-dd',
	timeFormat: 'h:m'
});
$('.time').timepicker({timeFormat: 'h:m'});
//--></script> 
<?php echo $footer; ?>