<?php
/*
加载资源文件
*/
function load_src($file_name){
	$file=explode('.',$file_name);
	$suffix=$file[1];
	$root=__ROOT__;
	if($suffix=="css"){
		$path=$root."/templet/baoding/css/".$file_name;
	}elseif($suffix=="js"){
		$path=$root."/templet/baoding/js/".$file_name;
	}else{
		$path=$root."/templet/baoding/images/".$file_name;
	}
	
	echo $path;
}

function spFetch($name){
	return spClass($name,"","./fetch/" . $name . ".php");
}
/*
获取网站跟路径
*/
function getRoot(){
	define('ROOT_PATH', getcwd());
	define('IS_CGI',(0 === strpos(PHP_SAPI,'cgi') || false !== strpos(PHP_SAPI,'fcgi')) ? 1 : 0 );
	define('IS_CLI',PHP_SAPI=='cli' ? 1   :   0);
	if(!IS_CLI) {
	    if(!defined('_PHP_FILE_')) {
	        if(IS_CGI) {
	            $_temp  = explode('.php',$_SERVER['PHP_SELF']);
	            define('_PHP_FILE_',    rtrim(str_replace($_SERVER['HTTP_HOST'],'',$_temp[0].'.php'),'/'));
	        }else {
	            define('_PHP_FILE_',    rtrim($_SERVER['SCRIPT_NAME'],'/'));
	        }
	    }
	    if(!defined('__ROOT__')) {
	        $_root  =   rtrim(dirname(_PHP_FILE_),'/');
	        define('__ROOT__',  (($_root=='/' || $_root=='\\')?'':$_root));
	        define('__PATH__',  __ROOT__."/tpl/");
	    }
	}
}

/*
字符串截取
*/

function utf_substr($str,$len,$suffix='...')
{  $length=strlen($str);
	for($i=0;$i<$len;$i++)
	{
		
		$temp_str=substr($str,0,1);
	if(ord($temp_str) > 127)
			{
			$i++;
			if($i<$len)
				{
					$new_str[]=substr($str,0,3);
					$str=substr($str,3);
				}
			}
	else
		{
			$new_str[]=substr($str,0,1);
			$str=substr($str,1);
		}
	}
	if($length>$len)
		{
			$new_str[]=$suffix;
		}

return join($new_str);
}