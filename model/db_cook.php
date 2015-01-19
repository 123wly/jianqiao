<?php
class db_cook extends ybModel  
{  
	var $pk = "id"; // 主键  
	var $table = "cook"; // 数据表的名称 

	public function create($row){
        $row['create_time'] = time();
        return parent::create($row);
    }

    public function save($row){
    	$rs = $this->find(array("date"=>$row['date']));
    	if(empty($rs)){
    		return $this->create($row);
    	}else {
    		return $this->update(array("date"=>$row['date']), $row);
    	}
    }

}