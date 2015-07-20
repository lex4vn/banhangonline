<?php  
class ControllerModuleFbpixel extends Controller {
	protected function index($setting) {
		$this->language->load('module/fbpixel');
		
		$this->data['heading_title'] = sprintf($this->language->get('heading_title'), $this->config->get('config_name'));

		$this->data['message'] = html_entity_decode($setting['description'][$this->config->get('config_language_id')], ENT_QUOTES, 'UTF-8');

		if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/module/fbpixel.tpl')) {
			$this->template = $this->config->get('config_template') . '/template/module/fbpixel.tpl';
		} else {
			$this->template = 'default/template/module/fbpixel.tpl';
		}
		
		$this->render();
	}
}
?>