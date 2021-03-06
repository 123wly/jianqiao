<?php
/////////////////////////////////////////////////////////////////
//万虎网络, Copyright (C)   2010 - 2011  www.wanhunet.com 

 
class main extends top
{
    function __construct(){
        parent::__construct(); 
    }

	public function index(){
		if($this->uid == 0){
			$display = ($this->yb['guestMode'] == 1) ? 'index' : 'login';
			$this->email = spClass('ybCookie')->get_cookie('unames');
		}else{
			$this->memberinfo();
			if($this->yb['wizard_switch'] == 1){
				$this->blogtag = explode(',',$this->user['blogtag']);
				$this->systag = spClass('db_category')->findCate();
			}
			$display ='index';
		}
		$this->CurrentModule = 'index';
		
		if(isset($_GET["openid"])){
			$rs = spClass("login","","./api/login.php")->wechatLogin($_GET["openid"]);
			if($rs){
				header('Location:'.spUrl('phone',"index"));
			}else {
				$this->display('wechat_login.html');
			}
		}else {
			///@@@@
			if(ismobile()){
				header('Location:'.spUrl('phone',"index"));
			}else {
				$this->display($display.'.html');
			}
		}
	}

	public function recommend(){
		$this->systag = spClass('db_category')->findCate(); //获取系统级别标签
		$this->title = '推荐频道';
		$this->CurrentModule = 'recommend';
		$this->display('recommend.html');
	}


	public function discovery(){
		$this->CurrentModule = 'discover';
		$this->titlepre = '发现';
		$this->display('discover.html');
	}

	public function wechat_login(){
		$rs = spClass("login","","./api/login.php")->wechatOAth();
		if($rs){
			$this->success("绑定成功",spUrl('main', 'index'));
		}else {
			$this->error("绑定失败");
		}
	}

	/*用户登陆*/
	public function login(){
		var_dump($_POST);
		$this->time = time();
		$this->email = spClass('ybCookie')->get_cookie('unames');
		$this->display('login.html');
	}

	/*用户注册*/
	public function reg(){
		$this->invitemode = $this->spArgs('invitemode');
		$this->invitecode = $this->spArgs('invitecode');
		$this->schools = spClass("db_member")->findAll(" role in (0,1)","","username,uid");
		// print_r($this->schools);
		$this->display('reg.html');
	}
	
	/*找回密码*/
	public function resetpwd(){
		$this->do = $this->spArgs('do');
		if($this->spArgs('do') == 'submit')
		{
			if($rs = spCLass('db_findpwd')->varyToken($this->spArgs('token'))){
				$this->passtime = date('Y-m-d H:i:s',$rs['time']+60*60*24);
				$this->token    = $rs['token'];
			}else{
				$this->err = '您的请求已过期或者不正确,请重新发起密码找回请求';
			}

		}
		$this->display('resetpwd.html');
	}

	/*获取验证码*/
	public function vcode(){
		spClass('spVerifyCode')->display();
	}

}
?>
