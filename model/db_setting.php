<?php
/////////////////////////////////////////////////////////////////
//万虎网络, Copyright (C)   2010 - 2011  www.wanhunet.com 

class db_setting extends ybModel  
{  
	var $pk = "name"; //主键  
	var $table = "setting"; // 数据表的名称 
	
	
	/*显示系统配置*/
	function getConfig()
	{
		$rs = $this->findAll();
		$data = '';
		foreach($rs as $d)
		{
			$data[$d['name']] = $d['val'];
		}

		return $data;
	}
	
	
	/*保存系统配置
	input array key value*/
	function saveConfig($var)
	{
		spAccess('c','ybconfig');

		foreach($var as $k=>$d)
		{
			$rs = $this->find(array('name'=>$k));
			if(is_array($rs))
			{
				$this->update(array('name'=>$k),array('val'=>$d));
			}else{
				$this->create(array('name'=>$k,'val'=>$d));
			}
		}
		$rs = $this->getConfig();

		spAccess('w','ybconfig',$rs,-1);
	}
	



	

}
?>