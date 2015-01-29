<?php
/////////////////////////////////////////////////////////////////
//万虎网络, Copyright (C)   2010 - 2011  www.wanhunet.com 

class feed extends top
{ 

	function __construct(){  
         parent::__construct(); 
    }
   	
   	function fetchClass(){
		$schoolId = 1;   		
		$schools = spClass("db_role_tree")->readAll(array("puid"=>$schoolId));
		print_r($schools);
		die;
   	}
	
}
