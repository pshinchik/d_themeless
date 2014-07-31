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
			  <table class="list table table-bordered table-condensed">
				<thead>
				  <tr>
					<th class="left" colspan="2"><?php echo $text_order_detail; ?></th>
				  </tr>
				</thead>
				<tbody>
				  <tr>
					<td class="left" style="width: 50%;"><?php if ($invoice_no) { ?>
					  <b><?php echo $text_invoice_no; ?></b> <?php echo $invoice_no; ?><br />
					  <?php } ?>
					  <b><?php echo $text_order_id; ?></b> #<?php echo $order_id; ?><br />
					  <b><?php echo $text_date_added; ?></b> <?php echo $date_added; ?></td>
					<td class="left" style="width: 50%;"><?php if ($payment_method) { ?>
					  <b><?php echo $text_payment_method; ?></b> <?php echo $payment_method; ?><br />
					  <?php } ?>
					  <?php if ($shipping_method) { ?>
					  <b><?php echo $text_shipping_method; ?></b> <?php echo $shipping_method; ?>
					  <?php } ?></td>
				  </tr>
				</tbody>
			  </table>
			  <table class="list table table-bordered table-condensed">
				<thead>
				  <tr>
					<th class="left"><?php echo $text_payment_address; ?></th>
					<?php if ($shipping_address) { ?>
					<th class="left"><?php echo $text_shipping_address; ?></th>
					<?php } ?>
				  </tr>
				</thead>
				<tbody>
				  <tr>
					<td class="left"><?php echo $payment_address; ?></td>
					<?php if ($shipping_address) { ?>
					<td class="left"><?php echo $shipping_address; ?></td>
					<?php } ?>
				  </tr>
				</tbody>
			  </table>
			  <table class="list table table-bordered table-condensed">
				<thead>
				  <tr>
					<th class="left"><?php echo $column_name; ?></th>
					<th class="left"><?php echo $column_model; ?></th>
					<th class="right"><?php echo $column_quantity; ?></th>
					<th class="right"><?php echo $column_price; ?></th>
					<th class="right"><?php echo $column_total; ?></th>
					<?php if ($products) { ?>
					<th style="width: 1px;"></th>
					<?php } ?>
				  </tr>
				</thead>
				<tbody>
				  <?php foreach ($products as $product) { ?>
				  <tr>
					<td class="left"><?php echo $product['name']; ?>
					  <?php foreach ($product['option'] as $option) { ?>
					  <br />
					  &nbsp;<small> - <?php echo $option['name']; ?>: <?php echo $option['value']; ?></small>
					  <?php } ?></td>
					<td class="left"><?php echo $product['model']; ?></td>
					<td class="right"><?php echo $product['quantity']; ?></td>
					<td class="right"><?php echo $product['price']; ?></td>
					<td class="right"><?php echo $product['total']; ?></td>
					<td class="right"><a href="<?php echo $product['return']; ?>"><img src="catalog/view/theme/default/image/return.png" alt="<?php echo $button_return; ?>" title="<?php echo $button_return; ?>" /></a></td>
				  </tr>
				  <?php } ?>
				  <?php foreach ($vouchers as $voucher) { ?>
				  <tr>
					<td class="left"><?php echo $voucher['description']; ?></td>
					<td class="left"></td>
					<td class="right">1</td>
					<td class="right"><?php echo $voucher['amount']; ?></td>
					<td class="right"><?php echo $voucher['amount']; ?></td>
					<?php if ($products) { ?>
					<td></td>
					<?php } ?>
				  </tr>
				  <?php } ?>
				</tbody>
				<tfoot>
				  <?php foreach ($totals as $total) { ?>
				  <tr>
					<td colspan="3"></td>
					<td class="right"><b><?php echo $total['title']; ?>:</b></td>
					<td class="right"><?php echo $total['text']; ?></td>
					<?php if ($products) { ?>
					<td></td>
					<?php } ?>
				  </tr>
				  <?php } ?>
				</tfoot>
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
					<th class="left"><?php echo $column_date_added; ?></th>
					<th class="left"><?php echo $column_status; ?></th>
					<th class="left"><?php echo $column_comment; ?></th>
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