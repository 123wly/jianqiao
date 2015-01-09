<?php
/////////////////////////////////////////////////////////////////
//万虎网络, Copyright (C)   2010 - 2011  www.wanhunet.com 

class db_category extends ybModel  
{  
	var $pk = "cid"; // 主键  
	var $table = "catetags"; // 数据表的名称 
	
	
	function findCate()
	{
		if(!spAccess('r','systag')){  //读取设置
			$tag = $this->findAll('','sort ASC');
			spAccess('w','systag',$tag,-1);
		}else{
			$tag = spAccess('r','systag');
		}
		return $tag;
	}
	
	
	function saveCate($post)
	{
		if(is_array($post['cate']))
		{
			foreach($post['cate'] as $k=>$v)
			{
				$arr['sort'] = $v['sort'];
				$arr['catename'] = $v['catename'];
				$this->update(array('cid'=>$k),$arr);
			}
		}
	}

}
?>