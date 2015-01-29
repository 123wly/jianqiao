<?php $skin_path = $_smarty_tpl->getVariable('skin_path')->value; ?>
<?php $root=$tid=$_GET['tid'];
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
 $term=spClass("db_term")->find(array('id'=>$root));
 ?>

<div class="tptop">
    	<img src="<?php echo $skin_path;?>images/<?php echo $term['cover']; ?>" />
</div>