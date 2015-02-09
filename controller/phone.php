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
		$tofollow = spClass('db_member')->findAll(array("puid"=>$this->banjiInfo["uid"]),"","username,uid,blogtag,type");
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
}