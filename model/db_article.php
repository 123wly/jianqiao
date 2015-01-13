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
	public function next($id, $up = false, $tids = array()){
		$thisArticle = $this->find(array("id"=>$id),"","id,term_id");
		$whereTid    = "";
		if(count($tids) > 0){
			$whereTid = "'".implode("','", $tids)."'";
		}else {
			$whereTid = "'".$thisArticle['term_id']."'";
		}
		$co    = $up  ? "<" : ">";
		$order = $up ? "id desc" : "id asc";
		$id    = intval($id);
		$where = "`id` " . $co . " '" . $id . "' AND term_id IN (".$whereTid.")";
		return $this->find($where, $order);

	}
}
?>
