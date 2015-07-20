
<!-- AddThis Smart Layers BEGIN -->
<!-- Go to http://www.addthis.com/get/smart-layers to customize -->
<?php $js_url= '//s7.addthis.com/js/300/addthis_widget.js';
        if(!empty($idAddthis)){
            $js_url.='#pubid='. $idAddthis;
        }
?>
    <script type="text/javascript" src="<?php echo $js_url; ?>"></script>
    <script type="text/javascript">
        addthis.layers({
            'theme' : '<?php echo $theme; ?>',
            'domain' : '<?php echo $domain; ?>',
            'linkFilter' : function(link, layer) {
                console.log(link.title + ' - ' + link.url + " - " + layer);
                return link;
            },
            'responsive' : {
                'maxWidth' : '<?php echo $maxWidth; ?>px',
                'minWidth' : '<?php echo $minWidth; ?>px'
            },
            'share' : {
                'position' : '<?php echo $share_position; ?>',
                'services' : '<?php echo $services; ?>',
                'postShareTitle' : '<?php echo $share_title; ?>',
                'postShareFollowMsg' : '<?php echo $share_mgs; ?>',
                <?php if($share_desktop==1) { ?>
                    'desktop' : true,
                <?php } else { ?>
                    'desktop' : false,
                 <?php } ?>
                <?php if($share_mobile==1) { ?>
                    'mobile' : true,
                <?php } else { ?>
                    'mobile' : false,
                <?php } ?>
                'theme' : '<?php echo $share_theme; ?>'
            },
            'follow' : { <?php if(!empty($follow_services)) { ?>
                'services' : [<?php foreach ($follow_services as $code) { ?>
                    {'service' : '<?php echo $code["service"];?>', 'id' : '<?php echo $code["id"];?>'},
            ],
            <?php } } ?>

                'title' : '<?php echo $follow_title; ?>',
                'postFollowTitle' : '<?php echo $follow_thank; ?>',
                <?php if($follow_desktop==1) { ?>
                    'desktop' : true,
                 <?php } else { ?>
                    'desktop' : false,
                 <?php } ?>
                <?php if($follow_mobile==1) { ?>
                    'mobile' : true,
                <?php } else { ?>
                    'mobile' : false,
                <?php } ?>
                'theme' : '<?php echo $follow_theme; ?>'
            },
            'mobile' : {
                'buttonBarPosition' : '<?php echo $mobile_position; ?>',
                'buttonBarTheme' : '<?php echo $mobile_theme; ?>',
                    <?php if($mobile_status==1) { ?>
                'mobile' : true
                <?php } else { ?>
                'mobile' : false,
                        <?php } ?>
            }
        });
    </script>
<!-- AddThis Smart Layers BEGIN -->
<!-- Go to http://www.addthis.com/get/smart-layers to customize -->
