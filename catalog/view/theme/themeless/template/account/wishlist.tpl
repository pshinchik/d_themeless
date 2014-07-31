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
		<?php if ($success) { ?>
		<div class="success"><?php echo $success; ?><img src="catalog/view/theme/default/image/close.png" alt="" class="close" /></div>
		<?php } ?>
		<?php echo $column_left; ?><?php echo $column_right; ?>
			<div id="content"><?php echo $content_top; ?><!-- content -->
			  <h1><?php echo $heading_title; ?></h1>
			  <?php if ($products) { ?>
			  <div class="wishlist-info">
				<table class="table table-bordered table-condensed table-hover">
				  <thead>
					<tr>
					  <th class="image hidden-phone"><?php echo $column_image; ?></th>
					  <th class="name"><?php echo $column_name; ?></th>
					  <th class="model hidden-phone"><?php echo $column_model; ?></th>
					  <th class="stock hidden-phone"><?php echo $column_stock; ?></th>
					  <th class="price"><?php echo $column_price; ?></th>
					</tr>
				  </thead>
				  <?php foreach ($products as $product) { ?>
				  <tbody id="wishlist-row<?php echo $product['product_id']; ?>">
					<tr>
					  <td class="image hidden-phone"><?php if ($product['thumb']) { ?>
						<a href="<?php echo $product['href']; ?>"><img src="<?php echo $product['thumb']; ?>" alt="<?php echo $product['name']; ?>" title="<?php echo $product['name']; ?>" /></a>
						<?php } ?></td>
					  <td class="name">
						<?php if ($product['thumb']) { ?>
						<a href="<?php echo $product['href']; ?>" class="visible-phone"><img src="<?php echo $product['thumb']; ?>" alt="<?php echo $product['name']; ?>" title="<?php echo $product['name']; ?>" /></a>
						<?php } ?>
						<a href="<?php echo $product['href']; ?>"><?php echo $product['name']; ?></a>
						<div class="visible-phone">
							<?php echo $product['model']; ?>
						</div>
					  </td>
					  <td class="model hidden-phone"><?php echo $product['model']; ?></td>
					  <td class="stock hidden-phone"><?php echo $product['stock']; ?></td>
					  <td class="price"><?php if ($product['price']) { ?>
						<div class="price">
						  <?php if (!$product['special']) { ?>
						  <?php echo $product['price']; ?>
						  <?php } else { ?>
						  <s><?php echo $product['price']; ?></s> <b><?php echo $product['special']; ?></b>
						  <?php } ?>
						  <div class="visible-phone">
						  <?php echo $product['stock']; ?>
						  </div>
						</div>
						<?php } ?></td>
					</tr>
				  </tbody>
				  <?php } ?>
				</table>
			  </div>
			  <div class="buttons">
				<div class="right"><a href="<?php echo $continue; ?>" class="button"><?php echo $button_continue; ?></a></div>
			  </div>
			  <?php } else { ?>
			  <div class="content"><?php echo $text_empty; ?></div>
			  <div class="buttons">
				<div class="right"><a href="<?php echo $continue; ?>" class="button"><?php echo $button_continue; ?></a></div>
			  </div>
			  <?php } ?>
			  <?php echo $content_bottom; ?>
			</div>
		</div>
	</div>
</div>	
<?php echo $footer; ?>