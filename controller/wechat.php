<?php
/////////////////////////////////////////////////////////////////
//万虎网络, Copyright (C)   2010 - 2011  www.wanhunet.com

class wechat extends spController
{
    public function index(){

        include './wechat/lanewechat.php';
        $wechat = new \LaneWeChat\core\WeChat(WECHAT_TOKEN, TRUE, $this);
        // print_r($wechat);
        // echo $wechat->run($this);
        $wechat->checkSignature();
        die;
        
    }
    public function __text(&$request){
//        console_log($request);
        $content = '收到文本12消息';
        $tuwenList[] = array('title' => 'asdasd', 'description' => '描述1', 'pic_url' => '图片URL1', 'url' => $_SERVER['SERVER_NAME'].spUrl("main","index",array("openid"=>$request['fromusername'])));
        //构建图文消息格式
        $itemList = array();
        foreach ($tuwenList as $tuwen) {
            $itemList[] = LaneWeChat\core\ResponsePassive::newsItem($tuwen['title'], $tuwen['description'], $tuwen['pic_url'], $tuwen['url']);
        }
        return LaneWeChat\core\ResponsePassive::news($request['fromusername'], $request['tousername'], $itemList);
//        console_log($request);
//
//        return LaneWeChat\core\ResponsePassive::text($request['fromusername'], $request['tousername'], $content);
    }




    public function debug(){
        header("Content-type: text/html; charset=utf-8");

        foreach (dump_log() as $value) {
            $value["dump"] = json_decode($value["dump"], true);
            print_r($value);
        }
    }
}
?>
