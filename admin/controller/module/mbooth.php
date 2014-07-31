<?php

class ControllerModuleMBooth extends Controller {
	public $route = 'module/mbooth';
	public $mbooth = 'mbooth.xml';
	private $error = array(); 
	private $input = array();
        
	public function __construct($registry) {
		parent::__construct($registry);
		// Paths and Files
		$this->base_dir = substr_replace(DIR_SYSTEM, '/', -8);
		$this->mboot_script_dir = substr_replace(DIR_SYSTEM, '/admin/mbooth/xml/', -8);

	}
        
	public function index(){
		$this->document->addLink('//fonts.googleapis.com/css?family=PT+Sans:400,700,700italic,400italic&subset=latin,cyrillic-ext,latin-ext,cyrillic', "stylesheet");
		$this->document->addStyle('view/stylesheet/shopunity/normalize.css');
		$this->document->addStyle('view/javascript/shopunity/uniform/css/uniform.default.css');
		$this->document->addStyle('view/stylesheet/shopunity/icons.css');
		$this->document->addStyle('view/stylesheet/shopunity/shopunity.css');
		$this->document->addScript('view/javascript/shopunity/uniform/jquery.uniform.min.js');		
		$this->document->addScript('view/javascript/shopunity/shopunity.js');
		$this->document->addScript('view/javascript/shopunity/tooltip/tooltip.js');

		$this->load->language('module/mbooth');

		$this->document->setTitle($this->language->get('heading_title_main'));

		$this->data['version'] = $this->get_version();
        $this->data['token'] =  $this->session->data['token'];
		$this->data['route'] = $this->route;

		$this->data['heading_title'] = $this->language->get('heading_title_main');

		$this->data['text_enabled'] = $this->language->get('text_enabled');
		$this->data['text_disabled'] = $this->language->get('text_disabled');
		$this->data['text_module_name'] = $this->language->get('text_module_name');
		$this->data['text_module_version'] = $this->language->get('text_module_version');
		$this->data['text_module_author'] = $this->language->get('text_module_author');
		$this->data['text_module_activity'] = $this->language->get('text_module_activity');
		$this->data['text_module_id'] = $this->language->get('text_module_id');
		$this->data['text_confirm_delete'] = $this->language->get('text_confirm_delete');
		$this->data['text_no_results'] = $this->language->get('text_no_results');
		$this->data['text_module'] = $this->language->get('text_module');
		$this->data['text_instructions_full'] = $this->language->get('text_instructions_full');
		$this->data['text_version_check'] = sprintf($this->language->get('text_version_check'), $this->data['version']);
		$this->data['text_no_update'] = $this->language->get('text_no_update');
		$this->data['text_new_update'] = $this->language->get('text_new_update');
		$this->data['text_error_update'] = $this->language->get('text_error_update');
		$this->data['text_error_failed'] = $this->language->get('text_error_failed');

		$this->data['button_version_check'] = $this->language->get('button_version_check');
		$this->data['button_upload'] = $this->language->get('button_upload');
		$this->data['button_download'] = $this->language->get('button_download');
		$this->data['button_delete'] = $this->language->get('button_delete');
		$this->data['button_save'] = $this->language->get('button_save');
		$this->data['button_cancel'] = $this->language->get('button_cancel');
		$this->data['button_save_and_stay'] = $this->language->get('button_save_and_stay');
		$this->data['general_version_tooltip'] = $this->language->get('general_version_tooltip');

        if (isset($this->error['warning'])) {
			$this->data['error_warning'] = $this->error['warning'];
		} else {
			$this->data['error_warning'] = '';
		}
        
		if (isset($this->session->data['warning'] )) {
			$this->data['error_warning'] = $this->session->data['warning'] ;
		} else {
			$this->data['error_warning'] = '';
		}
		if (isset($this->session->data['success'])) {
			$this->data['success'] = $this->session->data['success'];
		
			unset($this->session->data['success']);
		} else {
			$this->data['success'] = '';
		}

		if (isset($this->session->data['error'])) {
			$this->data['error'] = $this->session->data['error'];
		
			unset($this->session->data['error']);
		} else {
			$this->data['error'] = '';
		} 
        if (isset($this->error['filename'])) {
			$this->data['error_filename'] = $this->error['filename'];
		} else {
			$this->data['error_filename'] = '';
		}
               
                
        if (isset($this->request->post['filename'])) {
    		$this->data['filename'] = $this->request->post['filename'];
        } elseif (!empty($download_info)) {
      		$this->data['filename'] = $download_info['filename'];
		} else {
			$this->data['filename'] = '';
		}
		
		$this->data['breadcrumbs'] = array(); 
   		$this->data['breadcrumbs'][] = array(
       		'text' => $this->language->get('text_home'),
			'href' => $this->url->link('common/home', 'token=' . $this->session->data['token'], 'SSL'),
      		'separator' => false
   		);

        $this->data['breadcrumbs'][] = array(
       		'text'      => $this->language->get('text_module'),
			'href'      => $this->url->link('extension/module', 'token=' . $this->session->data['token'], 'SSL'),
      		'separator' => ' :: '
   		);

   		$this->data['breadcrumbs'][] = array(
       		'text' => $this->language->get('heading_title_main'),
			'href' => $this->url->link('module/mbooth', 'token=' . $this->session->data['token'], 'SSL'),
      		'separator' => ' :: '
   		);
                
        $this->data['action'] = $this->url->link('module/welcome', 'token=' . $this->session->data['token'], 'SSL');
		$this->data['cancel'] = $this->url->link('extension/module', 'token=' . $this->session->data['token'], 'SSL');
		$this->data['token'] = $this->session->data['token'];
		$this->data['modules'] = array();
		
		if (isset($this->request->post['mbooth'])) {
			$this->data['modules'] = $this->request->post['mbooth'];
		} elseif ($this->config->get('mbooth')) { 
			$this->data['modules'] = $this->config->get('mbooth');
		}
                
		// find all xml files in folder mbooth/xml
		$list_mbooth_scripts = $this->list_mbooth_scripts(); 
		foreach ($list_mbooth_scripts as $mbooth_script){
			
			$xml = simplexml_load_file($mbooth_script);
			if(isset($xml->mbooth_version)){
			$this->data['xml_scripts'][] = array(
				'file_name' =>   basename($mbooth_script, ''),
				'id'             => isset($xml->id) ? $xml->id : $this->language->get('text_unavailable'),
				'type'           => isset($xml->type) ? $xml->type : $this->language->get('text_unavailable'),
				'version'        => isset($xml->version) ? $xml->version : $this->language->get('text_unavailable'),
				'mbooth_version' => isset($xml->mbooth_version) ? $xml->mbooth_version : $this->language->get('text_unavailable'),
				'author'         => isset($xml->author) ? $xml->author : $this->language->get('text_unavailable'),
				'download'       => $this->url->link('module/mbooth/download', 'token=' . $this->session->data['token'] . '&mbooth=' . basename($mbooth_script), 'SSL'),
				'delete'         => $this->url->link('module/mbooth/delete', 'token=' . $this->session->data['token'] . '&mbooth=' . basename($mbooth_script), 'SSL')
			);
			}
		}                 
        $this->template = 'module/mbooth.tpl';
		$this->children = array(
			'common/header',
			'common/footer'
		);		
		unset($this->session->data['warning']);
		$this->response->setOutput($this->render());
	}
	
	private function list_mbooth_scripts() {
		$mbooth_scripts = array();
		if ($this->userPermission('access')) {
			$enabled_mbooth_scripts = glob($this->mboot_script_dir . '*.xml');
			$disabled_mbooth_scripts = glob($this->mboot_script_dir . '*.xml_');

			if (!empty($enabled_mbooth_scripts)) {
				$mbooth_scripts = array_merge($mbooth_scripts, $enabled_mbooth_scripts);
			}

			if (!empty($disabled_mbooth_scripts)) {
				$mbooth_scripts = array_merge($mbooth_scripts, $disabled_mbooth_scripts);
			}
		}
		return $mbooth_scripts;
	}
        
    public function delete() {
		if ($this->userPermission()) {
			$xml_script = $this->request->get['mbooth'];
			$this->session->data['error'] = '';
			$this->session->data['success'] = '';
			$mbooth = $this->parse_mbooth_script($this->mboot_script_dir . $xml_script);
			foreach($mbooth['files'] as $file){			
				if (is_file($this->base_dir . $file)) {
					if (@unlink($this->base_dir . $file)) {
						$this->session->data['success'] .= '<br />' .$file;
					} else {
						$this->session->data['error'] .= '<br />' .$file;
						
					}
					$dir = dirname($this->base_dir . $file);
					while(strlen($dir) > strlen($this->base_dir)){
						if (is_dir($dir)) {
							if ($this->is_dir_empty($dir)) {
								if(rmdir($dir)){
									$this->session->data['success'] .= '<br />' .dirname($dir);
									$dir = dirname($dir);
								}
							}else{
								break;	
							}
						}else{
							break;	
						}
					}
				
				}else{
					$this->session->data['error'] .= '<br />' .$file;
				}
			}
			if($this->session->data['error'] != '') {$this->session->data['error'] = $this->language->get('error_delete') . $this->session->data['error']; }
			if($this->session->data['success'] != '') {$this->session->data['success'] = $this->language->get('success_delete') . $this->session->data['success']; }
		}
		$this->redirect($this->url->link('module/mbooth', 'token=' . $this->session->data['token'], 'SSL'));
	} 
        
     public function is_dir_empty($dir) {
	  if (!is_readable($dir)) return NULL; 
	  $handle = opendir($dir);
	  while (false !== ($entry = readdir($handle))) {
		if ($entry != "." && $entry != "..") {
		  return false;
		}
	  }
	  return true;
	} 
    public function download() {
		if ($this->userPermission()) {                  
			
			// Parse xml files
			$mbooth = $this->parse_mbooth_script($this->mboot_script_dir.$this->request->get['mbooth']);   
			if($mbooth){
			// collect all files
			foreach($mbooth['files'] as $target){
				$glob_dir = glob($this->base_dir.$target);
				if(isset($glob_dir[0])){
				$targets[] = array(
					'target' => $glob_dir[0],
					'file' => $target
					);
				}else{
					$this->session->data['warning'] = $this->language->get('error_warning');
					$this->redirect($this->url->link('module/mbooth', 'token=' . $this->session->data['token'], 'SSL'));	
				}
			} 
			$this->zip_files($targets, $mbooth['id'].'_v'.$mbooth['version'] ); 

			}else{
				echo $mbooth;	
			}
		} else {
			$this->redirect($this->url->link('module/mbooth', 'token=' . $this->session->data['token'], 'SSL'));
		}      
	}
        
    public function parse_mbooth_script($mbooth_script){
		$str = file_get_contents($mbooth_script);
		$xml = new SimpleXMLElement($str);
	  	if(isset($xml->mbooth_version)){
			$result['file_name'] =   basename($mbooth_script, '');
			$result['id'] = isset($xml->id) ? (string)$xml->id : $this->language->get('text_unavailable');
			$result['type'] = isset($xml->type) ? (string)$xml->type : $this->language->get('text_unavailable');
			$result['version'] = isset($xml->version) ? (string)$xml->version : $this->language->get('text_unavailable');
			$result['mbooth_version'] = isset($xml->mbooth_version) ? (string)$xml->mbooth_version : $this->language->get('text_unavailable');
			$result['author'] = isset($xml->author) ? (string)$xml->author : $this->language->get('text_unavailable');
			$files = $xml->files;
			$dirs = $xml->dirs;
			
			foreach ($files->file as $file){
			   $result['files'][] = (string)$file; 
			} 
			
			if (count($dirs)>0) {
			$arr_files=array();
			$cat=str_replace("admin/", "", DIR_APPLICATION);
			
			foreach ($dirs->dir as $dir) {
				$this->scandir($cat . $dir, $arr_files);
			}
			
			foreach ($arr_files as $file) {
				$file=str_replace($cat, "", $file);
				$result['files'][] = (string)$file;
			}
			}
			
			return $result;  
		}else{
			return false;
		}
	}
    
	private function zip_files($targets, $filename = 'module_') {
		//print_r($targets);
		$temp = tempnam(ini_get('upload_tmp_dir'), 'zip');
		$zip = new ZipArchive();
		$zip->open($temp, ZipArchive::OVERWRITE);
		
		foreach ($targets as $target) {
			if (is_file($target['target'])) {
				$zip->addFile($target['target'], 'upload/'.$target['file']);
			}
		}
		
		$zip->close();

		header('Pragma: public');
		header('Expires: 0');
		header('Content-Description: File Transfer');
		header('Content-Type: mbooth/xml');
		header('Content-Disposition: attachment; filename=' . $filename . '_' . date('Y-m-d') . '.zip');
		header('Content-Transfer-Encoding: binary');
		readfile($temp);
		unlink($temp);
	}
	
	public function upload() {
		$this->language->load('module/mbooth');		
		$json = array();
		
		if (!empty($this->request->files['file']['name'])) {
			$filename = basename(html_entity_decode($this->request->files['file']['name'], ENT_QUOTES, 'UTF-8'));	
					
			if ((utf8_strlen($filename) < 3) || (utf8_strlen($filename) > 128)) {
				$json['error'] = $this->language->get('error_filename');
			}	  						
			if ($this->request->files['file']['error'] != UPLOAD_ERR_OK) {
				$json['error'] = $this->language->get('error_upload_' . $this->request->files['file']['error']);
			}
		} else {
			$json['error'] = $this->language->get('error_upload');
		}
		
		if (!isset($json['error'])) {
			if (is_uploaded_file($this->request->files['file']['tmp_name']) && file_exists($this->request->files['file']['tmp_name'])) {			 
				$json['filename'] = $filename;
				move_uploaded_file($this->request->files['file']['tmp_name'], $this->mboot_script_dir . $filename);
				
				$mbooth = $this->parse_mbooth_script( $this->mboot_script_dir .$filename);
				
				$json['mbooth'] = $mbooth;
				$json['mbooth']['download']  = $this->url->link('module/mbooth/download', 'token=' . $this->session->data['token'] . '&mbooth=' . basename($filename), 'SSL');
				$json['mbooth']['delete']   = $this->url->link('module/mbooth/delete', 'token=' . $this->session->data['token'] . '&mbooth=' . basename($filename), 'SSL');
	
			}						
			$json['success'] = $this->language->get('entry_success_upload');
		}	
		$this->response->setOutput(json_encode($json));
	}
    
	private function userPermission($permission = 'modify') {
		$this->language->load('module/mbooth');
		
		if (!$this->user->hasPermission($permission, 'module/mbooth')) {
            $this->session->data['error'] = $this->language->get('error_permission');
            return false;
		}else{
        	return true;
		}
	}  
	private function scandir($folder, &$arr_files){
		
        if (is_dir($folder)){
        $handle = opendir($folder);
        while ($subfile = readdir($handle)){
                if ($subfile == '.' or $subfile == '..') continue;
                if (is_file($subfile)) $arr_files[]="$folder/$subfile";
                else $this->scandir("$folder/$subfile", $arr_files);
        }
        closedir($handle);
        }
        else $arr_files[]=$folder;
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
