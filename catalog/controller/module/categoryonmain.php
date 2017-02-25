<?php
class ControllerModuleCategoryonmain extends Controller {
    public function index() {
        $data = [];
        $data['link1'] =$this->url->link('product/category', 'path=59');
        $data['link2'] = $this->url->link('product/category', 'path=33');
        $data['link3'] = $this->url->link('product/category', 'path=25');
        $data['link4'] = $this->url->link('product/category', 'path=20');
        $data['link5'] = $this->url->link('product/category', 'path=90');
        $data['link6'] = $this->url->link('product/category', 'path=81');
        if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/module/categoryonmain.tpl')) {
            return $this->load->view($this->config->get('config_template') . '/template/module/categoryonmain.tpl', $data);
        } else {
            return $this->load->view('default/template/module/categoryonmain.tpl', $data);
        }
    }
}