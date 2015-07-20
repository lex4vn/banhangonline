<?php
/******************************************************
 * @package  : Pav Social module for Opencart 1.5.x
 * @version  : 1.0
 * @author   : http://www.pavothemes.com
 * @copyright: Copyright (C) Feb 2013 PavoThemes.com <@emai:pavothemes@gmail.com>.All rights reserved.
 * @license  : GNU General Public License version 1
 *******************************************************/

class ControllerModulePavsocialsidebar extends Controller {

    protected function index($setting) {
        static $module = 1;
        //$this->language->load('module/pavsocialsidebar');

        if (isset($this->request->server['HTTPS']) && (($this->request->server['HTTPS'] == 'on') || ($this->request->server['HTTPS'] == '1'))) {
            $this->data['base'] = $this->config->get('config_ssl');
        } else {
            $this->data['base'] = $this->config->get('config_url');
        }

        $outsite = isset($setting['position'])?$setting['position']:'left';
        if ($outsite == 'left') {
            $this->data['prefix'] = 'left';
        } else {
            $this->data['prefix'] = 'right';
        }

        //data config
        $this->data['theme'] = !empty($setting['theme'])?$setting['theme']:'transparent';
        $this->data['maxWidth'] = !empty($setting['responsive_maxwidth'])? $setting['responsive_maxwidth']: '979';
        $this->data['minWidth'] = !empty($setting['responsive_minwidth'])? $setting['responsive_minwidth']: '0';
        $this->data['domain'] = !empty($setting['domain'])? $setting['domain']: 'mysite.com';
        $this->data['idAddthis'] = !empty($setting['idAddthis'])? $setting['idAddthis']: '';

        //data config share
        $this->data['share_position'] = !empty($setting['share_position'])?$setting['share_position']:'left';
        if(!empty($setting['share_service']))
        {
            $data_services = $setting['share_service'];
            $this->data['services'] = join(",", $data_services);
        }else
            $this->data['services'] = 'facebook,twitter,google_plusone_share,email,print,more';

        $this->data['share_title'] = !empty($setting['share_title'])?$setting['share_title']:'Thanks for sharing!';
        $this->data['share_theme'] = !empty($setting['share_theme'])?$setting['share_theme']:'transparent';
        $this->data['share_mgs'] = !empty($setting['share_mgs'])?$setting['share_mgs']:'Follow us';
        $this->data['share_desktop'] = !empty($setting['share_desktop'])?$setting['share_desktop']:'true';
        $this->data['share_mobile'] = !empty($setting['share_mobile'])?$setting['share_mobile']:'true';

        //data config mobile
        $this->data['mobile_position'] = !empty($setting['mobile_position'])?$setting['mobile_position']:'top';
        $this->data['mobile_theme'] = !empty($setting['mobile_theme'])?$setting['mobile_theme']:'transparent';
        $this->data['mobile_status'] = !empty($setting['share_mgs'])?$setting['mobile_status']:'true';


        //data config follow
        $this->data['follow_title'] = !empty($setting['follow_title'])?$setting['follow_title']:'Follow';
        $this->data['follow_thank'] = !empty($setting['follow_thank'])?$setting['follow_thank']:'Thanks for following!';
        $this->data['follow_theme'] = !empty($setting['follow_theme'])?$setting['follow_theme']:'transparent';
        $this->data['follow_desktop'] = !empty($setting['follow_desktop'])?$setting['follow_desktop']:'true';
        $this->data['follow_mobile'] = !empty($setting['follow_mobile'])?$setting['follow_mobile']:'true';



        //config follow id services
        if(!empty($setting['follow_services_facebook'])){
            $this->data['follow_services'][]=array( 'service' => 'facebook', 'id' => $setting['follow_services_facebook']);
        }
        if(!empty($setting['follow_services_twitter'])){
            $this->data['follow_services'][]=array( 'service' => 'twitter', 'id' => $setting['follow_services_twitter']);
        }
        if(!empty($setting['follow_services_google_follow'])){
            $this->data['follow_services'][]=array( 'service' => 'google_follow', 'id' => $setting['follow_services_google_follow']);
        }
        if(!empty($setting['follow_services_youtube'])){
            $this->data['follow_services'][]=array( 'service' => 'youtube', 'id' => $setting['follow_services_youtube']);
        }
        if(!empty($setting['follow_services_flickr'])){
            $this->data['follow_services'][]=array( 'service' => 'flickr', 'id' => $setting['follow_services_flickr']);
        }
        if(!empty($setting['follow_services_vimeo'])){
            $this->data['follow_services'][]=array( 'service' => 'vimeo', 'id' => $setting['follow_services_vimeo']);
        }
        if(!empty($setting['follow_services_pinterest'])){
            $this->data['follow_services'][]=array( 'service' => 'pinterest', 'id' => $setting['follow_services_pinterest']);
        }
        if(!empty($setting['follow_services_instagram'])){
            $this->data['follow_services'][]=array( 'service' => 'instagram', 'id' => $setting['follow_services_instagram']);
        }
        if(!empty($setting['follow_services_linkedin'])){
            $this->data['follow_services'][]=array( 'service' => 'linkedin', 'id' => $setting['follow_services_linkedin']);
        }

        //Load file tpl
        $this->data['module'] = $module++;
        if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/module/pavsocialsidebar.tpl')) {
            $this->template = $this->config->get('config_template') . '/template/module/pavsocialsidebar.tpl';
        } else {
            $this->template = 'default/template/module/pavsocialsidebar.tpl';
        }
        $this->response->setOutput($this->render());
    }
}

?>
