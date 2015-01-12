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
}
?>
