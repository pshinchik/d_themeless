</div><!-- content end -->
<div class="push"></div>
</div><!-- conteiner end -->
</div><!-- wrapper end -->
<footer id="footer" class="row breadcrumb"><!-- footer -->
	<div class="layout"><!-- layout -->
		<div class="wrap"><!-- wrap -->
			  <?php if ($informations) { ?>
			  <div class="column col-sm-3">
				<h5><?php echo $text_information; ?></h5>
				<ul class="unstyled">
				  <?php foreach ($informations as $information) { ?>
				  <li><i class="icon-chevron-down"></i><a href="<?php echo $information['href']; ?>"><?php echo $information['title']; ?></a></li>
				  <?php } ?>
				</ul>
			  </div>
			  <?php } ?>
			  <div class="column col-sm-3">
				<h5><?php echo $text_service; ?></h5>
				<ul class="unstyled">
				  <li><i class="icon-chevron-down"></i><a href="<?php echo $contact; ?>"><?php echo $text_contact; ?></a></li>
				  <li><i class="icon-chevron-down"></i><a href="<?php echo $return; ?>"><?php echo $text_return; ?></a></li>
				  <li><i class="icon-chevron-down"></i><a href="<?php echo $sitemap; ?>"><?php echo $text_sitemap; ?></a></li>
				</ul>
			  </div>
			  <div class="column col-sm-3">
				<h5><?php echo $text_extra; ?></h5>
				<ul class="unstyled">
				  <li><i class="icon-chevron-down"></i><a href="<?php echo $manufacturer; ?>"><?php echo $text_manufacturer; ?></a></li>
				  <li><i class="icon-chevron-down"></i><a href="<?php echo $voucher; ?>"><?php echo $text_voucher; ?></a></li>
				  <li><i class="icon-chevron-down"></i><a href="<?php echo $affiliate; ?>"><?php echo $text_affiliate; ?></a></li>
				  <li><i class="icon-chevron-down"></i><a href="<?php echo $special; ?>"><?php echo $text_special; ?></a></li>
				  <!--<li><i class="icon-chevron-down"></i><a href="<?php echo $latest; ?>">рекомендуемые2</a></li>-->
				</ul>
			  </div>
			  <div class="column col-sm-3">
				<h5><?php echo $text_account; ?></h5>
				<ul class="unstyled">
				  <li><i class="icon-chevron-down"></i><a href="<?php echo $account; ?>"><?php echo $text_account; ?></a></li>
				  <li><i class="icon-chevron-down"></i><a href="<?php echo $order; ?>"><?php echo $text_order; ?></a></li>
				  <li><i class="icon-chevron-down"></i><a href="<?php echo $wishlist; ?>"><?php echo $text_wishlist; ?></a></li>
				  <li><i class="icon-chevron-down"></i><a href="<?php echo $newsletter; ?>"><?php echo $text_newsletter; ?></a></li>
				</ul>
			  </div>
		</div><!-- wrap end -->
	</div><!-- layout end -->
	<div class="layout"><!-- layout -->
		<div class="wrap"><!-- wrap -->
			<div id="powered" class="pull-center">
				<span><?php echo $powered; ?></span>
			</div> 
		</div><!-- wrap end -->
	</div><!-- layout end -->
</footer><!-- footer end -->


<div id="phone-spy" class="visible-phone"></div>
</div>
<script type="text/javascript">
	//move #column-right to bottom position
	/*$('#column-right').appendTo('#content_holder > .layout > .wrap');
	// 3 columns design
	if($('#column-left').length > 0 && $('#column-right').length > 0){
		$('#column-left').addClass('col-sm-3');
		$('#column-right').addClass('col-sm-2');
		$('#content').addClass('col-sm-7');
	}*/
	// 2 columns design main left
	if($('#column-left').length > 0 && $('#column-right').length == 0){
		$('#column-left').addClass('col-sm-3');
		$('#content').addClass('col-sm-9');
	}
	$('#column-right').appendTo('#content_holder > .layout > .wrap');
	// 2 columns design main right
	
	if($('#column-left').length == 0 && $('#column-right').length > 0){
		$('#column-right').addClass('col-sm-3');
		$('#content').addClass('col-sm-9');
	}

	//toggle sottocategorie
	$('.cat-toggle').toggle(
		function(){
			$(this).removeClass('icon-white').parents('li:eq(0)').find('ul').slideDown();
			return false;
		},
		function(){
			$(this).addClass('icon-white').parents('li:eq(0)').find('ul').slideUp();
			return false;
		}
	);
	$('.box-category a.active span.cat-toggle').click();
	
	$('.button').addClass('btn btn-primary');
	//$('.success, .warning').appendTo('#notification');
	
	//resize su moduli pensati per essere orizzontali ma messi in verticale
	$('.module-keep-resized').each(function(i,e){
		$(e).find('[class*="span"]').each(function(ii,ee){
			if($(ee).width() < 100)
				$(ee).css({'display':'block','width':'100%','float':'none', 'margin-left':'0'});
		})
	});
</script>
</body></html>