<?php
/////////////////////////////////////////////////////////////////
//万虎网络, Copyright (C)   2010 - 2011  www.wanhunet.com 


class emptyController extends top
{
	public $dTerm;
	public $dArticle;

	function __construct() {
        parent::__construct();
        $this->dTerm = spClass("db_term");
        $this->dArticle = spClass("db_article");
        $this->schools = spClass("db_member")->findAll(" role in ('0','1')","","username");
        $schools = array();
        foreach ($this->schools as $key => $value) {
        	$schools[] = $value["username"];
        }
        $this->schools = $schools;
    }

	public function index(){
		$c = isset($_GET["c"]) ? $this->spArgs("c") : "index";
		$this->assignown("tid",$this->spArgs("tid"));
		$this->assignown("id",$this->spArgs("id"));

		if(isset($_GET['tid'])){
			$termInfo = $this->dTerm->find(array("id"=>intval($_GET['tid'])));
			$this->assignown("cTerm",$termInfo);
		}

		if(isset($_GET['id'])){
			$articleInfo = $this->dArticle->find(array("id"=>intval($_GET['id'])));
			$this->assignown("cArticle",$articleInfo);
		}

		$tpldata = array(
				"baoding"=>"__",
				"fenyuan"=>"__f_",
				"phone"=>"__p_",
				"phone_fen"=>"__c_"
			);

		if(method_exists($this,$tpldata[THEME_NAME].$c)){
			call_user_func_array(array($this,$tpldata[THEME_NAME].$c), array());
		}
		// if(method_exists($this,"__f_".$c)){
		// 	call_user_func_array(array($this,"__f_".$c), array());
				
		// }

		// if(method_exists($this,"__p_".$c)){
		// 		call_user_func_array(array($this,"__p_".$c), array());
		// }
		// if(method_exists($this,"__c_".$c)){
		// 		call_user_func_array(array($this,"__c_".$c), array());
				
		// }

		$this->assignown("root",__ROOT__);
		$this->assignown('skin_path',"".__ROOT__.'/templet/' . THEME_NAME .'/');
	
		$this->display($c . ".html");
	}

	public function assignown($name, $value){
		$this->v->engine->assign($name, $value);
	}


	public function __mzsp(){
		$weeks = get_week(intval(date("Y")));

		$week_num = isset($_GET['week']) ? intval($_GET['week']) : intval(date("W"));
        $this_week = $weeks[$week_num - 1];

        $sql = " `date` >= ".$this_week[2]." and `date` <= ".$this_week[3];
        
        $week_data = spClass("db_cook")->findAll($sql,"","zao,zaodian,wu,wudian,wan");
        $data = array();
        foreach ($week_data as $key => $value) {
        	foreach ($value as $k => $vo) {
        		if(strstr($vo, "{")){
        			$strA = explode("{",$vo);
        			$title = substr($strA[1],0,strlen($strA[1])-1);
        			$data[$k][] = array("title"=>$title, "cook"=>$strA[0]);
        		}else {
        			$data[$k][] = array("title"=>$vo, "cook"=>$vo);
        		}
        		
        	}
        }
        // var_dump($data);die;

        $this->assignown("week_data", $data);

        $begin_time=strtr(substr($this_week['0'],5),"-","/");
        $end_time=strtr(substr($this_week['1'],5),"-","/");

        $this->assignown("begin_time",$begin_time);
        $this->assignown("end_time",$end_time);

        $upweek = (intval($week_num) - 1 < 2 ) ? 2 : (intval($week_num) - 1) ;
        $nextweek = ($week_num + 1 > count($weeks) ) ? count($weeks) : ($week_num + 1 );

        $this->assignown("upweek", $upweek);
        $this->assignown("nextweek", $nextweek);


        $daytime = strtotime(date('Y-m-d',time()));
        $dayData = spClass("db_cook")->find(array("date"=>$daytime));
        $this->assignown("dayData", $dayData);
	}

	public function __page(){
		$termInfo = $this->dTerm->find(array("id"=>$this->spArgs("tid")));
		$pageInfo = $this->dArticle->find(array("term_id"=>$termInfo['id']));

		$this->assignown("termInfo",$termInfo);
		$this->assignown("pageInfo",$pageInfo);
	}

	public function __information(){
		$childNode = spClass("db_term")->findAll(array("parent_id"=>$this->spArgs("tid")));
		$this->assignown("achildNode",$childNode);
		$content = array();
		foreach ($childNode as $key => $value) {
			$news = spClass("db_article")->findAll(array("term_id"=>$value['id']),"id desc","term_id,id,title,brief,cover,create_time,tpl","10");
			$content[$value['id']] = $news;
			$content[$value['id']]['tpl'] = $childNode[$key]['tpl'];
		}
		$this->assignown("content",$content);
	}
	
	public function __education_jqzk(){

		$results = spClass("db_article")->spPager($this->spArgs('page', 1), 10)->findAll(array("term_id"=>$_GET['tid']),"id desc","term_id,id,title,brief,cover,create_time,tpl"); 
		$pager = spClass("db_article")->spPager()->getPager();
		// print_r($results);

		$this->assignown("results",$results);
		$this->assignown("pager",$pager);

	}

	public function __information_list(){
		$term_info = spClass("db_term")->find(array("id"=>$_GET['tid']));
		$this->assignown("term_info",$term_info);

		$results = spClass("db_article")->spPager($this->spArgs('page', 1), 10)->findAll(array("term_id"=>$_GET['tid'])); 
		$pager = spClass("db_article")->spPager()->getPager();

		$this->assignown("results",$results);
		$this->assignown("pager",$pager);
	}
	
	public function __park(){
		$childNode = $this->dTerm->findAll(array("parent_id"=>$_GET['tid']));
		$this->assignown("childNode", $childNode);
	}

	public function __park_zy(){
		$article = $this->dArticle->findAll(array("term_id"=>$_GET['tid']));
		$this->assignown("articles", $article);
	}

	public function __information_zd(){
		$articleInfo = $this->dArticle->find(array("id"=>$_GET['id']));
		$this->assignown("articleInfo",$articleInfo);

		// 上一篇
		$upArticle = $this->dArticle->next($_GET['id'], true);
		if(empty($upArticle)){
			$up['href'] = "javascript:;";
			$up['title'] = "没有了";
		}else {
			$up['href'] = spUrl($upArticle['tpl'],"",array("id"=>$upArticle['id']));
			$up['title'] = $upArticle['title'];
		}

		// 下一篇
		$nextArticle = $this->dArticle->next($_GET['id']);
		if(empty($nextArticle)){
			$next['href'] = "javascript:;";
			$next['title'] = "没有了";
		}else {
			$next['href'] = spUrl($nextArticle['tpl'],"",array("id"=>$nextArticle['id']));
			$next['title'] = $nextArticle['title'];
		}
		// 赋值
		$this->assignown("up",$up);
		$this->assignown("next",$next);
	}
	
	public function __wsmxzjq(){
		$results = spClass("db_article")->spPager($this->spArgs('page', 1), 10)->findAll(array("term_id"=>$_GET['tid']),"id desc","term_id,id,title,brief,cover,create_time,tpl"); 
		$pager = spClass("db_article")->spPager()->getPager();
		
		$this->assignown("results",$results);
		$this->assignown("pager",$pager);
	}

	public function __life(){
		if($_GET['tid'] == "25"){
			$childNode = $this->dTerm->findAll(array("parent_id"=>$_GET['tid']),"","id");
			$terms = array();
			foreach ($childNode as $key => $value) {
				$terms[] = $value['id'];
			}
			$whereTid = "'".implode("','", $terms)."'";
			$where = "`term_id` IN (".$whereTid.")";
			$results = spClass("db_article")->spPager($this->spArgs('page', 1), 10)->findAll($where ,"id desc","term_id,id,title,brief,cover,create_time,tpl"); 
			$pager = spClass("db_article")->spPager()->getPager();
			$this->assignown("results",$results);
			$this->assignown("pager",$pager);
		}else {
			$results = spClass("db_article")->spPager($this->spArgs('page', 1), 10)->findAll(array("term_id"=>$_GET['tid']),"id desc","term_id,id,title,brief,cover,create_time,tpl"); 
			$pager = spClass("db_article")->spPager()->getPager();
			
			$this->assignown("results",$results);
			$this->assignown("pager",$pager);
		}
	}

	public function __bjtd(){

		$results = spClass("db_article")->spPager($this->spArgs('page', 1), 10)->findAll(array("term_id"=>$_GET['tid']),"id desc","term_id,id,title,brief,cover,create_time,tpl"); 
		$pager = spClass("db_article")->spPager()->getPager();
		// print_r($results);
		
		$this->assignown("results",$results);
		$this->assignown("pager",$pager);
	}
	public function __jiamenjianqiao(){
		$this->__page();
	}
	public function __index(){

		//新闻
		$news = spClass("db_article")->findAll(array("term_id"=>31),"id desc","id,title,brief,cover,create_time,tpl","8");
		$this->assignown("news",$news);
		// print_r($news);
		// 宝贝动态
		$baobeidongtai = spClass("db_article")->findAll(array("term_id"=>33),"id desc","id,title,brief,cover,create_time,tpl","8");
		$this->assignown("bbdt",$baobeidongtai);

		// 渗透教育
		$jiaoyu = spClass("db_article")->findAll(array("term_id"=>4),"id desc","id,title,brief,cover,create_time,tpl","4");
		$this->assignown("jiaoyu",$jiaoyu);

		// 家园共育
		$gongyu = spClass("db_term")->findAll(array("parent_id"=>6,"recommend"=>1),"`order` asc","*","2");
		$hudong = spClass("db_term")->findAll(array("parent_id"=>25,"recommend"=>1),"","*",3);
		$gys = array_merge($hudong, $gongyu);
		$gongyugood = array();
		foreach ($gys as $key => $value) {
			if($key != 0){
				if($key % 2 == 0){
					$gongyugood[count($gongyugood)-1][] = $value;
				}else {
					$gongyugood[][] = $value;
				}
			}else {
				$gongyugood[] = $value;
			}
		}
		$this->assignown("gongyu",$gongyugood);

		// 周刊
		$zhoukan = spClass("db_article")->find(array("term_id"=>39),"id desc");
		$this->assignown("zhoukan", $zhoukan);

		// 食谱
		$shipu = spClass("db_article")->find(array("term_id"=>24),"id desc");
		$this->assignown("shipu", $shipu);

		// 作品
		$zuopin = spClass("db_article")->find(array("term_id"=>20),"id desc");
		$this->assignown("zuopin", $zuopin);


	}
	public function __zhaopinxinx(){
		$termInfo = $this->dTerm->find(array("id"=>$_GET['tid']));
		if($termInfo['parent_id'] == 0){
			$childNode = $this->dTerm->findAll(array("parent_id"=>$termInfo['id']),"`order` asc","id");
			$ids = array();
			foreach ($childNode as $key => $value) {
				$ids[] = $value['id'];
			}
			$whereTid = " `term_id` in ('".implode("','", $ids)."') ";
		}else {
			$whereTid = array("term_id"=>$_GET['tid']);
		}
		$results = spClass("db_zhaopin")->spPager($this->spArgs('page', 1), 10)->findAll($whereTid, "id desc");
		$pager = spClass("db_zhaopin")->spPager()->getPager();
		$this->assignown("results",$results);
		$this->assignown("pager",$pager);
	}
	public function __zhaopinxinx_zd(){
		$info = spClass("db_zhaopin")->find(array("id"=>$_GET['zid']));
		$this->assignown("info", $info);
	}
	public function __search(){
		$obj = spClass('db_article');
		$keyword = urldecode($this->spArgs('keyword'));
		$condition = ' uid = ' . THEME_UID . ' and title like '.$obj->escape('%'.$keyword.'%');
		$result = $obj->spPager($this->spArgs('page', 1), 10)->findAll($condition);
		$pager     = $this->dArticle->spPager()->getPager();
		$this->assignown("results",$result);
		$this->assignown("pager",$pager);
	}








	///////////////////////////////////////////////////

	public function __f_index(){
		
		//分园新闻
		$f_n = spClass("db_term")->find(array("name"=>"新闻动态","uid"=>THEME_UID));
		$f_news = spClass("db_article")->findAll(array("term_id"=>$f_n["id"]),"id desc","id,title,tpl,brief,cover","5");
		$this->assignown("f_n",$f_n);
		$this->assignown("f_news",$f_news);
		
		//分园介绍
		$f_jh=spClass("db_term")->find(array("name"=>"分园介绍","uid"=>THEME_UID));
		$f_jieshao = spClass("db_article")->find(array("term_id"=>$f_jh["id"]));
		$this->assignown("f_jh",$f_jh);
		$this->assignown("f_jieshao",$f_jieshao);
		
		//通知公告
		$f_ju 	= spClass("db_term")->find(array("name"=>"通知公告","uid"=>THEME_UID));
		$f_jiyu = spClass("db_article")->findAll(array("term_id"=>$f_ju['id']),"id desc","id,title,content,tpl,brief","2");
		$this->assignown("f_ju",$f_ju);
		$this->assignown("f_jiyu",$f_jiyu);

		//剑桥生活
		$f_sh   = spClass("db_term")->find(array("id"=>51));
		$this->assignown("f_sh",$f_sh);

		//精彩活动
		$f_hd_term 	= sPclass("db_term")->find(array("id"=>62));
		$f_hd 	 	= spClass("db_article")->findAll(array("term_id"=>62),"id desc","id,title,cover,tpl,brief","8");
		$this->assignown("f_hd_term",$f_hd_term);
		$this->assignown("f_hd",$f_hd);

		//欢乐课堂
		$f_kt_term = sPclass("db_term")->find(array("id"=>64));
		$f_kt      = spClass("db_article")->findAll(array("term_id"=>64),"id desc","id,title,cover,tpl,brief","8");
		$this->assignown("f_kt_term",$f_kt_term);
		$this->assignown("f_kt",$f_kt);

		// 家长寄语
		$this->jiyu = spClass("db_term")->find(array("name"=>"家长寄语","uid"=>THEME_UID));

		$f_all_index = array_merge($f_hd, $f_kt);
		$this->assignown("f_all_index",$f_all_index);
	}

	public function __f_page_show(){
		$page_show  = $this->dArticle->find(array("id"=>$_GET['id']));
		$imgs=str_replace("[\"","",$page_show['imgs']);
		$imgs=str_replace("\"]","",$imgs);
		$imgs=explode('","',$imgs);
		$this->assignown("page_show",$page_show);
		$this->assignown("imgs",$imgs);
		// 上一篇
		$upArticle = $this->dArticle->next($_GET['id'], true);
		if(empty($upArticle)){
			$up['href'] = "javascript:;";
			$up['title'] = "没有了";
		}else {
			$up['href'] = spUrl($upArticle['tpl'],"",array("id"=>$upArticle['id']));
			$up['title'] = $upArticle['title'];
		}

		// 下一篇
		$nextArticle = $this->dArticle->next($_GET['id']);
		if(empty($nextArticle)){
			$next['href'] = "javascript:;";
			$next['title'] = "没有了";
		}else {
			$next['href'] = spUrl($nextArticle['tpl'],"",array("id"=>$nextArticle['id']));
			$next['title'] = $nextArticle['title'];
		}
		// 赋值 
		$this->assignown("up",$up);
		$this->assignown("next",$next);
	}

	public function __f_term($pagenum = 10, $order="id desc"){

		$term = spClass("db_term")->find(array("id"=>$_GET['tid']));
		if(!$term['parent_id']){
			$term = spClass("db_term")->find(array("parent_id"=>$_GET['tid']));
		}

		$articles=spClass("db_article")->spPager($this->spArgs('page', 1),$pagenum)->findAll(array("term_id"=>$term['id']),$order);

		$article=spClass("db_article")->find(array("term_id"=>$term['id']));

		$pager = spClass("db_article")->spPager()->getPager();
		$this->assignown("term",$term);
		$this->assignown("articles",$articles);
		$this->assignown("article",$article);
		$this->assignown("pager",$pager);
	}

	public function __f_mzsp(){
		$weeks = get_week(intval(date("Y")));

		$week_num = isset($_GET['week']) ? intval($_GET['week']) : intval(date("W"));
        $this_week = $weeks[$week_num - 1];

        $sql = " `date` >= ".$this_week[2]." and `date` <= ".$this_week[3];
        
        $week_data = spClass("db_cook")->findAll($sql,"","zao,zaodian,wu,wudian,wan");
        $data = array();
        
        foreach ($week_data as $key => $value) {
        	foreach ($value as $k => $vo) {
        		if(strstr($vo, "{")){
        			$strA = explode("{",$vo);
        			$title = substr($strA[1],0,strlen($strA[1])-1);
        			$data[$k][] = array("title"=>$title, "cook"=>$strA[0]);
        		}else {
        			$data[$k][] = array("title"=>$vo, "cook"=>$vo);
        		}
        		
        	}
        }
        $this->assignown("week_data", $data);

        $begin_time=strtr(substr($this_week['0'],5),"-","/");
        $end_time=strtr(substr($this_week['1'],5),"-","/");

        $this->assignown("begin_time",$begin_time);
        $this->assignown("end_time",$end_time);
        $upweek = (intval($week_num) - 1 < 2 ) ? 2 : (intval($week_num) - 1) ;
        $nextweek = ($week_num + 1 > count($weeks) ) ? count($weeks) : ($week_num + 1 );

        $this->assignown("upweek", $upweek);
        $this->assignown("nextweek", $nextweek);

        $time=strtotime(date('Y-m-d'));
        $day_food=spClass("db_cook")->find(array("date"=>$time),"","zao,zaodian,wu,wudian,wan");
        $this->assignown("day_food",$day_food);
	}

	public function __f_gywm_fyjs(){

		$this->__f_term();	

	}

	public function __f_gywm_zxxx(){
		$flag_new="selected";
		$flag_new2="hui";
		$flag_tz2="none hui";
		$flag_tz=$_GET['pagetz'];
		if($flag_tz){
			$flag_tz="class='selected'";
			$flag_tz2="hui";

			$flag_new="";
			$flag_new2="none hui";
		}
		$this->assignown("flag_new",$flag_new);
		$this->assignown("flag_new2",$flag_new2);
		$this->assignown("flag_tz",$flag_tz);
		$this->assignown("flag_tz2",$flag_tz2);



		//分园新闻
		$term_new=spClass("db_term")->find(array("id"=>75));
		$f_news = spClass("db_article")->spPager($this->spArgs('page', 1), 10)->findAll(array("term_id"=>75),"id desc");
		$pager = spClass("db_article")->spPager()->getPager();
		$this->assignown("term_new",$term_new);
		$this->assignown("pager",$pager);
		$this->assignown("f_news",$f_news);

		//分园通知
		$term_tz=spClass("db_term")->find(array("id"=>74));
		$f_tz = spClass("db_article")->spPager($this->spArgs('pagetz', 1), 10)->findAll(array("term_id"=>74),"id desc");
		$pager_tz = spClass("db_article")->spPager()->getPager();
		$this->assignown("term_tz",$term_tz);
		$this->assignown("pager_tz",$pager_tz);
		$this->assignown("f_tz",$f_tz);
	}
	public function __f_gywm_zxxx_zd(){
		$this->__f_page_show();
		
	}
	public function __f_jqsh_ktnr_zd(){
		$this->__f_page_show();
	}
	public function __f_gywm_lxwm(){
		$this->__f_term(10);
		
	}
	public function __f_ydfc(){
		$this->__f_term();
	}

	public function __f_jqsh_jcsh(){
		$this->__f_term(10);
	}

	public function __f_wsbj_wsxzs(){
		$this->__f_term();
	}
	public function __f_mzsp_sp(){
		$this->__f_term();
		$this->__f_mzsp();
	}

	public function __f_yybm_wybm(){
		$this->__f_term();
	}

	public function __f_ydfc_jscyzs(){
		$this->__f_term(10);

	}
	
	public function __f_jqsh_jcsh_zd(){
		$this->__f_page_show();
	}

	public function __f_jqsh_ktnr(){
		$this->__f_term();
	}

	public function __f_jqsh_jzjy(){
		$this->__f_term(10);
	}

	public function __f_jqsh_jzjy_zd(){
		$this->__f_page_show();
	}

	public function __f_wsbj_wsxzs_zd(){
		$this->__f_page_show();
	}

	public function __f_zsgg(){
		 $this->__f_term(10);
	}
	
	public function __f_zsgg_zd(){
		$this->__f_page_show();
	}

	public function __f_ydfc_jscyzs_zd(){
		$this->__f_page_show();
	}

	public function __f_yybm_wyyy(){
		$this->__f_term(10);
	}

	public function __f_bjztc(){
		$this->__f_term();
	}



	///////////////////////////////////////////
	public function __p_index(){
	//新闻资讯
		$new=spClass("db_term")->find(array("id"=>"31","uid"=>"1"));
		$this->assignown("new",$new);
	//通知公告
		$notice=spClass("db_term")->find(array("id"=>"32","uid"=>"1"));
		$this->assignown("notice",$notice);
	//招生公告
		$s_notice=spClass("db_term")->find(array("id"=>"26","uid"=>"1"));
		$this->assignown("s_notice",$s_notice);
	//剑桥生活
		$life=spClass("db_article")->findAll(array("term_id"=>"20","uid"=>"1"));
		$this->assignown("life",$life);
	//选择剑桥
		$choose=spClass("db_article")->findAll(array("term_id"=>"29","uid"=>"1"));
		$this->assignown("choose",$choose);

	}
	public function __p_term($pagenum=5,$order="id desc"){

		$term = spClass("db_term")->find(array("id"=>$_GET['tid']));
		if(!$term['parent_id']){
			$term = spClass("db_term")->find(array("parent_id"=>$_GET['tid']));
		}

		$articles=spClass("db_article")->spPager($this->spArgs('page', 1),$pagenum)->findAll(array("term_id"=>$term['id']),$order);

		$article=spClass("db_article")->find(array("term_id"=>$term['id']));

		$pager = spClass("db_article")->spPager()->getPager();
		$this->assignown("term",$term);
		$this->assignown("articles",$articles);
		$this->assignown("article",$article);
		$this->assignown("pager",$pager);
	}

	public function __p_pageshow(){
		$flag="1";
		if($_GET['tid']){
			$article=$this->dArticle->find(array("term_id"=>$_GET['tid']));
			$flag="0";
		}elseif($_GET['id']){
			$article=$this->dArticle->find(array("id"=>$_GET['id']));
		}
		$this->assignown("article",$article);
		$this->assignown("flag",$flag);
		// 上一篇
		$upArticle = $this->dArticle->next($_GET['id'], true);
		if(empty($upArticle)){
			$up['href'] = "javascript:;";
			$up['title'] = "没有了";
		}else {
			$up['href'] = spUrl($upArticle['ptpl'],"",array("id"=>$upArticle['id']));
			$up['title'] = $upArticle['title'];
		}

		// 下一篇
		$nextArticle = $this->dArticle->next($_GET['id']);
		if(empty($nextArticle)){
			$next['href'] = "javascript:;";
			$next['title'] = "没有了";
		}else {
			$next['href'] = spUrl($nextArticle['ptpl'],"",array("id"=>$nextArticle['id']));
			$next['title'] = $nextArticle['title'];
		}
		// 赋值
		$this->assignown("up",$up);
		$this->assignown("next",$next);
	}

	public function __p_news(){
		$this->__p_term();
	}

	public function __p_notice(){

		$this->__p_term();
	}
	public function __p_notices(){
		
		$term = spClass("db_term")->find(array("id"=>$_GET['tid']));
		if(!$term['parent_id']){
			$term = spClass("db_term")->find(array("parent_id"=>$_GET['tid']));
		}
		$this->assignown("term",$term);

		$childNode = $this->dTerm->findAll(array("parent_id"=>$_GET['tid']),"","id");
		$terms = array();
		foreach ($childNode as $key => $value) {
			$terms[] = $value['id'];
		}
		$whereTid = "'".implode("','", $terms)."'";
		$where = "`term_id` IN (".$whereTid.")";
		$results = spClass("db_article")->spPager($this->spArgs('page', 1), 10)->findAll($where ,"id desc","term_id,id,title,brief,cover,create_time,tpl,ptpl"); 
		$pager = spClass("db_article")->spPager()->getPager();
		$this->assignown("articles",$results);
		$this->assignown("pager",$pager);
	}
	public function __p_introduction(){

		$this->__p_pageshow();
	}

	public function __p_dailydiet(){
		$datearr = getdate();
		$year = strtotime($datearr['year'].'-1-1');
		$startdate = getdate($year);
		$firstweekday = 7-$startdate['wday'];//获得第一周几天

		$yday = $datearr['yday']+1-$firstweekday;//今年的第几天
		$week=  ceil($yday/7)+1;//取到第几周
	
		$weeks = get_week(intval(date("Y")));
		$week_num = $week;
        $this_week = $weeks[$week_num - 1];

        $sql = " `date` >= ".$this_week[2]." and `date` <= ".$this_week[3];
        
        $week_data = spClass("db_cook")->findAll($sql,"","zao,zaodian,wu,wudian,wan");
        $this->assignown("week_data", $week_data);
        //var_dump($week_data);

        $begin_time=strtr(substr($this_week['0'],5),"-","/");
        $end_time=strtr(substr($this_week['1'],5),"-","/");

        $this->assignown("begin_time",$begin_time);
        $this->assignown("end_time",$end_time);

        $weekarray=array("周一","周二","周三","周四","周五");

        $num=date("w")-1;

        $this->assignown("num",$num);
        $this->assignown("weekarray",$weekarray);

	}
	public function __p_garden(){
		$data = $this->dTerm->findAll(array("parent_id"=>$_GET["tid"]));
		$this->assignown("list", $data);
	}
	public function __p_gardenlist(){
		$data = $this->dArticle->findAll(array("term_id"=>$_GET["tid"]));
		$this->assignown("list", $data);
	}







	/////////////////////////
	public function __c_index(){
		//分园简介
		$jieshao=spClass("db_article")->find(array("term_id"=>"56"));
		$this->assignown("jieshao",$jieshao);
		//资讯信息
		$news=spClass("db_term")->find(array("id"=>"58"));
		$this->assignown("news",$news);
		//设施环境
		$sheshi=spClass("db_article")->find(array("term_id"=>"15"));
		$this->assignown("sheshi",$sheshi);
		//园长介绍
		$yuanzhang=spClass("db_article")->find(array("term_id"=>"59"));
		$this->assignown("yuanzhang",$yuanzhang);
		//剑桥生活
		$huo=spClass("db_term")->findAll(array("parent_id"=>"51","phone"=>"1"));
		$this->assignown("huo",$huo);
		//预约报名
		$baoming=spClass("db_article")->find(array("term_id"=>"54"));
		$this->assignown("baoming",$baoming);

		$banjis = $this->dTerm->findAll(array("parent_id"=>55),"","id");
		$whereIn = array();
		foreach ($banjis as $key => $value) {
			$whereIn[] = $value["id"];
		}
		$strwherein = " term_id in ('".implode("','",$whereIn)."')";
		$banjis = $this->dArticle->findAll($strwherein,"","tpl,title");
		// print_r($banjis);
		$this->assignown("banji",$banjis);

	}

	public function __c_profile(){
		$flag="1";
		if($_GET['tid']){
			$article=$this->dArticle->find(array("term_id"=>$_GET['tid']));
			$flag="0";
		}elseif($_GET['id']){
			$article=$this->dArticle->find(array("id"=>$_GET['id']));
		}
		$this->assignown("article",$article);
		$this->assignown("flag",$flag);
		// 上一篇
		$upArticle = $this->dArticle->next($_GET['id'], true);
		if(empty($upArticle)){
			$up['href'] = "javascript:;";
			$up['title'] = "没有了";
		}else {
			$up['href'] = spUrl($upArticle['ptpl'],"",array("id"=>$upArticle['id']));
			$up['title'] = $upArticle['title'];
		}

		// 下一篇
		$nextArticle = $this->dArticle->next($_GET['id']);
		if(empty($nextArticle)){
			$next['href'] = "javascript:;";
			$next['title'] = "没有了";
		}else {
			$next['href'] = spUrl($nextArticle['ptpl'],"",array("id"=>$nextArticle['id']));
			$next['title'] = $nextArticle['title'];
		}
		// 赋值
		$this->assignown("up",$up);
		$this->assignown("next",$next);
	}
	public function __c_newslist(){
		$flag_new="class='on'";
		$flag_new2="display:block";
		$flag_tz="";
		$flag_tz2="display:none";
		if($_GET['pagetz']){
			$flag_tz="class='on'";
			$flag_tz2="display:block";

			$flag_new="";
			$flag_new2="display:none";
		}
		$this->assignown("flag_new",$flag_new);
		$this->assignown("flag_new2",$flag_new2);
		$this->assignown("flag_tz",$flag_tz);
		$this->assignown("flag_tz2",$flag_tz2);
		$term=spClass("db_term")->find(array("id"=>$_GET['tid']));
		$this->assignown("term",$term);
		//新闻动态
		$news_term=spClass("db_term")->find(array("id"=>"75"));
		$news=spClass("db_article")->spPager($this->spArgs('page', 1), 10)->findAll(array("term_id"=>"75"),"`create_time` asc");
		$pager = spClass("db_article")->spPager()->getPager();
		$this->assignown("pager",$pager);
		$this->assignown("news_term",$news_term);
		$this->assignown("news",$news);
		//通知通告
		$notices_term=spClass("db_term")->find(array("id"=>"74"));
		$notices=spClass("db_article")->spPager($this->spArgs('pagetz', 1), 10)->findAll(array("term_id"=>"74"));
		$pager_tz = spClass("db_article")->spPager()->getPager();
		$this->assignown("pager_tz",$pager_tz);
		$this->assignown("notices_term",$notices_term);
		$this->assignown("notices",$notices);


	}
	public function __c_list(){

		$term=spClass("db_term")->find(array("id"=>$_GET['tid']));
		$this->assignown("term",$term);

		$articles=spClass("db_article")->spPager($this->spArgs('page', 1), 10)->findAll(array("term_id"=>$_GET['tid']));
		$pager = spClass("db_article")->spPager()->getPager();
		$this->assignown("pager",$pager);
		$this->assignown("articles",$articles);
	}
	public function __c_wlist(){
		$this->__c_list();

	}

}