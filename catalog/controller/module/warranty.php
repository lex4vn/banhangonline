<?php
class ControllerModuleWarranty extends Controller {
	protected function index($setting) {
              $this->language->load('module/warranty');
		static $module = 0;
		
		$this->data['width'] = $setting['image_width'];
		$this->data['height'] = $setting['image_height'];
		$this->data['heading_title'] = $this->language->get('heading_title');
		// image		
		$this->load->model('tool/image');

		$this->data['images'] = array();

        $image_avatars = $this->config->get('image_avatar_w');
	
		foreach ($image_avatars as $image_avatar) {
                    if($image_avatar['image']){
				
				$image = $this->model_tool_image->resize($image_avatar['image'], $setting['image_width'], $setting['image_height']);
                               
                    }  else {
                       $image =$this->model_tool_image->resize( 'no_image.jpg', $setting['image_width'], $setting['image_height']);
                       print_r($image);
                      
                    }
                     
				$this->data['images'][] = array(
					'position'           => $image_avatar['position'],			
					'name'           => $image_avatar['name'],			
					'phone'           => $image_avatar['phone'],			
					'email'           => $image_avatar['email'],			
					'yahoo'           => $image_avatar['yahoo'],			
					'skype'           => $image_avatar['skype'],			
					'image'           => $image
				);	
		} 
		
		$this->data['module'] = $module++;
				
		if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/module/warranty.tpl')) {
			$this->template = $this->config->get('config_template') . '/template/module/warranty.tpl';
		} else {
			$this->template = 'default/template/module/warranty.tpl';
		}

		$this->render();
	}
        function catchFirstImage($content) {
		  $first_img = ''; 
		  $output = preg_match_all('/<img.+src=[\'"]([^\'"]+)[\'"].*>/i', $content, $matches);
		  if(isset($matches[1][0])){
			$first_img = $matches[1][0];
			}
		  if(empty($first_img)){ //Defines a default image
			$first_img = "no_image.jpg";
		  }
		  return $first_img;
		} //end function	
}
?>