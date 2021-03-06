<?php
/////////////////////////////////////////////////////////////////
//万虎网络, Copyright (C)   2010 - 2011  www.wanhunet.com 

//访问用户博客首页
class userblog extends top
{
	private $user_data = ''; //初始化当前用户的信息
	private $user_skin = ''; //初始化当前用户的主题
	private $user_domain = '';//
	
	public function __construct(){
		parent::__construct();

		//@@@调用通知
		$this->__tiao(array("tag"=>"通知"), 'wh_tongzhi');
		$this->__tiao(array("tag"=>"作业"), "wh_zuoye");
		$this->__tiao(array("tag"=>"课堂照片"), "wh_ketang");
		$this->__tiao(array("tag"=>"活动照片"), "wh_huodong");
		///
		
		///
		$this->getUserSkin(); //获取用户的基本信息，必须头条处理，判断用户是否存在
		$this->getMyFollow();
		$this->getMyLook();
		$this->isfollow = $this->isFollow();
		$this->pmNum();

		$this->__getFollows();
	}

	private function __getFollows(){
		$num["teacher"] = spClass('db_member')->findCount(array("puid"=>$_GET["uid"], "type"=>"2"));
		$num["student"] = spClass('db_member')->findCount(array("puid"=>$_GET["uid"], "type"=>"0"));
		$this->childNum = $num;
	}

	/*显示用户首页 index 采取domain方式显示*/
	public function index()
	{
		
		// $this->getUserSkin(); //获取用户的基本信息，必须头条处理，判断用户是否存在
		// $this->getMyFollow();
		// $this->getMyLook();
		// $this->isfollow = $this->isFollow();
		// $this->pmNum();

		$this->follow = spClass('db_follow')->spLinker()->findAll(array('uid'=>$this->user_data['uid']),'time desc','','20');  //显示我关注的20个
		$this->display('index.html');
	}
	
	private function __tiao($args, $ass){
		if(!isset($_GET["uid"]) and isset($_GET['bid'])){
			$blogInfo = spClass("db_blog")->find(array("bid"=>$_GET["bid"]));
			$_GET["uid"] = $blogInfo['uid'];
		}
		
		$data = spClass('db_tags')->findTagByAttrUid($args, intval($_GET["uid"]));

		if(is_array($data['blog'])){
			foreach($data['blog'] as &$d){
				$d['h_url'] =  goUserHome(array('uid'=>$d['uid'], 'domain'=>$d['domain']));
				$d['h_img'] = avatar(array('uid'=>$d['uid'],'size'=>'middle'));
				$d['b_url'] = goUserBlog(array('bid'=>$d['bid'],'domain'=>$d['domain'],'uid'=>$d['uid']));
				$d['tag'] 	= ($d['tag'] != '') ? explode(',',$d['tag']) : '';
				
				$d['time']  = ybtime(array('time'=>$d['time']));
				$rs         = split_attribute($d['body']); 
				$d['attr']  = $rs['attr'];
				$d['repto'] = $rs['repto'];
				if(!empty($d['repto'])){
					$d['repto']['h_url'] = goUserHome(array('uid'=>$d['repto']['uid'], 'domain'=>$d['repto']['domain']));
					$d['repto']['h_img'] = avatar(array('uid'=>$d['repto']['uid'],'size'=>'small'));
				}else{
					$d['repto'] = null;
				}
				$d['body'] = strip_tags($rs['body']);
			}
			$this->$ass = $data["blog"];
		}else{
			$this->$ass = false;
		}
	}

	/*显示某一条记录*/
	public function show()
	{
		$this->getUserSkin($this->spArgs('bid'));
		$this->getMyFollow();
		$this->getMyLook();
		$this->pmNum();
		$this->fava = $this->getBlogFava();
		$this->isfollow = $this->isFollow();
		$this->bid = intval($this->spArgs('bid'));
		//检测是否存在
		$sql = "SELECT * FROM `".DBPRE."blog` AS b  where b.open = 1 and b.bid = '$bid'";
		// $test=spClass('db_blog')->find(array('bid'=>$this->bid));
		// var_dump($test);
		if(spClass('db_blog')->find(array('bid'=>$this->bid)))
		{
			spClass('db_blog')->incrField(array('bid'=>$this->spArgs('bid')), 'hitcount'); 
			$this->display('list.html',$this->result);
		}else{
			err404('您查看的内容可能已经修改或者删除。');	
		}
		
	}
	
	public function huamingce(){
		$tofollow = spClass('db_member')->findAll(array("puid"=>$_GET["uid"]),"","username,uid,type");
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
		$this->display("huamingce.html");
	}
	
	public function liebiao(){
		$this->display("liebiao.html");
	}
	public function type(){
		$this->display("type.html");
	}
	public function tag(){
		$this->display("tag.html");
	}

	
	/*我关注谁*/
	private function getMyFollow(){
		$this->follow = spClass('db_follow')->spLinker()->findAll(array('uid'=>$this->user_data['uid']),'time desc','','24');  //显示我关注的24个
	}
	
	/*谁关注我*/
	private function getMyLook(){
		$this->myLook = spClass('db_follow')->findCount(array('touid'=>$this->user_data['uid'])) - 1;
	}
	
	/*我是否关注*/
	private function isFollow()
	{
		if($_SESSION['uid'] == $this->user_data['uid']){
			return -1;  //自己
		}
		$follow = spCLass('db_follow')->find( array('uid'=>$_SESSION['uid'],'touid'=>$this->user_data['uid']));
		if(is_array($follow)){
			return 1;  //已关注
		}
		return 0;
	}
	
	/*我与某人的私心数量*/
	private function pmNum(){
		if($this->user_data['uid'] != $this->uid){
			$uid = $this->uid;
			$touid = $this->user_data['uid'];
			$rs = spCLass('db_pm')->findCount(" uid = '$uid' and touid = $touid or uid = '$touid' and touid = $uid and (status > '$uid' or status < '$uid')");
		}
		if(empty($rs)) $rs = 0;
		$this->pmnum = $rs;
	}
	
	private function getBlogFava(){
		$bid = intval($this->spArgs('bid'));
		$sql = "select m.username,m.uid,m.domain,l.* from ".DBPRE."likes as l LEFT JOIN  ".DBPRE."member as m on l.uid = m.uid where l.bid = '$bid' order by l.time desc limit 0,26";
		$rs =  spClass('db_member')->findSql($sql);
		$count = spClass('db_likes')->findCount( array('bid'=>$bid) );
		$data['rs'] = $rs;
		$data['count'] = $count;
		return $data;
	}
	
	
	/*获取用户的skin and base info
	  读取 domain 或者 uid,或者从$bid 读取
	*/
	private function getUserSkin($bid=0)
	{
		if($this->spArgs('bid')){
			$rs = spClass('db_theme')->getByBid(intval($this->spArgs('bid')));
		}else if($this->spArgs('uid') != ''){
			$rs = spClass('db_theme')->getByUid($this->spArgs('uid'));
		}else if($this->spArgs('domain') != 'home' && $this->spArgs('domain') != ''){
			$rs = spClass('db_theme')->getByDomain($this->spArgs('domain'));
		}
		if(!is_array($rs)) {err404('您访问的用户不存在,用户可能已经更改了个性域名');}
		$skin = spClass('db_theme')->find(array('uid'=>$rs['uid']));
		if($skin['setup']) $skin['setup'] = unserialize($skin['setup']);
		$rs['blogtag'] = explode(',',$rs['blogtag']); //切割成数组
		$this->user_data = $rs;
		$this->user_skin = $skin;   //将数据赋值给全局变量
	}



	/*覆盖原始display*/
	public function display($tpl)
	{

		// 模板内引用文件的路径
		$site_uri = trim(dirname($GLOBALS['G_SP']['url']['url_path_base']),"\/\\");
		if( '' == $site_uri ){ $site_uri = 'http://'.$_SERVER["HTTP_HOST"]; 	}else{ $site_uri = 'http://'.$_SERVER["HTTP_HOST"].'/'.$site_uri; }
		$this->site_uri = $site_uri;
		
		$this->user_skin['theme'] == '' ? $theme = 'boy' : $theme = $this->user_skin['theme'];   //获取我选择的风格
		$this->user_skin['css'] == '' ? $css = '' : $css = $this->user_skin['css'];   //获取我选择的风格
		$this->user_skin['setup'] = $this->user_skin['setup'];  //获取我选择的风格
		
		if($_SESSION['customize']['theme'] != '')  //如果自定义有数据则启用自定义的界面
		{
			// $theme = $_SESSION['customize']['theme'];
			// $this->user_skin['theme'] = $_SESSION['customize']['theme'];
		}
		
		// if($_SESSION['customize']['css'] != '') $css = $_SESSION['customize']['css']; //如果session的css不为空则调用预览模式的css
		$this->themes_path = $site_uri.'/'.$GLOBALS['G_SP']['view']['config']['template_dir'].'/theme/'.$theme.'/';
		$this->themes_include_path = 'theme/'.$theme; //主题内部调用模板路径
		$this->default_include_path = 'theme/boy/'; //默认主题主题内部调用模板路径
		$this->custom_css = $css;
		
		$this->username = $this->user_data['username'];
		$this->usertag = $this->user_data['blogtag'];
		$this->domain = ($this->user_data['domain'] == '') ? 'home' : $this->user_data['domain'];  //如果没定义domain 就是home
		
	
		$this->touid = $this->user_data['uid'];
		$this->usersign =strip_tags($this->user_data['sign']);//strip_tags
		$this->signhtml =strip_tags($this->user_data['sign'],'<b><font><p><span>');//strip_tags
		$this->user = $this->user_data;
		
		$this->page_init = isset($this->user_skin['setup']['page_limit']) ? $this->user_skin['setup']['page_limit'] : 10; //自定义分页

	
		$appPath = APP_PATH.'/'.$GLOBALS['G_SP']['view']['config']['template_dir'].'/theme/boy/'.$tpl;
		if($theme != 'boy'){ 
			$appPath = APP_PATH.'/'.$GLOBALS['G_SP']['view']['config']['template_dir'].'/theme/'.$theme.'/'.$tpl;
			if(!file_exists($appPath)){
				$appPath = APP_PATH.'/'.$GLOBALS['G_SP']['view']['config']['template_dir'].'/theme/boy/'.$tpl;  //如果模板不存在则加载默认模板
			}  
		}
	
		parent::display($appPath,TRUE);
	}

}
