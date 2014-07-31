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
       <h1><i class="icon-puzzle"></i> <?php echo $heading_title; ?></h1>
      <div class="buttons"><?php if(isset($stores)){ ?>
        <select onChange="location='<?php echo $module_link; ?>&store_id='+$(this).val()">
          <?php foreach($stores as $store){ ?>
          <?php if($store['store_id'] ==  $store_id){ ?>
          <option value="<?php echo $store['store_id']; ?>" selected="selected" ><?php echo $store['name']; ?></option>
          <?php }else{ ?>
          <option value="<?php echo $store['store_id']; ?>" ><?php echo $store['name']; ?></option>
          <?php } ?>
          <?php } ?>
        </select><?php } ?><a onClick="saveAndStay()" class="button"><span><?php echo $button_save_and_stay; ?></span></a><a onclick="$('#form').submit();" class="button"><?php echo $button_save; ?></a><a href="<?php echo $cancel; ?>" class="button"><?php echo $button_cancel; ?></a></div>
    </div>
    <div class="content">
            <div id="tabs" class="htabs">
			  <a href="#general_menu" class="htab-item"><span class="icon-list"></span><?php echo $text_tab_menu; ?></a>
          	  <a href="#general_settings" class="htab-item"><span class="icon-settings"></span><?php echo $text_tab_settings; ?></a>  
              <a href="#general_design" class="htab-item"><span class="icon-design"></span><?php echo $text_tab_design; ?></a>
              <a href="#general_params" class="htab-item"><span class="icon-tools"></span><?php echo $text_tab_parameters; ?></a>
               <a href="#instructions" class="htab-item"><span class="icon-graduation-cap"></span><?php echo $text_tab_instructions; ?></a>
            </div>
             <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" id="form">
                  <div id="general_menu" >
                      <div class="tree-megamenu">
                      <h2><?php echo $text_menu_structure; ?></h2>
                      <div class="dd nastable" id="nestable">
                          <?php echo $tree; ?>
                      </div>
                      </div>
                      <div id="megamenu_form">
                       <h2><?php echo $text_menu_settings; ?></h2>
                        <div id="sub_tabs" class="htabs">
                            <a href="#sub_tabs1" class="htab-item"><?php echo $text_tab_data; ?></a>
                            <a href="#sub_tabs2" class="htab-item"><?php echo $text_tab_parameters; ?></a>
                            <a href="#sub_tabs3" class="htab-item"><?php echo $text_tab_design; ?></a>
                         </div>
                      <div id="sub_tabs1">
                        <table class="list"> 
                         <tr>
                           <td><?php echo $entry_name; ?></td>  
                           <td><input type="text" name="dmm_description[name]" id="name" value="" /></td>
                         </tr>
                         <tr>
                           <td><?php echo $entry_description; ?></td>  
                           <td><textarea type="text" name="dmm_description[description]" id="description" value=""></textarea></td>
                         </tr>
                         <tr>
                           <td><?php echo $entry_menu_type; ?><i class="icon-question" data-help="<?php echo $menu_type_tooltip; ?>" rel="tooltip"></i></td>
                            <td class="left">
                              <select name="d_mega_menu_type" id="submenu_type">
                               <?php foreach ($d_mega_menu['menu']['menu_type'] as $type) {?>
                                <?php if($d_mega_menu == $type){ ?>
                                <option value="<?php echo $type; ?>" selected="selected"><?php echo $type; ?></option>
                                <?php }else{ ?>
                                <option value="<?php echo $type; ?>"><?php echo $type; ?></option>
                                <?php } ?>
                               <?php } ?>
                               </select>
                            </td>
                            <tr>
                              <td class="type_submenu_text" id="type_submenu_text-url" style="display:none;"><?php echo $entry_url; ?></td>
                              <td class="type_submenu" id="type_submenu-url" style="display:none;">
                              <textarea type="text" id="type-url" name="menu_type_params[url]" value=""></textarea>
                              </td>
                            </tr> 
                            <tr>
                            <td class="type_submenu_text" id="type_submenu_text-text" style="display:none;"><?php echo $entry_text; ?></td> 
                             <td class="type_submenu" id="type_submenu-text" style="display:none;">
                              <textarea type="text"  id="type-text" name="menu_type_params[text]" value=""></textarea>
                            </td>
                            </tr>
                            <tr>
                            <td class="type_submenu_text" id="type_submenu_text-video" style="display:none;"><?php echo $entry_video; ?><i class="icon-question" data-help="<?php echo $menu_type_video_tooltip; ?>" rel="tooltip"></i></td>
                             <td class="type_submenu" id="type_submenu-video" style="display:none;">
                              <textarea type="text" id="type-video" name="menu_type_params[video][video]" value=""></textarea>
                              <div class="row"><span class="required">*</span><?php echo $entry_demension; ?></div>
                                <div class="row"><input type="text" size="5" name="menu_type_params[video][width]" value="" id="type-video_width" />
                              <input type="text" size="5" name="menu_type_params[video][height]" value="" id="type-video_height" /></div>
                            </td>
                          </tr>
                          <tr>
                            <td class="type_submenu_text" id="type_submenu_text-maps" style="display:none;"><?php echo $entry_maps; ?><i class="icon-question" data-help="<?php echo $menu_type_map_tooltip; ?>" rel="tooltip"></i></td>
                             <td class="type_submenu" id="type_submenu-maps" style="display:none;">
                              <textarea type="text" id="type-maps" name="menu_type_params[maps][maps]" value=""></textarea>
                              <div class="row"><span class="required">*</span><?php echo $entry_demension; ?></div>
                              <div class="row"><input type="text" size="5" name="menu_type_params[maps][width]" value="" id="type-maps_width" /> 
                              <input type="text" size="5" name="menu_type_params[maps][height]" value="" id="type-maps_height" /></div>
                            </td>
                          </tr>
                          <tr>
                            <td class="type_submenu_text" id="type_submenu_text-feed" style="display:none;"><?php echo $entry_feed; ?></td>
                            <td class="type_submenu" id="type_submenu-feed" style="display:none;">
                              <div class="row"><?php echo $entry_feed_title; ?></div>
                              <div class="row"><input type="text" id="type-feed_title" name="menu_type_params[feed][title]" value=""/></div>
                              <textarea type="text" id="type-feed_link" name="menu_type_params[feed][link]" value=""></textarea>
                            </td>
                          </tr>
                          <tr>
                            <td class="type_submenu_text" id="type_submenu_text-banner" style="display:none;"><?php echo $entry_banner; ?></td>
                            <td class="type_submenu" id="type_submenu-banner" style="display:none;">
                              <select name="menu_type_params[banner][banner]" id="type-banner">
                                <option value=""></option>
                              <?php foreach ($banners as $banner) { ?>
                              <?php if ($banner['banner_id'] == $d_mega_menu) { ?>
                              <option value="<?php echo $banner['banner_id']; ?>" selected="selected"><?php echo $banner['name']; ?></option>
                              <?php } else { ?>
                              <option value="<?php echo $banner['banner_id']; ?>"><?php echo $banner['name']; ?></option>
                              <?php } ?>
                              <?php } ?>
                             </select>
                              <div class="row"><span class="required">*</span><?php echo $entry_demension; ?></div>
                               <div class="row"><input type="text" size="5" name="menu_type_params[banner][width]" value="" id="type-banner_width" /> 
                              <input type="text" size="5" name="menu_type_params[banner][height]" value="" id="type-banner_height" /></div>
                            </td>
                          </tr>
                          <tr>
                            <td class="type_submenu_text" id="type_submenu_text-products" style="display:none;"><?php echo $entry_products; ?></td>
                            <td class="type_submenu" id="type_submenu-products" style="display:none;">
                              <select name="menu_type_params[products][products]" id="type-products">
                                <option value=""></option>
                              <?php foreach ($product_total as $product) { ?>
                              <?php if ($product['product_id'] == $d_mega_menu) { ?>
                              <option value="<?php echo $product['product_id']; ?>" selected="selected"><?php echo $product['name']; ?></option>
                              <?php } else { ?>
                              <option value="<?php echo $product['product_id']; ?>"><?php echo $product['name']; ?></option>
                              <?php } ?>
                              <?php } ?>
                             </select>
                             <div class="row"><span class="required">*</span><?php echo $entry_demension; ?></div>
                              <div class="row"><input type="text" size="5" name="menu_type_params[products][width]" value="" id="type-products_width" /> 
                              <input type="text" size="5" name="menu_type_params[products][height]" value="" id="type-products_height" /></div>
                            </td>
                          </tr>
                          <tr>
                            <td class="type_submenu_text" id="type_submenu_text-image" style="display:none;"><?php echo $entry_image; ?></td>
                            <td class="type_submenu" id="type_submenu-image" style="display:none;" >
                              <div class="image"><img src="<?php echo $thumb; ?>" alt="" id="thumb" />
                                <input type="hidden" name="menu_type_params[image][image]" value="<?php echo $image; ?>" id="image" />
                                <br />
                                <a onclick="image_upload('image', 'thumb');"><?php echo $text_browse; ?></a>&nbsp;&nbsp;|&nbsp;&nbsp;<a onclick="$('#thumb').attr('src', '<?php echo $no_image; ?>'); $('#image').attr('value', '');"><?php echo $text_clear; ?></a></div>
                                 <div class="row"><span class="required">*</span><?php echo $entry_demension; ?></div> 
                                <div class="row"><input type="text" size="5" name="menu_type_params[image][width]" value="" id="type-image_width" />
                                <input type="text" size="5" name="menu_type_params[image][height]" value="" id="type-image_height" /></div>
                            </td>
                          </tr>
                          <tr>
                            <td class="type_submenu_text" id="type_submenu_text-slideshow" style="display:none;"><?php echo $entry_banner; ?></td>
                            <td class="type_submenu" id="type_submenu-slideshow" style="display:none;">
                              <select name="menu_type_params[slideshow][banner]" id="type-slideshow">
                                <option value=""></option>
                              <?php foreach ($banners as $banner) { ?>
                              <?php if ($banner['banner_id'] == $d_mega_menu) { ?>
                              <option value="<?php echo $banner['banner_id']; ?>" selected="selected"><?php echo $banner['name']; ?></option>
                              <?php } else { ?>
                              <option value="<?php echo $banner['banner_id']; ?>"><?php echo $banner['name']; ?></option>
                              <?php } ?>
                              <?php } ?>
                             </select>
                             <div class="row"><span class="required">*</span><?php echo $entry_demension; ?></div><div class="row"><input type="text" size="5" name="menu_type_params[slideshow][width]" value="" id="type-slideshow_width" />
                             <input type="text" size="5" name="menu_type_params[slideshow][height]" value="" id="type-slideshow_height" /></div>
                            </td>
                          </tr>
                          <tr>
                        </table>
                      </div>
                     <div id="sub_tabs2">
                        <table class="list">
                          <tr>
                            <td><?php echo $entry_item_status; ?></td>
                            <td><select name="status" id ="status">
                                <?php if ($d_mega_menu['menu']['status']) { ?> 
                                <option value="1" selected="selected"><?php echo $text_enabled; ?></option>
                                <option value="0"><?php echo $text_disabled; ?></option>
                                <?php } else { ?>
                                <option value="1"><?php echo $text_enabled; ?></option>
                                <option value="0" selected="selected"><?php echo $text_disabled; ?></option>
                                <?php } ?>
                              </select></td>
                          </tr>
                          <tr>
                            <td><?php echo $entry_ParenID; ?><i class="icon-question" data-help="<?php echo $menu_parentid_tooltip; ?>" rel="tooltip"></i></td>  
                            <td>
  							             <input type="text" name="path" value="<?php echo $path; ?>" size="30" id="path"/>
  							             <input type="hidden" name ="parent_id" id="parent_id" size="10" value="<?php echo $d_mega_menu['menu']['parent_id']; ?>" />
							             </td>
                          </tr>
                          <tr>
                            <td><?php echo $entry_column_break; ?><i class="icon-question"  data-help="<?php echo $column_break_tooltip; ?>" rel="tooltip"></i></td> 
                                <td><select name="column_break" id ="column_break">
                                <?php if ($d_mega_menu['menu']['column_break']) { ?> 
                                <option value="1" selected="selected"><?php echo $text_enabled; ?></option>
                                <option value="0"><?php echo $text_disabled; ?></option>
                                <?php } else { ?>
                                <option value="1"><?php echo $text_enabled; ?></option>
                                <option value="0" selected="selected"><?php echo $text_disabled; ?></option>
                                <?php } ?>
                              </select></td>
                          </tr>
                         <tr>
                            <td><?php echo $entry_label; ?><i class="icon-question"  data-help="<?php echo $label_tooltip; ?>" rel="tooltip"></i></td> 
                                <td><select name="menu_type_params[label][status]" id ="label_status">
                                <?php if ($d_mega_menu['menu']['menu_type_params']['label']['status']) { ?> 
                                <option value="1" selected="selected"><?php echo $text_enabled; ?></option>
                                <option value="0"><?php echo $text_disabled; ?></option>
                                <?php } else { ?>
                                <option value="1"><?php echo $text_enabled; ?></option>
                                <option value="0" selected="selected"><?php echo $text_disabled; ?></option>
                                <?php } ?>
                              </select></td>
                          </tr>
                          <tr>
                            <td id="label_title_text" style="display:none;"><?php echo $entry_title; ?></td>  
                            <td id="label_title_input" style="display:none;"><input type="text" name="menu_type_params[label][title]" value=""  id="label_title"/></td>
                          </tr>
                           <tr>
                            <td id="label_color_text" style="display:none;"><?php echo $entry_color_text; ?></td>  
                            <td id="label_color_input" style="display:none;"><input type="text" class="color-picker" name="menu_type_params[label][text_color]" id="color_picker_6" ></td>
                          </tr>
                          <tr>
                            <td id="label_background_text" style="display:none;"><?php echo $entry_background; ?></td>  
                            <td id="label_background_input" style="display:none;"><input type="text" class="color-picker" name="menu_type_params[label][background_color]" id="color_picker_7" ></td>
                          </tr> 
                        </table>
                        </div>
                      <div id="sub_tabs3">
                        <table class="list">
                          <tr>
                            <td><?php echo $entry_color_text; ?></td>  
                            <td><input type="text" class="color-picker" name="color_text" id="color_picker_2" ></td>
                          </tr>
                          <tr>
                            <td><?php echo $entry_background; ?></td>  
                            <td><input type="text" class="color-picker" name="color_background" id="color_picker_3"  ></td>
                          </tr> 
                          <tr>
                            <td><?php echo $entry_font_size; ?><i class="icon-question" data-help="<?php echo $menu_fontsize_tooltip; ?>" rel="tooltip"></i></td>  
                            <td><input type="text" name="font_size" value="" size="7" id="font_size"/></td>
                          </tr>
							             <tr>
                            <td><?php echo $entry_font_weight; ?></td>  
                            <td><select  name="font_weight" id="font_weight" value="" >
                              <?php foreach ($d_mega_menu['menu']['font_weight'] as $FontWeight) { ?>
                              <?php if ($FontWeight == $d_mega_menu['menu']['font_weight']) { ?>
                              <option value="<?php echo $FontWeight; ?>" selected="selected"><?php echo $FontWeight; ?></option>
                              <?php } else { ?>
                              <option value="<?php echo $FontWeight; ?>"><?php echo $FontWeight; ?></option>
                              <?php } ?>
                              <?php } ?>
                             </select>
                           </td>
                          </tr> 
                          <tr>
                            <td><?php echo $entry_font_family; ?></td>  
                            <td><select  name="font_family" value="" id="font_family" >
                                <option value=""></option>
                              <?php foreach ($d_mega_menu['menu']['font_family'] as $key=>$value) { ?>
                              <?php if ($value == $d_mega_menu['menu']['font_family']) { ?>
                              <option value="<?php echo $value; ?>" selected="selected"><?php echo $key; ?></option>
                              <?php } else { ?>
                              <option value="<?php echo $value; ?>"><?php echo $key; ?></option>
                              <?php } ?>
                              <?php } ?>
                             </select></td>
                          </tr>
                         </table>
                       </div>
                       <div class="buttons" id="button_add_menu">
                        <a onclick="addNewItem();" class="button"><?php echo $button_add_item_menu; ?></a> 
                        <a onclick="window.location.reload(true);" class="button"><?php echo $button_cancel; ?></a>
                       </div><div id="add_result"></div> 
                    </div> 
                    </div>
                     <div id="general_settings" class="htab-content"> 
                       <table id="module" class="list">
                          <thead>
                            <tr>
                              <td class="left"><?php echo $entry_layout; ?></td>
                              <td class="left"><?php echo $entry_position; ?></td>
                              <td class="left"><?php echo $entry_status; ?></td>
                              <td class="right"><?php echo $entry_sort_order; ?></td>
                              <td></td>
                            </tr>
                          </thead>
                          <?php $module_row = 0; ?>
                           <?php foreach ($modules as $module) { ?>
                            <tbody id="module-row<?php echo $module_row; ?>">
                           <tr>
                              <td class="left"><select name="d_mega_menu_module[<?php echo $module_row; ?>][layout_id]">
                                <?php foreach ($layouts as $layout) { ?>
                                 <?php if ($layout['layout_id'] == $module['layout_id']) { ?>
                                <option value="<?php echo $layout['layout_id']; ?>" selected="selected"><?php echo $layout['name']; ?></option>
                                <?php } else { ?>
                                <option value="<?php echo $layout['layout_id']; ?>"><?php echo $layout['name']; ?></option>
                                <?php } ?>
                                <?php } ?>
                              </select></td>
                              <td class="left"><select name="d_mega_menu_module[<?php echo $module_row; ?>][position]">
                                  <?php if ($module['position'] == 'column_mega_menu') { ?>
                                  <option value="column_mega_menu" selected="selected"><?php echo $text_column_mega_menu; ?></option>
                                  <?php } else { ?>
                                  <option value="column_mega_menu"><?php echo $text_column_mega_menu; ?></option>
                                  <?php } ?>    <?php if ($modules == 'content_top') { ?>
                                  <option value="content_top" selected="selected"><?php echo $text_content_top; ?></option>
                                  <?php } else { ?>
                                  <option value="content_top"><?php echo $text_content_top; ?></option>
                                  <?php } ?>
                                  <?php if ($modules == 'content_bottom') { ?>
                                  <option value="content_bottom" selected="selected"><?php echo $text_content_bottom; ?></option>
                                  <?php } else { ?>
                                  <option value="content_bottom"><?php echo $text_content_bottom; ?></option>
                                  <?php } ?>
                                  <?php if ($modules == 'column_left') { ?>
                                  <option value="column_left" selected="selected"><?php echo $text_column_left; ?></option>
                                  <?php } else { ?>
                                  <option value="column_left"><?php echo $text_column_left; ?></option>
                                  <?php } ?>
                                  <?php if ($modules == 'column_right') { ?>
                                  <option value="column_right" selected="selected"><?php echo $text_column_right; ?></option>
                                  <?php } else { ?>
                                  <option value="column_right"><?php echo $text_column_right; ?></option>
                                  <?php } ?>
                                </select>
                              </td>
                              <td class="left"><select name="d_mega_menu_module[<?php echo $module_row; ?>][status]">
                                <?php if ($module['status']) { ?>
                                <option value="1" selected="selected"><?php echo $text_enabled; ?></option>
                                <option value="0"><?php echo $text_disabled; ?></option>
                                <?php } else { ?>
                                <option value="1"><?php echo $text_enabled; ?></option>
                                <option value="0" selected="selected"><?php echo $text_disabled; ?></option>
                                <?php } ?>
                              </select></td>
                            <td class="right"><input type="text" name="d_mega_menu_module[<?php echo $module_row; ?>][sort_order]" value="<?php echo $module['sort_order']; ?>" size="3" /></td>
                            <td class="left"><a onclick="$('#module-row<?php echo $module_row; ?>').remove();" class="button"><?php echo $button_remove; ?></a></td>
                            </tr> 
                             <?php $module_row++; ?>
                             <?php } ?>
                             </tbody>
                              <tfoot>
                            <tr>
                              <td colspan="4"></td>
                              <td class="left"><a onclick="addModule();" class="button"><?php echo $button_add_module; ?></a></td>
                            </tr> </tfoot>
                         </table>
                        </div>
                       <div id="general_design" class="htab-content">
                         <table class="list">
							             <tr>
                            <td><?php echo $text_general_theme; ?><i class="icon-question" data-help="<?php echo $general_theme_tooltip; ?>"rel="tooltip"></i></td>
                            <td>
                            <select name="d_mega_menu[general][theme]">
                              <?php foreach ($themes as $theme) {?>
                                      <?php if($d_mega_menu['general']['theme'] == $theme){ ?>
                                        <option value="<?php echo $theme; ?>" selected="selected"><?php echo $theme; ?></option>
                                        <?php }else{ ?>
                                        <option value="<?php echo $theme; ?>"><?php echo $theme; ?></option>
                                        <?php } ?>
                              <?php } ?>
                             </select>
                             </td>
                          </tr>
                          <tr>
                            <td><?php echo $entry_color_text; ?></td>  
                            <td><input type="text" class="color-picker" name="d_mega_menu[general][general_color_text]" id="color_picker_5" ></td>
                          </tr>
                          <tr>
                            <td><?php echo $entry_background; ?></td>  
                            <td><input type="text" class="color-picker" name="d_mega_menu[general][general_color_background]" id="color_picker_4"  ></td>
                          </tr> 
                          <tr>
                            <td><?php echo $entry_font_size; ?><i class="icon-question" data-help="<?php echo $menu_fontsize_tooltip; ?>" rel="tooltip"></i></td>  
                            <td><input type="text" size="7" name="d_mega_menu[general][general_font_size]" /></td>
                          </tr>
						              <tr>
                            <td><?php echo $entry_font_weight; ?></td>  
                            <td>
                             <select  name="d_mega_menu[general][general_font_weight]" value=""  >
                              <?php foreach ($d_mega_menu['menu']['font_weight'] as $generalFontWeight) { ?>
                              <?php if ($generalFontWeight == $d_mega_menu['menu']['font_weight']) { ?>
                              <option value="<?php echo $generalFontWeight; ?>" selected="selected"><?php echo $generalFontWeight; ?></option>
                              <?php } else { ?>
                              <option value="<?php echo $generalFontWeight; ?>"><?php echo $generalFontWeight; ?></option>
                              <?php } ?>
                              <?php } ?>
                             </select>
                            </td>
                          </tr>  
                          <tr>
                            <td><?php echo $entry_font_family; ?></td>  
                            <td><select  name="d_mega_menu[general][general_font_family]" value="" id="" >
                                <option value=""></option>
                              <?php foreach ($d_mega_menu['menu']['font_family'] as $key=>$value) { ?>
                              <?php if ($value == $d_mega_menu['menu']['font_family']) { ?>
                              <option value="<?php echo $value; ?>" selected="selected"><?php echo $key; ?></option>
                              <?php } else { ?>
                              <option value="<?php echo $value; ?>"><?php echo $key; ?></option>
                              <?php } ?>
                              <?php } ?>
                             </select>
							             </td>
                          </tr>
                          <tr>
                            <td><?php echo $entry_custom_styles; ?><i class="icon-question" data-help="<?php echo $general_custom_tooltip; ?>" rel="tooltip"></i></td>  
                            <td><textarea name="d_mega_menu[general][general_custom_styles]" id="general_custom_styles" ></textarea></td>
                          </tr>
                         </table>
                        </div>   
                       <div id="general_params" class="htab-content">
                          <div class="tab-body">
                            <table class="list"> 
                               <tr>
                                <td><span><?php echo $text_version_check; ?></span><i class="icon-question" data-help="<?php echo $general_version_tooltip; ?>" rel="tooltip"></i></td>
                                <td><a onClick="versionCheck('<?php echo $route; ?>', '#version_result', '<?php echo $token; ?>')" class="button"><?php echo $button_version_check; ?></a></td>
                                <td id="version_result"></td>
                            </tr>
                            <tr>
                             <td class="name"><span><?php echo $text_general_debug;?></span><i class="icon-question" data-help="<?php echo $general_debug_tooltip; ?>" rel="tooltip"></i></td>
                             <td class="settings"><input type="hidden" value="0" name="d_mega_menu[general][debug]" />
                              <?php if(isset($d_mega_menu['general']['debug']) && $d_mega_menu['general']['debug'] == 1){ ?>
                              <input class="styled" type="checkbox" value="1" name="d_mega_menu[general][debug]" checked="checked" id="general_debug" />
                              <?php }else{ ?>
                               <input class="styled" type="checkbox" value="1" name="d_mega_menu[general][debug]" id="general_debug" />
                                <?php } ?>
                                <label  for="general_debug"><?php echo $settings_enable; ?></label></td>
                              <td></td>
                            </tr>
                          </table>
                          </div>
                        </div>
                        <div id="instructions" class="htab-content">
                          <div class="tab-body">
                            <?php echo $text_instructions_full; ?>
                          </div>
                        <div>
                    </form>  
             </div>
       </div>
</div>

<script type="text/javascript"> 

var module_row = <?php echo $module_row; ?>;

function addModule() {  
  html  = '<tbody id="module-row' + module_row + '">';
  html += '  <tr>';
  html += '    <td class="left"><select name="d_mega_menu_module[' + module_row + '][layout_id]">';
  <?php foreach ($layouts as $layout) { ?>
  html += '      <option value="<?php echo $layout['layout_id']; ?>"><?php echo addslashes($layout['name']); ?></option>';
  <?php } ?>
  html += '    </select></td>';
  html += '    <td class="left"><select name="d_mega_menu_module[' + module_row + '][position]">';

            html += '      <option value="column_mega_menu"><?php echo $text_column_mega_menu; ?></option>';
            

			html += '      <option value="column_header"><?php echo $text_column_header; ?></option>';
			html += '      <option value="column_footer"><?php echo $text_column_footer; ?></option>';
			html += '      <option value="column_extra1"><?php echo $text_column_extra1; ?></option>';
			html += '      <option value="column_extra2"><?php echo $text_column_extra2; ?></option>';
			html += '      <option value="column_extra3"><?php echo $text_column_extra3; ?></option>';
			html += '      <option value="column_extra4"><?php echo $text_column_extra4; ?></option>';
			html += '      <option value="column_extra5"><?php echo $text_column_extra5; ?></option>';
			html += '      <option value="column_extra6"><?php echo $text_column_extra6; ?></option>';
			html += '      <option value="column_extra7"><?php echo $text_column_extra7; ?></option>';
			html += '      <option value="column_extra8"><?php echo $text_column_extra8; ?></option>';
			
  html += '      <option value="content_top"><?php echo $text_content_top; ?></option>';
  html += '      <option value="content_bottom"><?php echo $text_content_bottom; ?></option>';
  html += '      <option value="column_left"><?php echo $text_column_left; ?></option>';
  html += '      <option value="column_right"><?php echo $text_column_right; ?></option>';
  html += '    </select></td>';
  html += '    <td class="left"><select name="d_mega_menu_module[' + module_row + '][status]">';
  html += '      <option value="1" selected="selected"><?php echo $text_enabled; ?></option>';
  html += '      <option value="0"><?php echo $text_disabled; ?></option>';
  html += '    </select></td>';
  html += '    <td class="right"><input type="text" name="d_mega_menu_module[' + module_row + '][sort_order]" value="" size="3" /></td>';
  html += '    <td class="left"><a onclick="$(\'#module-row' + module_row + '\').remove();" class="button"><?php echo $button_remove; ?></a></td>';
  html += '  </tr>';
  html += '</tbody>';
  
  $('#module tfoot').before(html);
  
  module_row++;
}

$(document).ready(function(){

var editor = CodeMirror.fromTextArea(document.getElementById("general_custom_styles"), {});

  var updateOutput = function(e){
        var list   = e.length ? e : $(e.target),
            output = list.data('output');
        if (window.JSON) {
            output.val(window.JSON.stringify(list.nestable('serialize')));
        } else {
            output.val('JSON browser support required for this demo.');
        }
  };
  $('#nestable').nestable({
        group: 1
  })
  .on('change', updateOutput);
    updateOutput($('#nestable').data('output', $('#nestable_output')));


   $("#nestable a").on("mousedown", function(event) { 
    event.preventDefault();
    return false;
});

$('#nestable').nestable.serialize;

$("#submenu_type").on('change', function(){
  updateEdit();
});

 $('#label_status').on('change', function(){
        if($(this).val() == 1) {
       
        $('#label_title_text').show(); 
        $('#label_title_input').show(); 
        $('#label_color_text').show(); 
        $('#label_background_input').show(); 
        $('#label_color_input').show(); 
        $('#label_background_text').show(); 
    } else {
        $('#label_title_text').hide(); 
        $('#label_title_input').hide(); 
        $('#label_color_text').hide(); 
        $('#label_background_input').hide(); 
        $('#label_color_input').hide(); 
        $('#label_background_text').hide(); 
    } 
    });

$('#tabs a').tabs(); 

$('#sub_tabs a').tabs(); 

$('#nestable').on('change', function() {
  var tmp = JSON.stringify($('#nestable').nestable('serialize'));   
    $.ajax( {
      type: "POST",
      url: 'index.php?route=module/d_mega_menu/saveTreeMenu&token=<?php echo $token; ?>', 
      data : {'items': tmp},
      dataType: 'html',
		 beforeSend: function() {
      
      },
      complete: function() {
       
      },
      success:function(msg){
       
      }
   });  
});

$(function() {
    $('#color_picker_2').colorpicker({
        parts: 'simple',
         showOn: 'both',
         buttonColorize: true,
         showNoneButton: true,
         alpha: true,
         colorFormat: '#HEX'
    });
     $('#color_picker_3').colorpicker({
        parts: 'simple',
         showOn: 'both',
         buttonColorize: true,
         showNoneButton: true,
         alpha: true,
         colorFormat: '#HEX'
    });
     $('#color_picker_4').colorpicker({
        parts: 'simple',
         showOn: 'both',
         buttonColorize: true,
         showNoneButton: true,
         alpha: true,
         colorFormat: '#HEX'
  });
      $('#color_picker_5').colorpicker({
        parts: 'simple',
         showOn: 'both',
         buttonColorize: true,
         showNoneButton: true,
         alpha: true,
         colorFormat: '#HEX'
    });
        $('#color_picker_6').colorpicker({
        parts: 'simple',
         showOn: 'both',
         buttonColorize: true,
         showNoneButton: true,
         alpha: true,
         colorFormat: '#HEX'
    });
          $('#color_picker_7').colorpicker({
        parts: 'simple',
         showOn: 'both',
         buttonColorize: true,
         showNoneButton: true,
         alpha: true,
         colorFormat: '#HEX'
    });
});
  
    

})

$('input[name=\'path\']').autocomplete({
	delay: 500,
	source: function(request, response) {		
		$.ajax({
			url: 'index.php?route=module/d_mega_menu/autocomplete&token=<?php echo $token; ?>&filter_name=' +  encodeURIComponent(request.term),
			dataType: 'json',
			success: function(json) {
				json.unshift({
					'item_id':  0,
					'name':  '<?php echo $text_none; ?>'
				});
				
				response($.map(json, function(item) {
					return {
						label: item.name,
						value: item.item_id
					}
				}));
			}
		});
	},
	select: function(event, ui) {
		$('input[name=\'path\']').val(ui.item.label);
		$('input[name=\'parent_id\']').val(ui.item.value);
		
		return false;
	},
	focus: function(event, ui) {
      	return false;
   	}
});

function image_upload(field, thumb) {
  $('#dialog').remove();
  
  $('#content').prepend('<div id="dialog" style="padding: 3px 0px 0px 0px;"><iframe  src="index.php?route=common/filemanager&token=<?php echo $token; ?>&field=' + encodeURIComponent(field) + '" style="padding:0; margin: 0; display: block; width: 100%; height: 100%;" frameborder="no" scrolling="auto"></iframe></div>');
  
  $('#dialog').dialog({
    title: '<?php echo $text_image_manager; ?>',
    close: function (event, ui) {
      if ($('#' + field).attr('value')) {
        $.ajax({
          url: 'index.php?route=common/filemanager/image&token=<?php echo $token; ?>&image=' + encodeURIComponent($('#' + field).val()),
          dataType: 'text',
          success: function(data) {
            $('#' + thumb).replaceWith('<img src="' + data + '" alt="" name="image" id="' + thumb + '" />');
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

function saveAndStay(){
    $.ajax( {
      type: "POST",
      data: $('#form').serialize(),
    beforeSend: function() {
    $('#form').fadeTo('slow', 0.5);
    },
    complete: function() {
    $('#form').fadeTo('slow', 1);   
    },
      success: function( response ) {
       console.log( response );
      }
    } );  
}

function addNewItem(){
    $.ajax( {
      type: "POST",
      url: 'index.php?route=module/d_mega_menu/insert&token=<?php echo $token; ?>', 
      data: $('#megamenu_form input[type=\'text\'], #megamenu_form select, #megamenu_form textarea,#megamenu_form input[type=\'hidden\'], #megamenu_form input[type=\'checkbox\']'),
      beforeSend: function() {
      //$('#form').fadeTo('slow', 0.5);
      },
      complete: function() {
      //$('#form').fadeTo('slow', 1);   
      window.location.reload(true);
      },
      success:function(msg){
      //  alert(msg);
      }
   });  
}

function deleteItem(id){
  if (confirm('Are you sure you want to delete this?')) {
   $.ajax( {
      type: "POST",
      url: 'index.php?route=module/d_mega_menu/delete&token=<?php echo $token; ?>&id='+id, 
      data: 'id='+  id,
      dataType: 'json',
      complete: function( ) {
        $('.dd-item[data-id='+id+']').remove();
      } 
    }); 
  }
}

function editItem(id){
 
$('.dd-item .active').removeClass('active');
//$("#megamenu_form").css({position:''});
    $.ajax( {
      type: "POST",
      url: 'index.php?route=module/d_mega_menu/edit&token=<?php echo $token; ?>', 
      data: 'id='+  id,
      dataType: 'json',
      success: function( json,msg ) {
	   $('#update_item').remove();
       $('#parent_id').val(json['parent_id']);
       $('#column_break').val(json['column_break']); 
       $('#name').val(json['name']); 
       $('#description').val(json['description']); 
       $('#status').val(json['status']);
       $('#submenu_type').val(json['menu_type']);
       $('input[name=color_text]').val(json['color_text']); 
       $('input[name=color_background]').val(json['color_background']); 
       $('#font_size').val(json['font_size']); 
	     $('#font_weight').val(json['font_weight']); 
       $('#font_family').val(json['font_family']); 
       $('#type-url').val(json['url']);
       $('#type-text').val(json['text']);
       $('#type-video').val(json['video']);
       $('#type-video_width').val(json['video_width']);
       $('#type-video_height').val(json['video_height']);
       $('#type-maps').val(json['maps']);
       $('#type-maps_width').val(json['maps_width']);
       $('#type-maps_height').val(json['maps_height']);
       $('#type-feed_link').val(json['feed_link']);
       $('#type-feed_title').val(json['feed_title']);
       $('#type-banner').val(json['banner']);
       $('#type-banner_width').val(json['banner_width']);
       $('#type-banner_height').val(json['banner_height']);
       $('#type-products').val(json['products']);
       $('#type-products_width').val(json['products_width']);
       $('#type-products_height').val(json['products_height']);
	     $('#image').val(json['image']);
       $('#type-image_width').val(json['image_width']);
       $('#type-image_height').val(json['image_height']);
	     $('#thumb').attr('src', json['thumb']);
	     $('#type-slideshow').val(json['slideshow']);
       $('#type-slideshow_height').val(json['slideshow_height']);
       $('#type-slideshow_width').val(json['slideshow_width']);
	     $('#path').val(json['path']);
       if(json['label_status']==null){
        $('#label_status').val('0');
         $('#label_title_text').hide(); 
        $('#label_title_input').hide(); 
        $('#label_color_text').hide(); 
        $('#label_background_input').hide(); 
        $('#label_color_input').hide(); 
        $('#label_background_text').hide(); 
       }else{
         $('#label_status').val('1');
        $('#label_title_text').show(); 
        $('#label_title_input').show(); 
        $('#label_color_text').show(); 
        $('#label_background_input').show(); 
        $('#label_color_input').show(); 
        $('#label_background_text').show(); 
       }
      // $('#label_status').val(json['label_status']);
       $('#label_title').val(json['label_title']);
       $('#color_picker_6').val(json['label_color_text']);
       $('#color_picker_7').val(json['label_background_color']);

	     $('#dd_'+id+'').addClass('active');
//$("#megamenu_form").css({position:'fixed'});
       updateEdit();
       
	  html = '<a onclick="updateItem('+ id +');" class="button right" id="update_item"><?php echo $button_save; ?></a>';
     $('#add_result').before(html);
      }
    });    
}

function updateItem(id){  
    $.ajax( {
      type: "POST",
      url: 'index.php?route=module/d_mega_menu/update&token=<?php echo $token; ?>&id='+id, 
      data:  $('#megamenu_form input[type=\'text\'], #megamenu_form input[type=\'hidden\'], #megamenu_form select, #megamenu_form textarea, #megamenu_form input[type=\'checkbox\']'),
      beforeSend: function() {
      //$('#form').fadeTo('slow', 0.5);
      },
      complete: function() {
      //$('#form').fadeTo('slow', 1);   
      window.location.reload(true);
      }, 
      success:function(msg){
       // alert(msg);
      }
    });  
}
function updateEdit(){
  $(".type_submenu").hide();
  $(".type_submenu_text").hide(); 
  $("#type_submenu-"+$("#submenu_type").val()).show();
  $("#type_submenu_text-"+$("#submenu_type").val()).show();
}

</script>
<?php echo $footer; ?>