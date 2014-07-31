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
	</div>
</div>
<div id="content_holder"><!-- content_holder -->
	<div class="layout"><!-- layout -->
		<div class="wrap"><!-- wrap -->
		<?php echo $column_left; ?><?php echo $column_right; ?>
			<div id="content"><?php echo $content_top; ?><!-- content -->
			  <h1><?php echo $heading_title; ?></h1>
			  <fieldset>
			  <legend><?php echo $text_critea; ?></legend>
			  <div class="content row-fluid">
				<div class="form-horizontal span8">
					<div class="control-group">
					<label class="control-label"><span class="icon icon-search"></span> <?php echo $entry_search; ?></label>
					<div class="controls">
				  <?php if ($search) { ?>
				  <input type="text" name="search" value="<?php echo $search; ?>" />
				  <?php } else { ?>
				  <input type="text" name="search" value="<?php echo $search; ?>" onclick="this.value = '';" onkeydown="this.style.color = '000000'" style="color: #999;" />
				  <?php } ?>
				  <select name="category_id">
					<option value="0"><?php echo $text_category; ?></option>
					<?php foreach ($categories as $category_1) { ?>
					<?php if ($category_1['category_id'] == $filter_category_id) { ?>
					<option value="<?php echo $category_1['category_id']; ?>" selected="selected"><?php echo $category_1['name']; ?></option>
					<?php } else { ?>
					<option value="<?php echo $category_1['category_id']; ?>"><?php echo $category_1['name']; ?></option>
					<?php } ?>
					<?php foreach ($category_1['children'] as $category_2) { ?>
					<?php if ($category_2['category_id'] == $filter_category_id) { ?>
					<option value="<?php echo $category_2['category_id']; ?>" selected="selected">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<?php echo $category_2['name']; ?></option>
					<?php } else { ?>
					<option value="<?php echo $category_2['category_id']; ?>">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<?php echo $category_2['name']; ?></option>
					<?php } ?>
					<?php foreach ($category_2['children'] as $category_3) { ?>
					<?php if ($category_3['category_id'] == $filter_category_id) { ?>
					<option value="<?php echo $category_3['category_id']; ?>" selected="selected">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<?php echo $category_3['name']; ?></option>
					<?php } else { ?>
					<option value="<?php echo $category_3['category_id']; ?>">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<?php echo $category_3['name']; ?></option>
					<?php } ?>
					<?php } ?>
					<?php } ?>
					<?php } ?>
				  </select>
					<div class="row">
						<div class="col-sm-5">
							<label for="sub_category" class="checkbox">
							<?php if ($sub_category) { ?>
							<input type="checkbox" name="sub_category" value="1" id="sub_category" checked="checked" class="styled" />
							<?php } else { ?>
							<input type="checkbox" name="sub_category" value="1" id="sub_category" class="styled" />
							<?php } ?>
							<?php echo $text_sub_category; ?></label>
						</div>
						<div class="col-sm-7">
							<label for="description" class="checkbox">
							<?php if ($description) { ?>
							<input type="checkbox" name="description" value="1" id="description" checked="checked" class="styled" />
							<?php } else { ?>
							<input type="checkbox" name="description" value="1" id="description" class="styled" />
							<?php } ?>
							<?php echo $entry_description; ?></label>
						</div>
					</div>
					</div>
				</div>
				</div>
				<div class="col-sm-4">
					<input type="button" value="<?php echo $button_search; ?>" id="button-search" class="button btn btn-large btn-success" />
				</div>
			  </div>
			  </fieldset>
			  <?php if ($products) { ?>
			  <div class="product-filter well row">
					<div class="sort col-sm-4"><i class="icon-icon-chart-bar"></i>
						<div class="input-prepend">
							 <select onchange="location = $(this).children('option:selected').val();" value="" id="sort_select" class="styled">
								<?php foreach ($sorts as $sorts) { ?>
								<?php if ($sorts['value'] == $sort . '-' . $order) { ?>
								<option value="<?php echo $sorts['href']; ?>"   selected='selected' ><?php echo $sorts['text']; ?></option>
								<?php } else { ?>
								<option value="<?php echo $sorts['href']; ?>"><?php echo $sorts['text']; ?></option>
								<?php } ?>
								<?php } ?>
							</select>
						</div>
					</div>
					<div class="limit col-sm-2"><i class="icon-view-list"></i>
						<div class="input-prepend">
							<select onchange="location = $(this).children('option:selected').val();" value="" id="limit_select" class="styled">
								<?php foreach ($limits as $limits) { ?>
								<?php if ($limits['value'] == $limit) { ?>
								<option value="<?php echo $limits['href']; ?>" selected='selected'  ><?php echo $text_limit; ?> <?php echo $limits['text']; ?></option>
								<?php } else { ?>
								<option value="<?php echo $limits['href']; ?>"><?php echo $text_limit; ?> <?php echo $limits['text']; ?></option>
								<?php } ?>
								<?php } ?>
							</select>
						</div>
					</div>
					
					<div class="product-compare col-sm-3">
						<a href="<?php echo $compare; ?>" id="compare-total" class="btn btn-info"><span class="icon icon-white icon-icon-compare"></span> <?php echo $text_compare; ?></a>
					</div>
					<div class="display col-sm-2 hidden-phone">
						<div class="block-grid-list">
							<a onclick="display('list');" class="btn btn-info active"><span class="icon icon-view-list icon-white icon-list"></span></a>
							<a onclick="display('grid');" class="btn btn-info"><span class="icon icon-view-grid icon-white icon-th-large"></span></a>
						</div>
					</div>
				</div>
				<div class="product-list">
					<?php foreach ($products as $product) { ?>
					<div class="row block-list-product">
						<div class="col-sm-4">
							<div class="image img-polaroid">
						  <?php if ($product['thumb']) { ?>
							<a href="<?php echo $product['href']; ?>">
								<img src="<?php echo $product['thumb']; ?>" title="<?php echo $product['name']; ?>" alt="<?php echo $product['name']; ?>" />
							</a>
						  <?php } ?>
						  </div>
						</div>
						<div class="clear"></div>
						<div class="col-sm-6">
							<div class="name">
								<h4><a href="<?php echo $product['href']; ?>"><?php echo $product['name']; ?></a></h4>
							</div>
							<?php if ($product['rating']) { ?>
							<div class="rating">
								<img src="catalog/view/theme/themeless/image/stars-<?php echo $product['rating']; ?>.png" alt="<?php echo $product['reviews']; ?>" />
							</div>
							<?php } ?>
							<div class="btn-group">
								<div class="wishlist">
									<a class="btn btn-link" onclick="addToWishList('<?php echo $product['product_id']; ?>');"><span class="icon icon-icon-heart"></span><?php echo $button_wishlist; ?></a>
								</div>
								<div class="compare">
									<a class="btn btn-link"onclick="addToCompare('<?php echo $product['product_id']; ?>');"><span class="icon icon-icon-compare"></span><?php echo $button_compare; ?></a>
								</div>
							</div>
							<div class="description hide-in-grid">
								<?php echo $product['description']; ?>
							</div>
							<div class="quantity">
								<span class="text-quantity"><?php echo $text_quantity; ?></span>
								<div class="quantity-control" data="<?php echo $product['product_id']; ?>">
									<i class="icon-chevron-left"></i>
									<input type="text" class="quantity-input" value="1" id="quantity_<?php echo $product['product_id']; ?>" />
									<i class="icon-chevron-right"></i>
								</div>
								<div class="cart">
									<a onclick="addToCart('<?php echo $product['product_id']; ?>');" class="button btn btn-primary"><span class="icon icon-white icon-shopping-cart"></span><?php echo $button_cart; ?></a>
								</div>
							</div>
						</div>
						<div class="col-sm-2 price-block">
							<?php if ($product['price']) { ?>
							<div class="price">
								<?php if (!$product['special']) { ?>
								<span class="price-new label label-info"><span class="icon icon-white icon-tag"></span> <?php echo $product['price']; ?></span>
								<?php } else { ?>
								<span class="price-new label label-warning" style="font-size: inherit;"><span class="icon icon-white icon-tag"></span> <?php echo $product['special']; ?></span>
								<div class="hide-in-grid"><span class="price-old"><?php echo $product['price']; ?></span></div>
								<?php } ?>
							</div>
							<?php } ?>
							
						</div>
					</div>
					<?php } ?>
				</div>
			  <div class="pagination"><?php echo $pagination; ?></div>
			  <?php } else { ?>
			  <div class="content"><?php echo $text_empty; ?></div>
			  <?php }?>
			  <?php echo $content_bottom; ?>
			</div>
		</div>
	</div>
</div>	
<script type="text/javascript"><!--
$('#content input[name=\'filter_name\']').keydown(function(e) {
	if (e.keyCode == 13) {
		$('#button-search').trigger('click');
	}
});

$('#button-search').bind('click', function() {
	url = 'index.php?route=product/search';
	
	var filter_name = $('#content input[name=\'search\']').attr('value');
	
	if (filter_name) {
		url += '&search=' + encodeURIComponent(filter_name);
	}

	var filter_category_id = $('#content select[name=\'filter_category_id\']').attr('value');
	
	if (filter_category_id > 0) {
		url += '&filter_category_id=' + encodeURIComponent(filter_category_id);
	}
	
	var filter_sub_category = $('#content input[name=\'filter_sub_category\']:checked').attr('value');
	
	if (filter_sub_category) {
		url += '&filter_sub_category=true';
	}
		
	var filter_description = $('#content input[name=\'filter_description\']:checked').attr('value');
	
	if (filter_description) {
		url += '&filter_description=true';
	}

	location = url;
});

function display(view) {
	if (view == 'list') {
		$('.product-grid').attr('class', 'product-list');
		
		$('.product-list > div').each(function(index, element) {
			html = '';
			
				html += '<div class="col-sm-4">'
					var image = $(element).find('.image').html();
					if (image != null) {
						html += '<div class="image">' + image + '</div>';
					}
				html += '</div>'
				
				html += '<div class="col-sm-6">'
					html += '<div class="name">' + $(element).find('.name').html() + '</div>';
					var rating = $(element).find('.rating').html();
					if (rating != null) {
						html += '<div class="rating">' + rating + '</div>';
					}
					var model = $(element).find('.model').html();
					if (model != null) {
						html += '<div class="model">' + $(element).find('.model').html() + '</div>';
					}
					
					html += '<div class="btn-group">'
						html += '<div class="wishlist">' + $(element).find('.wishlist').html() + '</div>';
						html += '<div class="compare">' + $(element).find('.compare').html() + '</div>';
					html += '</div>'
					
					html += '<div class="description">' + $(element).find('.description').html() + '</div>';
					html += '<div class="quantity">' + $(element).find('.quantity').html() + '</div>';
					//html += '<div class="cart">' + $(element).find('.cart').html() + '</div>';	
				html += '</div>'
				
				html += '<div class="col-sm-2">'
					var price = $(element).find('.price').html();
					if (price != null) {
						html += '<div class="price">' + price  + '</div>';
					}
				html += '</div>'
			
			$(element).html(html);
		});		
		$('.display  .grid').removeClass('active')	
		$('.display  .list').addClass('active')
		
		$.cookie('display', 'list'); 
	} else {
		$('.product-list').attr('class', 'product-grid');
		
		$('.product-grid > div').each(function(index, element) {
			html = '';
			
				html += '<div class="col-sm-12">'
				var image = $(element).find('.image').html();
				if (image != null) {
					html += '<div class="image">' + image + '</div>';
				}
				html += '</div>'

				html += '<div class="col-sm-12 block-cart-hide">'	
				var rating = $(element).find('.rating').html();
				if (rating != null) {
					html += '<div class="rating">' + rating + '</div>';
				}
				html += '<div class="name">' + $(element).find('.name').html() + '</div>';			
				
				var model = $(element).find('.model').html();
					if (model != null) {
						html += '<div class="model">' + $(element).find('.model').html() + '</div>';
					}	
				html += '<div class="description">' + $(element).find('.description').html() + '</div>';
				
				html += '<div class="wishlist">' + $(element).find('.wishlist').html() + '</div>';
				html += '<div class="compare">' + $(element).find('.compare').html() + '</div>';
				html += '<div class="quantity">' + $(element).find('.quantity').html() + '</div>';		
				html += '<div class="cart">' + $(element).find('.cart').html() + '</div>';
				
				html += '</div>'
				
				html += '<div class="col-sm-12">'
					var price = $(element).find('.price').html();
					if (price != null) {
						html += '<div class="price">' + price  + '</div>';
					}
				html += '</div>'
				
			$(element).html(html);
		});	
		
		$('.display .list').removeClass('active')			
		$('.display .grid').addClass('active')
		
		$.cookie('display', 'grid');
	}
}

view = $.cookie('display');
$(window).load(function(){
	if($('#phone-spy').is(':visible')) view='list';
	if (view) {
		display(view);
	} else {
		display('list');
	}
});
//--></script> 
<?php echo $footer; ?>