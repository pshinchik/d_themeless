<?php
class ControllerModuleInfopage extends Controller {
	private $error = array(); 
	
	public function index() {   
		$this->load->language('module/infopage');

		$this->document->setTitle($this->language->get('heading_title'));
		
		$this->load->model('setting/setting');
		$this->load->model('catalog/information');
				
		if (($this->request->server['REQUEST_METHOD'] == 'POST') && $this->validate()) {			
			$this->model_setting_setting->editSetting('infopage', $this->request->post);		
			
			$this->session->data['success'] = $this->language->get('text_success');
			
			$this->redirect($this->url->link('extension/module', 'token=' . $this->session->data['token'], 'SSL'));
		}
				
		$this->data['heading_title'] = $this->language->get('heading_title');

		$this->data['text_enabled'] = $this->language->get('text_enabled');
		$this->data['text_disabled'] = $this->language->get('text_disabled');
		$this->data['text_content_top'] = $this->language->get('text_content_top');
		$this->data['text_content_bottom'] = $this->language->get('text_content_bottom');		
		$this->data['text_column_left'] = $this->language->get('text_column_left');

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
		
		$this->data['entry_page'] = $this->language->get('entry_page');
		$this->data['entry_display_title'] = $this->language->get('entry_display_title');
		$this->data['entry_layout'] = $this->language->get('entry_layout');
		$this->data['entry_position'] = $this->language->get('entry_position');
		$this->data['entry_status'] = $this->language->get('entry_status');
		$this->data['entry_sort_order'] = $this->language->get('entry_sort_order');
		
		$this->data['button_save'] = $this->language->get('button_save');
		$this->data['button_cancel'] = $this->language->get('button_cancel');
		$this->data['button_add_module'] = $this->language->get('button_add_module');
		$this->data['button_remove'] = $this->language->get('button_remove');
		
		$results = $this->model_catalog_information->getInformations();
		foreach ($results as $result)
		{
			$this->data['informations'][] = array(
				'information_id' => $result['information_id'],
				'title'          => $result['title']
			);
		}

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
       		'text'      => $this->language->get('heading_title'),
			'href'      => $this->url->link('module/infopage', 'token=' . $this->session->data['token'], 'SSL'),
      		'separator' => ' :: '
   		);
		
		$this->data['action'] = $this->url->link('module/infopage', 'token=' . $this->session->data['token'], 'SSL');
		
		$this->data['cancel'] = $this->url->link('extension/module', 'token=' . $this->session->data['token'], 'SSL');

		$this->data['modules'] = array();
		
		if (isset($this->request->post['infopage_module'])) {
			$this->data['modules'] = $this->request->post['infopage_module'];
		} elseif ($this->config->get('infopage_module')) { 
			$this->data['modules'] = $this->config->get('infopage_module');
		}		
				
		$this->load->model('design/layout');
		
		$this->data['layouts'] = $this->model_design_layout->getLayouts();

		$this->template = 'module/infopage.tpl';
		$this->children = array(
			'common/header',
			'common/footer'
		);
				
		$this->response->setOutput($this->render());
	}
	
	private function validate() {
		if (!$this->user->hasPermission('modify', 'module/infopage')) {
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