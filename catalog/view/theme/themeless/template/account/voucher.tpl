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
		  <br />
		  <p><?php echo $text_description; ?></p>
		  <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data">
			<div class="form-horizontal">
			  <div class="control-group">
			  <label class="control-label"><span class="required">*</span> <?php echo $entry_to_name; ?></label>
			  <div class="controls"><input type="text" name="to_name" value="<?php echo $to_name; ?>" />
				  <?php if ($error_to_name) { ?>
				  <span class="error"><?php echo $error_to_name; ?></span>
				  <?php } ?></div>
			  </div>
			  
			<div class="control-group">
			  <label class="control-label"><span class="required">*</span> <?php echo $entry_to_email; ?></label>
			  <div class="controls"><input type="text" name="to_email" value="<?php echo $to_email; ?>" />
				  <?php if ($error_to_email) { ?>
				  <span class="error"><?php echo $error_to_email; ?></span>
				  <?php } ?></div>
			</div>
			<div class="control-group">
			  <label class="control-label"><span class="required">*</span> <?php echo $entry_from_name; ?></label>
			  <div class="controls"><input type="text" name="from_name" value="<?php echo $from_name; ?>" />
				  <?php if ($error_from_name) { ?>
				  <span class="error"><?php echo $error_from_name; ?></span>
				  <?php } ?></div>
			</div>
			<div class="control-group">
			  <label class="control-label"><span class="required">*</span> <?php echo $entry_from_email; ?></label>
			  <div class="controls"><input type="text" name="from_email" value="<?php echo $from_email; ?>" />
				  <?php if ($error_from_email) { ?>
				  <span class="error"><?php echo $error_from_email; ?></span>
				  <?php } ?></div>
			</div>
			<div class="control-group">
			  <label class="control-label"><span class="required">*</span> <?php echo $entry_theme; ?></label>
			  <div class="controls"><?php foreach ($voucher_themes as $voucher_theme) { ?>
				  <?php if ($voucher_theme['voucher_theme_id'] == $voucher_theme_id) { ?>
				  <label for="voucher-<?php echo $voucher_theme['voucher_theme_id']; ?>" class="radio radio-button">
				  <input type="radio" name="voucher_theme_id" value="<?php echo $voucher_theme['voucher_theme_id']; ?>" id="voucher-<?php echo $voucher_theme['voucher_theme_id']; ?>" checked="checked" />
				  <?php echo $voucher_theme['name']; ?></label>
				  <?php } else { ?>
				  <label for="voucher-<?php echo $voucher_theme['voucher_theme_id']; ?>" class="radio radio-button">
				  <input type="radio" name="voucher_theme_id" value="<?php echo $voucher_theme['voucher_theme_id']; ?>" id="voucher-<?php echo $voucher_theme['voucher_theme_id']; ?>" />
				  <?php echo $voucher_theme['name']; ?></label>
				  <?php } ?>
				  <?php } ?>
				  <?php if ($error_theme) { ?>
				  <span class="error"><?php echo $error_theme; ?></span>
				  <?php } ?></div>
			</div>
			<div class="control-group">
			  <label class="control-label"><?php echo $entry_message; ?></label>
			  <div class="controls"><textarea name="message" cols="40" rows="5"><?php echo $message; ?></textarea></div>
			</div>
			<div class="control-group">
			  <label class="control-label"><span class="required">*</span> <?php echo $entry_amount; ?></label>
			  <div class="controls"><input type="text" name="amount" value="<?php echo $amount; ?>" size="5" />
				  <?php if ($error_amount) { ?>
				  <span class="error"><?php echo $error_amount; ?></span>
				  <?php } ?></div>
			</div>
			</div>
			<div class="buttons">
			  <div class="right">
				<label class="checkbox"><?php echo $text_agree; ?>
				<?php if ($agree) { ?>
				<input type="checkbox" name="agree" value="1" checked="checked" />
				<?php } else { ?>
				<input type="checkbox" name="agree" value="1" />
				<?php } ?>
				</label>
				<input type="submit" value="<?php echo $button_continue; ?>" class="button btn btn-primary" />
			  </div>
			</div>
		  </form>
		  <?php echo $content_bottom; ?>
		</div>
		</div>
	</div>
</div>  
<?php echo $footer; ?>