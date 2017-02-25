<?php
class ControllerModulefilterpro extends Controller {
	private $k = 1;
	public function index($setting) {
        static $module = 0;

        $this->load->model('module/filterpro');
        $this->load->model('catalog/category');
		$this->load->model('catalog/product');
//		if($setting['type'] == 1) {
//
//			$this->language->load('product/filter');
//			$data['text_display'] = $this->language->get('text_display');
//			$data['text_list'] = $this->language->get('text_list');
//			$data['text_grid'] = $this->language->get('text_grid');
//			$data['text_sort'] = $this->language->get('text_sort');
//			$data['text_limit'] = $this->language->get('text_limit');
//
//			$sort = 'p.sort_order';
//			$order = 'ASC';
			//$limit = $this->config->get('config_product_limit');

//			$url = '';
//
//			if(isset($this->request->get['limit'])) {
//				$url .= '&limit=' . $this->request->get['limit'];
//			}
//
//			$data['sorts'] = array();
//
//			$data['sorts'][] = array(
//				'text' => $this->language->get('text_default'),
//				'value' => 'p.sort_order-ASC',
//				'href' => $this->url->link('product/filter', 'sort=p.sort_order&order=ASC' . $url)
//			);
//
//			$data['sorts'][] = array(
//				'text' => $this->language->get('text_name_asc'),
//				'value' => 'pd.name-ASC',
//				'href' => $this->url->link('product/filter', 'sort=pd.name&order=ASC' . $url)
//			);
//
//			$data['sorts'][] = array(
//				'text' => $this->language->get('text_name_desc'),
//				'value' => 'pd.name-DESC',
//				'href' => $this->url->link('product/filter', 'sort=pd.name&order=DESC' . $url)
//			);
//
//			$data['sorts'][] = array(
//				'text' => $this->language->get('text_price_asc'),
//				'value' => 'p.price-ASC',
//				'href' => $this->url->link('product/filter', 'sort=p.price&order=ASC' . $url)
//			);
//
//			$data['sorts'][] = array(
//				'text' => $this->language->get('text_price_desc'),
//				'value' => 'p.price-DESC',
//				'href' => $this->url->link('product/filter', 'sort=p.price&order=DESC' . $url)
//			);
//
//			if($this->config->get('config_review_status')) {
//				$data['sorts'][] = array(
//					'text' => $this->language->get('text_rating_desc'),
//					'value' => 'rating-DESC',
//					'href' => $this->url->link('product/filter', 'sort=rating&order=DESC' . $url)
//				);
//
//				$data['sorts'][] = array(
//					'text' => $this->language->get('text_rating_asc'),
//					'value' => 'rating-ASC',
//					'href' => $this->url->link('product/filter', 'sort=rating&order=ASC' . $url)
//				);
//			}
//
//			$data['sorts'][] = array(
//				'text' => $this->language->get('text_model_asc'),
//				'value' => 'p.model-ASC',
//				'href' => $this->url->link('product/filter', 'sort=p.model&order=ASC' . $url)
//			);
//
//			$data['sorts'][] = array(
//				'text' => $this->language->get('text_model_desc'),
//				'value' => 'p.model-DESC',
//				'href' => $this->url->link('product/filter', 'sort=p.model&order=DESC' . $url)
//			);
//
//			$url = '';
//
//			if(isset($this->request->get['sort'])) {
//				$url .= 'sort=' . $this->request->get['sort'];
//			}
//
//			if(isset($this->request->get['order'])) {
//				$url .= '&order=' . $this->request->get['order'];
//			}
//
//			$data['limits'] = array();
//
//			$data['limits'][] = array(
//				'text' => $this->config->get('config_catalog_limit'),
//				'value' => $this->config->get('config_catalog_limit'),
//				'href' => $this->url->link('product/filter', $url . '&limit=' . $this->config->get('config_catalog_limit'))
//			);
//
//			$data['limits'][] = array(
//				'text' => 25,
//				'value' => 25,
//				'href' => $this->url->link('product/filter', $url . '&limit=25')
//			);
//
//			$data['limits'][] = array(
//				'text' => 50,
//				'value' => 50,
//				'href' => $this->url->link('product/filter', $url . '&limit=50')
//			);
//
//			$data['limits'][] = array(
//				'text' => 75,
//				'value' => 75,
//				'href' => $this->url->link('product/filter', $url . '&limit=75')
//			);
//
//			$data['limits'][] = array(
//				'text' => 100,
//				'value' => 100,
//				'href' => $this->url->link('product/filter', $url . '&limit=100')
//			);
//
//
//			$data['sort'] = $sort;
//			$data['order'] = $order;
//			$data['limit'] = $limit;
//
//			if(file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/module/filterpro_container.tpl')) {
//				$this->template = $this->config->get('config_template') . '/template/module/filterpro_container.tpl';
//			} else {
//				$this->template = 'default/template/module/filterpro_container.tpl';
//			}
//            $this->response->setOutput($this->load->view('module/filterpro.tpl', $data));
//		} else {
			$this->language->load('module/filterpro');
			$data['text_discount_label'] = $this->language->get('text_discount_label');


			$data['text_tax'] = $this->language->get('text_tax');
			$data['button_cart'] = $this->language->get('button_cart');
			$data['button_wishlist'] = $this->language->get('button_wishlist');
			$data['button_compare'] = $this->language->get('button_compare');
			$data['text_price_range'] = $this->language->get('text_price_range');
			$data['text_manufacturers'] = $this->language->get('text_manufacturers');
			$data['text_tags'] = $this->language->get('text_tags');
			$data['text_categories'] = $this->language->get('text_categories');
			$data['text_attributes'] = $this->language->get('text_attributes');
			$data['text_all'] = $this->language->get('text_all');
			$data['clear_filter'] = $this->language->get('clear_filter');
			$data['text_instock'] = $this->language->get('text_instock');

			$data['heading_title'] = $this->language->get('heading_title');

			$data['pds_sku'] = $this->language->get('pds_sku');
			$data['pds_upc'] = $this->language->get('pds_upc');
			$data['pds_location'] = $this->language->get('pds_location');
			$data['pds_model'] = $this->language->get('pds_model');
			$data['pds_brand'] = $this->language->get('pds_brand');
			$data['pds_stock'] = $this->language->get('pds_stock');
			$data['symbol_right'] = $this->currency->getSymbolRight();
			$data['symbol_left'] = $this->currency->getSymbolLeft();

			$data['setting'] = $setting;

			if(VERSION == '1.5.0') {
				$filterpro_setting = unserialize($this->config->get('filterpro_setting'));
			} else {
				$filterpro_setting = $this->config->get('filterpro_setting');
			}
            $filterpro_setting = $setting['filterpro_setting'];
			$category_id = false;
			$data['path'] = "";
			if(isset($this->request->get['path'])) {
				$data['path'] = $this->request->get['path'];
				$parts = explode('_', (string)$this->request->get['path']);
				$category_id = array_pop($parts);
			}

			$manufacturer_id = false;
			if(isset($this->request->get['manufacturer_id'])) {
				$manufacturer_id = $this->request->get['manufacturer_id'];
			$data = array(
					'filter_manufacturer_id' => $this->request->get['manufacturer_id']
				);
			} else {
				$data['filter_category_id'] = $category_id;
                $data['filter_sub_category'] = $category_id;
//				'filter_category_id' => $category_id,
//				'filter_sub_category' => false
//			);
			}

			$this->load->model('catalog/product');
			$product_total = $this->model_catalog_product->getTotalProducts($data);
			if($product_total < 2) {
				return;
			}

			$data['category_id'] = $category_id;

//			$data = array('category_id' => $category_id, 'manufacturer_id' => $manufacturer_id);

			$this->load->model('module/filterpro');

			$data['manufacturers'] = false;
			if(isset($this->request->get['manufacturer_id'])) {
				$data['manufacturer_id'] = $this->request->get['manufacturer_id'];
			} else {
				if($filterpro_setting['display_manufacturer'] != 'none') {
					$data['manufacturers'] = $this->model_module_filterpro->getManufacturers($data);
					$data['display_manufacturer'] = $filterpro_setting['display_manufacturer'];
					$data['expanded_manufacturer'] = isset($filterpro_setting['expanded_manufacturer']) ? 1 : 0;
				}
			}
			$data['options'] = $this->model_module_filterpro->getOptions($data);
			$this->load->model('tool/image');
			foreach($data['options'] as $i => $option) {
				if(!isset($filterpro_setting['display_option_' . $option['option_id']])) {
					$filterpro_setting['display_option_' . $option['option_id']] = 'none';
				}
				$display_option = $filterpro_setting['display_option_' . $option['option_id']];
				if($display_option != 'none') {
					$data['options'][$i]['display'] = $display_option;
					$data['options'][$i]['expanded'] = isset($filterpro_setting['expanded_option_' . $option['option_id']]) ? 1 : 0;
					foreach($data['options'][$i]['option_values'] as $j => $option_value) {
						$data['options'][$i]['option_values'][$j]['thumb'] = $this->model_tool_image->resize($data['options'][$i]['option_values'][$j]['image'], 20, 20);
					}
				} else {
					unset($data['options'][$i]);
				}
			}
			$data['tags'] = array();


			$version = array_map("intVal", explode(".", VERSION));
//            var_dump($version);
//			if($version[2] < 4 && $filterpro_setting['display_tags'] != 'none') {
//				$data['tags'] = $this->model_module_filterpro->getTags($data);
//				$data['expanded_tags'] = isset($filterpro_setting['expanded_tags']) ? 1 : 0;
//			}
//            die;
			$data['categories'] = false;
			if($filterpro_setting['display_categories'] != 'none') {
				$data['categories'] = $this->model_module_filterpro->getSubCategories($data);
				$data['expanded_categories'] = isset($filterpro_setting['expanded_categories']) ? 1 : 0;
			}

			$data['attributes'] = $this->model_module_filterpro->getAttributes($data);


			foreach($data['attributes'] as $j => $attribute_group) {
				foreach($attribute_group['attribute_values'] as $attribute_id => $attribute) {
					if(!isset($filterpro_setting['display_attribute_' . $attribute_id])) {
						$filterpro_setting['display_attribute_' . $attribute_id] = 'none';
					}
					$display_attribute = $filterpro_setting['display_attribute_' . $attribute_id];
					if($display_attribute != 'none') {
						if($display_attribute == 'slider') {
							$values = $data['attributes'][$j]['attribute_values'][$attribute_id]['values'];
							$first = $values[0];
							$data['attributes'][$j]['attribute_values'][$attribute_id]['suffix'] = preg_replace("/^[0-9]*/", '', $first);

							$values = array_map('intVal', $values);
							$values = array_unique($values);
							sort($values);
							$data['attributes'][$j]['attribute_values'][$attribute_id]['values'] = $values;
						}
						$data['attributes'][$j]['attribute_values'][$attribute_id]['display'] = $display_attribute;
						$data['attributes'][$j]['attribute_values'][$attribute_id]['expanded'] = isset($filterpro_setting['expanded_attribute_' . $attribute_id])?1:0;
					} else {
						unset($data['attributes'][$j]['attribute_values'][$attribute_id]);
						if(!$data['attributes'][$j]['attribute_values']) {
							unset($data['attributes'][$j]);
						}
					}
				}
			}

			$data['price_slider'] = $filterpro_setting['price_slider'];
			$data['attr_group'] = $filterpro_setting['attr_group'];

			$data['instock_checked'] = isset($filterpro_setting['instock_checked']) ? 1 : 0;
			$data['instock_visible'] = isset($filterpro_setting['instock_visible']) ? 1 : 0;

			if($data['options'] || $data['manufacturers'] || $data['attributes'] || $data['price_slider']) {
				$this->document->addScript('catalog/view/javascript/jquery/jquery.tmpl.min.js');
				$this->document->addScript('catalog/view/javascript/jquery/jquery.deserialize.min.js');
				$this->document->addScript('catalog/view/javascript/jquery/jquery.loadmask.min.js');
				$this->document->addScript('catalog/view/javascript/filterpro.min.js');

				//$this->document->addStyle('catalog/view/theme/default/stylesheet/dist/filterpro.css');
				//$this->document->addStyle('catalog/view/theme/default/stylesheet/dist/jquery.loadmask.css');
                $this->document->addStyle('catalog/view/theme/default/stylesheet/dist/jquery-ui.min.css');
			}

//			if(file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/module/filterpro.tpl')) {
//				$this->template = $this->config->get('config_template') . '/template/module/filterpro.tpl';
//			} else {
//				$this->template = 'default/template/module/f ilterpro.tpl';
//			}

            if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/module/filterpro.tpl')) {
            	
            	if(true/*!empty($data['attributes'])*/){
            		return $this->load->view($this->config->get('config_template') . '/template/module/filterpro.tpl', $data);
            	}
                
            } else {
                return $this->load->view('default/template/module/filterpro.tpl', $data);
            }
//            $this->response->setOutput($this->load->view('module/filterpro.tpl', $data));

//		}

        // $this->render();
	}

	private function array_clean(array $array) {
		foreach($array as $key => $value) {
			if(is_array($value)) {
				$array[$key] = $this->array_clean($value);
				if(!count($array[$key])) {
					unset($array[$key]);
				}
			} elseif(is_string($value)) {
				$value = trim($value);
				if(!$value) {
					unset($array[$key]);
				}
			}
		}
		return $array;
	}

	public function getProducts() {

		//		$cache = md5(http_build_query($this->request->post));
		//		$json = $this->cache->get('filterpro.' . (int)$this->config->get('config_language_id') . '.' . (int)$this->config->get('config_store_id') . '.' . $cache);
		//		if(!$json) {

		$this->language->load('module/filterpro');
        $this->load->model('module/filterpro');
        $filterpro_setting =$this->model_module_filterpro->getModulePreferences();
//		if(VERSION == '1.5.0') {
//			$filterpro_setting = unserialize($this->config->get('filterpro_setting'));
//		} else {
//			$filterpro_setting = $this->config->get('filterpro_setting');
//		}


		if((float)$filterpro_setting['tax'] > 0) {
			$this->k = 1+(float)$filterpro_setting['tax']/100;
		}

		$page = 1;
		if(isset($this->request->post['page'])) {
			$page = (int)$this->request->post['page'];
		}


		if(isset($this->request->post['sort'])) {
			$sort = $this->request->post['sort'];
		} else {
			$sort = 'p.sort_order';
		}

		if(isset($this->request->post['order'])) {
			$order = $this->request->post['order'];
		} else {
			$order = 'ASC';
		}

		if(isset($this->request->post['limit'])) {
			$limit = $this->request->post['limit'];
		} else {
			$limit = $this->config->get('config_catalog_limit');
		}
		$limit = $this->config->get('config_product_limit');



		$this->load->model('catalog/product');
		$this->load->model('tool/image');

		$manufacturer = false;
		if(isset($this->request->post['manufacturer'])) {
			$manufacturer = $this->array_clean($this->request->post['manufacturer']);
			if(!count($manufacturer)) {
				$manufacturer = false;
			}
		}
		$manufacturer_id = false;
		if(isset($this->request->post['manufacturer_id'])) {
			$manufacturer_id = $this->request->post['manufacturer_id'];
			$manufacturer = array($manufacturer_id);
		}

		$option_value = false;
		if(isset($this->request->post['option_value'])) {
			$option_value = $this->array_clean($this->request->post['option_value']);
			if(!count($option_value)) {
				$option_value = false;
			}
		}

		$attribute_value = false;
		if(isset($this->request->post['attribute_value'])) {
			$attribute_value = $this->array_clean($this->request->post['attribute_value']);
			if(!count($attribute_value)) {
				$attribute_value = false;
			}
		}

		$instock = false;
		if(isset($this->request->post['instock'])) {
			$instock = true;
		}

		$tags = false;
		if(isset($this->request->post['tags'])) {
			$tags = $this->array_clean($this->request->post['tags']);
			if(!count($tags)) {
				$tags = false;
			}
		}

		$categories = false;
		if(isset($this->request->post['categories'])) {
			$categories = $this->array_clean($this->request->post['categories']);
			if(!count($categories)) {
				$categories = false;
			}
		}

		$category_id = 0;
		if(isset($this->request->post['category_id'])) {
			$category_id = $this->request->post['category_id'];
		}
		if(!$categories && $category_id) {
			$categories = array($category_id);
		}

		$attr_slider = isset($this->request->post['attr_slider']) ? $this->request->post['attr_slider'] : false;

        $data = array(
			'instock' => $instock,
			'option_value' => $option_value,
			'manufacturer' => $manufacturer,
			'attribute_value' => $attribute_value,
			'tags' => $tags,
			'categories' => $categories,
			'attr_slider' => $attr_slider,
			'min_price' => $this->request->post['min_price']/ $this->k,
			'max_price' => $this->request->post['max_price']/ $this->k,
			'start' => ($page - 1) * $limit,
			'limit' => $limit,
			'sort' => $sort,
			'order' => $order
		);
		$product_total = $this->model_module_filterpro->getTotalProducts($data);
		if($filterpro_setting['display_manufacturer'] == 'none') {
			$totals_manufacturers = false;
		} else {
			$totals_manufacturers = $this->model_module_filterpro->getTotalManufacturers($data);
		}
        //jrckzs
//        $totals_manufacturers = $this->model_module_filterpro->getTotalManufacturers($data);

		$totals_options = $this->model_module_filterpro->getTotalOptions($data);
		$totals_attributes = $this->model_module_filterpro->getTotalAttributes($data);

		$version = array_map("intVal", explode(".", VERSION));
//		if($version[2] >= 4) {
//			$totals_tags = array();
//		} else {
//			$totals_tags = $this->model_module_filterpro->getTotalTags($data);
//		}
		$totals_categories = $this->model_module_filterpro->getTotalCategories($data, $category_id);
		$products = $this->model_module_filterpro->getProducts($data);


		$result = array();

		$min_price = false;
		$max_price = false;

		if(isset($this->request->post['getPriceLimits']) && $this->request->post['getPriceLimits']) {
			$priceLimits = $this->model_module_filterpro->getPriceLimits(array('category_id' => $category_id, 'manufacturer_id' => $manufacturer_id));
			$min_price = $priceLimits['min_price'];
			$max_price = $priceLimits['max_price'];
		}

		foreach($products as $product) {
			if($product['image']) {
				$image = $this->model_tool_image->resize($product['image'], $this->config->get('config_image_product_width'), $this->config->get('config_image_product_height'));
			} else {
				$image = $this->model_tool_image->resize('placeholder.png', $this->config->get('config_image_related_width'), $this->config->get('config_image_related_height'));
			}

            if (($this->config->get('config_customer_price') && $this->customer->isLogged()) || !$this->config->get('config_customer_price')) {
                $priceint = $this->tax->calculate($product['price'], $product['tax_class_id'], $this->config->get('config_tax'));
                $price = $this->currency->format($priceint);
                $dollar_price = $this->currency->format($priceint,"UAH");
                $price = sprintf($this->language->get('text_price_with_dollar'), $price,'');
            } else {
                $price = false;
            }

            //jadd
            if ((float)$product['special']) {
                $specialint =  $this->tax->calculate($product['special'], $product['tax_class_id'], $this->config->get('config_tax'));
                   $special = $this->currency->format($specialint);
                $dollar_special =  $this->currency->format($specialint,"UAH");
                $special = sprintf($this->language->get('text_price_with_dollar'), $special,'');
            } else {
                $special = false;
				$percent = $this->model_catalog_product->getActiveCommonDiscountByProduct($product['product_id']);

				if(isset($percent['percent'])) {
					$special = $price * (1 - $percent['percent'] / 100);
					$special = $this->currency->format($this->tax->calculate($special, $product['tax_class_id'], $this->config->get('config_tax')));
				}
            }

			if($this->config->get('config_tax')) {
				$tax = $this->currency->format((float)$product['special'] ? $product['special'] : $product['price']);
			} else {
				$tax = false;
			}

			if($this->config->get('config_review_status')) {
				$rating = (int)$product['rating'];
				if((int)$product['rating']) {
					if ((int)$product['reviews'] === 1)
						$reviews = sprintf($this->language->get('text_reviews_1'), (int)$product['reviews']);
					else if ((int)$product['reviews'] < 5)
						$reviews = sprintf($this->language->get('text_reviews_2_4'), (int)$product['reviews']);
					else
						$reviews = sprintf($this->language->get('text_reviews'), (int)$product['reviews']);
				}else{
					$reviews = false;
				}
			} else {
				$rating = false;
				$reviews = false;
			}

			$description = function_exists('utf8_substr') ? utf8_substr(strip_tags(html_entity_decode($product['description'], ENT_QUOTES, 'UTF-8')), 0, 100) . '..' :
					substr(strip_tags(html_entity_decode($product['description'], ENT_QUOTES, 'UTF-8')), 0, 100) . '..';

			if($product['quantity'] <= 0) {
				$rstock = $product['stock_status'];
			} elseif($this->config->get('config_stock_display')) {
				$rstock = $product['quantity'];
			} else {
				$rstock = $this->language->get('text_instock');
			}

			$path = isset($this->request->post['path']) ? 'path=' . $this->request->post['path'] : '';

			$result[] = array(
				'discount'		=> ($price && $special) ? round(($price - $special)*100/($price)) : false,


				'sku' => $filterpro_setting['sku_display'] ? $product['sku'] : false,
				'model' => $filterpro_setting['model_display'] ? $product['model'] : false,
				'brand' => $filterpro_setting['brand_display'] ? $product['manufacturer'] : false,
				'location' => $filterpro_setting['location_display'] ? $product['location'] : false,
				'upc' => $filterpro_setting['upc_display'] ? $product['upc'] : false,
				'stock' => $filterpro_setting['stock_display'] ? $rstock : false,

				'product_id' => $product['product_id'],
				'image' => $image,
				'thumb' => $image,
				'special' => $special,
				'tax' => $tax,
				'rating' => $rating,
				'reviews' => $reviews,
				'name' => $product['name'],
				'description' => $description,
				'price' => $price,
				'href' => $this->url->link('product/product', $path . '&product_id=' . $product['product_id'])
			);
		}

		$pagination = new Pagination();
		$pagination->total = $product_total;
		$pagination->page = $page;
		$pagination->limit = $limit;
		$pagination->text = $this->language->get('text_pagination');
		$pagination->url = 'page={page}';

		$min_price = $this->currency->convert($min_price* $this->k, $this->config->get('config_currency'), $this->currency->getCode());
		$max_price = $this->currency->convert($max_price* $this->k, $this->config->get('config_currency'), $this->currency->getCode());
		$json = json_encode(array('result' => $result, 'min_price' => $min_price, 'max_price' => $max_price, 'pagination' => $pagination->render(),
								 'totals_data' => array('manufacturers' => $totals_manufacturers,
														'options' => $totals_options,
														'attributes' => $totals_attributes,
														'categories' => $totals_categories,
//														'tags' => $totals_tags
                                 )));

		//		$this->cache->set('filterpro.' . (int)$this->config->get('config_language_id') . '.' . (int)$this->config->get('config_store_id') . '.' . $cache, $json);
		//		}

		$this->response->setOutput($json);
	}
}

?>