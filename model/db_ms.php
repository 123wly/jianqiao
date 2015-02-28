<?php
/////////////////////////////////////////////////////////////////
//万虎网络, Copyright (C)   2010 - 2011  www.wanhunet.com 

class db_ms extends spModel  
{  
	var $pk = "id"; 
	var $table = "ms";
	
	
	function postms($uid, $touid, $body){
		$row = array('from'   => $uid,
					 'info'  => $body,
					 'time'  => time(),
					 'touid'	=>	$touid
		);
		$this->create($row);
		return true;
	}
	function listms($uid,$page=1)
	{
		$data = array();
		$column = 'p.id,p.touid,p.from,m.username as formusername, m.domain as todoman,p.info,p.time';
		$sql = "SELECT $column FROM `".DBPRE."ms` AS p LEFT JOIN `".DBPRE."member` AS m ON p.from = m.uid 
		 where p.touid='$uid'  ORDER BY p.time desc ";
		$data['data'] = $this->spPager($page,1)->findSql($sql);
		$data['page'] = $this->spPager()->getPager();
		return $data;
	}	
}
?>