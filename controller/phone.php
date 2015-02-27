<?php
/////////////////////////////////////////////////////////////////
//万虎网络, Copyright (C)   2010 - 2011  www.wanhunet.com 

 
class phone extends top
{
    function __construct(){
        parent::__construct();
        $this->userInfo  = spClass("db_member")->find(array("uid"=>$_SESSION["uid"]));
        if($this->userInfo["type"] ==2){
        	$this->banjiInfo = $this->userInfo;
        }else {
        	$this->banjiInfo = spClass("db_member")->find(array("uid"=>$this->userInfo["puid"]));
        }
        if(!method_exists($this,$_GET['a'])){
        	header('Location:'.spUrl('phone',"index"));
        	die;
        }
    }
    public function json_return($val){
    	echo json_encode($val);
    	die;
    }

    public function index(){
    	$this->display("index.html");
    }

    public function findUser(){
    	$uid = !isset($_POST['uid']) ? $_SESSION["uid"] : $_POST['uid'];
    	$data = spClass("db_member")->find(array("uid"=>$uid));
    	$this->json_return($data);
    }

    public function tagList(){
		$this->display("tagList.html");
	}
	
	public function page(){
		$this->display("page.html");
	}

	public function typeOne(){
		$this->display("album.html");
	}

	public function roster(){
		$tofollow = spClass('db_member')->findAll(array("puid"=>$_GET["uid"]),"","username,uid,blogtag,type");
		$tofollows = array();
		foreach ($tofollow as $key => $value) {
			if($value['type'] == 2){
				$tofollows['teacher'][] = $value;
			}
			if($value['type'] == 0){
				$tofollows['student'][] = $value;
			}
		}
		for ($i=0; $i < count($tofollows['teacher']) % 3; $i++) { 
			$tofollows['teacher'][] = null;
		}
		for ($i=0; $i < count($tofollows['student']) % 3; $i++) { 
			$tofollows['student'][] = null;
		}
		$this->tofollow = $tofollows;
		$this->display("roster.html");
	}
	public function notice_post(){
		$this->display("notice_post.html");
	}
	public function login(){
		if(isset($_GET["openid"])){
			$this->display("wechat_login.html");
		}else {
			$this->display("login.html");
		}
	}

	public function letter_post(){
		if(isset($_GET["id"])){
			$this->toUserInfo = spClass("db_member")->find(array("uid"=>$_GET["id"]));
		}
		$this->display("letter_post.html");
	}
	public function parent_list(){
		$tofollow = spClass('db_member')->findAll(array("puid"=>$this->banjiInfo["puid"]),"","username,uid,blogtag,type");
		$tofollows = array();
		foreach ($tofollow as $key => $value) {
			if($value['type'] == 2){
				$tofollows['teacher'][] = $value;
			}
			if($value['type'] == 0){
				$tofollows['student'][] = $value;
			}
		}
		$this->tofollow = $tofollows;
		$this->display("parent_list.html");
	}
	public function group(){
		$this->display("group.html");
	}
	public function letter_list(){
		
		$rs = spClass('db_pm')->pmlist($this->uid,$this->spArgs('page',1));
		if($rs){
			foreach($rs['data'] as &$d){
				$d['h_url'] = goUserHome(array('uid'=>$d['touid'], 'domain'=>$d['todoman']));
				$d['h_img'] = avatar(array('uid'=>$d['touid'],'size'=>'small'));
				$d['time'] = ybtime(array('time'=>$d['time']));
			}
		}
		for ($i=0; $i < count($rs['data']) % 3; $i++) { 
			$rs["data"][] = null;
		}
		$this->rs = $rs;
		$this->display("letter_list.html");
	}
	public function letter_info(){
		$uid = $this->spArgs("uid");
		$this->uidInfo = spClass("db_member")->find(array("uid"=>$uid));
		$this->display("letter_info.html");
	}
	/////////
	public function leave_message(){
		if(isset($_GET["id"])){
			$this->toUserInfo = spClass("db_member")->find(array("uid"=>$_GET["id"]));
		}
		$this->display("leave_message.html");
	}
	public function student_list(){
		
		$tofollow = spClass('db_member')->findAll(array("puid"=>$this->banjiInfo["puid"]),"","username,uid,blogtag,type");
		$tofollows = array();
		foreach ($tofollow as $key => $value) {
			if($value['type'] == 2){
				$tofollows['teacher'][] = $value;
			}
			if($value['type'] == 0){
				$tofollows['student'][] = $value;
			}
		}
		$this->tofollow = $tofollows;
		$this->display("student_list.html");
	}
	public function message_list(){

		$rs = spClass('db_ms')->listms($this->uid,$this->spArgs('page',1));
		if($rs){
			foreach($rs['data'] as &$d){
				$d['h_url'] = goUserHome(array('uid'=>$d['touid'], 'domain'=>$d['todoman']));
				$d['h_img'] = avatar(array('uid'=>$d['touid'],'size'=>'small'));
				$d['time'] = ybtime(array('time'=>$d['time']));
			}
		}
		$this->rs = $rs;
		$this->display("message_list.html");
	}
}