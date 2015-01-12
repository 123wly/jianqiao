<?php
/////////////////////////////////////////////////////////////////
//万虎网络, Copyright (C)   2010 - 2011  www.wanhunet.com 

class db_term extends ybModel
{
    public $pk = "id"; // 数据表的主键
    public $table = "term"; // 数据表的名称
    public $data = array();

    public function __get($name)
    {
        return isset($this->data[$name]) ? $this->data[$name] : null;
    }

    public function __set($name, $value)
    {
        $this->data[$name] = $value;
        return $this;
    }
    public function create($row){
        $row['create_time'] = time();
        $row['uid'] = $_SESSION['uid'];
        if(empty($row['order'])){
            $row['order'] = 0;
        }
        return parent::create($row);
    }
    public function read($conditions = null)
    {
        $where["id"] = $conditions;
        $data = $this->find($where);
        $this->data = $data;
        return $this;
    }

    public function parent($id = null)
    {
        if (is_null($id)) $id = $this->id;
        if (is_null($id)) $id = 0;
        return $this->read(array("id" => $this->parent_id));
    }

    public function childNode($conditions = null, $sort = null, $fields = null, $limit = null)
    {
        if (is_numeric($conditions)) $conditions["parent_id"] = $conditions;
        if(is_null($conditions)) $conditions["parent_id"] = $this->id;
        return $this->findAll($conditions, $sort, $fields, $limit);
    }

    public function toArray()
    {
        return $this->data;
    }

}