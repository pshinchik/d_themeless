<div id="slideshow<?php echo $module; ?>" class="carousel slide">
  <div class="carousel-inner">
    <?php $f = true; foreach ($banners as $banner) { ?>
    <div class="item<?php if($f) echo ' active'; $f=false; ?>">
    <?php if ($banner['link']) { ?>
    <a href="<?php echo $banner['link']; ?>"><img src="<?php echo $banner['image']; ?>" alt="<?php echo $banner['title']; ?>" /></a>
    <?php } else { ?>
    <img src="<?php echo $banner['image']; ?>" alt="<?php echo $banner['title']; ?>" />
    <?php } ?>
    </div>
    <?php } ?>
  </div>
  <a class="carousel-control left" href="#slideshow<?php echo $module; ?>" data-slide="prev"><i class="icon icon-chevron-left"></i></a>
  <a class="carousel-control right" href="#slideshow<?php echo $module; ?>" data-slide="next"><i class="icon icon-chevron-right"></i></a>
</div>
<script type="text/javascript"><!--
$('#slideshow<?php echo $module; ?>').carousel()
--></script>