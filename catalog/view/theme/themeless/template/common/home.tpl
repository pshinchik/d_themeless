<?php echo $header; ?>
<div class="home-breadcrumb">
	<div class="layout"><!-- breadcrumb layout -->
		<div class="wrap"><!-- breadcrumb wrap -->
			<div class="breadcrumb">
				<?php foreach ($breadcrumbs as $breadcrumb) { ?>
				<?php echo $breadcrumb['separator']; ?><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a>
				<?php } ?>
			</div>
		</div><!-- breadcrumb wrap end -->
	</div><!-- breadcrumb layout end -->
</div>

<div id="content_holder">
	<div class="layout">
		<div class="wrap">
			<?php echo $column_left; ?><?php echo $column_right; ?>  
			<article id="content-home" class="home-page">
				<div class="wrap">
					<?php echo $content_top; ?>
					<div class="h1 page-title" style="display: none"><?php echo $heading_title; ?></div>  
				</div><!--article wrap-->
			</article>
		</div><!--content wrap-->
	</div><!--content layout-->
</div><!--content_holder-->

<?php if ($content_bottom) { ?>
<div class="info-text">
    <div class="layout">
        <div class="wrap">
            <?php echo $content_bottom; ?>
        </div>
    </div>
</div>
<?php } ?>
<div class="clear"></div>
<?php echo $footer; ?>