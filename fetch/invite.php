<?php
/////////////////////////////////////////////////////////////////
//万虎网络, Copyright (C)   2010 - 2011  www.wanhunet.com                           


class invite extends top
{

    function __construct()
    {
        parent::__construct();
        $this->needLogin();
    }

    public function getInviteList()
    {
        $db_invite = spClass('db_invite');
        return ($db_invite->initInvite($this->uid));
    }

    public function addToFull()
    {
        if(spClass('db_invite')->addToFull($this->uid) ){
			 return (true);
		}else{
			$this->api_error('请稍候再试');
		}
    }

    public function getInvitedFriendList()
    {
        $row = array('uid' => $this->uid);
        $friendBaseInfo = spClass('db_invite_friend')->spLinker()->spPager($this->spArgs('page', 1), 30)->findAll($row); //邀请的好友 编号
		foreach($friendBaseInfo as &$d){
			$d += $d['user'];
			$d['h_url'] = goUserHome(array('uid'=>$d['touid'], 'domain'=>$d['domain']));
			$d['h_img'] = avatar(array('uid'=>$d['touid'],'size'=>'middle'));
			unset($d['user']);
		}
        return ($friendBaseInfo);
    }

}