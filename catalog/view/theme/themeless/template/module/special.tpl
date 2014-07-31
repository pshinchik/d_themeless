<div class="box row-fluid module-keep-resized">
  <div class="box-heading breadcrumb"><h5><?php echo $heading_title; ?></h5></div>
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
          <?php echo $product['price']; ?>
          <?php } else { ?>
          <span class="price-old"><?php echo $product['price']; ?></span> <span class="price-new"><?php echo $product['special']; ?></span>
          <?php } ?>
        </div>
        <?php } ?>
        <div class="cart"><input type="button" value="<?php echo $button_cart; ?>" onclick="addToCart('<?php echo $product['product_id']; ?>');" class="button" /></div>
      </div>
      <?php } ?>
    </div>
  </div>
</div>
