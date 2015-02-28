<?php
/////////////////////////////////////////////////////////////////
//万虎网络, Copyright (C)   2010 - 2011  www.wanhunet.com 


define('APP_PATH',dirname(__FILE__));
define('URL_PATH',$_SERVER['SERVER_NAME'].'/');
define('IN_APP',TRUE);
define('SP_PATH',APP_PATH.'/init');

//@@@@
include_once './wh_function.php';
/////

if(!is_file(APP_PATH.'/config.php')){header('Location:install/');}

if(isset($_REQUEST['ssid'])){session_id($_REQUEST['ssid']);}
require(APP_PATH.'/config.php');


//@@@
$spConfig["view"]["config"]["template_dir"] = ismobile() ? 'tplm' : 'tplv2';
//$spConfig["view"]["config"]["template_dir"] = ismobile() ? 'tplv2' : 'tplv2';
if(file_exists("theme.php")){
	$wanhu_data = include_once 'theme.php';
	$wanhu_data = json_decode($wanhu_data, true);
	if(isset($_SERVER["SERVER_NAME"])){
		$server_name = explode(".",$_SERVER["SERVER_NAME"]);
	}
	if(isset($_SERVER["HTTP_HOST"])){
		$server_name = explode(".",$_SERVER["HTTP_HOST"]);
	}
	$server_name = $server_name[0];
	if(isset($wanhu_data[$server_name])){
		if(ismobile()){
			define("THEME_NAME", $wanhu_data[$server_name]['mtheme']);
		}else {
			define("THEME_NAME", $wanhu_data[$server_name]['theme']);
		}
		define('THEME_UID', $wanhu_data[$server_name]['uid']);
		$spConfig["default_controller"] = "index";
	}
}
/////

require(SP_PATH.'/init.php');
header('Content-type: text/html; charset=utf-8');


getRoot();
spRun();
?>