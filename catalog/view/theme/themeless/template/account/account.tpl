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
		<div class="success"><?php echo $success; ?></div>
		<?php } ?>
		<?php echo $column_left; ?><?php echo $column_right ?>
			<div id="content"><?php echo $content_top; ?><!-- content -->
			  <h1><?php echo $heading_title; ?></h1>
			  <div class="row-fluid">
				<div class="col-sm-4">
					  <h3><?php echo $text_my_account; ?></h3>
					  <div class="content">
						<ul>
						  <li><a href="<?php echo $edit; ?>"><?php echo $text_edit; ?></a></li>
						  <li><a href="<?php echo $password; ?>"><?php echo $text_password; ?></a></li>
						  <li><a href="<?php echo $address; ?>"><?php echo $text_address; ?></a></li>
						  <li><a href="<?php echo $wishlist; ?>"><?php echo $text_wishlist; ?></a></li>
						</ul>
					  </div>
				</div>
				<div class="col-sm-4">
					  <h3><?php echo $text_my_orders; ?></h3>
					  <div class="content">
						<ul>
						  <li><a href="<?php echo $order; ?>"><?php echo $text_order; ?></a></li>
						  <li><a href="<?php echo $download; ?>"><?php echo $text_download; ?></a></li>
						  <?php if ($reward) { ?>
						  <li><a href="<?php echo $reward; ?>"><?php echo $text_reward; ?></a></li>
						  <?php } ?>
						  <li><a href="<?php echo $return; ?>"><?php echo $text_return; ?></a></li>
						  <li><a href="<?php echo $transaction; ?>"><?php echo $text_transaction; ?></a></li>
						</ul>
					  </div>
				</div>
				<div class="col-sm-4">
			  <h3><?php echo $text_my_newsletter; ?></h3>
				  <div class="content">
					<ul>
					  <li><a href="<?php echo $newsletter; ?>"><?php echo $text_newsletter; ?></a></li>
					</ul>
				  </div>
				</div>
			  </div>
			  <?php echo $content_bottom; ?>
			</div>
		</div>
	</div>
</div>	
<?php echo $footer; ?> 