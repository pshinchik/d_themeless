<style>
<?php if(isset($settings['general']['general_font_size'])||isset($settings['general']['general_color_background'])||isset($settings['general']['general_font_family'])||isset($settings['general']['general_color_text'])){?>
#d_mega_menu ul li a{
	background-color: <?php echo $settings['general']['general_color_background'];?>;
	color: <?php echo $settings['general']['general_color_text'];?>;
	font-size : <?php echo $settings['general']['general_font_size'];?>px;
	font-family: <?php echo $settings['general']['general_font_family'];?>;
	font-weight: <?php echo $settings['general']['general_font_weight'];?>;
}
#d_mega_menu {
    background:<?php echo $settings['general']['general_color_background'];?>;
    }
<?php } ?>
<?php if(isset($settings['general']['general_custom_styles'])) { echo $settings['general']['general_custom_styles']; }?>;
</style>
<?php if($settings['general']['debug']){?>
<div id="d_mega_menu_debug">
	<div class="heading">General</div>
		<pre><?php print_r($settings['general']); ?></pre>
	<div class="heading">Menu</div>
		<pre><?php print_r($d_mega_menu); ?></pre>
<?php } ?>

<nav id="d_mega_menu">
   <?php echo $menu; ?>
</nav>
<script type="text/javascript"> 
$('#menu').hide(); 
$('#d_mega_menu').prepend('<div id="menu-button">Menu</div>');
	$('#d_mega_menu #menu-button').on('click', function(){
		var menu = $(this).next('ul');
		if (menu.hasClass('open')) {
			menu.removeClass('open');
		}
		else {
			menu.addClass('open');
		}
	});
	</script>
<script>

$('#d_mega_menu ul:first').addClass('category-menu');
$('#d_mega_menu li ul li i.icon-chevron-down').removeClass('icon-chevron-down');
$('#d_mega_menu li ul li ul li i').addClass('icon-chevron-down');

</script>	