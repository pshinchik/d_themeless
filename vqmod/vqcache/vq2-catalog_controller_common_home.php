<?php  
class ControllerCommonHome extends Controller {
	public function index() {

			/*DREAMWHITE THEME BY DREAMVENTION.COM*/
			$this->data['breadcrumbs'][] = array(
						'text'      =>  $this->language->get('text_home'),
						'href'      => '',
						'separator' => ''
					);
			

			$this->data['config'] = $this->config->get('dreamtheme');
		$this->document->setTitle($this->config->get('config_title'));
		$this->document->setDescription($this->config->get('config_meta_description'));

		$this->data['heading_title'] = $this->config->get('config_title');
		
		if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/common/home.tpl')) {
			$this->template = $this->config->get('config_template') . '/template/common/home.tpl';
		} else {
			$this->template = 'default/template/common/home.tpl';
		}
		
		$this->children = array(

			'common/column_header',
			'common/column_footer',
			'common/column_extra1',
			'common/column_extra2',
			'common/column_extra3',
			'common/column_extra4',
			'common/column_extra5',
			'common/column_extra6',
			'common/column_extra7',
			'common/column_extra8',
			

            'common/column_mega_menu',
            
			'common/column_left',
			'common/column_right',
			'common/content_top',
			'common/content_bottom',
			'common/footer',
			'common/header'
		);
										
		$this->response->setOutput($this->render());
	}
}
?>