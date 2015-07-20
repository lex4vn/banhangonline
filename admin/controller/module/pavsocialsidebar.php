<?php
class ControllerModulePavsocialsidebar extends Controller {
    private $error = array();
    public $data='';

    public function index() {

        $this->language->load('module/pavsocialsidebar');
        $this->document->setTitle($this->language->get('heading_title'));
        $this->load->model('setting/setting');

        if (($this->request->server['REQUEST_METHOD'] == 'POST') && $this->validate()) {
            $this->model_setting_setting->editSetting('pavsocialsidebar', $this->request->post);
            $action = $this->request->post['action'];
            unset($this->request->post['action']);
            $this->model_setting_setting->editSetting('pavsocialsidebar', $this->request->post);

            $this->session->data['success'] = $this->language->get('text_success');
            if ($action == 'save-edit') {
                $this->redirect($this->url->link('module/pavsocialsidebar', 'token=' . $this->session->data['token'], 'SSL'));
            } else {
                $this->redirect($this->url->link('extension/module', 'token=' . $this->session->data['token'], 'SSL'));
            }
        }
        $base = "";
        if (isset($this->request->server['HTTPS']) && (($this->request->server['HTTPS'] == 'on') || ($this->request->server['HTTPS'] == '1'))) {
            $base = $this->config->get('config_ssl');
        } else {
            $base = $this->config->get('config_url');
        }

        $this->data['themes']	= array(
            array( 'val' => 'transparent','text'=> $this->language->get('text_thems_transparent')),
            array( 'val' => 'light','text'      => $this->language->get('text_thems_light')),
            array( 'val' => 'gray','text'	    => $this->language->get('text_thems_gray')),
            array( 'val' => 'drark','text'	    => $this->language->get('text_thems_drark'))
        );

        //data services share
        $this->data['services'] = array(
            array( 'val' => 'facebook',	'text'	    => 'Facebook' ),
            array( 'val' => 'twitter',	'text'	    => 'Twitter' ),
            array( 'val' => 'yahoomail',	'text'	=> 'Y! Mail'),
            array( 'val' => 'zingme',	'text'	=> 'ZingMe'),
            array( 'val' => 'pinterest',	'text'	=> 'Pinterest Pin It'),
            array( 'val' => 'more',	'text'	    => 'More' ),
            array( 'val' => 'print',	'text'	=> 'Print'),
            array( 'val' => 'email',	'text'	=> 'Email'),
            array( 'val' => 'tumblr',	'text'	=> 'Tumblr'),
            array( 'val' => 'linkedin',	'text'	=> 'LinkedIn'),
            array( 'val' => 'favorites',	'text'	=> 'Favorites'),
            array( 'val' => 'gmail',	'text'	=> 'Gmail' ),
            array( 'val' => 'google_plusone_share',	'text'	=> 'Google+ Share'),
            array( 'val' => 'hotmail',	'text'	=> 'Hotmail'),
            array( 'val' => 'linkshares',	'text'	=>'LinkShares'),
            array( 'val' => 'myspace',	'text'	=> 'Myspace'),
            array( 'val' => 'printfriendly',	'text'	=> 'PrintFriendly') ,
            array( 'val' => 'virb',	'text'	=> 'Virb'),
            array( 'val' => 'webnews',	'text'	=>'Webnews'),
            array( 'val' => 'windows',	'text'	=> 'Windows Gadgets'),
            array( 'val' => 'wordpress',	'text'	=> 'WordPress'),
            array( 'val' => 'yigg',	'text'	=>'Yigg'),
            array( 'val' => 'ziczac','text'	=>'ZicZac'),
             );

        //data services follow
        $this->data['services_id'] = array(
            array( 'val' => 'facebook',	'text'	=> 'Facebook', 'url' => 'facebook.com/'),
            array( 'val' => 'twitter',	'text'	=> 'Twitter', 'url' => 'twitter.com/' ),
            array( 'val' => 'google_follow',	'text'	=> 'Google follow', 'url' => 'plus.google.com/'),
            array( 'val' => 'youtube',	'text'	=>'Youtube', 'url' => 'youtube.com/user/'),
            array( 'val' => 'flickr',	'text'	=> 'Flickr', 'url' => 'flickr.com/photos/'),
            array( 'val' => 'vimeo',	'text'	=>'Vimeo', 'url' => 'vimeo.com/'),
            array( 'val' => 'pinterest',	'text'	=> 'Pinterest', 'url' => 'pinterest.com/'),
            array( 'val' => 'instagram',	'text'	=>'Instagram', 'url' => 'instagram.com/'),
            array( 'val' => 'linkedin',	'text'	=> 'LinkedIn', 'url' => 'linkedin.com/in/')
        );

        $this->data['positions'] = array('left','right');

        //text
        $this->data['heading_title'] = $this->language->get('heading_title');
        $this->data['text_enabled'] = $this->language->get('text_enabled');
        $this->data['text_disabled'] = $this->language->get('text_disabled');
        $this->data['text_content_top'] = $this->language->get('text_content_top');
        $this->data['text_content_bottom'] = $this->language->get('text_content_bottom');
        $this->data['text_description'] = $this->language->get('text_description');
        $this->data['text_description_IDAddthis'] = $this->language->get('text_description_IDAddthis');
        $this->data['entry_domain'] = $this->language->get('entry_domain');

        //mibile config
        $this->data['entry_mobile_config'] = $this->language->get('entry_mobile_config');
        $this->data['entry_mobile_theme'] = $this->language->get('entry_mobile_theme');
        $this->data['entry_mobile_position'] = $this->language->get('entry_mobile_position');
        $this->data['entry_mobile_status'] = $this->language->get('entry_mobile_status');
        $this->data['text_mobile_top'] = $this->language->get('text_mobile_top');
        $this->data['text_mobile_bottom'] = $this->language->get('text_mobile_bottom');

        //entry
        $this->data['tab_module'] = $this->language->get('tab_module');
        $this->data['entry_sort_order'] = $this->language->get('entry_sort_order');
        $this->data['entry_theme'] = $this->language->get('entry_theme');
        $this->data['entry_layout'] = $this->language->get('entry_layout');
        $this->data['entry_position'] = $this->language->get('entry_position');
        $this->data['entry_status'] = $this->language->get('entry_status');
        $this->data['entry_responsive_maxwidth'] = $this->language->get('entry_responsive_maxwidth');
        $this->data['entry_responsive_minwidth'] = $this->language->get('entry_responsive_minwidth');
        $this->data['entry_idAddthis'] = $this->language->get('entry_idAddthis');

        //share
        $this->data['entry_share_theme'] = $this->language->get('entry_share_theme');
        $this->data['entry_share_services'] = $this->language->get('entry_share_services');
        $this->data['entry_share_mgs'] = $this->language->get('entry_share_mgs');
        $this->data['entry_share_title'] = $this->language->get('entry_share_title');
        $this->data['entry_share_position'] = $this->language->get('entry_share_position');
        $this->data['entry_share_desktop'] = $this->language->get('entry_share_desktop');
        $this->data['entry_share_mobile'] = $this->language->get('entry_share_mobile');
        $this->data['entry_share_left'] = $this->language->get('entry_share_left');
        $this->data['entry_share_right'] = $this->language->get('entry_share_right');

        //follow
        $this->data['entry_follow_theme'] = $this->language->get('entry_follow_theme');
        $this->data['entry_follow_services'] = $this->language->get('entry_follow_services');
        $this->data['entry_follow_title'] = $this->language->get('entry_follow_title');
        $this->data['entry_follow_thank'] = $this->language->get('entry_follow_thank');
        $this->data['entry_follow_desktop'] = $this->language->get('entry_follow_desktop');
        $this->data['entry_follow_mobile'] = $this->language->get('entry_follow_desktop');
        $this->data['entry_follow_id'] = $this->language->get('entry_follow_id');

        $this->data['button_save'] = $this->language->get('button_save');
        $this->data['button_cancel'] = $this->language->get('button_cancel');
        $this->data['button_add_module'] = $this->language->get('button_add_module');
        $this->data['button_remove'] = $this->language->get('button_remove');

        $this->load->model('localisation/language');
        $this->data['languages'] = $this->model_localisation_language->getLanguages();
        $this->data['token'] = $this->session->data['token'];

        if (isset($this->error['warning'])) {
            $this->data['error_warning'] = $this->error['warning'];
        } else {
            $this->data['error_warning'] = '';
        }

        if (isset($this->session->data['success'])) {
            $this->data['success'] = $this->session->data['success'];
            unset($this->session->data['success']);
        } else {
            $this->data['success'] = '';
        }

        $this->data['breadcrumbs'] = array();


        $this->data['breadcrumbs'][] = array(
            'text' => $this->language->get('text_home'),
            'href' => $this->url->link('common/home', 'token=' . $this->session->data['token'], 'SSL'),
            'separator' => false
        );

        $this->data['breadcrumbs'][] = array(
            'text' => $this->language->get('text_module'),
            'href' => $this->url->link('extension/module', 'token=' . $this->session->data['token'], 'SSL'),
            'separator' => ' :: '
        );

        $this->data['breadcrumbs'][] = array(
            'text' => $this->language->get('heading_title'),
            'href' => $this->url->link('module/pavsocialsidebar', 'token=' . $this->session->data['token'], 'SSL'),
            'separator' => ' :: '
        );

        $this->data['action'] = $this->url->link('module/pavsocialsidebar', 'token=' . $this->session->data['token'], 'SSL');

        $this->data['cancel'] = $this->url->link('extension/module', 'token=' . $this->session->data['token'], 'SSL');

        $this->data['modules'] = array();

        if (isset($this->request->post['pavsocialsidebar_module'])) {
            $this->data['modules'] = $this->request->post['pavsocialsidebar_module'];
        } elseif ($this->config->get('pavsocialsidebar_module')) {
            $this->data['modules']= $this->config->get('pavsocialsidebar_module');
        }
        //echo '<pre>'.print_r($this->data['modules'],1); die;

        $this->load->model('design/layout');
        $this->data['layouts'] = $this->model_design_layout->getLayouts();

        $this->load->model('design/banner');
        $this->data['banners'] = $this->model_design_banner->getBanners();

        $this->template = 'module/pavsocialsidebar.tpl';
        $this->children = array(
            'common/header',
            'common/footer'
        );

        $this->response->setOutput($this->render());
    }

    private function validate() {
        if (!$this->user->hasPermission('modify', 'module/pavsocialsidebar')) {
            $this->error['warning'] = $this->language->get('error_permission');
        }

        if (!$this->error) {
            return true;
        } else {
            return false;
        }
    }

}
?>