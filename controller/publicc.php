<?php
/////////////////////////////////////////////////////////////////
//万虎网络, Copyright (C)   2010 - 2011  www.wanhunet.com 

 
class publicc extends spController
{
	public function uploadFile(){
        
        $targetFolder = '/uploads'; // Relative to the root

        $verifyToken = md5('unique_salt' . $_POST['timestamp']);


        if (true) {
        	$filename = uniqid().$_FILES['Filedata']['name'];
            $tempFile = $_FILES['Filedata']['tmp_name'];
            $targetPath = $_SERVER['DOCUMENT_ROOT'] .__ROOT__. $targetFolder;
            $targetFile = rtrim($targetPath,'/') . '/' . $filename;
            
            // Validate the file type
            $fileTypes = array('jpg','jpeg','gif','png'); // File extensions
            $fileParts = pathinfo($_FILES['Filedata']['name']);
            
            if (in_array($fileParts['extension'],$fileTypes)) {
                move_uploaded_file($tempFile,$targetFile);
                echo json_encode(array("status"=>1,"info"=>$filename));
            } else {
                echo json_encode(array("status"=>0));
            }
        }
    }

    public function bmorder(){
        // var_dump($_POST);die;
        $rs = spClass("db_baoming")->create($_POST);
        if ($rs) {
            $this->success("保存成功", spUrl("index","index"));
        } else {
            $this->error("保存失败", spUrl("index","index"));
        }
    }
    public function guestbook(){
        if(!spClass('spVerifyCode')->verify( $this->spArgs('vericode'))){
            $this->error('验证码不正确');
        } 
        $rs = spClass("db_guestbook")->create($_POST);
        if ($rs) {
            $this->success("保存成功", spUrl("index","index"));
        } else {
            $this->error("保存失败", spUrl("index","index"));
        }
    }
}