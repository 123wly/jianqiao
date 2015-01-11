<?php
/////////////////////////////////////////////////////////////////
//万虎网络, Copyright (C)   2010 - 2011  www.wanhunet.com 

class term extends top
{ 

	//获取分类
	function getTerm($parent_id='0',$uid='1'){
	    $conditions=array
	       (
	    	'parent_id'=>$parent_id,
	    	'uid'=>$uid
	    	);
	    //var_dump($conditions);
		$data= spClass('db_term')->findAll($conditions);
        return ($data);
	}
	function getSlide($type){
		$sql ="select * from ".DBPRE."ad_list where auid= '".$type."'";
		$data=spClass('db_term')->findSql($sql);
        return ($data);
	}
	
	
}
