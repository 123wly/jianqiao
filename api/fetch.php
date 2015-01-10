<?php
/////////////////////////////////////////////////////////////////
//万虎网络, Copyright (C)   2010 - 2011  www.wanhunet.com     

class fetch extends top
{

    function __construct(){
        parent::__construct();
    }

    public function nihao(){
    	$data = spClass("db_term")->findAll();
    	return $data;
    }
    
}