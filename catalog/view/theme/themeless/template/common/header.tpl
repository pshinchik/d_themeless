<!DOCTYPE html>
<html dir="<?php echo $direction; ?>" lang="<?php echo $lang; ?>">
<!-- the "no-js" class is for Modernizr. -->
<head>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title><?php echo $title; ?></title>
<base href="<?php echo $base; ?>" />
<?php if ($description) { ?>
<meta name="description" content="<?php echo $description; ?>" />
<?php } ?>
<?php if ($keywords) { ?>
<meta name="keywords" content="<?php echo $keywords; ?>" />
<?php } ?>
<?php if ($icon) { ?>
<link href="<?php echo $icon; ?>" rel="icon" />
<?php } ?>
<?php foreach ($links as $link) { ?>
<link href="<?php echo $link['href']; ?>" rel="<?php echo $link['rel']; ?>" />
<?php } ?>
<?php foreach ($styles as $style) { ?>
<link rel="<?php echo $style['rel']; ?>" type="text/css" href="<?php echo $style['href']; ?>" media="<?php echo $style['media']; ?>" />
<?php } ?>
<link href='http://fonts.googleapis.com/css?family=PT+Sans+Narrow:400,700&subset=latin,cyrillic-ext,latin-ext,cyrillic' rel='stylesheet' type='text/css'>

<script type="text/javascript" src="catalog/view/javascript/jquery/jquery-1.7.1.min.js"></script>
<script type="text/javascript" src="catalog/view/javascript/jquery/ui/jquery-ui-1.8.16.custom.min.js"></script>
<link rel="stylesheet" type="text/css" href="catalog/view/javascript/jquery/ui/themes/ui-lightness/jquery-ui-1.8.16.custom.css" />
<script type="text/javascript" src="catalog/view/javascript/jquery/ui/external/jquery.cookie.js"></script>
<script type="text/javascript" src="catalog/view/javascript/jquery/colorbox/jquery.colorbox.js"></script>
<link rel="stylesheet" type="text/css" href="catalog/view/javascript/jquery/colorbox/colorbox.css" media="screen" />

<script type="text/javascript" charset="utf-8">
      $(function(){
        $("input:checkbox.styled, input:radio.styled").uniform();
      });
</script>

<?php foreach ($scripts as $script) { ?>
<script type="text/javascript" src="<?php echo $script; ?>"></script>
<?php } ?>
<!--[if IE 7]>
<link rel="stylesheet" type="text/css" href="catalog/view/theme/themeless/stylesheet/ie7.css" />
<![endif]-->
<!--[if lt IE 7]>
<link rel="stylesheet" type="text/css" href="catalog/view/theme/themeless/stylesheet/ie6.css" />
<script type="text/javascript" src="catalog/view/javascript/DD_belatedPNG_0.0.8a-min.js"></script>
<script type="text/javascript">
DD_belatedPNG.fix('#logo img');
</script>
<![endif]-->
<?php echo $google_analytics; ?>
</head>
<body>
<div class="wrapper">
<header id="header"><!-- header -->
<div class="header-top-bg"><!-- header-top-bg -->
<div class="layout"><!-- layout -->
	<div class="wrap"><!-- wrap -->
		<div class="header-top">
			<div class="row">
				<div class="col-xs-12 col-sm-4 phone-line">
					<div class="pull-left-contact-main">
						<div class="top-contact">		
							<span>Contact us:</span> 	
							<?php if(isset($config['contact']['phone'][1]['id'])){?>
								<div class="phone">
									<i class="icon-phone"></i>
									<ul>
										<?php foreach($config['contact']['phone'] as $phone){?>
											<?php if(isset($phone['id'])){ ?>
												<li>
												<a href="skype:<?php echo $phone['code'].$phone['number'];?>"> <small>(<?php echo $phone['code'];?>)</small><?php echo $phone['number'];?></a>
												</li>
											<?php } ?>
										<?php } ?>
									</ul>
								</div>
							<?php }?>
							<?php if(isset($config['contact']['skype'][1]['id'])){ ?>
								<div class="skype">
									<i class="icon-skype"></i>
									<ul>
										<?php foreach($config['contact']['skype'] as $skype){?>
											<?php if(isset($skype['id'])){ ?>
												<li>
												<a href="skype:<?php echo $skype['code'];?>?add"><?php echo $skype['code'];?></a>
												</li>
											<?php } ?>
										<?php } ?>
									</ul>
								</div>
							<?php } ?>		
						</div>
					</div>
				</div>
				<div class="col-xs-12 col-sm-8 top-info-block">
					<div class="pull-right">
						<div class="pull-right hide-div">
							<ul class="header-information">
								<?php if(isset($informations)){
								  foreach(array_reverse($informations) as $information ) { ?> 
										<li><a href="<?php echo $information['href'];?>"><?php echo $information['title'];?></a></li>
								<?php }
								  }
								?>
							</ul>
						</div>
						<div class="pull-right hide-div">
							<div id="profile" class="btn-group links">
								<a class="link-profile dropdown-toggle" data-toggle="dropdown" href="#"><?php echo $text_profile; ?> <i class="icon-chevron-down"></i></a>
								<ul class="dropdown-menu">
									<div class="dropdown-list-border"><span class="arrow-up"></span></div>
									<?php if (!$logged) { ?>
									<li><?php echo $text_welcome; ?></li>
									<?php } else { ?>
									<li><?php echo $text_logged; ?></li>
									<?php } ?>
									<li><a href="<?php echo $wishlist; ?>" id="wishlist-total"><?php echo $text_wishlist; ?></a></li>
									<li><a href="<?php echo $account; ?>"><?php echo $text_account; ?></a></li>
									<li><a href="<?php echo $shopping_cart; ?>"><?php echo $text_shopping_cart; ?></a></li>
									<li><a href="<?php echo $checkout; ?>"><?php echo $text_checkout; ?></a></li>
								</ul>
							</div>
						</div>
						<div class="pull-right hide-div">
							<div class="pull-left" style="margin-right: 20px;">
								<?php echo $language; ?>
							</div>
							<div class="pull-right hide-div">
								<?php echo $currency; ?>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>	
	</div><!-- wrap end -->
</div><!-- layout end -->
</div><!-- header-top-bg end -->
<div id="middle" class="row">
	<div class="layout"><!-- layout -->
		<div class="wrap"><!-- wrap -->
				<div class="col-xs-12 col-sm-4 logo">
					<?php if ($logo) { ?>
					<div id="logo"><a href="<?php echo $home; ?>"><img src="<?php echo $logo; ?>" title="<?php echo $name; ?>" alt="<?php echo $name; ?>" /></a></div>
					<?php } ?>
				</div>
				<div class="col-xs-12 col-sm-4 pull-center-search">
					<div id="search" class="input-prepend input-append pull-left">
					  <?php if(isset($search)){ ?>
						<div class="button-search first"><i class="icon-magnifying-glass"></i></div>
						<input type="text" class="input-search search-query"  name="search" placeholder="<?php echo $text_search; ?>" value="<?php echo $search; ?>" />
						<div class="button-search last"><i class="icon-search"></i></div>
					  <?php } ?>
					</div>
				</div>
				<div class="col-xs-12 col-sm-4 pull-center-cart">
					<?php echo $cart; ?>
				</div>
					
			<!--<div class="row-fluid">
				<div class="span6">

				</div>
				<div class="span12 visible-phone">
					<div class="pull-right">
						<div class="pull-left" style="margin-right: 20px;">
							<?php echo $language; ?>
						</div>
						<div class="pull-right">
							<?php echo $currency; ?>
						</div>
					</div>
				</div>
				<div class="span6">
					<ul class="links pull-right inline">
						<li><a href="<?php echo $home; ?>"><?php echo $text_home; ?></a></li>
						<li><a href="<?php echo $wishlist; ?>" id="wishlist-total"><?php echo $text_wishlist; ?></a></li>
						<li><a href="<?php echo $account; ?>"><?php echo $text_account; ?></a></li>
						<li><a href="<?php echo $shopping_cart; ?>"><?php echo $text_shopping_cart; ?></a></li>
						<li><a href="<?php echo $checkout; ?>"><?php echo $text_checkout; ?></a></li>
					</ul>
				</div>
			</div>-->
		</div>
	</div>	
</div>
<div id="main-menu-bg">
	<div class="layout"><!-- layout --> 
		<div class="wrap"><!-- wrap -->
			<?php if ($categories) { ?>
			<div id="menu" class="navbar navbar-inverse">
				<div class="navbar-inner">
					<div class="container">
						<a class="btn btn-navbar btn-block" data-target=".navbar-inverse-collapse" data-toggle="collapse">
							<span class="icon icon-elusive-icons-1"></span> MENU
						</a>
						<div class="nav-collapse collapse navbar-inverse-collapse">
							<ul class="nav nav-pills">
								<?php foreach ($categories as $category) { ?>
									<?php if ($category['children']) { ?>
										<li class="dropdown">
											<a class="dropdown-toggle" data-toggle="dropdown" href="<?php echo $category['href']; ?>"><?php echo $category['name']; ?><span class="icon-chevron-down"></span></a>
											<?php for ($i = 0; $i < count($category['children']);) { ?>
											<ul class="dropdown-menu column">
											<?php $j = $i + ceil(count($category['children']) / $category['column']); ?>
												<!--<li>
													<a href="<?php echo $category['href']; ?>"><b><?php echo $category['name']; ?></b></a>
												</li>-->
												<?php for (; $i < $j; $i++) { ?>
													<?php if (isset($category['children'][$i])) { ?>
													<li>
														<a href="<?php echo $category['children'][$i]['href']; ?>"><?php echo $category['children'][$i]['name']; ?></a>
													</li>
													<?php } ?>
												<?php } ?>			
											</ul>
											<?php } ?>
										</li>
									<?php } else { ?>
									<li><a href="<?php echo $category['href']; ?>"><?php echo $category['name']; ?></a></li>
									<?php } ?>
								<?php } ?>
							</ul>
						</div>
					</div>
				</div>
			</div>
			<?php } ?>
		</div>
	</div><!-- layout end -->	
</div>
<div id="column_header_holder">
    <div class="layout">
      <div class="wrap"> <?php echo $column_header; ?> </div>
    </div>
</div>
<div class="clear"></div>	
</header><!-- header end -->

<div id="conteiner">
<div class="content"><!-- content -->
<div id="notification_holder">
  <div class="layout">
    <div class="wrap">
      <div id="notification"></div>
    </div>
  </div>
</div>	
