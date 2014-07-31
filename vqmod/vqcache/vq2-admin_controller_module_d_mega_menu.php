<?php
class ControllerModuleDMegaMenu extends Controller {
	public $route = 'module/d_mega_menu';
	public $mbooth = 'mbooth_d_mega_menu.xml';
	private $error = array(); 
	private $input = array();

	public function index() {   
		$this->document->addLink('//fonts.googleapis.com/css?family=PT+Sans:400,700,700italic,400italic&subset=latin,cyrillic-ext,latin-ext,cyrillic', "stylesheet");
		$this->document->addStyle('view/stylesheet/shopunity/normalize.css');
		$this->document->addStyle('view/javascript/shopunity/uniform/css/uniform.default.css');
		$this->document->addStyle('view/stylesheet/shopunity/icons.css');
		$this->document->addStyle('view/stylesheet/shopunity/shopunity.css');
		$this->document->addScript('view/javascript/shopunity/uniform/jquery.uniform.min.js');	
		$this->document->addScript('view/javascript/shopunity/shopunity.js');
		$this->document->addScript('view/javascript/shopunity/tooltip/tooltip.js');
		$this->document->addStyle('view/javascript/shopunity/codemirror/codemirror.css');
		$this->document->addScript('view/javascript/shopunity/codemirror/codemirror.js');
		$this->document->addScript('view/javascript/shopunity/codemirror/css.js');
		$this->document->addStyle('view/stylesheet/d_mega_menu/d_mega_menu.css');
		$this->document->addScript('view/javascript/shopunity/jquery.nestable.js');
		$this->document->addScript('view/javascript/shopunity/colorpicker/jquery.colorpicker.js');
		$this->document->addStyle('view/javascript/shopunity/colorpicker/jquery.colorpicker.css');
		
		$this->language->load('module/d_mega_menu');
		$this->document->setTitle($this->language->get('heading_title_main'));

		$this->load->model('setting/setting');

		if(isset($this->request->get['store_id'])){ $store_id = $this->request->get['store_id']; }else{  $store_id = 0; }

		$this->load->model('catalog/d_mega_menu');
				
		if (($this->request->server['REQUEST_METHOD'] == 'POST') && $this->validate()) {
				
					
			$this->session->data['success'] = $this->language->get('text_success');
						
			$this->model_setting_setting->editSetting('d_mega_menu', $this->request->post, $store_id);
			if(!isset($this->request->post['save'])){
			$this->redirect($this->url->link('extension/module', 'token=' . $this->session->data['token'], 'SSL'));
			}
		}
				
		$this->data['heading_title'] = $this->language->get('heading_title_main');
		$this->data['version'] = $this->get_version();
		$this->data['route'] = $this->route;
		$this->data['token'] =  $this->session->data['token'];
		$this->data['settings_enable'] = $this->language->get('settings_enable');
		$this->data['text_version_check'] = sprintf($this->language->get('text_version_check'), $this->data['version']);
		$this->data['module_link'] = $this->url->link($this->route, 'token=' . $this->session->data['token'], 'SSL');
		$this->data['button_version_check'] = $this->language->get('button_version_check');

		$this->data['text_none'] = $this->language->get('text_none');
		$this->data['text_no_update'] = $this->language->get('text_no_update');
		$this->data['text_new_update'] = $this->language->get('text_new_update');
		$this->data['text_error_update'] = $this->language->get('text_error_update');
		$this->data['text_error_failed'] = $this->language->get('text_error_failed');
		$this->data['text_enabled'] = $this->language->get('text_enabled');
		$this->data['text_disabled'] = $this->language->get('text_disabled');
		$this->data['text_content_top'] = $this->language->get('text_content_top');
		$this->data['text_content_bottom'] = $this->language->get('text_content_bottom');		
		$this->data['text_column_left'] = $this->language->get('text_column_left');

            $this->data['text_column_mega_menu'] = $this->language->get('text_column_mega_menu');
            

			$this->data['text_column_header'] = $this->language->get('text_column_header');
			$this->data['text_column_footer'] = $this->language->get('text_column_footer');
			$this->data['text_column_extra1'] = $this->language->get('text_column_extra1');
			$this->data['text_column_extra2'] = $this->language->get('text_column_extra2');
			$this->data['text_column_extra3'] = $this->language->get('text_column_extra3');
			$this->data['text_column_extra4'] = $this->language->get('text_column_extra4');
			$this->data['text_column_extra5'] = $this->language->get('text_column_extra5');
			$this->data['text_column_extra6'] = $this->language->get('text_column_extra6');
			$this->data['text_column_extra7'] = $this->language->get('text_column_extra7');
			$this->data['text_column_extra8'] = $this->language->get('text_column_extra8');
			
		$this->data['text_column_right'] = $this->language->get('text_column_right');
		$this->data['text_show'] = $this->language->get('text_show');
		$this->data['text_general_debug'] = $this->language->get('text_general_debug');	
		$this->data['text_image_manager'] = $this->language->get('text_image_manager');
		$this->data['text_browse'] = $this->language->get('text_browse');
		$this->data['text_clear'] = $this->language->get('text_clear');		
		$this->data['text_general_theme'] = $this->language->get('text_general_theme');
		$this->data['text_menu_type_categories'] = $this->language->get('text_menu_type_categories');
		$this->data['text_menu_type_url'] = $this->language->get('text_menu_type_url');
		$this->data['text_menu_type_text'] = $this->language->get('text_menu_type_text');	
		$this->data['text_menu_type_images'] = $this->language->get('text_menu_type_images');
		$this->data['text_menu_type_maps'] = $this->language->get('text_menu_type_maps');
		$this->data['text_menu_type_contacts'] = $this->language->get('text_menu_type_contacts');
		$this->data['text_menu_type_product'] = $this->language->get('text_menu_type_product');
		$this->data['text_menu_type_articles'] = $this->language->get('text_menu_type_articles');
		$this->data['text_menu_type_videos'] = $this->language->get('text_menu_type_videos');
		$this->data['text_menu_type_logins'] = $this->language->get('text_menu_type_logins');		
		$this->data['text_menu_type_slideshow'] = $this->language->get('text_menu_type_slideshow');
		$this->data['text_instructions_full'] = $this->language->get('text_instructions_full');
		$this->data['text_tab_menu'] = $this->language->get('text_tab_menu');
		$this->data['text_tab_settings'] = $this->language->get('text_tab_settings');
		$this->data['text_tab_design'] = $this->language->get('text_tab_design');
		$this->data['text_tab_instructions'] = $this->language->get('text_tab_instructions');
		$this->data['text_tab_parameters'] = $this->language->get('text_tab_parameters');
		$this->data['text_tab_data'] = $this->language->get('text_tab_data');
		$this->data['text_menu_structure'] = $this->language->get('text_menu_structure');
		$this->data['text_menu_settings'] = $this->language->get('text_menu_settings');

		$this->data['entry_description'] = $this->language->get('entry_description');
		$this->data['entry_layout'] = $this->language->get('entry_layout');
		$this->data['entry_position'] = $this->language->get('entry_position');
		$this->data['entry_status'] = $this->language->get('entry_status');
		$this->data['entry_sort_order'] = $this->language->get('entry_sort_order');
		$this->data['entry_name'] = $this->language->get('entry_name');
		$this->data['entry_menu_type'] = $this->language->get('entry_menu_type');
		$this->data['entry_ParenID'] = $this->language->get('entry_ParenID');
		$this->data['entry_menu_class'] = $this->language->get('entry_menu_class');
		$this->data['entry_column_break'] = $this->language->get('entry_column_break'); 
		$this->data['entry_label'] = $this->language->get('entry_label');
		$this->data['entry_title'] = $this->language->get('entry_title');
		$this->data['entry_menu_image'] = $this->language->get('entry_menu_image');
		$this->data['entry_show_title'] = $this->language->get('entry_show_title');
		$this->data['entry_font_family'] = $this->language->get('entry_font_family');
		$this->data['entry_font_size'] = $this->language->get('entry_font_size');
		$this->data['entry_color_links'] = $this->language->get('entry_color_links');
		$this->data['entry_color_text'] = $this->language->get('entry_color_text');
		$this->data['entry_background'] = $this->language->get('entry_background');
		$this->data['entry_custom_styles'] = $this->language->get('entry_custom_styles');
		$this->data['entry_url'] = $this->language->get('entry_url');
		$this->data['entry_text'] = $this->language->get('entry_text');
		$this->data['entry_banner'] = $this->language->get('entry_banner');
		$this->data['entry_feed_title'] = $this->language->get('entry_feed_title');
		$this->data['entry_feed'] = $this->language->get('entry_feed');
		$this->data['entry_video'] = $this->language->get('entry_video');
		$this->data['entry_products'] = $this->language->get('entry_products');
		$this->data['entry_maps'] = $this->language->get('entry_maps');
		$this->data['entry_image'] = $this->language->get('entry_image');
		$this->data['entry_demension'] = $this->language->get('entry_demension');
		$this->data['entry_item_status'] = $this->language->get('entry_item_status');
		$this->data['entry_font_weight'] = $this->language->get('entry_font_weight');

		$this->data['button_save'] = $this->language->get('button_save');
		$this->data['button_cancel'] = $this->language->get('button_cancel');
		$this->data['button_update'] = $this->language->get('button_update');
		$this->data['button_add_module'] = $this->language->get('button_add_module');
		$this->data['button_remove'] = $this->language->get('button_remove');
		$this->data['button_save_and_stay'] = $this->language->get('button_save_and_stay');
		$this->data['button_add_item_menu'] = $this->language->get('button_add_item_menu');
		$this->data['button_save_tree'] = $this->language->get('button_save_tree');
		$this->data['button_clear_item_menu'] = $this->language->get('button_clear_item_menu');

		$this->data['general_debug_tooltip'] = $this->language->get('general_debug_tooltip');
		$this->data['general_version_tooltip'] = $this->language->get('general_version_tooltip');
		$this->data['general_custom_tooltip'] = $this->language->get('general_custom_tooltip');
		$this->data['menu_type_tooltip'] = $this->language->get('menu_type_tooltip');
		$this->data['column_break_tooltip'] = $this->language->get('column_break_tooltip');
		$this->data['label_tooltip'] = $this->language->get('label_tooltip');
		$this->data['menu_parentid_tooltip'] = $this->language->get('menu_parentid_tooltip');
		$this->data['menu_type_map_tooltip'] = $this->language->get('menu_type_map_tooltip');
		$this->data['menu_type_video_tooltip'] = $this->language->get('menu_type_video_tooltip');
		$this->data['menu_fontsize_tooltip'] = $this->language->get('menu_fontsize_tooltip');
		$this->data['general_theme_tooltip'] = $this->language->get('general_theme_tooltip');

 		if (isset($this->error['warning'])) {
			$this->data['error_warning'] = $this->error['warning'];
		} else {
			$this->data['error_warning'] = '';
		}

  		$this->data['breadcrumbs'] = array();

   		$this->data['breadcrumbs'][] = array(
       		'text'      => $this->language->get('text_home'),
			'href'      => $this->url->link('common/home', 'token=' . $this->session->data['token'], 'SSL'),
      		'separator' => false
   		);

   		$this->data['breadcrumbs'][] = array(
       		'text'      => $this->language->get('text_module'),
			'href'      => $this->url->link('extension/module', 'token=' . $this->session->data['token'], 'SSL'),
      		'separator' => ' :: '
   		);
		
   		$this->data['breadcrumbs'][] = array(
       		'text'      => $this->language->get('heading_title_main'),
			'href'      => $this->url->link('module/d_mega_menu', 'token=' . $this->session->data['token']. '&store_id='.$store_id, 'SSL'),
      		'separator' => ' :: '
   		);


		$this->data['action'] = $this->url->link('module/d_mega_menu', 'token=' . $this->session->data['token']. '&store_id='.$store_id, 'SSL');
		$this->data['cancel'] = $this->url->link('extension/module', 'token=' . $this->session->data['token'], 'SSL');	
		$this->data['actionDelete'] = $this->url->link('module/d_mega_menu/delete', 'token=' . $this->session->data['token']. '&store_id='.$store_id, 'SSL');
		$this->data['token'] = $this->session->data['token'];

		$this->data['d_mega_menu'] = array();
		
		if(isset($this->request->get['store_id'])){
			$store_id = $this->request->get['store_id'];
		}else{
			$store_id = $this->config->get('config_store_id');
		}
		
		if (isset($this->request->post['d_mega_menu'])) {
			$this->data['d_mega_menu'] = $this->request->post['d_mega_menu'];
		} elseif ($this->model_setting_setting->getSetting('d_mega_menu', $store_id)) { 
			$settings = $this->model_setting_setting->getSetting('d_mega_menu', $store_id);
			$this->data['d_mega_menu'] =  $settings['d_mega_menu']; 
		}

		$this->data['modules'] = array();
		
		if (isset($this->request->post['d_mega_menu_module'])) {
			$this->data['modules'] = $this->request->post['d_mega_menu_module'];
		} elseif ($this->config->get('d_mega_menu_module')) { 
			$this->data['modules'] = $this->config->get('d_mega_menu_module');
		}	


		$settings = $this->config->get('d_mega_menu_settings');
		if(empty($settings)){
			$this->config->load('d_mega_menu_settings');
			$settings = $this->config->get('d_mega_menu_settings');
		}

		if(!empty($this->data['d_mega_menu'])){
		$this->data['d_mega_menu'] = $this->array_merge_recursive_distinct($settings, $this->data['d_mega_menu']);
		}else{
			$this->data['d_mega_menu'] = $settings;
		}

		$this->data['d_mega_menu']['general']['store_id'] = $store_id;

		$result = $this->model_catalog_d_mega_menu->getTree();
		
		$this->data['tree'] = $this->generateTree($result);

		//Get stores
		$this->load->model('setting/store');
		$results = $this->model_setting_store->getStores();
		if($results){
			$this->data['stores'][] = array('store_id' => 0, 'name' => $this->config->get('config_name'));
			foreach ($results as $result) {
				$this->data['stores'][] = array(
					'store_id' => $result['store_id'],
					'name' => $result['name']
					
				);
			}	
		}

		//Get designes
		$dir    = DIR_CATALOG.'/view/theme/default/stylesheet/d_mega_menu';
		$files = scandir($dir);
		$this->data['themes'] = array();
		foreach($files as $file){
			if(strlen($file) > 3){
				$this->data['themes'][] = substr($file, 0, -4);
			}
		}

		if (isset($this->request->post['image'])) {
			$this->data['image'] = $this->request->post['image'];
		} else {
			$this->data['image'] = '';
		}
		$this->load->model('tool/image');

		if (isset($this->request->post['image']) && file_exists(DIR_IMAGE . $this->request->post['image'])) {
			$this->data['thumb'] = $this->model_tool_image->resize($this->request->post['image'], 100, 100);
		} elseif (!empty($category_info) && $category_info['image'] && file_exists(DIR_IMAGE . $category_info['image'])) {
			$this->data['thumb'] = $this->model_tool_image->resize($category_info['image'], 100, 100);
		} else {
			$this->data['thumb'] = $this->model_tool_image->resize('no_image.jpg', 100, 100);
		}
		
		$this->data['no_image'] = $this->model_tool_image->resize('no_image.jpg', 100, 100);

		if (isset($this->request->post['path'])) {
			$this->data['path'] = $this->request->post['path'];
		} else {
			$this->data['path'] = '';
		}

		$this->load->model('catalog/product');

		$this->data ['product_total'] = $this->model_catalog_product->getProducts();

		$this->load->model('design/banner');
		
		$this->data['banners'] = $this->model_design_banner->getBanners();

		$this->load->model('design/layout');
		
		$this->data['layouts'] = $this->model_design_layout->getLayouts();

                 $this->data['layouts'][] = array('layout_id'=>0, 'name' => 'All Pages' ); 
            

		$this->template = 'module/d_mega_menu.tpl';
		$this->children = array(
			'common/header',
			'common/footer'
		);
		
		$this->response->setOutput($this->render());
	}

	public function install() {
		$this->load->model('setting/setting');

		$this->load->model('catalog/d_mega_menu');

		$this->model_catalog_d_mega_menu->installDMegaMenu();
		
		$this->data['categories'] = array();
					
		$categories = $this->model_catalog_d_mega_menu->getCategories();

		$this->model_catalog_d_mega_menu->addItemMenu($categories);
		$file1 = str_replace("admin", "vqmod/xml", DIR_APPLICATION) . "a_vqmod_d_mega_menu.xml_"; $file2 = str_replace("admin", "vqmod/xml", DIR_APPLICATION) . "a_vqmod_d_mega_menu.xml";
		  if (file_exists($file1)) rename($file1, $file2);

	}
		 
	public function uninstall() {
		  $this->load->model('setting/setting');

		  $this->load->model('catalog/d_mega_menu');

		  $this->model_catalog_d_mega_menu->uninstallDMegaMenu();
		  $file1 = str_replace("admin", "vqmod/xml", DIR_APPLICATION) . "a_vqmod_d_mega_menu.xml"; $file2 = str_replace("admin", "vqmod/xml", DIR_APPLICATION) . "a_vqmod_d_mega_menu.xml_";
		    if (file_exists($file1)) rename($file1, $file2);

		 
	}
	
	protected function generateTree($tree){
		$result = '<ol class="dd-list">';

		foreach ($tree as $item) {
		if ($item['column_break']){
			$result .= '<li class="dd-item" data-id="'.$item['item_id'].'" style="border-bottom:2px solid #A9A9A9;" >';
			}else{
				$result .= '<li class="dd-item" data-id="'.$item['item_id'].'" >';
			}
			
			$result .= ' <div class="dd-handle" id="dd_'.$item['item_id'].'">'.$item['name'].' <div class="icons"><a onclick="editItem('.$item['item_id'].');"><span class="icon-pencil" id="'.$item['item_id'].'"></span></a> <a onclick="deleteItem('.$item['item_id'].');"><span class="icon-cancel" id="'.$item['item_id'].'"></span></a></div></div>';
			if (!empty($item['children'])){
				$result .= $this->generateTree($item['children']);
			}
			$result .= '</li>';
		}
		return $result .= '</ol>';
	}

	public function insert() {  
		print_r($this->request->post);
		if (($this->request->server['REQUEST_METHOD'] == 'POST')&& $this->validate()) {
			$this->load->model('catalog/d_mega_menu');
				print_r($this->request->post);
			$this->model_catalog_d_mega_menu->addItem($this->request->post);
		}
		
	}

	public function edit() {
		$json = array();
		
		$this->load->model('tool/image');

	
		if( isset($this->request->post['id'])&& $this->validate()){
			$this->load->model('catalog/d_mega_menu');

			$results = $this->model_catalog_d_mega_menu->getItem( (int)$this->request->post['id'] );

			foreach ($results as $result) {
				
					
					if (!empty($result['menu_type_params']['image']['image']) && file_exists(DIR_IMAGE . $result['menu_type_params']['image']['image'])) {
						$thumb = $this->model_tool_image->resize($result['menu_type_params']['image']['image'], 100, 100);
					} else {
						$thumb = $this->model_tool_image->resize('no_image.jpg', 100, 100);
					}
		
					if ($result['parent_id']!=0) {
						$item = $this->model_catalog_d_mega_menu->getItem($result['parent_id']);
							foreach ($item as $items) {
								$path = $items['name'];
							}
					} else {
						$path = '';
					}
					
					if (!empty($result['description'])){
						$description = html_entity_decode($result['description']);
					}else {
						$description = '';
					}
		
				$json = array(
					'item_id'     				=> $result['item_id'], 
					'name'       	 			=> $result['name'],
					'parent_id'   				=> $result['parent_id'],
					'column_break'      		=> $result['column_break'],
					'status'      				=> $result['status'],
					'menu_type'					=> $result['menu_type'],
					'color_text' 				=> $result['color_text'],
					'font_size'  				=> $result['font_size'],
					'description'				=> $description,
					'color_background' 			=> $result['color_background'],
					'font_family'    			=> $result['font_family'],
					'font_weight'    			=> $result['font_weight'],
					'url' 						=> $result['menu_type_params']['url'],
					'text' 						=> $result['menu_type_params']['text'],
					'video' 					=> $result['menu_type_params']['video']['video'],
					'video_width'       		=> $result['menu_type_params']['video']['width'],
					'video_height'      		=> $result['menu_type_params']['video']['height'],
					'maps' 						=> $result['menu_type_params']['maps']['maps'],
					'maps_width'        		=> $result['menu_type_params']['maps']['width'],
					'maps_height'       		=> $result['menu_type_params']['maps']['height'],
					'feed_title' 				=> $result['menu_type_params']['feed']['title'],
					'feed_link' 				=> $result['menu_type_params']['feed']['link'],
					'banner'      				=> $result['menu_type_params']['banner']['banner'],
					'banner_width'      		=> $result['menu_type_params']['banner']['width'],
					'banner_height'     		=> $result['menu_type_params']['banner']['height'],
					'products' 					=> $result['menu_type_params']['products']['products'],
					'products_width'    		=> $result['menu_type_params']['products']['width'],
					'products_height'   		=> $result['menu_type_params']['products']['height'],
					'image' 					=> $result['menu_type_params']['image']['image'],
					'image_width'       		=> $result['menu_type_params']['image']['width'],
					'image_height'      		=> $result['menu_type_params']['image']['height'],
					'slideshow' 				=> $result['menu_type_params']['slideshow']['banner'],
					'slideshow_height'  		=> $result['menu_type_params']['slideshow']['height'],
					'slideshow_width'   		=> $result['menu_type_params']['slideshow']['width'],
					'label_status'      		=> $result['menu_type_params']['label']['status'],
					'label_title'       		=> $result['menu_type_params']['label']['title'],
					'label_color_text'  		=> $result['menu_type_params']['label']['text_color'],
					'label_background_color'    => $result['menu_type_params']['label']['background_color'],
					'thumb' 					=> $thumb,
					'path' 			    		=> $path

				);
			}
		}	
		$this->response->setOutput(json_encode($json));
	}  

	public function update() { 
	$this->load->model('catalog/d_mega_menu'); 

		if (($this->request->server['REQUEST_METHOD'] == 'POST') && $this->validate()) {
			$this->model_catalog_d_mega_menu->updateItemMenu((int)$this->request->get['id'], $this->request->post);
		}
		
	}

	public function delete(){
		if( isset($this->request->get['id'])&& $this->validate()){
			$this->load->model('catalog/d_mega_menu');

			$this->model_catalog_d_mega_menu->delete( (int)$this->request->get['id'] );
		}
		$this->redirect($this->url->link('module/d_mega_menu', 'token=' . $this->session->data['token'], 'SSL'));
	}

	public function saveTreeMenu(){
		$result = array();

		$this->load->model('catalog/d_mega_menu');

		$json = $this->request->post['items'];
		$json = str_replace("&quot;", '"',$json);
		$json = json_decode($json,true);

		$result = $this->recursionAdd($json,0);

		$this->model_catalog_d_mega_menu->saveMenu($result);

	}

	public function recursionAdd($data,$parentID){
		$result = array();

		foreach ($data as $item) {
			$result[]=array('menuId' => $item['id'], 'parentId' => $parentID);

			if (isset($item['children'])) {
				$children = $this->recursionAdd($item['children'],$item['id']);

				$result = array_merge($result,$children);
			}
		}
		return $result;
	}
	
	protected function validate() {
		if (!$this->user->hasPermission('modify', 'module/d_mega_menu')) {
			$this->error['warning'] = $this->language->get('error_permission');
		}
		
		if (!$this->error) {
			return true;
		} else {
			return false;
		}	
	}

	public function array_merge_recursive_distinct( array &$array1, array &$array2 ){
	  $merged = $array1;	

	  foreach ( $array2 as $key => &$value ) {
			if ( is_array ( $value ) && isset ( $merged [$key] ) && is_array ( $merged [$key] ) ){
			  $merged [$key] = $this->array_merge_recursive_distinct ( $merged [$key], $value );
			}else{
			  $merged [$key] = $value;
			}
		  }
	  return $merged;
	}

	public function get_version(){
		$xml = file_get_contents(DIR_APPLICATION . 'mbooth/xml/' . $this->mbooth);

		$mbooth = new SimpleXMLElement($xml);

		return $mbooth->version ;
		}
		
	public function version_check(){
		$json = array();
		$mbooth = $this->mbooth;
		$this->load->language($this->route);
		$str = file_get_contents(DIR_APPLICATION . 'mbooth/xml/' . $this->mbooth);
		$xml = new SimpleXMLElement($str);
	
		$current_version = $xml->version ;
	
		$check_version_url = 'http://opencart.dreamvention.com/update/index.php?mbooth=' . $mbooth ;
		
		$curl = curl_init();
		curl_setopt($curl, CURLOPT_URL, $check_version_url);
		curl_setopt($curl, CURLOPT_RETURNTRANSFER, true);
		$return_data = curl_exec($curl);
		$return_code = curl_getinfo($curl, CURLINFO_HTTP_CODE);
		curl_close($curl);

      if ($return_code == 200) {
         $data = simplexml_load_string($return_data);
	
         if ((string) $data->version == (string) $current_version || (string) $data->version <= (string) $current_version) {
			 
           $json['success']   = $this->language->get('text_no_update');

         } elseif ((string) $data->version > (string) $current_version) {
			 
			$json['attention']   = $this->language->get('text_new_update');
				
			foreach($data->updates->update as $update){

				if((string) $update->attributes()->version > (string)$current_version){
					$version = (string)$update->attributes()->version;
					$json['update'][$version] = (string) $update[0];
				}
			}
         } else {
            $json['error']   = $this->language->get('text_error_update');
         }
      } else { 
         $json['error']   =  $this->language->get('text_error_failed');
      }
		 $json['asdasd']= 'asdasda';
	      if (file_exists(DIR_SYSTEM.'library/json.php')) { 
	         $this->load->library('json');
	         $this->response->setOutput(Json::encode($json));
	      } else {
	         $this->response->setOutput(json_encode($json));
	      }
	}
	
	public function autocomplete() {
		$json = array();
		
		if (isset($this->request->get['filter_name'])) {
			$this->load->model('catalog/d_mega_menu');
			
			$data = array(
				'filter_name' => $this->request->get['filter_name'],
				'start'       => 0,
				'limit'       => 20
			);
			
			$results =  $this->model_catalog_d_mega_menu->getCategoriesAutocomplete($data);
				
			foreach ($results as $result) {
				$json[] = array(
					'item_id' => $result['item_id'], 
					'name'    => strip_tags(html_entity_decode($result['name'], ENT_QUOTES, 'UTF-8'))
				);
			}		
		}
		$sort_order = array();
	  
		foreach ($json as $key => $value) {
			$sort_order[$key] = $value['name'];
		}

		array_multisort($sort_order, SORT_ASC, $json);

		$this->response->setOutput(json_encode($json));
	}

}

?>