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
	
}
