<div class="box well column-account">
  <div class="box-heading">
  	<h5 class="visible-desktop"><?php echo $heading_title; ?></h5>
  	<a class="btn btn-navbar hidden-desktop" data-target=".nav-account" data-toggle="collapse">
  		<span class="icon icon-user"></span> <?php echo $heading_title; ?>
	</a>
  </div>
  <div class="box-content">
    <ul class="nav-stacked nav-collapse collapse nav-account">
      <?php if (!$logged) { ?>
      <li><i class="icon icon-chevron-down"></i><a href="<?php echo $login; ?>"><?php echo $text_login; ?></a></li>
      <li><i class="icon icon-chevron-down"></i><a href="<?php echo $register; ?>"><?php echo $text_register; ?></a></li>
      <li><i class="icon icon-chevron-down"></i><a href="<?php echo $forgotten; ?>"><?php echo $text_forgotten; ?></a></li>
      <?php } ?>
      <li><i class="icon icon-chevron-down"></i><a href="<?php echo $account; ?>"><?php echo $text_account; ?></a></li>
      <?php if ($logged) { ?>
      <li><i class="icon icon-chevron-down"></i><a href="<?php echo $edit; ?>"><?php echo $text_edit; ?></a></li>
      <li><i class="icon icon-chevron-down"></i><a href="<?php echo $password; ?>"><?php echo $text_password; ?></a></li>
      <?php } ?>
      <li><i class="icon icon-chevron-down"></i><a href="<?php echo $wishlist; ?>"><?php echo $text_wishlist; ?></a></li>
      <li><i class="icon icon-chevron-down"></i><a href="<?php echo $order; ?>"><?php echo $text_order; ?></a></li>
      <li><i class="icon icon-chevron-down"></i><a href="<?php echo $download; ?>"><?php echo $text_download; ?></a></li>
      <li><i class="icon icon-chevron-down"></i><a href="<?php echo $return; ?>"><?php echo $text_return; ?></a></li>
      <li><i class="icon icon-chevron-down"></i><a href="<?php echo $transaction; ?>"><?php echo $text_transaction; ?></a></li>
      <li><i class="icon icon-chevron-down"></i><a href="<?php echo $newsletter; ?>"><?php echo $text_newsletter; ?></a></li>
      <?php if ($logged) { ?>
      <li><i class="icon icon-chevron-down"></i><a href="<?php echo $logout; ?>"><?php echo $text_logout; ?></a></li>
      <?php } ?>
    </ul>
  </div>
</div>
