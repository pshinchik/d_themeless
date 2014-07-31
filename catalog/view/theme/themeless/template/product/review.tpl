<?php if ($reviews) { ?>
<?php foreach ($reviews as $review) { ?>
<div class="row-fluid">
	<div class="span3">
		<span class="icon icon-user"></span> <b><?php echo $review['author']; ?></b><br />
		<small><?php echo $review['date_added']; ?></small><br />
		<img src="catalog/view/theme/default-bootstrap/image/stars-<?php echo $review['rating'] . '.png'; ?>" alt="<?php echo $review['reviews']; ?>" />
	</div>
	<div class="span9">
		<?php echo $review['text']; ?>
	</div>
</div>
<hr />
<?php } ?>
<div class="pagination"><?php echo $pagination; ?></div>
<?php } else { ?>
<div class="content"><?php echo $text_no_reviews; ?></div>
<?php } ?>
