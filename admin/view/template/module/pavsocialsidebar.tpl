
<?php echo $header; ?>
<div id="content">
    <div class="breadcrumb">
        <?php foreach ($breadcrumbs as $breadcrumb) { ?>
        <?php echo $breadcrumb['separator']; ?><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a>
        <?php } ?>
    </div>

    <?php if ($error_warning) { ?>
    <div class="warning"><?php echo $error_warning; ?></div>
    <?php } ?>

    <?php if ($success) { ?>
    <div class="success"><?php echo $success; ?></div>
    <?php } ?>
    <div class="box">
        <div class="heading">
            <h1><img src="view/image/module.png" alt="" /> <?php echo $heading_title; ?></h1>
            <div class="buttons">
                <a onclick="$('#form').submit();" class="button"><?php echo $button_save; ?></a>
                <a onclick="$('#action').val('save-edit');$('#form').submit();" class="button"><?php echo $this->language->get('text_save_edit'); ?></a>
                <a href="<?php echo $cancel; ?>" class="button"><?php echo $button_cancel; ?></a>
            </div>
        </div>

        <div class="content">
            <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" id="form">
            <input name="action" type="hidden" id="action"/>
            <div class="vtabs">
                <?php $module_row = 1; ?>
                <?php foreach ($modules as $module) { ?>
                <a href="#tab-module-<?php echo $module_row; ?>" id="module-<?php echo $module_row; ?>"><?php echo $tab_module . ' ' . $module_row; ?>&nbsp;<img src="view/image/delete.png" alt="" onclick="$('.vtabs a:first').trigger('click'); $('#module-<?php echo $module_row; ?>').remove(); $('#tab-module-<?php echo $module_row; ?>').remove(); return false;" /></a>
                <?php $module_row++; ?>
                <?php } ?>
                <span id="module-add"><?php echo $button_add_module; ?>&nbsp;<img src="view/image/add.png" alt="" onclick="addModule();" /></span>
            </div>

            <?php $module_row = 1; ?>
            <?php foreach ($modules as $module) { ?>
            <div id="tab-module-<?php echo $module_row; ?>" class="vtabs-content">

                <table class="form">
                    <tr>
                        <td><?php echo $entry_layout; ?></td>
                        <td class="left"><select name="pavsocialsidebar_module[<?php echo $module_row; ?>][layout_id]">
                                <?php foreach ($layouts as $layout) { ?>
                                <?php if ($layout['layout_id'] == $module['layout_id']) { ?>
                                <option value="<?php echo $layout['layout_id']; ?>" selected="selected"><?php echo $layout['name']; ?></option>
                                <?php } else { ?>
                                <option value="<?php echo $layout['layout_id']; ?>"><?php echo $layout['name']; ?></option>
                                <?php } ?>
                                <?php } ?>
                            </select></td>
                    </tr>
                    <tr><td><?php echo $entry_position; ?></td>
                        <td class="left"><select name="pavsocialsidebar_module[<?php echo $module_row; ?>][position]">
                                <?php if ($module['position'] == 'content_top') { ?>
                                <option value="content_top" selected="selected"><?php echo $text_content_top; ?></option>
                                <?php } else { ?>
                                <option value="content_top"><?php echo $text_content_top; ?></option>
                                <?php } ?>
                                <?php if ($module['position'] == 'content_bottom') { ?>
                                <option value="content_bottom" selected="selected"><?php echo $text_content_bottom; ?></option>
                                <?php } else { ?>
                                <option value="content_bottom"><?php echo $text_content_bottom; ?></option>
                                <?php } ?>
                            </select></td>
                    </tr>

                    <tr>
                        <td><?php echo $entry_status; ?></td>
                        <td><select name="pavsocialsidebar_module[<?php echo $module_row; ?>][status]">
                            <?php if ($module['status']) { ?>
                            <option value="1" selected="selected"><?php echo $text_enabled; ?></option>
                            <option value="0"><?php echo $text_disabled; ?></option>
                            <?php } else { ?>
                            <option value="1"><?php echo $text_enabled; ?></option>
                            <option value="0" selected="selected"><?php echo $text_disabled; ?></option>
                            <?php } ?>
                            </select>
                        </td>
                    </tr>

                    <tr>
                        <td><?php echo $entry_sort_order; ?></td>
                        <td><input type="text" name="pavsocialsidebar_module[<?php echo $module_row; ?>][sort_order]" value="<?php echo $module['sort_order']; ?>" size="3" /></td>
                    </tr>

                    <tr>
                        <td><?php echo $entry_theme; ?></td>
                        <td><select name="pavsocialsidebar_module[<?php echo $module_row; ?>][theme]">
                            <?php foreach( $themes as $theme ) { ?>
                            <?php if ($module['theme'] == $theme) { ?>
                            <option value="<?php echo $theme['val'];?>" selected="selected"><?php echo $theme['text']; ?></option>
                            <?php } else { ?>
                            <option value="<?php echo $theme['val'];?>"><?php echo $theme['text']; ?></option>
                            <?php } ?>
                            <?php } ?>
                            </select>
                        </td>
                    </tr>

                    <tr>
                        <td><?php echo $entry_responsive_maxwidth; ?></td>
                        <td><input type="text" name="pavsocialsidebar_module[<?php echo $module_row; ?>][responsive_maxwidth]" value="<?php echo (isset($module['responsive_maxwidth'])? $module['responsive_maxwidth']: '979'); ?>" size="5" /> px</td>
                    </tr>

                    <tr>
                        <td><?php echo $entry_responsive_minwidth; ?></td>
                        <td><input type="text" name="pavsocialsidebar_module[<?php echo $module_row; ?>][responsive_minwidth]" value="<?php echo (isset($module['responsive_minwidth'])? $module['responsive_minwidth']: '0'); ?>" size="5" /> px</td>
                    </tr>

                    <tr>
                        <td><?php echo $entry_domain; ?></td>
                        <td><input type="text" name="pavsocialsidebar_module[<?php echo $module_row; ?>][domain]" value="<?php echo (isset($module['domain'])? $module['domain']: 'mysite.com'); ?>" size="20" /></td>
                    </tr>

                    <tr>
                        <td><?php echo $entry_idAddthis; ?></td>
                        <td><input type="text" name="pavsocialsidebar_module[<?php echo $module_row; ?>][idAddthis]" value="<?php echo (isset($module['idAddthis'])? $module['idAddthis']: ''); ?>" size="20" /></td>
                    </tr>
                    <tr>
                        <td colspan="2"><?php echo $text_description_IDAddthis; ?></td>
                    </tr>

                    <tr>
                        <td colspan="2"><b><?php echo $entry_mobile_config; ?></b></td>
                    </tr>

                    <tr>
                        <td><?php echo $entry_mobile_position?></td>
                        <td><select name="pavsocialsidebar_module[<?php echo $module_row; ?>][mobile_position]">
                                <?php if ($module['mobile_position']=='top') { ?>
                                <option value="top" selected="selected"><?php echo $text_mobile_top; ?></option>
                                <option value="bottom"><?php echo $text_mobile_bottom; ?></option>
                                <?php } else { ?>
                                <option value="top"><?php echo $text_mobile_top; ?></option>
                                <option value="bottom" selected="selected"><?php echo $text_mobile_bottom; ?></option>
                                <?php } ?>
                            </select>
                        </td>
                    </tr>

                    <tr>
                        <td><?php echo $entry_mobile_theme; ?></td>
                        <td><select name="pavsocialsidebar_module[<?php echo $module_row; ?>][mobile_theme]">
                                <?php foreach( $themes as $theme ) { ?>
                                <?php if ($module['mobile_theme'] == $theme) { ?>
                                <option value="<?php echo $theme['val'];?>" selected="selected"><?php echo $theme['text']; ?></option>
                                <?php } else { ?>
                                <option value="<?php echo $theme['val'];?>"><?php echo $theme['text']; ?></option>
                                <?php } ?>
                                <?php } ?>
                            </select>
                        </td>
                    </tr>

                    <tr>
                        <td><?php echo $entry_mobile_status; ?></td>
                        <td><select name="pavsocialsidebar_module[<?php echo $module_row; ?>][mobile_status]">
                                <?php if ($module['mobile_status']) { ?>
                                <option value="1" selected="selected"><?php echo $text_enabled; ?></option>
                                <option value="0"><?php echo $text_disabled; ?></option>
                                <?php } else { ?>
                                <option value="1"><?php echo $text_enabled; ?></option>
                                <option value="0" selected="selected"><?php echo $text_disabled; ?></option>
                                <?php } ?>
                            </select>
                        </td>
                    </tr>
                </table>

                <?php $socials = array("Share", "Follow"); ?>
                <div id="social-<?php echo $module_row; ?>" class="htabs">
                    <?php foreach ($socials as $social) { ?>
                    <a href="#tab-social-<?php echo $module_row; ?>-<?php echo $social; ?>"><?php echo $social; ?></a>
                    <?php } ?>
                </div>

                <div id="tab-social-<?php echo $module_row; ?>-Share">
                    <table class="form">
                        <tr>
                            <td><?php echo $this->language->get("entry_share_position"); ?></td>
                            <td><select name="pavsocialsidebar_module[<?php echo $module_row; ?>][share_position]">
                                    <?php if ($module['share_position'] == 'left') { ?>
                                    <option value="left" selected="selected"><?php echo $entry_share_left; ?></option>
                                    <option value="right"><?php echo $entry_share_right; ?></option>
                                    <?php } else { ?>
                                    <option value="right" selected="selected"><?php echo $entry_share_right; ?></option>
                                    <option value="left" ><?php echo $entry_share_left; ?></option>
                                    <?php } ?>
                                </select>
                            </td>

                        </tr>

                        <tr>
                            <td><?php echo $this->language->get("entry_share_services"); ?></td>
                            <td>
                                <select name="pavsocialsidebar_module[<?php echo $module_row; ?>][share_service][]" id="pavsocialsidebar_module_<?php echo $module_row; ?>_share_service" multiple="multiple" size="10" style="width:200px">
                                    <?php foreach ($services as $service) { ?>
                                        <option value="<?php echo $service['val']; ?>"<?php if( isset($module['share_service']) && in_array($service['val'],$module['share_service'])) { ?>selected="selected"<?php } ?>><?php echo $service['text']; ?></option>
                                    <?php } ?>
                                </select>
                            </td>
                        </tr>
                        <tr>
                            <td><?php echo $this->language->get("entry_share_title"); ?></td>
                            <td>
                                <input size="60" type="text" value="<?php echo (isset($module['share_title'])?$module['share_title']:'Thanks for sharing!' ) ?>" name="pavsocialsidebar_module[<?php echo $module_row; ?>][share_title]" >
                            </td>
                        </tr>

                        <tr>
                            <td><?php echo $this->language->get("entry_share_mgs"); ?></td>
                            <td>
                                <input size="60" type="text" value="<?php echo (isset($module['share_mgs'])?$module['share_mgs']:'Follow us' ) ?>" name="pavsocialsidebar_module[<?php echo $module_row; ?>][share_mgs]" >
                            </td>
                        </tr>

                        <tr>
                            <td><?php echo $this->language->get("entry_share_theme"); ?></td>
                            <td>
                                <select name="pavsocialsidebar_module[<?php echo $module_row; ?>][share_theme]">
                                    <?php foreach($themes as $theme):?>
                                    <?php if(isset($module['share_theme']) && $module['share_theme'] == $theme['val']):?>
                                    <option value="<?php echo $theme['val']; ?>" selected="selected"><?php echo $theme['text']; ?></option>
                                    <?php else: ?>
                                    <option value="<?php echo $theme['val']; ?>"><?php echo $theme['text']; ?></option>
                                    <?php endif;?>
                                    <?php endforeach; ?>
                                </select>
                            </td>
                        </tr>

                        <tr>
                            <td><?php echo $this->language->get("entry_share_desktop"); ?></td>
                            <td><select name="pavsocialsidebar_module[<?php echo $module_row; ?>][share_desktop]">
                                    <?php if ($module['share_desktop']) { ?>
                                    <option value="1" selected="selected"><?php echo $text_enabled; ?></option>
                                    <option value="0"><?php echo $text_disabled; ?></option>
                                    <?php } else { ?>
                                    <option value="1"><?php echo $text_enabled; ?></option>
                                    <option value="0" selected="selected"><?php echo $text_disabled; ?></option>
                                    <?php } ?>
                                </select>
                            </td>
                        </tr>

                        <tr>
                            <td><?php echo $this->language->get("entry_share_mobile"); ?></td>
                            <td><select name="pavsocialsidebar_module[<?php echo $module_row; ?>][share_mobile]">
                                    <?php if ($module['share_mobile']) { ?>
                                    <option value="1" selected="selected"><?php echo $text_enabled; ?></option>
                                    <option value="0"><?php echo $text_disabled; ?></option>
                                    <?php } else { ?>
                                    <option value="1"><?php echo $text_enabled; ?></option>
                                    <option value="0" selected="selected"><?php echo $text_disabled; ?></option>
                                    <?php } ?>
                                </select>
                            </td>
                        </tr>
                    </table>
                </div>

                <div id="tab-social-<?php echo $module_row; ?>-Follow">
                    <table class="form">
                        <tr>
                            <td><?php echo $entry_follow_title; ?></td>
                            <td><input type="text" name="pavsocialsidebar_module[<?php echo $module_row; ?>][follow_title]" value="<?php echo isset($module['follow_title'])?$module['follow_title']:'Follow'; ?>" size="35" /></td>
                        </tr>
                        <tr><td><?php echo $entry_follow_theme; ?></td>
                            <td>
                                <select name="pavsocialsidebar_module[<?php echo $module_row; ?>][theme]">
                                    <?php foreach($themes as $theme):?>
                                    <?php if(isset($module['theme']) && $module['theme'] == $theme['val']):?>
                                    <option value="<?php echo $theme['val']; ?>" selected="selected"><?php echo $theme['text']; ?></option>
                                    <?php else: ?>
                                    <option value="<?php echo $theme['val']; ?>"><?php echo $theme['text']; ?></option>
                                    <?php endif;?>
                                    <?php endforeach; ?>
                                </select>
                            </td>
                        </tr>
                        <tr>
                            <td><?php echo $entry_follow_thank; ?></td>
                            <td><input type="text" name="pavsocialsidebar_module[<?php echo $module_row; ?>][follow_thank]" value="<?php echo isset($module['follow_thank'])?$module['follow_thank']:'Thanks for following!'; ?>" size="35" /></td>
                        </tr>

                        <tr>
                            <td><?php echo $this->language->get("entry_follow_desktop"); ?></td>
                            <td><select name="pavsocialsidebar_module[<?php echo $module_row; ?>][follow_desktop]">
                                    <?php if ($module['follow_desktop']) { ?>
                                    <option value="1" selected="selected"><?php echo $text_enabled; ?></option>
                                    <option value="0"><?php echo $text_disabled; ?></option>
                                    <?php } else { ?>
                                    <option value="1"><?php echo $text_enabled; ?></option>
                                    <option value="0" selected="selected"><?php echo $text_disabled; ?></option>
                                    <?php } ?>
                                </select>
                            </td>
                        </tr>

                        <tr>
                            <td><?php echo $this->language->get("entry_follow_mobile"); ?></td>
                            <td><select name="pavsocialsidebar_module[<?php echo $module_row; ?>][follow_mobile]">
                                    <?php if ($module['follow_mobile']) { ?>
                                    <option value="1" selected="selected"><?php echo $text_enabled; ?></option>
                                    <option value="0"><?php echo $text_disabled; ?></option>
                                    <?php } else { ?>
                                    <option value="1"><?php echo $text_enabled; ?></option>
                                    <option value="0" selected="selected"><?php echo $text_disabled; ?></option>
                                    <?php } ?>
                                </select>
                            </td>
                        </tr>
                        <tr>
                            <td colspan="2"><b><?php echo $entry_follow_services; ?></b>
                            <br/><?php echo $text_description; ?></td>
                        </tr>
                        <?php foreach($services_id as $id) { ?>
                        <tr>
                            <td><?php echo $id['text']; ?></td>
                            <td><?php $string= 'follow_services_'.$id['val']; ?>
                                <?php echo $id['url']; ?>&nbsp
                                <input type="text" name="pavsocialsidebar_module[<?php echo $module_row; ?>][follow_services_<?php echo $id['val']; ?>]"
                                 value="<?php echo isset($module[$string])?$module[$string]:''; ?>" size="20" />
                        </tr>
                        <?php } ?>
                    </table>
                </div>
            </div>
            <?php $module_row++; ?>
            <?php } ?>
        </form>
        </div>
    </div>
</div>
<script type="text/javascript"><!--
var module_row = <?php echo $module_row; ?>;

function addModule() {
    html  = '<div id="tab-module-' + module_row + '" class="vtabs-content">';
    html += '<table class="form">';
    html += '	<tr>';
    html += '		<td><?php echo $entry_layout; ?></td>';
    html += '		<td><select name="pavsocialsidebar_module[' + module_row + '][layout_id]">';
    <?php foreach ($layouts as $layout) { ?>
        html += '<option value="<?php echo $layout['layout_id']; ?>"><?php echo addslashes($layout['name']); ?></option>';
    <?php } ?>
    html += '		</select></td>';
    html += '	</tr>';
    html += '	<tr>';
    html += '		<td><?php echo $entry_position; ?></td>';
    html += '		<td class="left"><select name="pavsocialsidebar_module[' +module_row + '][position]">';
            <?php if (isset($module['position']) &&  $module['position']== 'content_top') { ?>
    html += '<option value="content_top" selected="selected"><?php echo $text_content_top; ?></option>';
                <?php } else { ?>
    html +='<option value="content_top"><?php echo $text_content_top; ?></option>';
                <?php } ?>
<?php if (isset($module['position']) && $module['position'] == 'content_bottom') { ?>
    html +='<option value="content_bottom" selected="selected"><?php echo $text_content_bottom; ?></option>';
                <?php } else { ?>
    html +='<option value="content_bottom"><?php echo $text_content_bottom; ?></option>';
                <?php } ?>
    html +='</select></td>';
    html += '	</tr>';
    html += '	<tr>';
    html += '		<td><?php echo $entry_status; ?></td>';
    html += '		<td><select name="pavsocialsidebar_module[' + module_row + '][status]">';
    html += '			<option value="1"><?php echo $text_enabled; ?></option>';
    html += '			<option value="0"><?php echo $text_disabled; ?></option>';
    html += '		</select></td>';
    html += '	</tr>';
    html += '	<tr>';
    html += '	<tr>';
    html += '		<td><?php echo $entry_sort_order; ?></td>';
    html += '		<td><input type="text" name="pavsocialsidebar_module[' + module_row + '][sort_order]" value="1" size="3" /></td>';
    html += '	</tr>';
    html += '<tr>';
    html += '<td><?php echo $entry_theme; ?></td>';
    html += '<td><select name="pavsocialsidebar_module[' +module_row+ '][theme]">';
<?php foreach( $themes as $theme ) { ?>
    html += '<option value="<?php echo $theme['val'];?>"><?php echo $theme['text']; ?></option>';
<?php } ?>
    html += '</select>';
    html += '</td>';
    html += '</tr>';
    html += '<tr>';
    html += '<td><?php echo $entry_responsive_maxwidth; ?></td>';
    html += '<td><input type="text" name="pavsocialsidebar_module[' +module_row+ '][responsive_maxwidth]" value="979" size="5" /> px</td>';
    html += '</tr>';
    html += '<tr>';
    html += '<td><?php echo $entry_responsive_minwidth; ?></td>';
    html += '<td><input type="text" name="pavsocialsidebar_module[' +module_row+ '][responsive_minwidth]" value="0" size="5" /> px</td>';
    html += '</tr>';
    html +='<tr>';
            html +='<td><?php echo $entry_domain; ?></td>';
            html +='<td><input type="text" name="pavsocialsidebar_module[<?php echo $module_row; ?>][domain]" value="<?php echo (isset($module['domain'])? $module['domain']: 'mysite.com'); ?>" size="20" /></td>';
            html +='</tr>';
            html +='<tr>';
            html +='<td colspan="2"><b><?php echo $entry_mobile_config; ?></b></td>';
            html +='</tr>';

            html +='<tr>';
    html +='<td><?php echo $entry_mobile_position?></td>';
    html +='<td><select name="pavsocialsidebar_module[<?php echo $module_row; ?>][mobile_position]">';
<?php if (isset ($module['mobile_position']) && $module['mobile_position'] =='top') { ?>
    html +='<option value="top" selected="selected"><?php echo $text_mobile_top; ?></option>';
    html +='<option value="bottom"><?php echo $text_mobile_bottom; ?></option>';
                <?php } else { ?>
        html +='<option value="top"><?php echo $text_mobile_top; ?></option>';
        html +='<option value="bottom" selected="selected"><?php echo $text_mobile_bottom; ?></option>';
                <?php } ?>
    html +='</select>';
    html +='</td>';
    html +='</tr>';
    html +='<tr>';
    html +='<td><?php echo $entry_idAddthis; ?></td>';
    html +='<td><input type="text" name="pavsocialsidebar_module[<?php echo $module_row; ?>][idAddthis]" value="<?php echo (isset($module['idAddthis'])? $module['idAddthis']: ''); ?>" size="20" /></td>';
    html +='</tr>';
    html +='<tr>';
    html +='<td colspan="2"><?php echo $text_description_IDAddthis; ?></td>';
    html +='</tr>';
    html +='<tr>';
    html +='<td><?php echo $entry_mobile_theme; ?></td>';
    html +='<td><select name="pavsocialsidebar_module[<?php echo $module_row; ?>][mobile_theme]">';
            <?php foreach( $themes as $theme ) { ?>
    <?php if (isset ($module['mobile_theme']) && $module['mobile_theme'] == $theme) { ?>
            html +='<option value="<?php echo $theme['val'];?>" selected="selected"><?php echo $theme['text']; ?></option>';
                    <?php } else { ?>
            html +='<option value="<?php echo $theme['val'];?>"><?php echo $theme['text']; ?></option>';
                    <?php } ?>
    <?php } ?>
    html +='</select>';
    html +='</td>';
    html +='</tr>';

    html +='<tr>';
    html +='<td><?php echo $entry_mobile_status; ?></td>';
    html +='<td><select name="pavsocialsidebar_module[<?php echo $module_row; ?>][mobile_status]">;'
            <?php if (isset($module['mobile_status']) && $module['mobile_status']){ ?>
        html +='<option value="1" selected="selected"><?php echo $text_enabled; ?></option>';
        html +='<option value="0"><?php echo $text_disabled; ?></option>';
                <?php } else { ?>
        html +='<option value="1"><?php echo $text_enabled; ?></option>';
        html +='<option value="0" selected="selected"><?php echo $text_disabled; ?></option>';
                <?php } ?>
    html +='</select>';
    html +='</td>';
    html +='</tr>';
    html += '</table>';

<?php $socials = array("Share", "Follow"); ?>
    html += '<div id="social-' + module_row + '" class="htabs">';
            <?php foreach ($socials as $social) { ?>
        html += '<a href="#tab-social-' + module_row + '-<?php echo $social; ?>"><?php echo $social; ?></a>';
             <?php } ?>
    html += '</div>';
    html += '<div id="tab-social-' +module_row+ '-Share">';
    html += '<table class="form">';
    html += '<tr>';
    html += '<td><?php echo $this->language->get("entry_share_position"); ?></td>';
    html +='<td><select name="pavsocialsidebar_module[<?php echo $module_row; ?>][share_position]">';
        html +='<option value="right"><?php echo $entry_share_right; ?></option>';
        html +='<option value="left" ><?php echo $entry_share_left; ?></option>';

html +='</select>';
    html +='</td>';

    html += '</tr>';
    html += '<tr>';
    html +='<td><?php echo $this->language->get("entry_share_services"); ?></td>';
    html += '<td>';
    html += '<select name="pavsocialsidebar_module[<?php echo $module_row; ?>][share_service][]" id="pavsocialsidebar_module_<?php echo $module_row; ?>_share_service" multiple="multiple" size="10" style="width:200px">';
    <?php foreach ($services as $service) { ?>
    html += '<option value="<?php echo $service['val']; ?>"<?php if( isset($module['share_service']) && in_array($service['val'],$module['share_service'])) { ?>selected="selected"<?php } ?>><?php echo $service['text']; ?></option>';
                <?php } ?>
    html += '</select>';
    html += '</td>';
    html += '</tr>';
    html += '<tr>';
    html += '<td><?php echo $this->language->get("entry_share_title"); ?></td>';
    html += '<td>';
    html += '<input size="60" type="text" value="<?php echo (isset($module['share_title'])?$module['share_title']:'Thanks for sharing!' ) ?>" name="pavsocialsidebar_module[<?php echo $module_row; ?>][share_title]" >';
    html += '</td>';
    html += '</tr>';
    html += '<tr>';
    html += '<td><?php echo $this->language->get("entry_share_mgs"); ?></td>';
    html += '<td>';
    html += '<input size="60" type="text" value="<?php echo (isset($module['share_mgs'])?$module['share_mgs']:'Follow us' ) ?>" name="pavsocialsidebar_module[<?php echo $module_row; ?>][share_mgs]" >';
    html += '</td>';
    html += '</tr>';
    html += '<tr>';
    html += '<td><?php echo $this->language->get("entry_share_theme"); ?></td>';
    html += '<td>';
    html += '<select name="pavsocialsidebar_module[' +module_row+ '][share_theme]">';
            <?php foreach($themes as $theme):?>
<?php if(isset($module['share_theme']) && $module['share_theme'] == $theme['val']):?>
    html += '<option value="<?php echo $theme['val']; ?>" selected="selected"><?php echo $theme['text']; ?></option>';
            <?php else: ?>
    html += '<option value="<?php echo $theme['val']; ?>"><?php echo $theme['text']; ?></option>';
            <?php endif;?>
<?php endforeach; ?>
    html += '</select>';
    html += '</td>';
    html += '</tr>';

    html += ' <tr>';
    html += '<td><?php echo $this->language->get("entry_share_desktop"); ?></td>';
    html += '<td><select name="pavsocialsidebar_module[' +module_row+ '][share_desktop]">';
        html += '<option value="1" selected="selected"><?php echo $text_enabled; ?></option>';
        html += '<option value="0"><?php echo $text_disabled; ?></option>';
    html += '</select>';
    html += '</td>';
    html += '</tr>';
    html += '<tr>';
    html += '<td><?php echo $this->language->get("entry_share_mobile"); ?></td>';
    html += '<td><select name="pavsocialsidebar_module[' +module_row+ '][share_mobile]">';
        html += '<option value="1" selected="selected"><?php echo $text_enabled; ?></option>';
        html += '<option value="0"><?php echo $text_disabled; ?></option>';
    html += '</select>';
    html += '</td>';
    html += '</tr>';
    html += '</table>';
    html += '</div>';
    html += '<div id="tab-social-' +module_row+ '-Follow">';
    html += '<table class="form">';
    html += '<tr>';
    html += '<td><?php echo $entry_follow_title; ?></td>';
    html += '<td><input type="text" name="pavsocialsidebar_module[' +module_row+ '][follow_title]" value="<?php echo isset($module['follow_title'])?$module['follow_title']:'Follow'; ?>" size="35" /></td>';
    html += '</tr>';
    html += '<tr>';
    html += '<td><?php echo $entry_follow_theme; ?></td>';
    html += '<td>';
    html += '<select name="pavsocialsidebar_module[' +module_row+ '][theme]">';
            <?php foreach($themes as $theme):?>;
<?php if(isset($module['theme']) && $module['theme'] == $theme['val']):?>
    html += '<option value="<?php echo $theme['val']; ?>" selected="selected"><?php echo $theme['text']; ?></option>';
            <?php else: ?>
    html += '<option value="<?php echo $theme['val']; ?>"><?php echo $theme['text']; ?></option>';
            <?php endif;?>
<?php endforeach; ?>
    html += '</select>';
    html += '</td>';
    html += '</tr>';
    html += '<td><?php echo $entry_follow_thank; ?></td>';
    html += '<td><input type="text" name="pavsocialsidebar_module[' +module_row+ '][follow_thank]" value="<?php echo isset($module['follow_thank'])?$module['follow_thank']:'Thanks for following!'; ?>" size="35" /></td>';
    html += '</tr>';
    html += '<tr>';
    html += '<td><?php echo $this->language->get("entry_follow_desktop"); ?></td>';
    html += '<td><select name="pavsocialsidebar_module[' +module_row+ '][follow_desktop]">';
    html += '<option value="1" selected="selected"><?php echo $text_enabled; ?></option>';
    html += '<option value="0"><?php echo $text_disabled; ?></option>';
    html += '</select>';
    html += '</td>';
    html += '</tr>';
    html += '<tr>';
    html += '<td><?php echo $this->language->get("entry_follow_mobile"); ?></td>';
    html += '<td><select name="pavsocialsidebar_module[' +module_row+ '][follow_mobile]">';
    html += '<option value="1" selected="selected"><?php echo $text_enabled; ?></option>';
    html += '<option value="0"><?php echo $text_disabled; ?></option>';
    html += '</select>';
    html += '</td>';
    html += '</tr>';
    html += '<tr>';
    html +='<tr>';
    html +='<td colspan="2"><b><?php echo $entry_follow_services; ?></b>';
    html +='<br/><?php echo $text_description; ?></td>';
    html +='</tr>';
    <?php foreach($services_id as $id) { ?>
    html +='<tr>';
    html +='<td><?php echo $id['text']; ?></td>';
    html +='<td><?php $string= 'follow_services_'.$id['val']; ?>';
    html +='<?php echo $id['url']; ?>&nbsp';
    html +='<input type="text" name="pavsocialsidebar_module[<?php echo $module_row; ?>][follow_services_<?php echo $id['val']; ?>]" value="<?php echo isset($module[$string])?$module[$string]:''; ?>" size="20" />';
    html +='</tr>';
    <?php } ?>
html += '</table>';
html += '</div>';
html += '</div>';

 $('#form').append(html);
$('#social-' + module_row + ' a').tabs();
$('#module-add').before('<a href="#tab-module-' + module_row + '" id="module-' + module_row + '"><?php echo $tab_module; ?> ' + module_row + '&nbsp;<img src="view/image/delete.png" alt="" onclick="$(\'.vtabs a:first\').trigger(\'click\'); $(\'#module-' + module_row + '\').remove(); $(\'#tab-module-' + module_row + '\').remove(); return false;" /></a>');
$('.vtabs a').tabs();
$('#module-' + module_row).trigger('click');
module_row++;
}
//-->
</script>
<script type="text/javascript"><!--
    $('.vtabs a').tabs();
    //--></script>
<script type="text/javascript"><!--
    <?php $i = 1; ?>
    <?php foreach ($modules as $module) { ?>
        $('#social-<?php echo $i; ?> a').tabs();
    <?php $i++; ?>
    <?php } ?>
//-->
</script>
<?php echo $footer; ?>
