<?php
class db_guestbook extends ybModel  
{  
	var $pk = "id"; // 主键  
	var $table = "guestbook"; // 数据表的名称 
	
	public function create($row){
        $row['create_time'] = time();
        $row['uid'] = THEME_UID;
        return parent::create($row);
    }
}