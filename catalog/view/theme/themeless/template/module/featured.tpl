<div class="box row module-keep-resized">
  <div class="box-heading breadcrumb"><h3><?php echo $heading_title; ?></h3></div>
  <div class="box-content">
    <div class="box-product">
      <?php $i = 0; foreach ($products as $product) { ?>
      <?php if( ($i % 4)==0) echo '<div style="clear: both;"></div>';?>
      <div class="col-xs-6 col-sm-3 img-polaroid product-bottom"<?php if( ($i % 4)==0) echo ' style="margin-left: 0px;"'; $i++; ?>>
        <?php if ($product['thumb']) { ?>
        <div class="image"><a href="<?php echo $product['href']; ?>"><img src="<?php echo $product['thumb']; ?>" alt="<?php echo $product['name']; ?>" /></a></div>
        <?php } ?>
        <div class="name"><a href="<?php echo $product['href']; ?>"><?php echo $product['name']; ?></a></div>
        <?php if ($product['price']) { ?>
        <div class="price">
          <?php if (!$product['special']) { ?>
          <span class="label label-info"><span class="icon icon-white icon-tag"></span> <?php echo $product['price']; ?></span>
          <?php } else { ?>
          <span class="price-old"><?php echo $product['price']; ?></span> <span class="price-new label label-warning"><span class="icon icon-white icon-tag"></span> <?php echo $product['special']; ?></span>
          <?php } ?>
        </div>
        <?php } ?>
        <div class="cart"><a href="#" onclick="addToCart('<?php echo $product['product_id']; ?>');event.preventDefault()" class="button btn btn-primary" ><span class="icon icon-white icon-shopping-cart"></span> <?php echo $button_cart; ?></a></div>
      </div>
      <?php } ?>
    </div>
  </div>
</div>
