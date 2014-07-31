<?php echo $header; ?>
<div class="home-breadcrumb">
	<div class="layout"><!-- layout -->
		<div class="wrap"><!-- wrap -->
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
	</div>
</div>
<div id="content_holder"><!-- content_holder -->
	<div class="layout"><!-- layout -->
		<div class="wrap"><!-- wrap -->
		<?php echo $column_left; ?><?php echo $column_right; ?>
			<div id="content"><?php echo $content_top; ?><!-- content -->
			  <h1><?php echo $heading_title; ?></h1>
			  <br />
			  <?php if ($categories) { ?>
			  <div class="row">
			  <div class="col-sm-2"><b><?php echo $text_index; ?></b></div>
				<div class="btn-group col-sm-10">
				<?php foreach ($categories as $category) { ?>
				<a href="index.php?route=product/manufacturer#<?php echo $category['name']; ?>" class="btn"><b><?php echo $category['name']; ?></b></a>
				<?php } ?>
				</div>
			  </div>
			  <br />
			  <?php foreach ($categories as $category) { ?>
			  <div class="manufacturer-list row">
				<div class="manufacturer-heading col-sm-1"><b><?php echo $category['name']; ?></b><a id="<?php echo $category['name']; ?>"></a></div>
				<div class="manufacturer-content col-sm-11">
				  <?php if ($category['manufacturer']) { ?>
				  <ul class="nav-pills">
				  <?php for ($i = 0; $i < count($category['manufacturer']);$i++) { ?>
				  
					<?php if (isset($category['manufacturer'][$i])) { ?>
					<li class="active"><a href="<?php echo $category['manufacturer'][$i]['href']; ?>"><span class="icon icon-white icon-certificate"></span> <?php echo $category['manufacturer'][$i]['name']; ?></a></li>
					<?php } ?>
				  
				  <?php } ?>
				  </ul>
				  <?php } ?>
				</div>
			  </div>
			  <?php } ?>
			  <?php } else { ?>
			  <div class="content"><?php echo $text_empty; ?></div>
			  <div class="buttons">
				<div class="right"><a href="<?php echo $continue; ?>" class="button"><?php echo $button_continue; ?></a></div>
			  </div>
			  <?php } ?>
			  <?php echo $content_bottom; ?>
			</div>
		</div>
	</div>
</div>	
<?php echo $footer; ?>