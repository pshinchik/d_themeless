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
		<?php if ($error_warning) { ?>
		<div class="warning"><?php echo $error_warning; ?></div>
		<?php } ?>
		<?php echo $column_left; ?><?php echo $column_right; ?>
			<div id="content"><?php echo $content_top; ?><!-- content -->
			  <h1><?php echo $heading_title; ?></h1>
			  <fieldset>
			  <legend><?php echo $text_address_book; ?></legend>
			  <?php foreach ($addresses as $result) { ?>
			  <div class="content row-fluid">
				<div class="span8"><?php echo $result['address']; ?></div>
				<div class="span4">
					<a href="<?php echo $result['update']; ?>" class="btn btn-success"><span class="icon icon-white icon-edit"></span> <?php echo $button_edit; ?></a>
					<a href="<?php echo $result['delete']; ?>" class="btn btn-danger"><span class="icon icon-white icon-remove"></span> <?php echo $button_delete; ?></a>
				</div>
			  </div>
			  <hr />
			  <?php } ?>
			  </fieldset>
			  <div class="buttons">
				<div class="left"><a href="<?php echo $back; ?>" class="button"><?php echo $button_back; ?></a> <a href="<?php echo $insert; ?>" class="button"><?php echo $button_new_address; ?></a></div>
			  </div>
			  <?php echo $content_bottom; ?>
			</div>
		</div>
	</div>
</div>	
<?php echo $footer; ?>