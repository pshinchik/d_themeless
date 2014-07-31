<?php echo $header; ?>
<div id="content">
  <div class="breadcrumb">
    <?php foreach ($breadcrumbs as $breadcrumb) { ?>
    <?php echo $breadcrumb['separator']; ?><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a>
    <?php } ?>
  </div>
  <?php if ($error_warning) { ?>
  <div class="warning"><?php echo $error_warning; ?></div>
  <?php } ?>
  <div class="box">
    <div class="heading">
      <h1><img src="view/image/module.png" alt="" /> <?php echo $heading_title; ?></h1>
      <div class="buttons"><a onclick="$('#form').submit();" class="button"><?php echo $button_save; ?></a><a onclick="location = '<?php echo $cancel; ?>';" class="button"><?php echo $button_cancel; ?></a></div>
    </div>
    <div class="content">
      <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" id="form">
       <div class="vtabs">
           <a href="#tab-1" id="tab-trigger-1" >Settings</a>
           <a href="#tab-2" id="tab-trigger-2" >Category</a>
           <!--<a href="#tab-3" id="tab-trigger-3">Product</a>-->
           <a href="#tab-10" id="tab-trigger-10">Support</a>
       </div>
       <div id="tab-1" class="vtabs-content" style="<?php echo $settings_display; ?>: block; ">
      
      <table class="form">
              <tr>
                <td><?php echo $settings_product_border; ?></td>
                	<td>
                    <?php if(isset($dreamtheme['settings']['product_border']) && $dreamtheme['settings']['product_border'] == 1){ ?> 
                    <input type="radio" value="1" name="dreamtheme[settings][product_border]" checked="checked" /> <?php echo $settings_yes; ?>
                    <input type="radio" value="0" name="dreamtheme[settings][product_border]" /> <?php echo $settings_no; ?>
                    <?php }else{ ?> 
                    <input type="radio" value="1" name="dreamtheme[settings][product_border]" /> <?php echo $settings_yes; ?>
                    <input type="radio" value="0" name="dreamtheme[settings][product_border]" checked="checked" /> <?php echo $settings_no; ?>
                    <?php } ?>
                    </td>
              </tr>
              <td><?php echo $settings_module_border; ?></td>
                	<td>
                    <?php if(isset($dreamtheme['settings']['module_border']) && $dreamtheme['settings']['module_border'] == 1){ ?> 
                    <input type="radio" value="1" name="dreamtheme[settings][module_border]" checked="checked" /> <?php echo $settings_yes; ?>
                    <input type="radio" value="0" name="dreamtheme[settings][module_border]" /> <?php echo $settings_no; ?>
                    <?php }else{ ?> 
                    <input type="radio" value="1" name="dreamtheme[settings][module_border]" /> <?php echo $settings_yes; ?>
                    <input type="radio" value="0" name="dreamtheme[settings][module_border]" checked="checked" /> <?php echo $settings_no; ?>
                    <?php } ?>
                    </td>
              </tr>
              <td><?php echo $settings_breadcrumbs; ?></td>
                	<td>
                    <?php if(isset($dreamtheme['settings']['breadcrumbs']) && $dreamtheme['settings']['breadcrumbs'] == 1){ ?> 
                    <input type="radio" value="1" name="dreamtheme[settings][breadcrumbs]" checked="checked" /> <?php echo $settings_yes; ?>
                    <input type="radio" value="0" name="dreamtheme[settings][breadcrumbs]" /> <?php echo $settings_no; ?>
                    <?php }else{ ?> 
                    <input type="radio" value="1" name="dreamtheme[settings][breadcrumbs]" /> <?php echo $settings_yes; ?>
                    <input type="radio" value="0" name="dreamtheme[settings][breadcrumbs]" checked="checked" /> <?php echo $settings_no; ?>
                    <?php } ?>
                    </td>
            </tr>
            <tr>
              <td><?php echo $settings_header_bg; ?></td>
              <td><div class="image"><img src="<?php echo $dreamtheme['settings']['header_bg_img']; ?>" alt="" id="header_bg_img" />
                  <input type="hidden" name="dreamtheme[settings][header_bg]" value="<?php echo $dreamtheme['settings']['header_bg']; ?>" id="header_bg" />
                  <br />
                  <a onclick="image_upload('header_bg', 'header_bg_img');"><?php echo $text_browse; ?></a>&nbsp;&nbsp;|&nbsp;&nbsp;<a onclick="$('#header_bg_img').attr('src', '<?php echo $no_image; ?>'); $('#header_bg').attr('value', '');"><?php echo $text_clear; ?></a></div></td>
            </tr>
            <tr>
              <td><?php echo $settings_footer_bg; ?></td>
              <td><div class="image"><img src="<?php echo $dreamtheme['settings']['footer_bg_img']; ?>" alt="" id="footer_bg_img" />
                  <input type="hidden" name="dreamtheme[settings][footer_bg]" value="<?php echo $dreamtheme['settings']['footer_bg']; ?>" id="footer_bg" />
                  <br />
                  <a onclick="image_upload('footer_bg', 'footer_bg_img');"><?php echo $text_browse; ?></a>&nbsp;&nbsp;|&nbsp;&nbsp;<a onclick="$('#footer_bg_img').attr('src', '<?php echo $no_image; ?>'); $('#footer_bg').attr('value', '');"><?php echo $text_clear; ?></a></div></td>
            </tr>
            <tr>
              <td><?php echo $settings_informations; ?></td>
              <td>
              <ol>
              <?php $i= 0; foreach($informations as $information){ $i++; ?> 
              
              <li><input type="checkbox" name="dreamtheme[settings][informations][<?php echo $i; ?>][information_id]" value="<?php echo ($information['information_id']); ?>" <?php if(isset($dreamtheme['settings']['informations'][$i]['information_id'])){ echo 'checked="checked"'; } ?> /><input type="hidden" name="dreamtheme[settings][informations][<?php echo $i; ?>][sort]" value="<?php echo $i; ?>" /><span><?php echo ($information['title']); ?></span></li>

              <?php } ?>
              </ol>
              
              </td>
              </tr>
              <tr>
              	<td><?php echo $settings_contact; ?></td>
                <td>
                    <ul>
                    <li>
                    <input type="checkbox" name="dreamtheme[settings][contact][phone][1][id]" value="1" <?php if(isset($dreamtheme['settings']['contact']['phone'][1]['id'])){ echo 'checked="checked"'; } ?> />
                    <input type="text" name="dreamtheme[settings][contact][phone][1][code]" value="<?php if(isset($dreamtheme['settings']['contact']['phone'][1]['code'])){ echo $dreamtheme['settings']['contact']['phone'][1]['code']; } ?>" style="width:30px"  /> <span>Code 1</span>
                    <input type="text" name="dreamtheme[settings][contact][phone][1][number]" value="<?php if(isset($dreamtheme['settings']['contact']['phone'][1]['number'])){ echo $dreamtheme['settings']['contact']['phone'][1]['number']; } ?>"  />
                    <input type="hidden" name="dreamtheme[settings][contact][phone][1][sort]" value="1" />
                    <span>Phone 1</span></li>
                    <li>
                    <input type="checkbox" name="dreamtheme[settings][contact][phone][2][id]" value="2" <?php if(isset($dreamtheme['settings']['contact']['phone'][2]['id'])){ echo 'checked="checked"'; } ?> />
                    <input type="text" name="dreamtheme[settings][contact][phone][2][code]" value="<?php if(isset($dreamtheme['settings']['contact']['phone'][2]['code'])){ echo $dreamtheme['settings']['contact']['phone'][2]['code']; } ?>" style="width:30px"  /> <span>Code  2</span>
                    <input type="text" name="dreamtheme[settings][contact][phone][2][number]" value="<?php if(isset($dreamtheme['settings']['contact']['phone'][2]['number'])){ echo $dreamtheme['settings']['contact']['phone'][2]['number']; } ?>"  />
                    <input type="hidden" name="dreamtheme[settings][contact][phone][2][sort]" value="2" />
                    <span>Phone 2</span></li>
                    <li>
                    <input type="checkbox" name="dreamtheme[settings][contact][skype][1][id]" value="1" <?php if(isset($dreamtheme['settings']['contact']['skype'][1]['id'])){ echo 'checked="checked"'; } ?> />
                    <input type="text" name="dreamtheme[settings][contact][skype][1][code]" value="<?php if(isset($dreamtheme['settings']['contact']['skype'][1]['code'])){ echo $dreamtheme['settings']['contact']['skype'][1]['code']; } ?>"  />
                    <input type="hidden" name="dreamtheme[settings][contact][skype][1][sort]" value="1" />
                    <span>Skype</span></li>
                    <li>
                    <input type="checkbox" name="dreamtheme[settings][contact][icq][1][id]" value="1" <?php if(isset($dreamtheme['settings']['contact']['icq'][1]['id'])){ echo 'checked="checked"'; } ?> />
                    <input type="text" name="dreamtheme[settings][contact][icq][1][code]" value="<?php if(isset($dreamtheme['settings']['contact']['icq'][1]['code'])){ echo $dreamtheme['settings']['contact']['icq'][1]['code']; } ?>"  />
                    <input type="hidden" name="dreamtheme[settings][contact][icq][1][sort]" value="1" />
                    <span>ICQ</span></li>
                    <li>
                    <input type="checkbox" name="dreamtheme[settings][contact][email][1][id]" value="1" <?php if(isset($dreamtheme['settings']['contact']['email'][1]['id'])){ echo 'checked="checked"'; } ?> />
                    <input type="text" name="dreamtheme[settings][contact][email][1][code]" value="<?php if(isset($dreamtheme['settings']['contact']['email'][1]['code'])){ echo $dreamtheme['settings']['contact']['email'][1]['code']; } ?>"  />
                    <input type="hidden" name="dreamtheme[settings][contact][email][1][sort]" value="1" />
                    <span>Email</span></li>      
                    </ul>
                    </td>
              	</tr>
              <tr>
              <td><?php echo $settings_social_networks; ?></td>
              <td>
              <ul>
                <li><input type="checkbox" name="dreamtheme[settings][social_networks][1][social_network_id]" value="1" <?php if(isset($dreamtheme['settings']['social_networks'][1]['social_network_id'])){ echo 'checked="checked"'; } ?> />
                <input type="hidden" name="dreamtheme[settings][social_networks][1][sort]" value="1" />
                <input type="text" name="dreamtheme[settings][social_networks][1][link]" value="<?php if(isset($dreamtheme['settings']['social_networks'][1]['link'])){ echo $dreamtheme['settings']['social_networks'][1]['link']; } ?>" />
                <span>Facebook</span>
                </li>
                <li><input type="checkbox" name="dreamtheme[settings][social_networks][2][social_network_id]" value="2" <?php if(isset($dreamtheme['settings']['social_networks'][1]['social_network_id'])){ echo 'checked="checked"'; } ?> />
                <input type="hidden" name="dreamtheme[settings][social_networks][2][sort]" value="2" />
                <input type="text" name="dreamtheme[settings][social_networks][2][link]" value="<?php if(isset($dreamtheme['settings']['social_networks'][2]['link'])){ echo $dreamtheme['settings']['social_networks'][2]['link']; } ?>" />
                <span>Twitter</span>
                </li>
                                <li><input type="checkbox" name="dreamtheme[settings][social_networks][3][social_network_id]" value="3" <?php if(isset($dreamtheme['settings']['social_networks'][3]['social_network_id'])){ echo 'checked="checked"'; } ?> />
                <input type="hidden" name="dreamtheme[settings][social_networks][3][sort]" value="3" />
                <input type="text" name="dreamtheme[settings][social_networks][3][link]" value="<?php if(isset($dreamtheme['settings']['social_networks'][3]['link'])){ echo $dreamtheme['settings']['social_networks'][3]['link']; } ?>" />
                <span>Vkontakte</span>
                </li>
                                <li><input type="checkbox" name="dreamtheme[settings][social_networks][4][social_network_id]" value="4" <?php if(isset($dreamtheme['settings']['social_networks'][4]['social_network_id'])){ echo 'checked="checked"'; } ?> />
                <input type="hidden" name="dreamtheme[settings][social_networks][4][sort]" value="4" />
                <input type="text" name="dreamtheme[settings][social_networks][4][link]" value="<?php if(isset($dreamtheme['settings']['social_networks'][4]['link'])){ echo $dreamtheme['settings']['social_networks'][4]['link']; } ?>" />
                <span>Pintrest</span>
                </li>
                <li><input type="checkbox" name="dreamtheme[settings][social_networks][5][social_network_id]" value="5" <?php if(isset($dreamtheme['settings']['social_networks'][5]['social_network_id'])){ echo 'checked="checked"'; } ?> />
                <input type="hidden" name="dreamtheme[settings][social_networks][5][sort]" value="5" />
                <input type="text" name="dreamtheme[settings][social_networks][5][link]" value="<?php if(isset($dreamtheme['settings']['social_networks'][5]['link'])){ echo $dreamtheme['settings']['social_networks'][5]['link']; } ?>" />
                <span>Google+</span>
                </li>
              </ul>
              
              </td>
            </tr>
    </table>
      </div>
      <div id="tab-2" class="vtabs-content" style="<?php echo $settings_display; ?>: block; ">
      <table class="form">
              <tr>
                <td><?php echo $category_description_position; ?></td>
                	<td>
                    <?php if(isset($dreamtheme['category']['description_position']) && $dreamtheme['category']['description_position'] == 1){ ?> 
                    <input type="radio" value="1" name="dreamtheme[category][description_position]" checked="checked" /> <?php echo $settings_top; ?>
                    <input type="radio" value="0" name="dreamtheme[category][description_position]" /> <?php echo $settings_bottom; ?>
                    <?php }else{ ?> 
                    <input type="radio" value="1" name="dreamtheme[category][description_position]" /> <?php echo $settings_top; ?>
                    <input type="radio" value="0" name="dreamtheme[category][description_position]" checked="checked" /> <?php echo $settings_bottom; ?>
                    <?php } ?>
                    </td>
              </tr>
              <td><?php echo $category_product_display; ?></td>
                	<td>
                    <?php if(isset($dreamtheme['category']['product_display']) && $dreamtheme['category']['product_display'] == 1){ ?> 
                    <input type="radio" value="1" name="dreamtheme[category][product_display]" checked="checked" /> <?php echo $settings_grid; ?>
                    <input type="radio" value="0" name="dreamtheme[category][product_display]" /> <?php echo $settings_list; ?>
                    <?php }else{ ?> 
                    <input type="radio" value="1" name="dreamtheme[category][product_display]" /> <?php echo $settings_grid; ?>
                    <input type="radio" value="0" name="dreamtheme[category][product_display]" checked="checked" /> <?php echo $settings_list; ?>
                    <?php } ?>
                    </td>
              </tr>
              <td><?php echo $category_ajax_pages; ?></td>
                	<td>
                    <?php if(isset($dreamtheme['category']['ajax_pages']) && $dreamtheme['category']['ajax_pages'] == 1){ ?> 
                    <input type="radio" value="1" name="dreamtheme[category][ajax_pages]" checked="checked" /> <?php echo $settings_yes; ?>
                    <input type="radio" value="0" name="dreamtheme[category][ajax_pages]" /> <?php echo $settings_no; ?>
                    <?php }else{ ?> 
                    <input type="radio" value="1" name="dreamtheme[category][ajax_pages]" /> <?php echo $settings_yes; ?>
                    <input type="radio" value="0" name="dreamtheme[category][ajax_pages]" checked="checked" /> <?php echo $settings_no; ?>
                    <?php } ?>
                    </td>
              </tr>
              
            </table>
      </div>
      
      <!--<div id="tab-3" class="vtabs-content" style="<?php echo $settings_display; ?>: block; ">
      <table class="form">
              <tr>
                <td><?php echo $entry_description; ?></td>
                	<td>
                    <?php if(isset($dreamtheme['product']['value']) && $dreamtheme['product']['value'] == 1){ ?> 
                    <input type="radio" value="1" name="dreamtheme[product][value]" checked="checked" /> <?php echo $settings_yes; ?>
                    <input type="radio" value="0" name="dreamtheme[product][value]" /> <?php echo $settings_no; ?>

                    <?php }else{ ?> 
                    <input type="radio" value="1" name="dreamtheme[product][value]" /> <?php echo $settings_yes; ?>
                    <input type="radio" value="0" name="dreamtheme[product][value]" checked="checked" /> <?php echo $settings_no; ?>
                    <?php } ?>
                    </td>
              </tr>
            </table>
      </div>   -->
      <div id="tab-10" class="vtabs-content" style="<?php echo $settings_display; ?>: block; ">
      <table class="form">
      		  <tr>
              <td colspan="2">
              <h1>The best support from Dreamvention</h1>
              <p>At Dreamvention we believe in trust. We know that trust does not come easy and it takes years of quality service to build up trustworthy relationship. That is why we give a great deal of attention to customer service. When you contact us, you can be sure to talk to a professional experts that will guide you through any issue and not overwhelm you with technical data.</p>
              <p>We offer the best customer care with a 24 hour guaranteed reply time (for holidays it may be up to 48 hours). So go ahead, give it a try. </p>
              </td>
              </tr>
      		  <tr>
              <td>
              Support email:
              </td>
              <td>
              <a href="mailto:info@dreamvention.com?subject=QuickCheckout_Support_<?php echo $_SERVER["SERVER_NAME"];?>">info@dreamvention.com</a>
              </td>
              <tr>
              <td>
              or click here:
              </td>
              <td>
              <div class="buttons"><a class="button" href="mailto:info@dreamvention.com?subject=QuickCheckout_Support_<?php echo $_SERVER["SERVER_NAME"];?>">Need Help</a></div>
              </td>
              </tr>
              <tr>
              <td>
              Visit our Opencart Extensions Page for more great paid and free products.
              </td>
              <td>
              <a href="http://www.opencart.com/index.php?route=extension/extension&filter_username=Dreamvention" target="_blank">More Extensions from Dreamvention</a>
              </td>
              </tr> 
              <tr>
              <td>
              or visit our website at.
              </td>
              <td>
              <a href="http://www.dreamvention.com/"  target="_blank">www.dreamvention.com</a>
              </td>
              </tr>             
      </table>
      </div>
      </form>
    </div>
  </div>
</div>
<script type="text/javascript"><!--
$('.vtabs a').tabs();
//--></script> 
<script type="text/javascript"><!--
function image_upload(field, thumb) {
	$('#dialog').remove();
	
	$('#content').prepend('<div id="dialog" style="padding: 3px 0px 0px 0px;"><iframe src="index.php?route=common/filemanager&token=<?php echo $token; ?>&field=' + encodeURIComponent(field) + '" style="padding:0; margin: 0; display: block; width: 100%; height: 100%;" frameborder="no" scrolling="auto"></iframe></div>');
	
	$('#dialog').dialog({
		title: '<?php echo $text_image_manager; ?>',
		close: function (event, ui) {
			if ($('#' + field).attr('value')) {
				$.ajax({
					url: 'index.php?route=common/filemanager/image&token=<?php echo $token; ?>&image=' + encodeURIComponent($('#' + field).val()),
					dataType: 'text',
					success: function(data) {
						$('#' + thumb).replaceWith('<img src="' + data + '" alt="" id="' + thumb + '" />');
					}
				});
			}
		},	
		bgiframe: false,
		width: 800,
		height: 400,
		resizable: false,
		modal: false
	});
};
//--></script> 
<?php echo $footer; ?>