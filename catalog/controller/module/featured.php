<?php
class ControllerModuleFeatured extends Controller {
	public function index($setting) {
		$this->load->language('module/featured');

		$data['heading_title'] = $this->language->get('heading_title');

		$data['text_tax'] = $this->language->get('text_tax');

		$data['button_cart'] = $this->language->get('button_cart');
		$data['button_wishlist'] = $this->language->get('button_wishlist');
		$data['button_compare'] = $this->language->get('button_compare');

        $data['link_to_catalog'] = $this->url->link('product/category', 'path=59');
		$this->load->model('catalog/product');
//        $this->load->model('catalog/common_discount');


		$this->load->model('tool/image');

		$data['products'] = array();

		if (!$setting['limit']) {
			$setting['limit'] = 4;
		}

		if (!empty($setting['product'])) {
			$products = array_slice($setting['product'], 0, (int)$setting['limit']);


            foreach ($products as $product_id) {
                $product_info = $this->model_catalog_product->getProduct($product_id);




                if ($product_info) {
                    if ($product_info['image']) {
                        $image = $this->model_tool_image->resize($product_info['image'], $setting['width'], $setting['height']);
                    } else {
                        $image = $this->model_tool_image->resize('placeholder.png', $setting['width'], $setting['height']);
                    }

                    if (($this->config->get('config_customer_price') && $this->customer->isLogged()) || !$this->config->get('config_customer_price')) {
                        $price = $this->currency->format($this->tax->calculate($product_info['price'], $product_info['tax_class_id'], $this->config->get('config_tax')));
                        $dollar_price = $this->currency->format($this->tax->calculate($product_info['price'], $product_info['tax_class_id'], $this->config->get('config_tax')),"UAH");
                        $price = sprintf($this->language->get('text_price_with_dollar'), $price,'');
                    } else {
                        $price = false;
                    }


                    if ((float)$product_info['special']) {
                        $special = $this->currency->format($this->tax->calculate($product_info['special'], $product_info['tax_class_id'], $this->config->get('config_tax')));
                        $dollar_special = $this->currency->format($this->tax->calculate($product_info['special'], $product_info['tax_class_id'], $this->config->get('config_tax')),"UAH");
                        $special = sprintf($this->language->get('text_price_with_dollar'), $special,'');
                    } else {
                        $special = false;
                        $percent = $this->model_catalog_product->getActiveCommonDiscountByProduct($product_id);

                        if(isset($percent['percent'])) {
                            $special = $price * (1 - $percent['percent'] / 100);
                            $special = $this->currency->format($this->tax->calculate($special, $product_info['tax_class_id'], $this->config->get('config_tax')));
                        }
                    }


                    if ($this->config->get('config_tax')) {
                        $tax = $this->currency->format((float)$product_info['special'] ? $product_info['special'] : $product_info['price']);
                    } else {
                        $tax = false;
                    }





                    if($this->config->get('config_review_status')) {
                        $rating = (int)$product_info['rating'];
                        if((int)$product_info['rating']) {
                            if ((int)$product_info['reviews'] === 1)
                                $reviews = sprintf($this->language->get('text_reviews_1'), (int)$product_info['reviews']);
                            else if ((int)$product_info['reviews'] < 5)
                                $reviews = sprintf($this->language->get('text_reviews_2_4'), (int)$product_info['reviews']);
                            else
                                $reviews = sprintf($this->language->get('text_reviews'), (int)$product_info['reviews']);
                        }else{
                            $reviews = false;
                        }
                    } else {
                        $rating = false;
                        $reviews = false;
                    }


                    $data['products'][] = array(
                        'discount'		=> ($price && $special) ? round(($price - $special)*100/($price)) : false,


                        'product_id'  => $product_info['product_id'],
                        'thumb'       => $image,
                        'name'        => $product_info['name'],
                        'description' => utf8_substr(strip_tags(html_entity_decode($product_info['description'], ENT_QUOTES, 'UTF-8')), 0, $this->config->get('config_product_description_length')) . '..',
                        'price'       => $price,
                        'special'     => $special,
                        'tax'         => $tax,
                        'rating'      => $rating,
                        'reviews'     => $reviews,
                        'quantity'    => $product_info['quantity'],
                        'href'        => $this->url->link('product/product', 'product_id=' . $product_info['product_id'])
                    );
                }
            }
		}

		if ($data['products']) {
			if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/module/featured.tpl')) {
				return $this->load->view($this->config->get('config_template') . '/template/module/featured.tpl', $data);
			} else {
				return $this->load->view('default/template/module/featured.tpl', $data);
			}
		}
	}
}