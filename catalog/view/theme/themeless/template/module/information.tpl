<div class="box">
  <div class="box-heading breadcrumb">
		  	<h5 class="visible-desktop"><?php echo $heading_title; ?></h5>
		  	<a class="btn btn-navbar hidden-desktop" data-target=".nav-infos" data-toggle="collapse">
		  		<span class="icon icon-align-justify"></span> <?php echo $heading_title; ?>
			</a>
		  </div>
  <div class="box-content">
    <ul class="nav nav-tabs nav-stacked nav-collapse collapse nav-infos">
      <?php foreach ($informations as $information) { ?>
      <li><a href="<?php echo $information['href']; ?>"><?php echo $information['title']; ?></a></li>
      <?php } ?>
      <li><a href="<?php echo $contact; ?>"><?php echo $text_contact; ?></a></li>
      <li><a href="<?php echo $sitemap; ?>"><?php echo $text_sitemap; ?></a></li>
    </ul>
  </div>
</div>
