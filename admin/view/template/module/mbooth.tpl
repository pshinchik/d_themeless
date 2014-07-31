<?php echo $header; ?>
<script type="text/javascript" src="view/javascript/jquery/ajaxupload.js"></script> 
<div id="content">
  <div class="breadcrumb">
    <?php foreach ($breadcrumbs as $breadcrumb) { ?>
    <?php echo $breadcrumb['separator']; ?><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a>
    <?php } ?>
  </div>
  <?php if ($success) { ?>
  <div class="success"><?php echo $success; ?></div>
  <?php } ?> 
  <?php if ($error_warning) { ?>
  <div class="warning"><?php echo $error_warning; ?></div>
  <?php } ?>
  <?php if ($error) { ?>
  <div class="warning"><?php echo $error; ?></div>
  <?php } ?>
  <div class="box">
    <div class="heading">
      <h1><i class="icon-puzzle"></i> <?php echo $heading_title; ?></h1>
      <div class="buttons"><a onclick="saveAndStay();" class="button"><?php echo $button_save_and_stay; ?></a><a onclick="$('#form').submit();" class="button"><?php echo $button_save; ?></a><a onclick="location = '<?php echo $cancel; ?>';" class="button"><?php echo $button_cancel; ?></a></div>
    </div>
    <div class="content">
       <div id="tabs" class="htabs">
        <a href="#general_menu" class="htab-item"><span class="icon-puzzle"> Modules</span></a>
        <a href="#general_settings" class="htab-item"><span class="icon-settings"></span>Settings</a>  
        <a href="#instructions" class="htab-item"><span class="icon-graduation-cap"></span>Instructions</a>
      </div>
      <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" id="form">
       <div id="general_menu" >
        <div id="scripts">
          <table class="list">
            <thead>
              <tr>
                <td class="left"><?php echo $text_module_name; ?><br />
                  <i><?php echo $text_module_id; ?></i></td>
                <td class="center"><?php echo $text_module_version; ?></td>
                <td class="center"><?php echo $text_module_author; ?></td>
                <td class="center"><?php echo $text_module_activity; ?></td>
              </tr>
            </thead>
            <tbody>
              <?php if (isset($xml_scripts)) { ?>
              <?php $class = 'row-odd'; ?>
              <?php foreach ($xml_scripts as $xml_script) { ?>
              <?php $class = ($class == 'row-even' ? 'row-odd' : 'row-even'); ?>
              <tr class="<?php echo $class; ?>" data-file-name="<?php echo $xml_script['file_name']; ?>">
                <td class="left"><strong><?php echo $xml_script['file_name']; ?></strong><br />
                  <div class="description"><?php echo $xml_script['id']; ?></div></td>
                <td class="center"><?php echo $xml_script['version']; ?></td>
                <td class="center"><?php echo $xml_script['author']; ?></td>
                <td class="center"> [ <a class="action-link download" href="<?php echo $xml_script['download']; ?>"><?php echo $button_download; ?></a> ]
                  [ <a class="action-link delete" href="<?php echo $xml_script['delete'] ?>"><?php echo $button_delete; ?></a> ] </td>
              </tr>
              <?php } ?>
              <?php } else { ?>
              <tr>
                <td class="center" colspan="7"><?php echo $text_no_results; ?></td>
              </tr>
              <?php } ?>
            </tbody>
          </table>
          <tr>
            <td><input style="display:none" type="text" name="filename" value="<?php echo $filename; ?>" />
              <a id="button-upload" class="button"><?php echo $button_upload; ?></a>
              <?php if ($error_filename) { ?>
              <span class="error"><?php echo $error_filename; ?></span>
              <?php } ?></td>
          </tr>
        </div>
      </div>
       <div id="general_settings" class="htab-content">
        <div class="tab-body">
          <table class="form"> 
            <tr>
              <td><span><?php echo $text_version_check; ?></span><i class="icon-question" data-help="<?php echo $general_version_tooltip; ?>" rel="tooltip"></i></td>
              <td><a onClick="versionCheck('<?php echo $route; ?>', '#version_result', '<?php echo $token; ?>')" class="button"><?php echo $button_version_check; ?></a></td>
              <td id="version_result"></td>
            </tr>
          </table>
        </div>
      </div>
      <div id="instructions" class="htab-content">
        <div class="tab-body">
          <?php echo $text_instructions_full; ?>
        </div>
      </div>
     </form>
    </div>
  </div>
</div>

<script type="text/javascript"><!--
new AjaxUpload('#button-upload', {
	action: 'index.php?route=module/mbooth/upload&token=<?php echo $token; ?>',
	name: 'file',
	autoSubmit: true,
	responseType: 'json',
	onSubmit: function(file, extension) {
		$('#button-upload').after('<img src="view/image/loading.gif" class="loading" style="padding-left: 5px;" />');
		$('#button-upload').attr('disabled', true);
	},
	onComplete: function(file, json) {
		$('#button-upload').attr('disabled', false);
		
		if (json['success']) {
			alert(json['success']);
			$('tr[data-file-name="'+ json['mbooth']['file_name'] +'"]').remove(); 
				html = '<tr class="<?php echo $class; ?>" data-file-name="' + json['mbooth']['file_name']+ '"><td class="left"><strong>' + json['mbooth']['file_name'] + '</strong><br /><div class="description">' + json['mbooth']['id'] + '</div></td><td class="center">' + json['mbooth']['version'] + '</td><td class="center">' + json['mbooth']['author'] + '</td><td class="center"> [ <a class="action-link download" href="' + json['mbooth']['download'] + '"><?php echo $button_download; ?></a> ] [ <a class="action-link delete" href="' + json['mbooth']['delete'] + '"><?php echo $button_delete; ?></a> ] </td> </tr>';
				$('#scripts tbody').append(html);
			
		}
		if (json['error']) {
			alert(json['error']);
		}
		$('.loading').remove();	
	}
});
$('.action-link.delete').bind('click', function() {
    if(!confirm('<?php echo $text_confirm_delete?>') )
        return false;
});
//--></script> 
<script type="text/javascript">
$(document).ready(function(){
    $('#tabs a').tabs(); 
    $('#sub_tabs a').tabs(); 
})

function saveAndStay(){
    $.ajax( {
      type: "POST",
      data: $('#form').serialize(),
    beforeSend: function() {
    $('#form').fadeTo('slow', 0.5);
    },
    complete: function() {
    $('#form').fadeTo('slow', 1);   
    },
      success: function( response ) {
      //  console.log( response );
      }
    } );  
  }

  $('#version_check').click(function(){
  $.ajax( {
      type: "POST",
      url: 'index.php?route=module/quickcheckout/version_check&token=<?php echo $token; ?>',
    dataType: 'json',
    beforeSend: function() {
    $('#form').fadeTo('slow', 0.5);
    },
    complete: function() {
    $('#form').fadeTo('slow', 1);   
    },
      success: function( json ) {
        console.log( json );
    if(json['error']){
      $('#version_result').html('<div class="warning">' + json['error'] + '</div>')
    }
    if(json['attention']){
      $html = '';
      if(json['update']){
         $.each(json['update'] , function(k, v) {
            $html += '<div>Version: ' +k+ '</div><div>'+ v +'</div>';
         });
      }
       $('#version_result').html('<div class="attention">' + json['attention'] + $html + '</div>')
    }
    if(json['success']){
      $('#version_result').html('<div class="success">' + json['success'] + '</div>')
    } 
      }
  })
})
</script>
<?php echo $footer; ?>