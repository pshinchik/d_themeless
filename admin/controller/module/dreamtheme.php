<?php
class ControllerModuleDreamtheme extends Controller {
	private $error = array(); 
	 
	public function index() {   
		$this->load->language('setting/setting');
		$this->load->language('module/dreamtheme');

		$this->document->setTitle($this->language->get('heading_title'));
		
		$this->load->model('setting/setting');
		
		$this->data['success'] = '';
		
		if (($this->request->server['REQUEST_METHOD'] == 'POST') && $this->validate()) {
			$this->model_setting_setting->editSetting('dreamtheme', $this->request->post);		
			
			$this->data['success'] = $this->language->get('text_success');
						

		}
				
		$this->data['heading_title'] = $this->language->get('heading_title');

		$this->data['text_enabled'] = $this->language->get('text_enabled');
		$this->data['text_disabled'] = $this->language->get('text_disabled');

		$this->data['entry_description'] = $this->language->get('entry_description');
		$this->data['entry_layout'] = $this->language->get('entry_layout');
		$this->data['entry_position'] = $this->language->get('entry_position');
		$this->data['entry_status'] = $this->language->get('entry_status');
		$this->data['entry_sort_order'] = $this->language->get('entry_sort_order');
		$this->data['text_image_manager'] = $this->language->get('text_image_manager');
		
		
		// Words
		$this->data['settings_yes'] = $this->language->get('settings_yes');
		$this->data['settings_no'] = $this->language->get('settings_no');
		$this->data['settings_display'] = $this->language->get('settings_display');
		$this->data['settings_require'] = $this->language->get('settings_require');		
		$this->data['settings_grid'] = $this->language->get('settings_grid');
		$this->data['settings_list'] = $this->language->get('settings_list');	
		$this->data['settings_top'] = $this->language->get('settings_top');
		$this->data['settings_bottom'] = $this->language->get('settings_bottom');	
		
		// Settings
		$this->data['settings_product_border'] = $this->language->get('settings_product_border');
		$this->data['settings_module_border'] = $this->language->get('settings_module_border');
		$this->data['settings_breadcrumbs'] = $this->language->get('settings_breadcrumbs');
		$this->data['settings_header_bg'] = $this->language->get('settings_header_bg');
		$this->data['settings_footer_bg'] = $this->language->get('settings_footer_bg');
		$this->data['text_browse'] = $this->language->get('text_browse');
		$this->data['text_clear'] = $this->language->get('text_clear');
		$this->data['settings_informations'] = $this->language->get('settings_informations');	
		$this->data['settings_social_networks'] = $this->language->get('settings_social_networks');
		$this->data['settings_contact'] = $this->language->get('settings_contact');
		
		
		// Category
		$this->data['category_description_position'] = $this->language->get('category_description_position');
		$this->data['category_product_display'] = $this->language->get('category_product_display');	
		$this->data['category_ajax_pages'] = $this->language->get('category_ajax_pages');	
		
						
		$this->data['button_save'] = $this->language->get('button_save');
		$this->data['button_cancel'] = $this->language->get('button_cancel');
		$this->data['button_add_module'] = $this->language->get('button_add_module');
		$this->data['button_remove'] = $this->language->get('button_remove');
		
		$this->data['tab_module'] = $this->language->get('tab_module');

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
       		'text'      => $this->language->get('heading_title'),
			'href'      => $this->url->link('module/dreamtheme', 'token=' . $this->session->data['token'], 'SSL'),
      		'separator' => ' :: '
   		);
		
		$this->data['action'] = $this->url->link('module/dreamtheme', 'token=' . $this->session->data['token'], 'SSL');
		
		$this->data['cancel'] = $this->url->link('extension/module', 'token=' . $this->session->data['token'], 'SSL');
		
		$this->data['token'] = $this->session->data['token'];

		$this->data['dreamtheme'] = array();
		
		if (isset($this->request->post['dreamtheme'])) {
			$this->data['dreamtheme'] = $this->request->post['dreamtheme'];
		} elseif ($this->config->get('dreamtheme')) { 
			$this->data['dreamtheme'] = $this->config->get('dreamtheme');
		}
		$this->load->model('tool/image');
		
		$header_bg = $this->data['dreamtheme']['settings']['header_bg'];
		if ($header_bg && file_exists(DIR_IMAGE . $header_bg) && is_file(DIR_IMAGE . $header_bg)) {
			$this->data['dreamtheme']['settings']['header_bg_img'] = $this->model_tool_image->resize($header_bg, 100, 100);		
		} else {
			$this->data['dreamtheme']['settings']['header_bg_img'] = $this->model_tool_image->resize('no_image.jpg', 100, 100);
		}
		
		$footer_bg = $this->data['dreamtheme']['settings']['footer_bg'];
		if ($footer_bg && file_exists(DIR_IMAGE . $footer_bg) && is_file(DIR_IMAGE . $footer_bg)) {
			$this->data['dreamtheme']['settings']['footer_bg_img'] = $this->model_tool_image->resize($footer_bg, 100, 100);		
		} else {
			$this->data['dreamtheme']['settings']['footer_bg_img'] = $this->model_tool_image->resize('no_image.jpg', 100, 100);
		}
		
		$this->data['no_image'] = $this->model_tool_image->resize('no_image.jpg', 100, 100);
		
		$this->load->model('localisation/language');
		
		$this->data['languages'] = $this->model_localisation_language->getLanguages();

		$this->load->model('catalog/information');
		
		$this->data['informations'] = $this->model_catalog_information->getInformations();

		

		$this->template = 'module/dreamtheme.tpl';
		$this->children = array(
			'common/header',
			'common/footer'
		);
				
		$this->response->setOutput($this->render());
	}
	
	private function validate() {
		if (!$this->user->hasPermission('modify', 'module/dreamtheme')) {
			$this->error['warning'] = $this->language->get('error_permission');
		}
		
		if (!$this->error) {
			return true;
		} else {
			return false;
		}	
	}
}
?>