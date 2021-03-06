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
			  <p><?php echo $text_total; ?><b> <?php echo $total; ?></b>.</p>
			  <table class="list table table-condensed table-bordered">
				<thead>
				  <tr>
					<th class="left"><?php echo $column_date_added; ?></th>
					<th class="left"><?php echo $column_description; ?></th>
					<th class="right"><?php echo $column_points; ?></th>
				  </tr>
				</thead>
				<tbody>
				  <?php if ($rewards) { ?>
				  <?php foreach ($rewards  as $reward) { ?>
				  <tr>
					<td class="left"><?php echo $reward['date_added']; ?></td>
					<td class="left"><?php if ($reward['order_id']) { ?>
					  <a href="<?php echo $reward['href']; ?>"><?php echo $reward['description']; ?></a>
					  <?php } else { ?>
					  <?php echo $reward['description']; ?>
					  <?php } ?></td>
					<td class="right"><?php echo $reward['points']; ?></td>
				  </tr>
				  <?php } ?>
				  <?php } else { ?>
				  <tr>
					<td class="center" colspan="5"><?php echo $text_empty; ?></td>
				  </tr>
				  <?php } ?>
				</tbody>
			  </table>
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