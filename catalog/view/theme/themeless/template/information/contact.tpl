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
				<div class="row-fluid">
					<div class="col-sm-4">
						<h2><?php echo $text_location; ?></h2>
						<div class="contact-info well">
							<div class="content"><div class="left"><b><?php echo $text_address; ?></b><br />
								<?php echo $store; ?><br />
								<?php echo $address; ?></div>
								<div class="right">
									<?php if ($telephone) { ?>
									<b><?php echo $text_telephone; ?></b><br />
									<?php echo $telephone; ?><br />
									<br />
									<?php } ?>
									<?php if ($fax) { ?>
									<b><?php echo $text_fax; ?></b><br />
									<?php echo $fax; ?>
									<?php } ?>
								</div>
							</div>
						</div>
					</div>
					<div class="col-sm-7" style="margin-left: 20px;">
						<h2><?php echo $text_contact; ?></h2>
							<div class="content">
								<b><?php echo $entry_name; ?></b><br />
								<input type="text" name="name" value="<?php echo $name; ?>" />
								<br />
								<?php if ($error_name) { ?>
								<span class="error"><?php echo $error_name; ?></span>
								<?php } ?>
								<br />
								<b><?php echo $entry_email; ?></b><br />
								<input type="text" name="email" value="<?php echo $email; ?>" />
								<br />
								<?php if ($error_email) { ?>
								<span class="error"><?php echo $error_email; ?></span>
								<?php } ?>
								<br />
								<b><?php echo $entry_enquiry; ?></b><br />
								<textarea name="enquiry" cols="40" rows="10" style="width: 99%;"><?php echo $enquiry; ?></textarea>
								<br />
								<?php if ($error_enquiry) { ?>
								<span class="error"><?php echo $error_enquiry; ?></span>
								<?php } ?>
								<br />
								<b><?php echo $entry_captcha; ?></b><br />
								<input type="text" name="captcha" value="<?php echo $captcha; ?>" />
								<br />
								<img src="index.php?route=information/contact/captcha" alt="" />
								<?php if ($error_captcha) { ?>
								<span class="error"><?php echo $error_captcha; ?></span>
								<?php } ?>
							</div>
							<div class="buttons">
								<div class="right"><input type="submit" value="<?php echo $button_continue; ?>" class="button btn btn-primary" /></div>
							</div>
					</div>
				</div>
			  </form>
			  <?php echo $content_bottom; ?>
			</div>
		</div>
	</div>
</div>	
<?php echo $footer; ?>