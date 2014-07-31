<?php 
$reserved = array(
		'system/logs',
		'system/cache',
		'system/config',
		'install',
		'image/flags',
		'image/data',
		'catalog/view/javascript/jquery/ui',
		'catalog/view/javascript/unitpngfix',
		'catalog/view/javascript/jquery/superfish',
		'catalog/view/javascript/jquery/nivo-slider',
		'catalog/view/javascript/jquery/fancybox',
		'admin/view/image/filemanager',
		'admin/view/image/flags',
		'admin/view/javascript/jquery/ui',
		'admin/view/javascript/jquery/superfish',
		'admin/view/javascript/jquery/menu',
		'admin/view/javascript/jquery/jstree',
		'admin/view/javascript/jquery/flot',
		'admin/view/javascript/ckeditor',
	);
function listFolderFiles($dir, $reserved){
    $ffs = scandir($dir);
    $dirs = array();
    foreach($ffs as $ff){
        if($ff != '.' && $ff != '..'){
        	$remove = false;
        	foreach($reserved as $reserve){
	        	if  (preg_match('/^'.str_replace("/", "\/", $reserve).'/i', substr(str_replace(".//", "/", $dir),1).'/'.$ff)) {
	        		$dirs[] = substr(str_replace(".//", "/", $dir),1).'/'.$ff;
					$remove = true;
				}
			}
			if(!$remove){
	        	if(!is_dir($dir.'/'.$ff)){
	            	echo str_replace("//", "",'&lt;file>'.substr(str_replace(".//", "/", $dir),1).'/'.$ff.'&lt;/file><br/>');
	        	}
	            if(is_dir($dir.'/'.$ff)) listFolderFiles($dir.'/'.$ff, $reserved);
	        }
        }
    }
}

function listDirs($reserved){
	foreach($reserved as $reserve){
    	echo str_replace("//", "",'&lt;dir>'.$reserve.'&lt;/dir><br/>');
	}
}
echo '&lt;files><br/>';
listFolderFiles('./', $reserved);
echo '&lt;/files><br/>';
echo '&lt;dirs><br/>';
listDirs($reserved);
echo '&lt;/dirs>';


?>