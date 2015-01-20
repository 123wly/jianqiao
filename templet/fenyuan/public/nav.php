<?php $skin_path = $_smarty_tpl->getVariable('skin_path')->value; ?>
<?php $terms = spClass("db_term")->findAll(array("uid"=>THEME_UID,"nav"=>'1','parent_id'=>'0'),"`order` asc");
$nav_class=array('lvs','cens','hos','las','lvs','cens','hos');
$root=$tid=$_GET['tid'];
$id=$_GET['id'];
if($id){
     $tid=spClass("db_article")->find(array('id'=>$id));
     $root=$tid['term_id'];
      }
if($root){
    $term=spClass("db_term")->find(array('id'=>$root));
    $parent=spClass("db_term")->find(array('id'=>$term['parent_id']));
    if($parent){
        $root=$parent['id'];
        $p_parent=spClass("db_term")->find(array('id'=>$parent['parent_id']));
         if($p_parent){
            $root=$p_parent['id'];
        }

    }
}
?>
<div id="header">
	<div class="top">
    	<div class="main top_nav">
        	<div class="logo">
            	<a href="<?php echo spUrl('index') ?>"><img src="<?php echo $skin_path;?>images/logo_fy.jpg" /></a>
            </div>
            <div class="nav">
            	<ul><?php foreach ($terms as $key => $vo) : ?>
                	<li class="<?php echo $nav_class[$key];?>"><a  <?php echo $root==$vo['id'] ? 'class="hover"' : ''; ?> href="<?php echo spUrl($vo['tpl'],'',array('tid'=>$vo['id'])); 
                   ?>"><?php echo $vo['name']; ?><span></span></a></li>  
                    <?php endforeach ?> 
                </ul>
            </div>
        </div>
    </div>
</div>