<?php
class ControllerCommonSeoPro extends Controller {
	private $cache_data = null;
	private $languages = array();
	private $config_language;

	public function __construct($registry) {
		parent::__construct($registry);
		$this->cache_data = $this->cache->get('seo_pro');
		if (!$this->cache_data) {
			$query = $this->db->query("SELECT LOWER(`keyword`) as 'keyword', `query` FROM " . DB_PREFIX . "url_alias");
			$this->cache_data = array();
			foreach ($query->rows as $row) {
				$this->cache_data['keywords'][$row['keyword']] = $row['query'];
				$this->cache_data['queries'][$row['query']] = $row['keyword'];
			}
			$this->cache->set('seo_pro', $this->cache_data);
		}

		$query = $this->db->query("SELECT `value` FROM `" . DB_PREFIX . "setting` WHERE `key` = 'config_language'");
		$this->config_language = $query->row['value'];

		$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "language WHERE status = '1'");

		foreach ($query->rows as $result) {
			$this->languages[$result['code']] = $result;
		}

	}

	public function index() {

		$code = null;

		// If language specdified in URI - switch to code from URI
		if(isset($this->request->get['_route_'])) {
			$route_ = $this->request->get['_route_'];
			$tokens = explode('/', $this->request->get['_route_']);

			if(array_key_exists($tokens[0], $this->languages)) {
				$code = $tokens[0];
				$this->request->get['_route_'] = substr($this->request->get['_route_'], strlen($code) + 1);
			}

			if(trim($this->request->get['_route_']) == '' || trim($this->request->get['_route_']) == 'index.php') {
				unset($this->request->get['_route_']);
			}
		}

		// Pavillion Theme fix for "original_route" param.
		// Theme: <http://themeforest.net/item/pavilion-premium-responsive-opencart-theme/9219645>
		if(isset($this->request->get['original_route'])) {
			unset($this->request->get['original_route']);
		}

		// Detect language code
		if(!isset($code)) {
			if (isset($this->session->data['language'])) {
				$code = $this->session->data['language'];
			} elseif (isset($this->request->cookie['language'])) {
				$code = $this->request->cookie['language'];
			} else {
				$code = $this->config_language;
			}
		}


		if(!isset($this->session->data['language']) || $this->session->data['language'] != $code) {
			$this->session->data['language'] = $code;
		}

		
		$xhttprequested =
			isset($this->request->server['HTTP_X_REQUESTED_WITH'])
			&& (strtolower($this->request->server['HTTP_X_REQUESTED_WITH']) == 'xmlhttprequest');
		
		$captcha = isset($this->request->get['route']) && $this->request->get['route']=='tool/captcha';

		if(!$xhttprequested && !$captcha) {
			setcookie('language', $code, time() + 60 * 60 * 24 * 30, '/',
				($this->request->server['HTTP_HOST'] != 'localhost') ? $this->request->server['HTTP_HOST'] : false);
		}


		$this->config->set('config_language_id', $this->languages[$code]['language_id']);
		$this->config->set('config_language', $this->languages[$code]['code']);

		$language = new Language($this->languages[$code]['directory']);
		$language->load('default');
		$language->load($this->languages[$code]['directory']);
		$this->registry->set('language', $language);


		// Add rewrite to url class
		if ($this->config->get('config_seo_url')) {
			$this->url->addRewrite($this);
		} else {
			return;
		}

		// Decode URL
		if (!isset($this->request->get['_route_'])) {
			$this->validate();
		} else {
			$route = $this->request->get['_route_'];
			unset($this->request->get['_route_']);
			$parts = explode('/', trim(utf8_strtolower($route), '/'));
			list($last_part) = explode('.', array_pop($parts));
			array_push($parts, $last_part);

			$rows = array();
			foreach ($parts as $keyword) {
				if (isset($this->cache_data['keywords'][$keyword])) {
					$rows[] = array('keyword' => $keyword, 'query' => $this->cache_data['keywords'][$keyword]);
				}
			}

			if (count($rows) == sizeof($parts)) {
				$queries = array();
				foreach ($rows as $row) {
					$queries[utf8_strtolower($row['keyword'])] = $row['query'];
				}

				reset($parts);
				foreach ($parts as $part) {
					$url = explode('=', $queries[$part], 2);

					if ($url[0] == 'category_id') {
						if (!isset($this->request->get['path'])) {
							$this->request->get['path'] = $url[1];
						} else {
							$this->request->get['path'] .= '_' . $url[1];
						}
					} elseif (count($url) > 1) {
						$this->request->get[$url[0]] = $url[1];
					}
				}
			} else {
				$this->request->get['route'] = 'error/not_found';
			}

			if (isset($this->request->get['product_id'])) {
				$this->request->get['route'] = 'product/product';
				if (!isset($this->request->get['path'])) {
					$path = $this->getPathByProduct($this->request->get['product_id']);
					if ($path) $this->request->get['path'] = $path;
				}
			} elseif (isset($this->request->get['path'])) {
				$this->request->get['route'] = 'product/category';
			} elseif (isset($this->request->get['manufacturer_id'])) {
				$this->request->get['route'] = 'product/manufacturer/info';
			} elseif (isset($this->request->get['information_id'])) {
				$this->request->get['route'] = 'information/information';
			} elseif(isset($this->cache_data['queries'][$route_])) {
					header($this->request->server['SERVER_PROTOCOL'] . ' 301 Moved Permanently');
					$this->response->redirect($this->cache_data['queries'][$route_]);
			} else {
				if (isset($queries[$parts[0]])) {
					$this->request->get['route'] = $queries[$parts[0]];
				}
			}


			$this->validate();

			if (isset($this->request->get['route'])) {
				return new Action($this->request->get['route']);
			}
		}
	}

	public function rewrite($link, $code = '') {
		if(!$code) {
			$code = $this->session->data['language'];
		}
		if($code == $this->config_language) {
			$code='';
		}
		else {
			$code .='/';
		}
		//Раскоментировать если чо если вдруг
		$code = '';
		if (!$this->config->get('config_seo_url')) return $link;

		$seo_url = '';

		$component = parse_url(str_replace('&amp;', '&', $link));

		$data = array();
		parse_str($component['query'], $data);

		$route = $data['route'];
		unset($data['route']);

		switch ($route) {
			case 'common/home':
				if ($component['scheme'] == 'https') {
					$link = $this->config->get('config_ssl');
				} else {
					$link = $this->config->get('config_url');
				}
                if($code != $this->config_language.'/') {
                    $link .= $code;
                }
				if(isset($this->cache_data['queries']['common/home'])) {
					$link .= $this->cache_data['queries']['common/home'];
				}
				return $link;
				break;
			case 'product/product':
				if (isset($data['product_id'])) {
					$tmp = $data;
					$data = array();
					if ($this->config->get('config_seo_url_include_path')) {
						$data['path'] = $this->getPathByProduct($tmp['product_id']);
						if (!$data['path']) return $link;
					}
					$data['product_id'] = $tmp['product_id'];
					if (isset($tmp['tracking'])) {
						$data['tracking'] = $tmp['tracking'];
					}

					// Compatibility with "OCJ Merchandising Reports" module.
					// Save and pass-thru module specific GET parameters.
					if (isset($tmp['uri'])) {
						$data['uri'] = $tmp['uri'];
					}
					if (isset($tmp['list_type'])) {
						$data['list_type'] = $tmp['list_type'];
					}
				}
				break;

			case 'product/category':
				if (isset($data['path'])) {
					$category = explode('_', $data['path']);
					$category = end($category);
					$data['path'] = $this->getPathByCategory($category);
					if (!$data['path']) return $link;
				}
				break;

			case 'product/product/review':
			case 'information/information/info':
			case 'information/information/agree':
				return $link;
				break;

			default:
				break;
		}

		if ($component['scheme'] == 'https') {
			$link = $this->config->get('config_ssl');
		} else {
			$link = $this->config->get('config_url');
		}

		$link .= $code . 'index.php?route=' . $route;

		if (count($data)) {
			$link .= '&amp;' . urldecode(http_build_query($data, '', '&amp;'));
		}

		$queries = array();
		foreach ($data as $key => $value) {
			switch ($key) {
				case 'product_id':
				case 'manufacturer_id':
				case 'category_id':
				case 'information_id':

				case 'search':
				case 'sub_category':
				case 'description':

					$queries[] = $key . '=' . $value;
					unset($data[$key]);
					$postfix = 1;
					break;

				case 'path':
					$categories = explode('_', $value);
					foreach ($categories as $category) {
						$queries[] = 'category_id=' . $category;
					}
					unset($data[$key]);
					break;

				default:
					break;
			}
		}

		if(empty($queries)) {
			$queries[] = $route;
		}

		$rows = array();
		foreach($queries as $query) {
			if(isset($this->cache_data['queries'][$query])) {
				$rows[] = array('query' => $query, 'keyword' => $this->cache_data['queries'][$query]);
			}
		}

		if(count($rows) == count($queries)) {
			$aliases = array();
			foreach($rows as $row) {
				$aliases[$row['query']] = $row['keyword'];
			}
			foreach($queries as $query) {
				$seo_url .= '/' . rawurlencode($aliases[$query]);
			}
		}

		if ($seo_url == '') return $link;

		$seo_url = $code . trim($seo_url, '/');

		if ($component['scheme'] == 'https') {
			$seo_url = $this->config->get('config_ssl') . $seo_url;
		} else {
			$seo_url = $this->config->get('config_url') . $seo_url;
		}

		if (isset($postfix)) {
			$seo_url .= trim($this->config->get('config_seo_url_postfix'));
		} else {
			$seo_url .= '/';
		}

		if(substr($seo_url, -2) == '//') {
			$seo_url = substr($seo_url, 0, -1);
		}


		if (count($data)) {
			$seo_url .= '?' . urldecode(http_build_query($data, '', '&amp;'));
		}

		return $seo_url;
	}

	private function getPathByProduct($product_id) {
		$product_id = (int)$product_id;
		if ($product_id < 1) return false;

		static $path = null;
		if (!is_array($path)) {
			$path = $this->cache->get('product.seopath');
			if (!is_array($path)) $path = array();
		}

		if (!isset($path[$product_id])) {
			$query = $this->db->query("SELECT category_id FROM " . DB_PREFIX . "product_to_category WHERE product_id = '" . $product_id . "' ORDER BY main_category DESC LIMIT 1");

			$path[$product_id] = $this->getPathByCategory($query->num_rows ? (int)$query->row['category_id'] : 0);

			$this->cache->set('product.seopath', $path);
		}

		return $path[$product_id];
	}

	private function getPathByCategory($category_id) {
		$category_id = (int)$category_id;
		if ($category_id < 1) return false;

		static $path = null;
		if (!is_array($path)) {
			$path = $this->cache->get('category.seopath');
			if (!is_array($path)) $path = array();
		}

		if (!isset($path[$category_id])) {
			$max_level = 10;

			$sql = "SELECT CONCAT_WS('_'";
			for ($i = $max_level-1; $i >= 0; --$i) {
				$sql .= ",t$i.category_id";
			}
			$sql .= ") AS path FROM " . DB_PREFIX . "category t0";
			for ($i = 1; $i < $max_level; ++$i) {
				$sql .= " LEFT JOIN " . DB_PREFIX . "category t$i ON (t$i.category_id = t" . ($i-1) . ".parent_id)";
			}
			$sql .= " WHERE t0.category_id = '" . $category_id . "'";

			$query = $this->db->query($sql);

			$path[$category_id] = $query->num_rows ? $query->row['path'] : false;

			$this->cache->set('category.seopath', $path);
		}

		return $path[$category_id];
	}

	private function validate() {
		if (isset($this->request->get['route']) && ($this->request->get['route'] == 'error/not_found'
			|| preg_match('~^api/~',$this->request->get['route']) // Masks all api requests
				)) {
			return;
		}
		if(empty($this->request->get['route'])) {
			$this->request->get['route'] = 'common/home';
		}

		if (isset($this->request->server['HTTP_X_REQUESTED_WITH']) && strtolower($this->request->server['HTTP_X_REQUESTED_WITH']) == 'xmlhttprequest') {
			return;
		}

		if (isset($this->request->server['HTTPS']) && (($this->request->server['HTTPS'] == 'on') || ($this->request->server['HTTPS'] == '1'))) {
			$url = str_replace('&amp;', '&', $this->config->get('config_ssl') . ltrim($this->request->server['REQUEST_URI'], '/'));
			$seo = str_replace('&amp;', '&', $this->url->link($this->request->get['route'], $this->getQueryString(array('route')), 'SSL'));
		} else {
			$url = str_replace('&amp;', '&',
				substr($this->config->get('config_url'), 0, strpos($this->config->get('config_url'), '/', 10)) // leave only domain
				. $this->request->server['REQUEST_URI']);
			$seo = str_replace('&amp;', '&', $this->url->link($this->request->get['route'], $this->getQueryString(array('route')), 'NONSSL'));
		}

		// Быдлокод, пиздец какой быдлокод и костыль. Сделано, чтобы подружить сеопро и фильтр категорий
		if (isset($this->request->get['route']) && $this->request->get['route'] == 'product/category') {
			$parts = explode('/', $url);
			$oc_parts = [];
			$filter_parts = [];
			$filter_start = false;
			$filter_right_parts = [];
			for ($i = 0; $i < count($parts); $i++) {
				if ($parts[$i] != 'http:' && (strpos($parts[$i], ':') || strpos($parts[$i], '='))) {
					if(!$filter_start){
						$oc_parts[$i] = '';
					}
					$filter_start = true;

				}
				if ($filter_start) {
					if($parts[$i]){
						$filter_right_parts[] = $parts[$i];
					}
					$filter_parts[] = $parts[$i];
				} else {
					$oc_parts[] = $parts[$i];
				}
			}
			$filter_path = implode('/', $filter_parts);
//			$filter_right_path = trim($filter_path, '/').'/';
			$filter_right_path = trim(implode('/', $filter_right_parts), '/').'/';
			
			$seo_new_parts = explode('/',$seo);
			foreach ($seo_new_parts as $key=>$part) {
				if (strpos($part, '=')) {
					$seo_new_parts[$key] = '';
				}
			}
			$seo_new = implode('/', $seo_new_parts);
			$seo_new = rtrim($seo_new, '/') . '/';

			if($seo_new !== implode('/', $oc_parts) || ($filter_start && $filter_path != $filter_right_path))
			{
				header($this->request->server['SERVER_PROTOCOL'] . ' 303 See Other');

				if($filter_parts) {
					$this->response->redirect($seo_new . $filter_right_path, 303);
				}
				else {
					$this->response->redirect($seo_new, 303);

				}
			}

		}
		elseif (rawurldecode($url) /* Фикс для того, чтобы не применялась модификация фильтра */!= rawurldecode($seo)) {
			header($this->request->server['SERVER_PROTOCOL'] . ' 303 See Other');

			$this->response->redirect($seo,303);
		}
	}

	private function getQueryString($exclude = array()) {
		if (!is_array($exclude)) {
			$exclude = array();
			}

		return urldecode(
			http_build_query(
				array_diff_key($this->request->get, array_flip($exclude))
				)
			);
		}
	}
