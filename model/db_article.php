<?php
/////////////////////////////////////////////////////////////////
//万虎网络, Copyright (C)   2010 - 2011  www.wanhunet.com 

class db_article extends ybModel
{


	var $pk = "id"; // 主键
	var $table = "article"; // 数据表的名称
	
	public function create($row){
		$row['create_time'] = time();
		$row['uid'] = $_SESSION['uid'];
		return parent::create($row);
	}
}
?>
