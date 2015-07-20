<?php  
class ControllermodulePavautosearch extends Controller {
	protected function index( $setting ) {
	
		static $module = 0;
		$this->load->language('module/pavautosearch');
		$this->load->model('tool/image');
		$this->load->model('catalog/category');
		$this->load->model('catalog/manufacturer');

		if (file_exists('catalog/view/theme/' . $this->config->get('config_template') . '/stylesheet/pavautosearch.css')) {
			$this->document->addStyle('catalog/view/theme/' . $this->config->get('config_template') . '/stylesheet/pavautosearch.css');
		} else {
			$this->document->addStyle('catalog/view/theme/default/stylesheet/pavautosearch.css');
		}

		$this->data['additional_class'] = isset($setting['class'])?$setting['class']:'';
		$this->data['limit'] = isset($setting['limit'])?$setting['limit']:5;
		$this->data['show_category'] = isset($setting['show_category'])?$setting['show_category']:'1';
		$this->data['show_image'] = isset($setting['show_image'])?$setting['show_image']:'1';
		$this->data['show_price'] = isset($setting['show_price'])?$setting['show_price']:'1';
		$this->data['categories'] = $this->data["manufacturers"] = array();

		if($this->data['show_category']){
			
			// 3 Level Category Search
			$this->data['categories'] = array();

			$this->data['category_id'] = 0;

			$categories_1 = $this->model_catalog_category->getCategories(0);

			foreach ($categories_1 as $category_1) {
				$level_2_data = array();

				$categories_2 = $this->model_catalog_category->getCategories($category_1['category_id']);

				foreach ($categories_2 as $category_2) {
					$level_3_data = array();

					$categories_3 = $this->model_catalog_category->getCategories($category_2['category_id']);

					foreach ($categories_3 as $category_3) {
						$level_3_data[] = array(
							'category_id' => $category_3['category_id'],
							'name'        => $category_3['name'],
						);
					}

					$level_2_data[] = array(
						'category_id' => $category_2['category_id'],	
						'name'        => $category_2['name'],
						'children'    => $level_3_data
					);					
				}

				$this->data['categories'][] = array(
					'category_id' => $category_1['category_id'],
					'name'        => $category_1['name'],
					'children'    => $level_2_data
				);
			}

		}
		
		$this->data['module'] = $module++;
						
		if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/module/pavautosearch.tpl')) {
			$this->template = $this->config->get('config_template') . '/template/module/pavautosearch.tpl';
		} else {
			$this->template = 'default/template/module/pavautosearch.tpl';
		}
		
		$this->render();
	}
	public function autocomplete() {
		$json = array();

		$this->language->load('product/category');
		if (isset($this->request->get['filter_name']) || isset($this->request->get['filter_manufacturer_id']) || isset($this->request->get['filter_category_id'])) {
			$this->load->model('tool/image');
			$this->load->model('catalog/product');
			
			if (isset($this->request->get['filter_name'])) {
				$filter_name = $this->request->get['filter_name'];
			} else {
				$filter_name = '';
			}

			if (isset($this->request->get['filter_category_id'])) {
				$filter_category_id = $this->request->get['filter_category_id'];
			} else {
				$filter_category_id = '';
			}
			if (isset($this->request->get['description'])) {
				$description = $this->request->get['description'];
			} else {
				$description = '';
			}
			if (isset($this->request->get['sub_category'])) {
				$sub_category = $this->request->get['sub_category'];
			} else {
				$sub_category = '';
			}

			if (isset($this->request->get['limit'])) {
				$limit = $this->request->get['limit'];	
			} else {
				$limit = 20;	
			}
			$data = array(
				'filter_name'  => $filter_name,
				'filter_tag'   => $filter_name,
				'filter_description' => $description,
				'filter_sub_category' => $sub_category,
				'filter_category_id' => $filter_category_id,
				'start'        => 0,
				'limit'        => $limit
			);
			
			$results = $this->model_catalog_product->getProducts($data);
			$total = $this->model_catalog_product->getTotalProducts($data);
			foreach ($results as $result) {
				if ($result['image']) {
					$image = $this->model_tool_image->resize($result['image'], 100, 100);
				} else {
					$image = false;
				}
				if (($this->config->get('config_customer_price') && $this->customer->isLogged()) || !$this->config->get('config_customer_price')) {
					$price = $this->currency->format($this->tax->calculate($result['price'], $result['tax_class_id'], $this->config->get('config_tax')));
				} else {
					$price = false;
				}
						
				if ((float)$result['special']) {
					$special = $this->currency->format($this->tax->calculate($result['special'], $result['tax_class_id'], $this->config->get('config_tax')));
				} else {
					$special = false;
				}
				if ($this->config->get('config_tax')) {
					$tax = $this->currency->format((float)$result['special'] ? $result['special'] : $result['price']);
				} else {
					$tax = false;
				}
				
				$json[] = array(
					'total' => $total,
					'product_id' => $result['product_id'],
					'name'       => strip_tags(html_entity_decode($result['name'], ENT_QUOTES, 'UTF-8')),	
					'model'      => $result['model'],
					'image'		 => $image,
					'link'		 => $this->url->link('product/product','product_id='.$result['product_id']),
					'special'	 => $special,
					'tax'		 => $tax,
					'price'      => $price
				);	
			}
			
		}

		$this->response->setOutput(json_encode($json));
	}
}
?>
