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
			<div id="content"><?php echo $content_top; ?><!-- content -->
			  <h1><?php echo $heading_title; ?></h1>
			  <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data">
				<fieldset>
				<legend><?php echo $text_your_details; ?></legend>
				<div class="content">
				  <div class="form-horizontal">
					<div class="control-group">
					  <label class="control-label"><span class="required">*</span> <?php echo $entry_firstname; ?></label>
					  <div class="controls"><input type="text" name="firstname" value="<?php echo $firstname; ?>" />
						<?php if ($error_firstname) { ?>
						<span class="error"><?php echo $error_firstname; ?></span>
						<?php } ?></div>
					</div>
					<div class="control-group">
					  <label class="control-label"><span class="required">*</span> <?php echo $entry_lastname; ?></label>
					  <div class="controls"><input type="text" name="lastname" value="<?php echo $lastname; ?>" />
						<?php if ($error_lastname) { ?>
						<span class="error"><?php echo $error_lastname; ?></span>
						<?php } ?></div>
					</div>
					<div class="control-group">
					  <label class="control-label"><span class="required">*</span> <?php echo $entry_email; ?></label>
					  <div class="controls"><input type="text" name="email" value="<?php echo $email; ?>" />
						<?php if ($error_email) { ?>
						<span class="error"><?php echo $error_email; ?></span>
						<?php } ?></div>
					</div>
					<div class="control-group">
					  <label class="control-label"><span class="required">*</span> <?php echo $entry_telephone; ?></label>
					  <div class="controls"><input type="text" name="telephone" value="<?php echo $telephone; ?>" />
						<?php if ($error_telephone) { ?>
						<span class="error"><?php echo $error_telephone; ?></span>
						<?php } ?></div>
					</div>
					<div class="control-group">
					  <label class="control-label"><?php echo $entry_fax; ?></label>
					  <div class="controls"><input type="text" name="fax" value="<?php echo $fax; ?>" /></div>
					</div>
				  </div>
				</div>
				<div class="buttons">
				  <div class="left"><a href="<?php echo $back; ?>" class="button"><?php echo $button_back; ?></a>
					<input type="submit" value="<?php echo $button_continue; ?>" class="button" />
				  </div>
				</div>
				</fieldset>
			  </form>
			  <?php echo $content_bottom; ?>
			</div>
		</div>
	</div>
</div>	
<?php echo $footer; ?>