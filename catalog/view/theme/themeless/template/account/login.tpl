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
		<?php echo $column_left; ?><?php echo $column_right ?>
			<div id="content"><?php echo $content_top; ?><!-- content -->
			  <h1><?php echo $heading_title; ?></h1>
			  <div class="login-content row-fluid">
				<div class="left span6">
				<fieldset>
				  <legend><?php echo $text_new_customer; ?></legend>
				  <div class="content">
					<p><b><?php echo $text_register; ?></b></p>
					<p><?php echo $text_register_account; ?></p>
					<a href="<?php echo $register; ?>" class="button"><?php echo $button_continue; ?></a></div>
				</fieldset>
				</div>
				<div class="right span6">
				  <fieldset>
				  <legend><?php echo $text_returning_customer; ?></legend>
				  <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data">
					<div class="content">
					  <p><?php echo $text_i_am_returning_customer; ?></p>
					  <b><?php echo $entry_email; ?></b><br />
					  <input class="login-email" type="text" name="email" value="<?php echo $email; ?>" />
					  <br />
					  <b><?php echo $entry_password; ?></b><br />
					  <input class="login-email" type="password" name="password" value="<?php echo $password; ?>" />
					  <br />
					  <a href="<?php echo $forgotten; ?>"><?php echo $text_forgotten; ?></a><br />
					  <br />
					  <input type="submit" value="<?php echo $button_login; ?>" class="button" />
					  <?php if ($redirect) { ?>
					  <input type="hidden" name="redirect" value="<?php echo $redirect; ?>" />
					  <?php } ?>
					</div>
				  </form>
				  </fieldset>
				</div>
			  </div>
			  <?php echo $content_bottom; ?> 
			</div>
		</div>
	</div>
</div>	
<script type="text/javascript"><!--
$('#login input').keydown(function(e) {
	if (e.keyCode == 13) {
		$('#login').submit();
	}
});
//--></script> 
<?php echo $footer; ?>