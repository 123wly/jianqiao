<?php
/////////////////////////////////////////////////////////////////
//万虎网络, Copyright (C)   2010 - 2011  www.wanhunet.com 


//博客动作执行
class invite extends top
{

	function index(){
		
		
	}
	
	function myintval(){
		if(!$this->uid >0){prient_jump(spUrl('main'));}	
		$this->memberinfo();
		
		$this->display('user_invite.html');
	
	}
	
	

	

}