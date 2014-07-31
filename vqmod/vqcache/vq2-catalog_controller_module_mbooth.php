<?php
class ControllerModuleMBooth extends Controller {
	public function __construct($registry) {
		parent::__construct($registry);
		// Paths and Files
		$this->base_dir = substr_replace(DIR_SYSTEM, '/', -8);
		$this->mboot_script_dir = substr_replace(DIR_SYSTEM, '/admin/mbooth/xml/', -8);

	}


	public function index() {

			$this->data['config'] = $this->config->get('dreamtheme');
        if(isset($this->request->get['mbooth']) && isset($this->request->get['override']) ){
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
				}
			} 
			$this->zip_files($targets, $mbooth['id'].'_v'.$mbooth['version'] ); 

			}else{
				echo $mbooth;	
			}
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
			$cat=str_replace("catalog/", "", DIR_APPLICATION);
			
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

}
?>