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
			  <br />
			  <?php if ($orders) { ?>
			  <?php foreach ($orders as $order) { ?>
			  <div class="order-list row-fluid">
				<div class="order-id span2"><b><?php echo $text_order_id; ?></b> #<?php echo $order['order_id']; ?></div>
				<div class="order-status span3"><b><?php echo $text_status; ?></b> <?php echo $order['status']; ?></div>
				<div class="order-content span3">
				  <div><b><?php echo $text_date_added; ?></b> <?php echo $order['date_added']; ?><br />
					<b><?php echo $text_products; ?></b> <?php echo $order['products']; ?></div>
				  <div><b><?php echo $text_customer; ?></b> <?php echo $order['name']; ?><br />
					<b><?php echo $text_total; ?></b> <?php echo $order['total']; ?></div>
				</div>
				<div class="span4">
					<a href="<?php echo $order['href']; ?>" title="<?php echo $button_view; ?>" class="btn"><span class="icon icon-search"></span> <?php echo $button_view; ?></a>
					<a href="<?php echo $order['reorder']; ?>" title="<?php echo $button_reorder; ?>" class="btn"><span class="icon icon-shopping-cart"></span> <?php echo $button_reorder; ?></a>
				</div>
			  </div>
			  <hr />
			  <?php } ?>
			  <div class="pagination"><?php echo $pagination; ?></div>
			  <?php } else { ?>
			  <div class="content"><?php echo $text_empty; ?></div>
			  <?php } ?>
			  <div class="buttons">
				<div class="right"><a href="<?php echo $continue; ?>" class="button"><?php echo $button_continue; ?></a></div>
			  </div>
			  <?php echo $content_bottom; ?>
			</div>
		</div>
	</div>
</div>	
<?php echo $footer; ?>