<?php
/////////////////////////////////////////////////////////////////
//万虎网络, Copyright (C)   2010 - 2011  www.wanhunet.com 


class emptyController extends top
{
	public function index(){
		echo $this->spArgs("aa");
	}
}