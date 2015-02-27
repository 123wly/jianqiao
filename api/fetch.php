<?php
/////////////////////////////////////////////////////////////////
//万虎网络, Copyright (C)   2010 - 2011  www.wanhunet.com 

class fetch extends top
{ 

	function __construct(){  
         parent::__construct(); 
    }
   	
   	function getClass(){
		$schoolId = $this->spArgs("schoolId");   		
		$schools = spClass("db_member")->findAll(array("puid"=>$schoolId,"role"=>2),"","uid,username");
		$this->api_success($schools);
   	}
   	public function huamingce(){
		$tofollow = spClass('db_member')->findAll(array("puid"=>$_POST["uid"]),"","username,uid,type");
		$data = array();
		foreach ($tofollow as $key => $value) {
			if($value['type'] == 2){
				$data['teacher'][] = $value;
			}
			if($value['type'] == 0){
				$data['student'][] = $value;
			}
		}
		$this->api_success($data);
	}
	public function sendms(){
		if($this->spArgs('username') == '' || $this->spArgs('body') == ''){
			$this->api_error('内容不能为空');
		}
		$user = spClass('db_member')->find(array('username'=>strreplaces($this->spArgs('username'))));
		if(!is_array($user)){
			$this->api_error('收信人不存在');
		}
		if($user['uid'] == $_SESSION['uid']){
			$this->api_error('不能给自己发信');
		}
		if($_SESSION['pm_ready'.$user['uid']] > time()){
			$this->api_error('每次每人发信需要间隔1分钟');
		}
		
		spClass('db_pm')->sendpm($_SESSION['uid'], $user['uid'], strreplaces($this->spArgs('body')));
		$_SESSION['pm_ready'.$user['uid']]  = time()+60;
		$this->api_success(true);
	}
	
}
