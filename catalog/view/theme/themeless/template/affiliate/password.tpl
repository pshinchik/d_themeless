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
			<div id="content"><?php echo $content_top; ?>
			  <h1><?php echo $heading_title; ?></h1>
			  <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data">
				<h2><?php echo $text_password; ?></h2>
				<div class="content">
				  <table class="form">
					<tr>
					  <td><span class="required">*</span> <?php echo $entry_password; ?></td>
					  <td><input type="password" name="password" value="<?php echo $password; ?>" />
						<?php if ($error_password) { ?>
						<span class="error"><?php echo $error_password; ?></span>
						<?php } ?></td>
					</tr>
					<tr>
					  <td><span class="required">*</span> <?php echo $entry_confirm; ?></td>
					  <td><input type="password" name="confirm" value="<?php echo $confirm; ?>" />
						<?php if ($error_confirm) { ?>
						<span class="error"><?php echo $error_confirm; ?></span>
						<?php } ?></td>
					</tr>
				  </table>
				</div>
				<div class="buttons">
				  <div class="left"><a href="<?php echo $back; ?>" class="button"><?php echo $button_back; ?></a></div>
				  <div class="right"><input type="submit" value="<?php echo $button_continue; ?>" class="button" /></div>
				</div>
			  </form>
			  <?php echo $content_bottom; ?>
			</div>
		</div>
	</div>
</div>	
<?php echo $footer; ?>