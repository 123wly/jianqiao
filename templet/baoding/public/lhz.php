<?php $skin_path = $_smarty_tpl->getVariable('skin_path')->value; ?>
<?php 
    if(!isset($_GET['tid']) and isset($_GET['id'])){
        $rs = spClass("db_article")->find(array("id"=>intval($_GET['id'])), "","term_id");
        if($rs) $_GET['tid'] = $rs['term_id'];
    }
    if(!isset($_GET['tid']) and isset($_GET['zid'])){
        $rs = spClass("db_zhaopin")->find(array("id"=>intval($_GET['zid'])), "","term_id");
        if($rs) $_GET['tid'] = $rs['term_id'];
    }
    $term   = spClass("db_term")->find(array("id"=>$_GET['tid']));
    if($term['parent_id'] != 0){
        $parent = spClass("db_term")->find(array("id"=>$term['parent_id']));
    }else {
        $parent = $term;
    }
    $childNode = spClass("db_term")->findAll(array("parent_id"=>$parent['id']),"`order` asc");
?>
<div class="left lhz">
    <h2>
        <img src="<?php echo $skin_path; ?>images/nav/<?php echo str_replace(" ","_",strtolower($parent["en_name"])); ?>_ep.png">
        <span><img src="<?php echo $skin_path; ?>images/nav/<?php echo str_replace(" ","_",strtolower($parent["en_name"])); ?>_en.png"></span>
    </h2>
    <ul>
        <?php foreach ($childNode as $key => $vo): ?>
            <li>
                <a href="<?php echo spUrl($vo['tpl'],'',array('tid'=>$vo['id'])); ?>" <?php echo $_GET['tid'] == $vo['id'] ? 'class="hover"' : ""; ?>>
                    <?php echo $vo['name']; ?>
                </a>
            </li>
        <?php endforeach ?>
    </ul>
</div>