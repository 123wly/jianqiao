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
{  
	$length=strlen($str);
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

function msubstr($str, $start=0, $length, $charset="utf-8", $suffix=true) {
    if(function_exists("mb_substr")){
        $slice = mb_substr($str, $start, $length, $charset);
    	$str_length = mb_strlen($str, $charset);
    }elseif(function_exists('iconv_substr')) {
        $slice = iconv_substr($str,$start,$length,$charset);
    }else{
        $re['utf-8']   = "/[\x01-\x7f]|[\xc2-\xdf][\x80-\xbf]|[\xe0-\xef][\x80-\xbf]{2}|[\xf0-\xff][\x80-\xbf]{3}/";
        $re['gb2312'] = "/[\x01-\x7f]|[\xb0-\xf7][\xa0-\xfe]/";
        $re['gbk']    = "/[\x01-\x7f]|[\x81-\xfe][\x40-\xfe]/";
        $re['big5']   = "/[\x01-\x7f]|[\x81-\xfe]([\x40-\x7e]|\xa1-\xfe])/";
        preg_match_all($re[$charset], $str, $match);
        $slice = join("",array_slice($match[0], $start, $length));
    }
    if($suffix){
    	if($str_length > $length ){
    		$slice .= "...";
    	}
    }
    return $slice;
}
function upload_echo($name){
	return __ROOT__ . '/uploads/' . $name;
}

function get_week($year) {
    $year_start = $year . "-01-01";
    $year_end = $year . "-12-31";
    $startday = strtotime($year_start);
    if (intval(date('N', $startday)) != '1') {
        $startday = strtotime("next monday", strtotime($year_start)); //获取年第一周的日期
    }
    $year_mondy = date("Y-m-d", $startday); //获取年第一周的日期
 
    $endday = strtotime($year_end);
    if (intval(date('W', $endday)) == '7') {
        $endday = strtotime("last sunday", strtotime($year_end));
    }
 
    $num = intval(date('W', $endday));
    for ($i = 1; $i <= $num; $i++) {
        $j = $i -1;
        $start_date = date("Y-m-d", strtotime("$year_mondy $j week "));
 
        $end_day = date("Y-m-d", strtotime("$start_date +6 day"));
 
        $week_array[$i] = array($start_date, $end_day, strtotime($start_date), strtotime($end_day));
    }
    return $week_array;
}

function vstr_replace($str, $a, $b){
	return str_replace($a, $b, $str);
}

function dump_log()
{
    return spClass("db_debug")->findAll("","id desc");
}

function console_log($var){
    $var = json_encode($var);
    return spClass("db_debug")->create(array(
        "dump" => $var,
    ));
}
