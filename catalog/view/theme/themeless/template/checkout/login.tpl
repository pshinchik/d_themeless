<div class="row">
<div class="left col-sm-6">
	<fieldset>
  <legend><?php echo $text_new_customer; ?></legend>
  <p><?php echo $text_checkout; ?></p>
  <label for="register" class="radio">
    <?php if ($account == 'register') { ?>
    <input type="radio" name="account" value="register" id="register" checked="checked" class="styled" />
    <?php } else { ?>
    <input type="radio" name="account" value="register" id="register" class="styled" />
    <?php } ?>
    <b><?php echo $text_register; ?></b></label>
  <br />
  <?php if ($guest_checkout) { ?>
  <label for="guest" class="radio">
    <?php if ($account == 'guest') { ?>
    <input type="radio" name="account" value="guest" id="guest" checked="checked" class="styled" />
    <?php } else { ?>
    <input type="radio" name="account" value="guest" id="guest" class="styled" />
    <?php } ?>
    <b><?php echo $text_guest; ?></b></label>
  <br />
  <?php } ?>
  <br />
  <p><?php echo $text_register_account; ?></p>
  <input type="button" value="<?php echo $button_continue; ?>" id="button-account" class="button btn btn-primary" />

</fieldset>
</div>
<div id="login" class="right col-sm-6">
	<fieldset>
		<legend><?php echo $text_returning_customer; ?></legend>
		<p><?php echo $text_i_am_returning_customer; ?></p>
		<b><?php echo $entry_email; ?></b><br />
		<input class="login-email" type="text" name="email" value="" />
		<br />
		<b><?php echo $entry_password; ?></b><br />
		<input class="login-email" type="password" name="password" value="" />
		<br />
		<a href="<?php echo $forgotten; ?>"><?php echo $text_forgotten; ?></a><br />
		<br />
		<input type="button" value="<?php echo $button_login; ?>" id="button-login" class="button btn btn-primary" /><br />
		<br />
    </fieldset>
</div>
</div>