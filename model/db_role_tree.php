<?php
/////////////////////////////////////////////////////////////////
//万虎网络, Copyright (C)   2010 - 2011  www.wanhunet.com       

class db_role_tree extends ybModel
{

    public $pk = "id";
    public $table = "role_tree";

    function readAll($conditions = null, $sort = null, $fields = null, $limit = null){
    	if(is_null($sort)) $sort = $this->pk;
    	$whereStr = "1=1";
    	if(is_array($conditions)){
    		foreach ($conditions as $key => $value) {
    			$value = $this->escape($value);
    			$whereStr .= " and `$key` = '$value' ";
    		}
    	}else {
    		$whereStr = $conditions;
    	}
        $sql = "SELECT 
			 um.username as 'musername',
			 pm.username as 'pusername',
			 um.uid      as 'uuid',
			 pm.uid 	 as 'puid',
         FROM 
        	wh_role_tree as tree 
        	LEFT JOIN wh_member as um ON tree.uid=um.uid 
        	LEFT JOIN wh_member as pm ON tree.puid=pm.uid 
        	WHERE " . $whereStr . " ORDER BY $sort";
    	return $this->findSql($sql);
    }

}