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
			  <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data">
				<div class="content">
				  <div class="form-horizontal">
					<div class="control-group">
					  <label class="control-label"><?php echo $entry_newsletter; ?></label>
					  <div class="controls">
						<?php if ($newsletter) { ?>
						<input type="radio" name="newsletter" value="1" checked="checked" class="styled" />
						<?php echo $text_yes; ?>&nbsp;
						<input type="radio" name="newsletter" value="0" class="styled" />
						<?php echo $text_no; ?>
						<?php } else { ?>
						<input type="radio" name="newsletter" value="1" class="styled" />
						<?php echo $text_yes; ?>&nbsp;
						<input type="radio" name="newsletter" value="0" checked="checked" class="styled" />
						<?php echo $text_no; ?>
						<?php } ?>
					  </div>
					</div>
				   </div>
				</div>
				<div class="buttons">
				  <div class="left"><a href="<?php echo $back; ?>" class="button"><?php echo $button_back; ?></a> <input type="submit" value="<?php echo $button_continue; ?>" class="button" /></div>
				</div>
			  </form>
			  <?php echo $content_bottom; ?>
			</div>
		</div>
	</div>
</div>	
<?php echo $footer; ?>