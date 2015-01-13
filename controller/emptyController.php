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

	public function __information_list(){
		$term_info = spClass("db_term")->find(array("id"=>$_GET['tid']));
		$this->assignown("term_info",$term_info);

		$results = spClass("db_article")->spPager($this->spArgs('page', 1), 1)->findAll(array("term_id"=>$_GET['tid'])); 
		$pager = spClass("db_article")->spPager()->getPager();

		$this->assignown("results",$results);
		$this->assignown("pager",$pager);
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
		$gongyu = spClass("db_term")->findAll(array("parent_id"=>6,"recommend"=>1),"","*","5");
		$gongyugood = array();
		foreach ($gongyu as $key => $value) {
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