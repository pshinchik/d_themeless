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
		<article id="content" class="category-page"><?php echo $content_top; ?>
			<div class="h1 page-title"><?php echo $heading_title; ?></div>
				<!--<?php if ($thumb || $description) { ?>
				  <div class="category-info">
					<?php if ($thumb) { ?>
					<div class="image"><img src="<?php echo $thumb; ?>" alt="<?php echo $heading_title; ?>" /></div>
					<?php } ?>
					<?php if ($description) { ?>
					<?php echo $description; ?>
					<?php } ?>
				  </div>
				<?php } ?>-->
				<!--<?php if ($categories) { ?>
				<div class="category-list">
						<ul class="row">
						  <?php $i = 1; foreach ($categories as $category) { ?>
						  <li class="col-sm-3"<?php if( ($i % 4) == 0) echo ' style="margin-left: 0px;"'; ?>><a href="<?php echo $category['href']; ?>" class="btn btn-block"><?php echo $category['name']; ?></a></li>
						  <?php $i++;} ?>
						</ul>
				</div>
				<?php } ?>-->
				<?php if ($products) { ?>
				<div class="product-filter well row">
					<div class="sort col-sm-3"><i class="icon-icon-chart-bar"></i>
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
					<div class="limit col-sm-3"><i class="icon-view-list"></i>
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
					
					<div class="product-compare col-sm-4">
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
						<div class="col-sm-6 col-xs-8 product-block-list">
							<div class="name">
								<h4><a href="<?php echo $product['href']; ?>"><?php echo $product['name']; ?></a></h4>
							</div>
							<?php if ($product['rating']) { ?>
							<div class="rating">
								<img src="catalog/view/theme/themeless/image/stars-<?php echo $product['rating']; ?>.png" alt="<?php echo $product['reviews']; ?>" />
							</div>
							<?php } ?>
							<div class="model">
								<span class="text-model"><?php echo $text_model; ?></span> <?php echo $product['model']; ?>
							</div>
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
							</div>
							<div class="cart">
								<a onclick="addToCart('<?php echo $product['product_id']; ?>');" class="button btn btn-primary"><span class="icon icon-cart-shopping-add"></span><?php echo $button_cart; ?></a>
							</div>
						</div>
						<div class="col-sm-2 col-xs-4 category-product-price price-block">
							<?php if ($product['price']) { ?>
							<div class="price">
								<?php if (!$product['special']) { ?>
								<span class="price-new label label-info"><span class="icon icon-white icon-tag"></span>  <?php echo $product['price']; ?></span>
								<?php } else { ?>
								<span class="price-new label label-warning" style="font-size: inherit;"><span class="icon icon-white icon-tag"></span>  <?php echo $product['special']; ?></span>
								<div class="hide-in-grid"><span class="price-old"><?php echo $product['price']; ?></span></div>
								<?php } ?>
							</div>
							<?php } ?>	
						</div>
					</div>
					<?php } ?>
				</div>
				<div class="clear"></div>
				<div class="pagination"><?php echo $pagination; ?></div>
				<?php } ?>
				<?php if (!$categories && !$products) { ?>
				<div class="content"><?php echo $text_empty; ?></div>
				<div class="buttons">
					<div class="right"><a href="<?php echo $continue; ?>" class="button"><?php echo $button_continue; ?></a></div>
				</div>
				<?php } ?>
				<?php echo $content_bottom; ?> 
		</article>
		</div><!-- wrap end -->
	</div><!-- layout end -->
</div><!-- content_holder end -->

<?php if ($description) { ?>
<div class="info-text"><!-- info-text -->
	<div class="layout"><!-- layout -->
		<div class="wrap"><!-- wrap -->
			<?php if ($description) { ?>
				<div class="category-info">
					<?php if ($description) { ?>
					<?php echo $description; ?>
					<?php } ?>
				</div>
			<?php } ?>
		</div><!-- wrap end -->
	</div><!-- layout end -->
</div><!-- info-text end -->
<?php } ?>

<script type="text/javascript"><!--
function display(view) {
	if (view == 'list') {
		$('.product-grid').attr('class', 'product-list');
		
		$('.product-list > div').each(function(index, element) {
			html = '';
			
				html += '<div class="col-sm-4 col-xs-12">'
					var image = $(element).find('.image').html();
					if (image != null) {
						html += '<div class="image">' + image + '</div>';
					}
				html += '</div>'
				
				html += '<div class="col-sm-6 col-xs-8 product-block-list">'
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
					html += '<div class="cart">' + $(element).find('.cart').html() + '</div>';	
				html += '</div>'
				
				html += '<div class="col-sm-2 col-xs-4 category-product-price">'
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