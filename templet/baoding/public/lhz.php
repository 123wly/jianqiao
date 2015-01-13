<?php 
    if(!isset($_GET['tid']) and isset($_GET['id'])){
        $rs = spClass("db_article")->find(array("id"=>intval($_GET['id'])), "","term_id");
        if($rs) $_GET['tid'] = $rs['term_id'];
    }
    $term   = spClass("db_term")->find(array("id"=>$_GET['tid']));
    $parent = spClass("db_term")->find(array("id"=>$term['parent_id']));
    $childNode = spClass("db_term")->findAll(array("parent_id"=>$parent['id']));
?>
<div class="left lhz">
    <h2>
        <?php echo $parent['name']; ?>
        <span><?php echo $parent['en_name']; ?></span>
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