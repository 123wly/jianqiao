<?php
/////////////////////////////////////////////////////////////////
//万虎网络, Copyright (C)   2010 - 2011  www.wanhunet.com 


define('APP_PATH',dirname(__FILE__));
define('URL_PATH',$_SERVER['SERVER_NAME'].'/yunbian');
define('IN_APP',TRUE);
define('SP_PATH',APP_PATH.'/init');
define("THEME_NAME",'baoding');
if(!is_file(APP_PATH.'/config.php')){header('Location:install/');}

if(isset($_REQUEST['ssid'])){session_id($_REQUEST['ssid']);}
require(APP_PATH.'/config.php');
$spConfig["view"]["config"]["template_dir"] = 'tplv2';
require(SP_PATH.'/init.php');
header('Content-type: text/html; charset=utf-8');

getRoot();
spRun();
?>