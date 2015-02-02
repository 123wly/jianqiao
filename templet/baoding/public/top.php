<div id="top">
    <div class="main">
        <?php 
            $head   = spClass("db_ad_unit")->find(array("title"=>"头部导航"),"","id");
            $headId = $head["id"];
            $head = spClass("db_ad_list")->findAll(array("auid"=>$headId));
            // var_dump($foot);
         ?>
        <p>
            <?php foreach ($head as $key => $value): ?>
                <a href="<?php echo $value["body"]; ?>" title="<?php echo $value["title"]; ?>"><?php echo $value["title"]; ?></a>  <?php echo $key != count($head) - 1 ? "|" : "";  ?> 
            <?php endforeach ?>
        </p>
    </div>
</div>