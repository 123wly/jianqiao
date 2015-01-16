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
    }

	public function index(){
		$c = $this->spArgs("c");
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

		if(method_exists($this,"__".$c)){
			call_user_func_array(array($this,"__".$c), array());
		}

		$this->assignown("root",__ROOT__);
		$this->assignown('skin_path',"".__ROOT__.'/templet/' . THEME_NAME .'/');
	
		$this->display($c . ".html");
	}

	public function assignown($name, $value){
		$this->v->engine->assign($name, $value);
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

		$results = spClass("db_article")->spPager($this->spArgs('page', 1), 4)->findAll(array("term_id"=>$_GET['tid']),"id desc","term_id,id,title,brief,cover,create_time,tpl"); 
		$pager = spClass("db_article")->spPager()->getPager();
		// print_r($results);

		$this->assignown("results",$results);
		$this->assignown("pager",$pager);

	}

	public function __information_list(){
		$term_info = spClass("db_term")->find(array("id"=>$_GET['tid']));
		$this->assignown("term_info",$term_info);

		$results = spClass("db_article")->spPager($this->spArgs('page', 1), 1)->findAll(array("term_id"=>$_GET['tid'])); 
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
		$results = spClass("db_article")->spPager($this->spArgs('page', 1), 4)->findAll(array("term_id"=>$_GET['tid']),"id desc","term_id,id,title,brief,cover,create_time,tpl"); 
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
			$results = spClass("db_article")->spPager($this->spArgs('page', 1), 6)->findAll($where ,"id desc","term_id,id,title,brief,cover,create_time,tpl"); 
			$pager = spClass("db_article")->spPager()->getPager();
			$this->assignown("results",$results);
			$this->assignown("pager",$pager);
		}else {
			$results = spClass("db_article")->spPager($this->spArgs('page', 1), 4)->findAll(array("term_id"=>$_GET['tid']),"id desc","term_id,id,title,brief,cover,create_time,tpl"); 
			$pager = spClass("db_article")->spPager()->getPager();
			
			$this->assignown("results",$results);
			$this->assignown("pager",$pager);
		}
	}

	public function __bjtd(){

		$results = spClass("db_article")->spPager($this->spArgs('page', 1), 2)->findAll(array("term_id"=>$_GET['tid']),"id desc","term_id,id,title,brief,cover,create_time,tpl"); 
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
		$news = spClass("db_article")->findAll(array("term_id"=>31),"id desc","id,title,brief,cover,create_time","8");
		$this->assignown("news",$news);

		// 宝贝动态
		$baobeidongtai = spClass("db_article")->findAll(array("term_id"=>33),"id desc","id,title,brief,cover,create_time","8");
		$this->assignown("bbdt",$baobeidongtai);

		// 渗透教育
		$jiaoyu = spClass("db_article")->findAll(array("term_id"=>4),"id desc","id,title,brief,cover,create_time","4");
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

}