<?php if (count($currencies) > 1) { ?>
<div id="currency">
<form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" id="currency_form">
  <div class="btn-group">
  <a class="link-currency dropdown-toggle" data-toggle="dropdown" href="#">
    <?php foreach($currencies as $currency){
    if($currency['code'] == $currency_code){ ?>
      <?php echo $currency['title']; ?>
   <?php } 
   }
   ?>
    <i class="icon-chevron-down"></i>
  </a>
  <ul class="dropdown-menu"><div class="dropdown-list-border"><span class="arrow-up"></span></div>
  <?php foreach ($currencies as $currency) { ?>
   <li><a onclick="$('input[name=\'currency_code\']').attr('value', '<?php echo $currency['code']; ?>'); $('#currency_form').submit();" >
     <?php echo $currency['title']; ?></a></li>
    <?php } ?>
 </ul>
</div>
    <input type="hidden" name="currency_code" value="" />
    <input type="hidden" name="redirect" value="<?php echo $redirect; ?>" />
    
   
</form>

</div>
<?php } ?>
