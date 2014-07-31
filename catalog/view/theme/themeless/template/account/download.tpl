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
			  <?php foreach ($downloads as $download) { ?>
			  <div class="download-list row-fluid">
				<div class="download-id col-sm-2"><b><?php echo $text_order; ?></b> <?php echo $download['order_id']; ?></div>
				<div class="download-status col-sm-3"><b><?php echo $text_size; ?></b> <?php echo $download['size']; ?></div>
				<div class="download-content col-sm-3">
				  <div><b><?php echo $text_name; ?></b> <?php echo $download['name']; ?><br />
					<b><?php echo $text_date_added; ?></b> <?php echo $download['date_added']; ?></div>
				  <div><b><?php echo $text_remaining; ?></b> <?php echo $download['remaining']; ?></div>
				</div>
				<div class="download-info col-sm-4">
					<?php if ($download['remaining'] > 0) { ?>
					<a href="<?php echo $download['href']; ?>" class="btn" title="<?php echo $button_download; ?>"><span class="icon icon-download"></span> <?php echo $button_download; ?></a>
					<?php } ?>
				</div>
			  </div>
			  <?php } ?>
			  <div class="pagination"><?php echo $pagination; ?></div>
			  <div class="buttons">
				<div class="right"><a href="<?php echo $continue; ?>" class="button"><?php echo $button_continue; ?></a></div>
			  </div>
			  <?php echo $content_bottom; ?>
			</div>
		</div>
	</div>
</div>	
<?php echo $footer; ?>