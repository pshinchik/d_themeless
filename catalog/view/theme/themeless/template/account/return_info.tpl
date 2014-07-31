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
			  <table class="list table table-condensed table-bordered">
				<thead>
				  <tr>
					<th class="left" colspan="2"><?php echo $text_return_detail; ?></th>
				  </tr>
				</thead>
				<tbody>
				  <tr>
					<td class="left" style="width: 50%;"><b><?php echo $text_return_id; ?></b> #<?php echo $return_id; ?><br />
					  <b><?php echo $text_date_added; ?></b> <?php echo $date_added; ?></td>
					<td class="left" style="width: 50%;"><b><?php echo $text_order_id; ?></b> #<?php echo $order_id; ?><br />
					  <b><?php echo $text_date_ordered; ?></b> <?php echo $date_ordered; ?></td>
				  </tr>
				</tbody>
			  </table>
			  <h2><?php echo $text_product; ?></h2>
			  <table class="list table table-bordered table-condensed">
				<thead>
				  <tr>
					<th class="left" style="width: 33.3%;"><?php echo $column_product; ?></th>
					<th class="left" style="width: 33.3%;"><?php echo $column_model; ?></th>
					<th class="right" style="width: 33.3%;"><?php echo $column_quantity; ?></th>
				  </tr>
				</thead>
				<tbody>
				  <tr>
					<td class="left"><?php echo $product; ?></td>
					<td class="left"><?php echo $model; ?></td>
					<td class="right"><?php echo $quantity; ?></td>
				  </tr>
				</tbody>
			  </table>
			  <table class="list table table-bordered table-condensed">
				<thead>
				  <tr>
					<th class="left" style="width: 33.3%;"><?php echo $column_reason; ?></th>
					<th class="left" style="width: 33.3%;"><?php echo $column_opened; ?></th>
					<th class="left" style="width: 33.3%;"><?php echo $column_action; ?></th>
				  </tr>
				</thead>
				<tbody>
				  <tr>
					<td class="left"><?php echo $reason; ?></td>
					<td class="left"><?php echo $opened; ?></td>
					<td class="left"><?php echo $action; ?></td>
				  </tr>
				</tbody>
			  </table>
			  <?php if ($comment) { ?>
			  <table class="list table table-bordered table-condensed">
				<thead>
				  <tr>
					<th class="left"><?php echo $text_comment; ?></th>
				  </tr>
				</thead>
				<tbody>
				  <tr>
					<td class="left"><?php echo $comment; ?></td>
				  </tr>
				</tbody>
			  </table>
			  <?php } ?>
			  <?php if ($histories) { ?>
			  <h2><?php echo $text_history; ?></h2>
			  <table class="list table table-bordered table-condensed">
				<thead>
				  <tr>
					<th class="left" style="width: 33.3%;"><?php echo $column_date_added; ?></th>
					<th class="left" style="width: 33.3%;"><?php echo $column_status; ?></th>
					<th class="left" style="width: 33.3%;"><?php echo $column_comment; ?></th>
				  </tr>
				</thead>
				<tbody>
				  <?php foreach ($histories as $history) { ?>
				  <tr>
					<td class="left"><?php echo $history['date_added']; ?></td>
					<td class="left"><?php echo $history['status']; ?></td>
					<td class="left"><?php echo $history['comment']; ?></td>
				  </tr>
				  <?php } ?>
				</tbody>
			  </table>
			  <?php } ?>
			  <div class="buttons">
				<div class="right"><a href="<?php echo $continue; ?>" class="button"><?php echo $button_continue; ?></a></div>
			  </div>
			  <?php echo $content_bottom; ?>
			</div>
		</div>
	</div>
</div>	
<?php echo $footer; ?>