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
		<?php if ($error_warning) { ?>
		<div class="warning"><?php echo $error_warning; ?></div>
		<?php } ?>
		<?php echo $column_left; ?><?php echo $column_right; ?>
		<div id="content"><?php echo $content_top; ?>
		  <h1><?php echo $heading_title; ?></h1>
		  <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data">
			<p><?php echo $text_email; ?></p>
			<fieldset>
			<legend><?php echo $text_your_email; ?></legend>
			<div class="content">
			  <div class="form-horizontal">
				<div class="control-group">
					<label class="control-label"><?php echo $entry_email; ?></label>
					<div class="controls"><?php echo $entry_email; ?></div>
				</div>
			  </div>
			</div>
			</fieldset>
			<div class="buttons">
			  <div class="left"><a href="<?php echo $back; ?>" class="button"><?php echo $button_back; ?></a> <input type="submit" value="<?php echo $button_continue; ?>" class="button" />
			  </div>
			</div>
		  </form>
		  <?php echo $content_bottom; ?>
		</div>
<?php echo $footer; ?>