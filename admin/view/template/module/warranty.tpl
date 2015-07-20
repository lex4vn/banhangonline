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
  <div class="box">
    <div class="heading">
      <h1><img src="view/image/module.png" alt="" /> <?php echo $heading_title; ?></h1>
      <div class="buttons"><a onclick="$('#form').submit();" class="button"><?php echo $button_save; ?></a><a onclick="location = '<?php echo $cancel; ?>';" class="button"><?php echo $button_cancel; ?></a></div>
    </div>
    <div class="content">
      <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" id="form">

        <!-- start image -->  
        <table id="images" class="list">
          <thead>
            <tr>
              <td class="left"><?php echo $Position; ?></td>
              <td class="left"><?php echo $Name; ?></td>
              <td class="left"><?php echo $Phone; ?></td>
              <td class="left"><?php echo $Email; ?></td>
              <td class="left"><?php echo $Yahoo; ?></td>
              <td class="left"><?php echo $Skype; ?></td>
              <td class="left"><?php echo $nivo_image ?></td>
              <td></td>
            </tr>
          </thead>
          <?php $image_row = 0; ?>
          <?php foreach ($images as $image) { ?>
          <tbody id="image-row<?php echo $image_row; ?>">
            <tr>	 
                <td class="left"><input type="text" name="image_avatar_w[<?php echo $image_row; ?>][position]" value="<?php echo  isset($image['position']) ? $image['position'] : ''; ?>" /></td>
                <td class="left"><input type="text" name="image_avatar_w[<?php echo $image_row; ?>][name]" value="<?php echo  isset($image['name']) ? $image['name'] : ''; ?>" /></td>
                <td class="left"><input type="text" name="image_avatar_w[<?php echo $image_row; ?>][phone]" value="<?php echo  isset($image['phone']) ? $image['phone'] : ''; ?>" /></td>
                <td class="left"><input type="text" name="image_avatar_w[<?php echo $image_row; ?>][email]" value="<?php echo  isset($image['email']) ? $image['email'] : ''; ?>" /></td>
                <td class="left"><input type="text" name="image_avatar_w[<?php echo $image_row; ?>][yahoo]" value="<?php echo  isset($image['yahoo']) ? $image['yahoo'] : ''; ?>" /></td>
                <td class="left"><input type="text" name="image_avatar_w[<?php echo $image_row; ?>][skype]" value="<?php echo  isset($image['skype']) ? $image['skype'] : ''; ?>" /></td>
              <td class="left"><div class="image">
                  <img src="<?php echo $image['thumb']; ?>" alt="" id="thumb<?php echo $image_row; ?>" />
                  <input type="hidden" name="image_avatar_w[<?php echo $image_row; ?>][image]" value="<?php echo $image['image']; ?>" id="image<?php echo $image_row; ?>"  />
                  <br />
                  <a onclick="image_upload('image<?php echo $image_row; ?>', 'thumb<?php echo $image_row; ?>');"><?php echo $text_browse; ?>
                  </a>&nbsp;&nbsp;|&nbsp;&nbsp;<a onclick="$('#thumb<?php echo $image_row; ?>').attr('src', '<?php echo $no_image; ?>'); $('#image<?php echo $image_row; ?>').attr('value', '');"><?php echo $text_clear; ?></a>
                </div></td>
              <td class="left"><a onclick="$('#image-row<?php echo $image_row; ?>').remove();" class="button"><?php echo $button_remove; ?></a></td>
            </tr>
          </tbody>
          <?php $image_row++; ?>
          <?php } ?>
          <tfoot>
            <tr>
              <td colspan="3"></td>
              <td class="left"><a onclick="addImage();" class="button"><?php echo $button_add_image; ?></a></td>
            </tr>
          </tfoot>
        </table>	 
        <!-- end image --> 
        <table id="module" class="list">
          <thead>
            <tr>
              <td class="left"><?php echo $entry_image; ?></td>
              <td class="left"><?php echo $entry_layout; ?></td>
              <td class="left"><?php echo $entry_position; ?></td>
              <td class="left"><?php echo $entry_status; ?></td>
              <td class="right"><?php echo $entry_sort_order; ?></td>
              <td></td>
            </tr>
          </thead>
          <?php $module_row = 0; ?>
          <?php foreach ($modules as $module) { ?>
          <tbody id="module-row<?php echo $module_row; ?>">
            <tr>
              <td class="left"><input type="text" name="warranty_module[<?php echo $module_row; ?>][image_width]" value="<?php echo $module['image_width']; ?>" size="3" />
                <input type="text" name="warranty_module[<?php echo $module_row; ?>][image_height]" value="<?php echo $module['image_height']; ?>" size="3" />
                <?php if (isset($error_image[$module_row])) { ?>
                <span class="error"><?php echo $error_image[$module_row]; ?></span>
                <?php } ?></td>
              <td class="left"><select name="warranty_module[<?php echo $module_row; ?>][layout_id]">
                  <?php foreach ($layouts as $layout) { ?>
                  <?php if ($layout['layout_id'] == $module['layout_id']) { ?>
                  <option value="<?php echo $layout['layout_id']; ?>" selected="selected"><?php echo $layout['name']; ?></option>
                  <?php } else { ?>
                  <option value="<?php echo $layout['layout_id']; ?>"><?php echo $layout['name']; ?></option>
                  <?php } ?>
                  <?php } ?>
                </select></td>
              <td class="left"><select name="warranty_module[<?php echo $module_row; ?>][position]">
				  <?php if ($module['position'] == 'column_right') { ?>
                  <option value="column_right" selected="selected"><?php echo $text_column_right; ?></option>
                  <?php } else { ?>
                  <option value="column_right"><?php echo $text_column_right; ?></option>
                  <?php } ?>
                  <?php if ($module['position'] == 'column_left') { ?>
                  <option value="column_left" selected="selected"><?php echo $text_column_left; ?></option>
                  <?php } else { ?>
                  <option value="column_left"><?php echo $text_column_left; ?></option>
                  <?php } ?>
                      <?php if ($module['position'] == 'support_warranty') { ?>
                      <option value="support_warranty" selected="selected">Support warranty</option>
                      <?php } else { ?>
                      <option value="support_warranty">Support warranty</option>
                      <?php } ?>
				  <?php if ($module['position'] == 'content_top') { ?>
                  <option value="content_top" selected="selected"><?php echo $text_content_top; ?></option>
                  <?php } else { ?>
                  <option value="content_top"><?php echo $text_content_top; ?></option>
                  <?php } ?>
                  <?php if ($module['position'] == 'footer_top') { ?>
                  <option value="footer_top" selected="selected"><?php echo $text_content_footer; ?></option>
                  <?php } else { ?>
                  <option value="footer_top"><?php echo $text_content_footer; ?></option>
                  <?php } ?>
                  <?php if ($module['position'] == 'content_bottom') { ?>
                  <option value="content_bottom" selected="selected"><?php echo $text_content_bottom; ?></option>
                  <?php } else { ?>
                  <option value="content_bottom"><?php echo $text_content_bottom; ?></option>
                  <?php } ?>
                </select></td>
              <td class="left"><select name="warranty_module[<?php echo $module_row; ?>][status]">
                  <?php if ($module['status']) { ?>
                  <option value="1" selected="selected"><?php echo $text_enabled; ?></option>
                  <option value="0"><?php echo $text_disabled; ?></option>
                  <?php } else { ?>
                  <option value="1"><?php echo $text_enabled; ?></option>
                  <option value="0" selected="selected"><?php echo $text_disabled; ?></option>
                  <?php } ?>
                </select></td>
              <td class="right"><input type="text" name="warranty_module[<?php echo $module_row; ?>][sort_order]" value="<?php echo $module['sort_order']; ?>" size="3" /></td>
              <td class="left"><a onclick="$('#module-row<?php echo $module_row; ?>').remove();" class="button"><?php echo $button_remove; ?></a></td>
            </tr>
          </tbody>
          <?php $module_row++; ?>
          <?php } ?>
          <tfoot>
            <tr>
              <td colspan="5"></td>
              <td class="left"><a onclick="addModule();" class="button"><?php echo $button_add_module; ?></a></td>
            </tr>
          </tfoot>
        </table>
      </form>
    </div>
  </div>
</div>
  <script type="text/javascript"><!--
    var image_row = <?php echo $image_row; ?>;

    function addImage() {
      html  = '<tbody id="image-row' + image_row + '">';
      html += '<tr>';
      html += '<td class="left"><input type="text" name="image_avatar_w[' + image_row + '][position]" value="" /></td>';
      html += '<td class="left"><input type="text" name="image_avatar_w[' + image_row + '][name]" value="" /></td>';
      html += '<td class="left"><input type="text" name="image_avatar_w[' + image_row + '][phone]" value="" /></td>';
      html += '<td class="left"><input type="text" name="image_avatar_w[' + image_row + '][email]" value="" /></td>';
      html += '<td class="left"><input type="text" name="image_avatar_w[' + image_row + '][yahoo]" value="" /></td>';
      html += '<td class="left"><input type="text" name="image_avatar_w[' + image_row + '][skype]" value="" /></td>';
      html += '<td class="left"><div class="image"><img src="<?php echo $no_image; ?>" alt="" id="thumb' + image_row + '" /><input type="hidden" name="image_avatar_w[' + image_row + '][image]" value="" id="image' + image_row + '" /><br /><a onclick="image_upload(\'image' + image_row + '\', \'thumb' + image_row + '\');"><?php echo $text_browse; ?></a>&nbsp;&nbsp;|&nbsp;&nbsp;<a onclick="$(\'#thumb' + image_row + '\').attr(\'src\', \'<?php echo $no_image; ?>\'); $(\'#image' + image_row + '\').attr(\'value\', \'\');"><?php echo $text_clear; ?></a></div></td>';
      html += '<td class="left"><a onclick="$(\'#image-row' + image_row  + '\').remove();" class="button"><?php echo $button_remove; ?></a></td>';
      html += '</tr>';
      html += '</tbody>'; 
	
      $('#images tfoot').before(html);
	  
      image_row++;
    }
    //--></script>
  <script type="text/javascript"><!--
    function image_upload(field, thumb) {
      $('#dialog').remove();
	
      $('#content').prepend('<div id="dialog" style="padding: 3px 0px 0px 0px;"><iframe src="index.php?route=common/filemanager&token=<?php echo $token; ?>&field=' + encodeURIComponent(field) + '" style="padding:0; margin: 0; display: block; width: 100%; height: 100%;" frameborder="no" scrolling="auto"></iframe></div>');
	
      $('#dialog').dialog({
        title: '<?php echo $text_image_manager; ?>',
        close: function (event, ui) {
          if ($('#' + field).attr('value')) {
            $.ajax({
              url: 'index.php?route=common/filemanager/image&token=<?php echo $token; ?>&image=' + encodeURIComponent($('#' + field).attr('value')),
              dataType: 'text',
              success: function(data) {
                $('#' + thumb).replaceWith('<img src="' + data + '" alt="" id="' + thumb + '" />');
              }
            });
          }
        },	
        bgiframe: false,
        width: 700,
        height: 400,
        resizable: false,
        modal: false
      });
    };
    //--></script> 

  <script type="text/javascript"><!--
    var module_row = <?php echo $module_row; ?>;

    function addModule() {	
      html  = '<tbody id="module-row' + module_row + '">';
      html += '  <tr>';
      html += '    <td class="left"><input type="text" name="warranty_module[' + module_row + '][image_width]" value="125" size="3" /> <input type="text" name="warranty_module[' + module_row + '][image_height]" value="125" size="3" /></td>';	
      html += '    <td class="left"><select name="warranty_module[' + module_row + '][layout_id]">';
        <?php foreach ($layouts as $layout) { ?>
          html += '<option value="<?php echo $layout['layout_id']; ?>"><?php echo addslashes($layout['name']); ?></option>';
        <?php } ?>
      html += '    </select></td>';
      html += '    <td class="left"><select name="warranty_module[' + module_row + '][position]">';
      html += '      <option value="column_left"><?php echo $text_column_left; ?></option>';
	  html += '      <option value="column_right"><?php echo $text_column_right; ?></option>';
      html += '      <option value="content_top"><?php echo $text_content_top; ?></option>';
      html += '      <option value="footer_top"><?php echo $text_content_footer; ?></option>';
        html += '      <option value="support_warranty">Support Warranty</option>';
      html += '      <option value="content_bottom"><?php echo $text_content_bottom; ?></option>';
      html += '    </select></td>';
      html += '    <td class="left"><select name="warranty_module[' + module_row + '][status]">';
      html += '      <option value="1" selected="selected"><?php echo $text_enabled; ?></option>';
      html += '      <option value="0"><?php echo $text_disabled; ?></option>';
      html += '    </select></td>';
      html += '    <td class="right"><input type="text" name="warranty_module[' + module_row + '][sort_order]" value="" size="3" /></td>';
      html += '    <td class="left"><a onclick="$(\'#module-row' + module_row + '\').remove();" class="button"><?php echo $button_remove; ?></a></td>';
      html += '  </tr>';
      html += '</tbody>';
	
      $('#module tfoot').before(html);
	
      module_row++;
    }
    //--></script> 

<?php echo $footer; ?>
