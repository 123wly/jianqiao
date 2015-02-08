<?php $skin_path = $_smarty_tpl->getVariable('skin_path')->value; ?>
<?php 
	if(!isset($_GET['tid']) and isset($_GET['id'])){
        $rs = spClass("db_article")->find(array("id"=>intval($_GET['id'])), "","term_id");
        if($rs) $_GET['tid'] = $rs['term_id'];
    }
    $tid        =  $_GET['tid'];
    $term       =  spClass("db_term")->find(array("id"=>$_GET['tid']));
    $parent     =  spClass("db_term")->find(array("id"=>$term['parent_id']));
    $pparent    =  spClass("db_term")->find(array("id"=>$parent['parent_id']));
    $childNode  =  spClass("db_term")->findAll(array("parent_id"=>$term['id']),"`order` asc");
    if($tid = $term['id']){
        $tid = $childNode['0']['id'];
    }
    if($parent){
        $childNode = spClass("db_term")->findAll(array("parent_id"=>$parent['id']),"`order` asc");
        $tid = $_GET['tid'];
    }
    if($pparent){
        $childNode = spClass("db_term")->findAll(array("parent_id"=>$pparent['id']),"`order` asc");
        $tid = $parent['id'];
    }
?>
<div class="gy_top">
    <ul>
        <h3>
            <?php $en_name = empty($parent['name']) ? $term['en_name'] : $parent['en_name']; ?>
            <?php if($pparent) $en_name = $pparent["en_name"]; ?>
            <img src="<?php echo $skin_path; ?>images/nav/<?php echo str_replace(" ","_",strtolower($en_name)); ?>_hy.png" />
        </h3>
        <?php foreach ($childNode as $key => $vo):?>
        	<li <?php echo $tid == $vo['id'] ? 'class="hover"' : ""; ?> >
                <a href="<?php echo spUrl($vo['tpl'],'',array('tid'=>$vo['id'])); ?>">
                    <?php echo $vo['name']; ?>
                </a>
            </li>
        <?php endforeach ?>
    </ul>
</div>