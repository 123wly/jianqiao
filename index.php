<?php
/////////////////////////////////////////////////////////////////
//万虎网络, Copyright (C)   2010 - 2011  www.wanhunet.com 



define('APP_PATH',dirname(__FILE__));
define('URL_PATH',$_SERVER['SERVER_NAME'].'/yunbian');
define('IN_APP',TRUE);
define('SP_PATH',APP_PATH.'/init');

include_once './wh_function.php';
// define("THEME_NAME",'baoding');
// define('THEME_UID', '1');

// define("THEME_NAME",'fenyuan');
// define('THEME_UID', '2');


if(!is_file(APP_PATH.'/config.php')){header('Location:install/');}

if(isset($_REQUEST['ssid'])){session_id($_REQUEST['ssid']);}
require(APP_PATH.'/config.php');
if(ismobile()){
	$spConfig["view"]["config"]["template_dir"] = 'tplm';
}else {
	$spConfig["view"]["config"]["template_dir"] = 'tplv2';
}

//@@@
if(file_exists("theme.php")){
	$wanhu_data = include_once 'theme.php';
	$wanhu_data = json_decode($wanhu_data, true);
	if(isset($_GET["uid"])){
		if(isset($wanhu_data[$_GET['uid']])){
			define("THEME_NAME", $wanhu_data[$_GET['uid']]['theme']);
			define('THEME_UID', $wanhu_data[$_GET['uid']]['uid']);
			$spConfig["default_controller"] = "index";
		}
	}
}
/////

require(SP_PATH.'/init.php');
header('Content-type: text/html; charset=utf-8');


getRoot();
spRun();
?>