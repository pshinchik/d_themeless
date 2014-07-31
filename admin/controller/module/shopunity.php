<?php
require_once(DIR_SYSTEM . 'library/hyperlight/hyperlight.php');

class ControllerModuleShopunity extends Controller {
	private $error = array(); 
	public $route = 'module/shopunity';
	public $mbooth = 'mbooth_shopunity_admin.xml';
	 
	public function index() {   
		$this->language->load('module/shopunity');
		
		$this->document->addLink('//fonts.googleapis.com/css?family=PT+Sans:400,700,700italic,400italic&subset=latin,cyrillic-ext,latin-ext,cyrillic', "stylesheet");
	
		$this->document->addStyle('view/stylesheet/shopunity/normalize.css');
		$this->document->addStyle('view/stylesheet/shopunity/icons.css');
		$this->document->addStyle('view/javascript/shopunity/uniform/css/uniform.default.css');
		$this->document->addStyle('view/javascript/shopunity/colorpicker/jquery.colorpicker.css');
		$this->document->addStyle('view/stylesheet/shopunity/hyperlight.css');
		$this->document->addStyle('view/stylesheet/shopunity/shopunity.css');

		$this->document->addScript('view/javascript/shopunity/uniform/jquery.uniform.min.js');
		$this->document->addScript('view/javascript/shopunity/shopunity.js');
		$this->document->addScript('view/javascript/shopunity/jquery.quicksearch.js');
		$this->document->addScript('view/javascript/shopunity/jquery.nicescroll.min.js');
		$this->document->addScript('view/javascript/shopunity/colorpicker/jquery.colorpicker.js');
		$this->document->addScript('view/javascript/shopunity/jquery.nestable.js');

		$this->document->setTitle($this->language->get('heading_title_main'));
		
		$this->load->model('setting/setting');
		
		if(isset($this->request->get['store_id'])){ $store_id = $this->request->get['store_id']; }else{  $store_id = 0; }
		$this->data['store_id'] = $store_id;
				
		if (($this->request->server['REQUEST_METHOD'] == 'POST') && $this->validate()) {
			$this->model_setting_setting->editSetting('shopunity', $this->request->post, $store_id);		
			
			$this->session->data['success'] = $this->language->get('text_success');
						
			$this->redirect($this->url->link('extension/module', 'token=' . $this->session->data['token'], 'SSL'));
		}
		
		
		$this->data['heading_title'] = $this->language->get('heading_title_main');
		$this->data['version'] = $this->get_version();
		$this->data['route'] = $this->route;
		$this->data['module_link'] = $this->url->link($this->route, 'token=' . $this->session->data['token'], 'SSL');
		$this->data['token'] =  $this->session->data['token'];
		
		$this->data['text_settings'] = $this->language->get('text_settings');
		$this->data['text_instructions'] = $this->language->get('text_instructions');
		$this->data['text_instructions_full'] = $this->language->get('text_instructions_full');
		$this->data['text_module'] = $this->language->get('text_module');
		$this->data['text_support'] = $this->language->get('text_support');
		$this->data['text_content_top'] = $this->language->get('text_content_top');
		$this->data['text_content_bottom'] = $this->language->get('text_content_bottom');		
		$this->data['text_column_left'] = $this->language->get('text_column_left');
		$this->data['text_column_right'] = $this->language->get('text_column_right');
		$this->data['text_version_check'] = sprintf($this->language->get('text_version_check'), $this->data['version']);

		$this->data['entry_description'] = $this->language->get('entry_description');
		$this->data['entry_layout'] = $this->language->get('entry_layout');
		$this->data['entry_position'] = $this->language->get('entry_position');
		$this->data['entry_status'] = $this->language->get('entry_status');
		$this->data['entry_sort_order'] = $this->language->get('entry_sort_order');
		
		$this->data['button_save'] = $this->language->get('button_save');
		$this->data['button_cancel'] = $this->language->get('button_cancel');
		$this->data['button_save_and_stay'] = $this->language->get('button_save_and_stay');
		$this->data['button_version_check'] = $this->language->get('button_version_check');
		$this->data['button_support'] = $this->language->get('button_support');
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
       		'text'      => $this->language->get('text_module'),
			'href'      => $this->url->link('extension/module', 'token=' . $this->session->data['token'], 'SSL'),
      		'separator' => ' :: '
   		);
		
   		$this->data['breadcrumbs'][] = array(
       		'text'      => $this->language->get('heading_title_main'),
			'href'      => $this->url->link('module/shopunity', 'token=' . $this->session->data['token'], 'SSL'),
      		'separator' => ' :: '
   		);
		
		$this->data['action'] = $this->url->link('module/shopunity', 'token=' . $this->session->data['token']. '&store_id='.$store_id, 'SSL');
		
		$this->data['cancel'] = $this->url->link('extension/module', 'token=' . $this->session->data['token'], 'SSL');
		
		$this->data['token'] = $this->session->data['token'];

		$this->data['modules'] = array();
		
		if (isset($this->request->post['shopunity_module'])) {
			$this->data['modules'] = $this->request->post['shopunity_module'];
		} elseif ($this->config->get('shopunity_module')) { 
			$this->data['modules'] = $this->config->get('shopunity_module');
		}	
				
		$this->load->model('design/layout');
		
		$this->data['layouts'] = $this->model_design_layout->getLayouts();
		
		$this->load->model('localisation/language');
		
		$this->data['languages'] = $this->model_localisation_language->getLanguages();
		
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
		
		$this->template = 'module/shopunity.tpl';
		$this->children = array(
			'common/header',
			'common/footer'
		);
				
		$this->response->setOutput($this->render());
	}
	
	protected function validate() {
		if (!$this->user->hasPermission('modify', 'module/shopunity')) {
			$this->error['warning'] = $this->language->get('error_permission');
		}
		
		if (!$this->error) {
			return true;
		} else {
			return false;
		}	
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
}
?>