<?php
/////////////////////////////////////////////////////////////////
//万虎网络, Copyright (C)   2010 - 2011  www.wanhunet.com 

class db_baoming extends ybModel
{
    public $pk = "id"; // 数据表的主键
    public $table = "baoming"; // 数据表的名称
    
    public function create($row){
        $row['create_time'] = time();
        return parent::create($row);
    }
    

}