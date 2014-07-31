<div id="cart" style="text-align: right;">
  <span class="heading pull-center" data-toggle="modal" data-target="#miniCart">
  	<a class="btn">
    	<span class="cart-box-icon">
			<i class="icon-cart-shopping"></i>
		</span>
		<span class="cart-box">
			<span id="cart-total">
				<span style="color: #555555; font-size: 16px; font-weight: bold; text-transform: uppercase;"><?php echo $heading_title; ?></span><?php echo $text_items; ?>
			</span>
		</span>
    </a>
  </span>
  <div class="content modal hide fade" id="miniCart">
  	<div class="modal-header">
		<span class="close" data-dismiss="modal" aria-hidden="true">x</span>
		<h3 id="miniCartLabel"><?php echo $heading_title; ?></h3>
	</div>
	<div class="clear"></div>
	<div class="modal-body">
    <?php if ($products || $vouchers) { ?>
    <div class="mini-cart-info">
      <table class="table table-condensed">
        <?php foreach ($products as $product) { ?>
        <tr>
          <td class="image hidden-phone"><?php if ($product['thumb']) { ?>
            <a href="<?php echo $product['href']; ?>"><img src="<?php echo $product['thumb']; ?>" alt="<?php echo $product['name']; ?>" title="<?php echo $product['name']; ?>" /></a>
            <?php } ?></td>
          <td class="name">
			<?php if ($product['thumb']) { ?>
            <a href="<?php echo $product['href']; ?>" class="visible-phone"><img src="<?php echo $product['thumb']; ?>" alt="<?php echo $product['name']; ?>" title="<?php echo $product['name']; ?>" /></a>
            <?php } ?>
			<a href="<?php echo $product['href']; ?>"><?php echo $product['name']; ?></a>
            <div>
              <?php foreach ($product['option'] as $option) { ?>
              - <small><?php echo $option['name']; ?> <?php echo $option['value']; ?></small><br />
              <?php } ?>
            </div></td>
          <td class="quantity">x&nbsp;<?php echo $product['quantity']; ?></td>
          <td class="total"><?php echo $product['total']; ?></td>
          <td class="remove"><img src="catalog/view/theme/default/image/remove-small.png" alt="<?php echo $button_remove; ?>" title="<?php echo $button_remove; ?>" onclick="if(getURLVar('route') == 'checkout/cart' || getURLVar('route') == 'checkout/checkout'){ location = 'index.php?route=checkout/cart&remove=<?php echo $product['key']; ?>'} else{$('#cart .modal-body').load('index.php?route=module/cart&remove=<?php echo $product['key']; ?>' + ' .modal-body .mini-cart-info');$('#cart .heading').load('index.php?route=module/cart&remove=<?php echo $product['key']; ?>' + ' .heading a.btn'); };" /></td>
        </tr>
        <?php } ?>
        <?php foreach ($vouchers as $voucher) { ?>
        <tr>
          <td class="image hidden-phone"></td>
          <td class="name"><?php echo $voucher['description']; ?></td>
          <td class="quantity">x&nbsp;1</td>
          <td class="total"><?php echo $voucher['amount']; ?></td>
          <td class="remove"><img src="catalog/view/theme/default/image/remove-small.png" alt="<?php echo $button_remove; ?>" title="<?php echo $button_remove; ?>" onclick="(getURLVar('route') == 'checkout/cart' || getURLVar('route') == 'checkout/checkout') ? location = 'index.php?route=checkout/cart&remove=<?php echo $voucher['key']; ?>' : $('#cart').load('index.php?route=module/cart&remove=<?php echo $voucher['key']; ?>' + ' #cart > *');" /></td>
        </tr>
        <?php } ?>
      </table>
    </div>
    <div class="mini-cart-total">
      <table class="table table-condensed">
        <?php foreach ($totals as $total) { ?>
        <tr>
          <td class="pull-right"><b><?php echo $total['title']; ?>:</b></td>
          <td class="pull-right"><?php echo $total['text']; ?></td>
        </tr>
        <?php } ?>
      </table>
    </div>
    <?php } else { ?>
    <div class="empty"><?php echo $text_empty; ?></div>
    <?php } ?>
    </div>
    <div class="modal-footer">
		<a href="<?php echo $cart; ?>" class="button btn btn-primary"><span class="icon icon-white icon-shopping-cart"></span> <?php echo $text_cart; ?></a>
		<a href="<?php echo $checkout; ?>" class="button btn btn-primary"><span class="icon icon-white icon-circle-arrow-right"></span> <?php echo $text_checkout; ?></a>
	</div>
  </div>
</div>