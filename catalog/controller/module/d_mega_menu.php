<?php  
class ControllerModuleDMegaMenu extends Controller {

	public function index() {
		if (file_exists('catalog/view/theme/' . $this->config->get('config_template') . '/stylesheet/d_mega_menu/'.$this->settings['general']['theme'].'.css')) {
					$this->document->addStyle('catalog/view/theme/' . $this->config->get('config_template') .'/stylesheet/d_mega_menu/'.$this->settings['general']['theme'].'.css');
				} else {
					$this->document->addStyle('catalog/view/theme/default/stylesheet/d_mega_menu/'.$this->settings['general']['theme'].'.css');
				}
			echo '<pre>';
print_r($this->settings['general']['theme']);
	echo '</pre>';
		$this->load->model('catalog/d_mega_menu');
		$this->load->model('setting/setting');

		//load settings from database
		$results = $this->model_setting_setting->getSetting('d_mega_menu', $this->config->get('config_store_id'));
		$this->settings = $results['d_mega_menu'];
		
		$result = $this->model_catalog_d_mega_menu->getMenu();
		// echo '<pre>';
		// print_r($result);
		// echo '</pre>';
		$this->data['d_mega_menu'] = $result;
		$this->data['menu'] = $this->generateMenu($result,true); 
		 
		//These are default settings (located in system/config/d_mega_menu_settings.php)
		$settings = $this->config->get('d_mega_menu_settings');
		if(empty($settings)){
			$this->config->load('d_mega_menu_settings');
			$settings = $this->config->get('d_mega_menu_settings');
		}

		if(!empty($this->settings)){
			$this->settings = $this->array_merge_recursive_distinct($settings, $this->settings);
		}

		$this->data['settings'] = $this->settings;
		
		if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/module/d_mega_menu.tpl')) {
			$this->template = $this->config->get('config_template') . '/template/module/d_mega_menu.tpl';
		} else {
			$this->template = 'default/template/module/d_mega_menu.tpl';
		}
		
		$this->response->setOutput($this->render());

	}

	protected function generateMenu($data, $first=false){
	$result =  '';

		if(!$first){
			$result = '<div>';
		}
	
		$result .= '<ul>';
		
		foreach ($data as $item) {

			$result .= '<li>';
			$result .= $this->category_type($item);
			$result .= $this->url_type($item);
			$result .= $this->text_type($item);
			$result .= $this->video_type($item);
			$result .= $this->maps_type($item);
			$result .= $this->feed_type($item);
			$result .= $this->contacts_type($item);
			$result .= $this->banner_type($item);
			$result .= $this->products_type($item);
			$result .= $this->login_type($item);
			$result .= $this->image_type($item);
			$result .= $this->slideshow_type($item);
			
		

			if (!empty($item['children'])){
					$result .= $this->generateMenu($item['children']);
			}
				if($item['column_break']){
			
				 $result .= '</ul>';
				 $result .= '<ul>';
			}
			
			$result .= '</li>';
		}
			$result .= '</ul>';
			
			if(!$first){
				$result .= '</div>';
			}
			
		return $result;
	}

	protected function category_type($item){
		 $result = "";
		 if ($item['menu_type'] == 'category' && !empty($item['children'])) {
			$category_href = $this->url->link('product/category', 'path=' . $item['item_id']);
				return $result .=' <span class="category_label" style="background-color:'.$item['menu_type_params']['label']['background_color'].'; color:'.$item['menu_type_params']['label']['text_color'].';">'.$item['menu_type_params']['label']['title'].'</span><a href="'.$category_href.'"><i class="icon-chevron-down"></i><span style="color: '.$item['color_text'].'; background-color:'.$item['color_background'].'; font-size:'.$item['font_size'].'px; font-family:'.$item['font_family'].'; font-weight:'.$item['font_weight'].';">'.$item['name'].'</span></a>';
			}elseif($item['menu_type'] == 'category' && empty($item['children'])) {
			$category_href = $this->url->link('product/category', 'path=' . $item['item_id']);
				return $result .=' <span class="category_label" style="background-color:'.$item['menu_type_params']['label']['background_color'].'; color:'.$item['menu_type_params']['label']['text_color'].';">'.$item['menu_type_params']['label']['title'].'</span><a href="'.$category_href.'"><i></i><span style="color: '.$item['color_text'].'; background-color:'.$item['color_background'].'; font-size:'.$item['font_size'].'px; font-family:'.$item['font_family'].'; font-weight:'.$item['font_weight'].';">'.$item['name'].'</span></a>';
			}
	}

	protected function url_type($item){
		 $result = "";
		 if ($item['menu_type'] == 'url'&& isset($item['menu_type_params']['url'])) {

				return $result .= '<a href="'.$item['menu_type_params']['url'].'"><span style="color: '.$item['color_text'].'; background-color:'.$item['color_background'].'; font-size:'.$item['font_size'].'px; font-family:'.$item['font_family'].'; font-weight:'.$item['font_weight'].';">'.$item['menu_type_params']['url'].'</span></a>';
			}
	}

	protected function text_type($item){
		 $result = "";
		 if ($item['menu_type'] == 'text'&& isset($item['menu_type_params']['text'])) {

				 return $result .='<span style="color: '.$item['color_text'].'; background-color:'.$item['color_background'].'; font-size:'.$item['font_size'].'px; font-family:'.$item['font_family'].'; font-weight:'.$item['font_weight'].';">' .$item['menu_type_params']['text']. '</span>';
			}
	}

	protected function video_type($item){
		 $result = "";
		 if ($item['menu_type'] == 'video'&& isset($item['menu_type_params']['video']['video'])) {

				return	$result .='<div id="megamenu_video"><iframe width="' .$item['menu_type_params']['video']['width']. '" height="' .$item['menu_type_params']['video']['height']. '" src="' .$item['menu_type_params']['video']['video']. '" frameborder="0" allowfullscreen></iframe></div>';
			}
	}

	protected function maps_type($item){
		 $result = "";
		 if ($item['menu_type'] == 'maps'&& isset($item['menu_type_params']['maps']['maps'])) {

				return $result .='<div id="megamenu_maps"><iframe width="' .$item['menu_type_params']['maps']['width']. '" height="' .$item['menu_type_params']['maps']['height']. '" src="' .$item['menu_type_params']['maps']['maps']. '&output=embed" frameborder="0" scrolling="no" marginheight="0" marginwidth="0" ></iframe></div>';
			}
	}

	protected function feed_type($item){
		 $result = "";
		 if ($item['menu_type'] == 'feed'&& isset($item['menu_type_params']['feed'])) {

				return $result .= '<a href="'.$item['menu_type_params']['feed']['link'].'"><span style="color: '.$item['color_text'].'; background-color:'.$item['color_background'].'; font-size:'.$item['font_size'].'px; font-family:'.$item['font_family'].'; font-weight:'.$item['font_weight'].';">'.$item['menu_type_params']['feed']['title'].'</span></a>';
			}
	}

	protected function contacts_type($item){
		 $result = "";
		 if ($item['menu_type'] == 'contacts') {
				$this->language->load('information/contact');

				return $result .= ' <div id="megamenu_contacts"><div style="color: '.$item['color_text'].'; background-color:'.$item['color_background'].'; font-size:'.$item['font_size'].'px; font-family:'.$item['font_family'].'; font-weight:'.$item['font_weight'].';"><b>' . $this->language->get('text_address'). '</b><br />' .$this->config->get('config_name'). '<br />' .$this->config->get('config_address'). '<br /> <b>' .$this->language->get('text_telephone'). '</b><br />' .$this->config->get('config_telephone'). '<br /><b>' . $this->language->get('text_fax') . '</b><br />' . $this->config->get('config_fax'). ' </div></div>';
			}
	}

	protected function banner_type($item){
		 $result = "";
		 if ($item['menu_type'] == 'banner'&& isset($item['menu_type_params']['banner'])) {
				$this->load->model('design/banner');

				$menuBanner = $this->model_design_banner->getBanner($item['menu_type_params']['banner']['banner']);

				return $result .= '<div id="megamenu_banner"><a href="'. $menuBanner[0]['link'].'"><img src="image/'.$menuBanner[0]['image'].'" alt="'.$menuBanner[0]['title'].'" title="'.$menuBanner[0]['title'].'" height="'.$item['menu_type_params']['banner']['height'].'" width="'.$item['menu_type_params']['banner']['width'].'" /></a></div>';
			}
	}

	protected function slideshow_type($item){
		 $result = "";
		 if ($item['menu_type'] == 'slideshow' && isset($item['menu_type_params']['slideshow']['banner'])) {
				$this->load->model('design/banner');

				$menuBanners = $this->model_design_banner->getBanner($item['menu_type_params']['slideshow']['banner']);
				
				$result .= '<div id="megamenu_slideshow"><div class="slideshow">';
				$result .= '<div id="slideshow'.$item['item_id'].'"class="nivoSlider">';
				foreach ($menuBanners as $menuBanner) {
				$result .= '<a class="nivo-imageLink" href="'. $menuBanner['link'].'"><img src="image/'.$menuBanner['image'].'" alt="'.$menuBanner['title'].'" title="'.$menuBanner['title'].'" width="'.$item['menu_type_params']['slideshow']['width'].'" height="'.$item['menu_type_params']['slideshow']['height'].'"/></a>';
				}
				$result.='</div></div></div><script type="text/javascript">$(document).ready(function() {$(\'#slideshow'.$item['item_id'].'\').nivoSlider();});</script>';
			return $result;
		}
	}

	protected function products_type($item){
		 $result = "";
		 if ($item['menu_type'] == 'products'&& isset($item['menu_type_params']['products'])) {
				$this->load->model('catalog/d_mega_menu');

				$product_href = $this->url->link('product/product', 'product_id=' .$item['menu_type_params']['products']['products']);

				$product = $this->model_catalog_product->getProduct($item['menu_type_params']['products']['products']);

				return $result .= '<div id="megamenu_products"><a href="'.$product_href.'"><img width="'.$item['menu_type_params']['products']['width'].'" height="'.$item['menu_type_params']['products']['height'].'"  src="image/'. $product['image'] .'" alt="'. $product['name'].'" /><div><span style="color: '.$item['color_text'].'; background-color:'.$item['color_background'].'; font-size:'.$item['font_size'].'px; font-family:'.$item['font_family'].'; font-weight:'.$item['font_weight'].';">'. $product['name'].'</span></div></a></div>';
			}
	}

	protected function image_type($item){
		 $result = "";
		 if ($item['menu_type'] == 'image'&& isset($item['menu_type_params']['image'])) {

				 return $result .= '<div id="megamenu_image"><img name="image" alt="" src="image/'.$item['menu_type_params']['image']['image'].'" height="'.$item['menu_type_params']['image']['height'].'" width="'.$item['menu_type_params']['image']['width'].'"/></div>';
			}
	}

	protected function login_type($item){
		$result = "";
		$this->load->model('account/customer');
		$this->language->load('account/login');

		$this->data['text_forgotten'] = $this->language->get('text_forgotten');
    	$this->data['entry_email'] = $this->language->get('entry_email');
    	$this->data['entry_password'] = $this->language->get('entry_password');
    	$this->data['button_continue'] = $this->language->get('button_continue');
		$this->data['button_login'] = $this->language->get('button_login');

		if (isset($this->error['warning'])) {
			$this->data['error_warning'] = $this->error['warning'];
		} else {
			$this->data['error_warning'] = '';
		}
		
		$this->data['action'] = $this->url->link('account/login', '', 'SSL');
		$this->data['register'] = $this->url->link('account/register', '', 'SSL');
		$this->data['forgotten'] = $this->url->link('account/forgotten', '', 'SSL');

		if (isset($this->request->post['redirect']) && (strpos($this->request->post['redirect'], $this->config->get('config_url')) !== false || strpos($this->request->post['redirect'], $this->config->get('config_ssl')) !== false)) {
			$this->data['redirect'] = $this->request->post['redirect'];
		} elseif (isset($this->session->data['redirect'])) {
      		$this->data['redirect'] = $this->session->data['redirect'];
	  		
			unset($this->session->data['redirect']);		  	
    	} else {
			$this->data['redirect'] = '';
		}

		if (isset($this->session->data['success'])) {
    		$this->data['success'] = $this->session->data['success'];
    
			unset($this->session->data['success']);
		} else {
			$this->data['success'] = '';
		}
		
		if (isset($this->request->post['email'])) {
			$this->data['email'] = $this->request->post['email'];
		} else {
			$this->data['email'] = '';
		}

		if (isset($this->request->post['password'])) {
			$this->data['password'] = $this->request->post['password'];
		} else {
			$this->data['password'] = '';
		}
		if ($item['menu_type'] == 'login') {

			$result .= '<form action="'. $this->data['action'] .'" method="post" enctype="multipart/form-data">
	         <div id="megamenu_login"><div style="color: '.$item['color_text'].'; background-color:'.$item['color_background'].'; font-size:'.$item['font_size'].'; font-family:'.$item['font_family'].'; font-weight:'.$item['font_weight'].';">
	          <input type="text" name="email" value="'.$this->data['entry_email'].'" />
	          <input type="password" name="password" id ="d_login_module_password" value="'. $this->data['entry_password'].'" />
			  <a href="'. $this->data['forgotten'].'">'. $this->data['text_forgotten'].'</a>
	          <input class="submit" type="submit" value="'. $this->data['button_login'].'" class="button" />
	          
	         </div></div></form>';

     	 return $result;
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
}
?>