<?php $listTree = $_smarty_tpl->getVariable('listTree')->value;?>
<?php $list     = $_smarty_tpl->getVariable('list')->value;?>
<?php 
    $parent_ids = array();
    $strList = '<option value ="0">根目录</option>';
    foreach ($list as $key => $value) {
        $parent_ids[$value['id']] = $value['parent_id'];
        $strList = $strList . '<option value ="'.$value['id'].'">'.$value['name'].'</option>';
    }
 ?>
<?php
$GLOBALS['count_aa'] = 0;
function listTreeDump($array,$strList){   
?>
<?php foreach ($array as $k => $vo): ?>
    <tr class="table_hover">
        <th width="20">
            <input type="hidden" name="<?php echo $vo['id']?>[id]" value="<?php echo $vo['id']; ?>" />
        </th>
        <th width="30" class="m_title">
            <input type="text" name="<?php echo $vo['id']?>[order]" value="<?php echo $vo['order']; ?>" style="margin-left:10px;width: 50px;text-align: center;height: 20px;line-height: 20px;" />
        </th>
        <th width="300" style="text-align: left;">
            <!-- <?php echo str_repeat('<span style="display:inline-block;width:15px;"></span>',$GLOBALS['count_aa']) ?> -->
            <input type="text" name="<?php echo $vo['id']?>[name]" value="<?php echo $vo['name']; ?>" style="text-align: left;height: 20px;line-height: 20px;" />
        </th>
        <th width="300">
            <select name="<?php echo $vo['id']?>[parent_id]">
                <?php echo $strList; ?>
            </select>
        </th>
        <td class="fun_con">
            <a class="f_delete" href="javascript:;" id="del_<?php echo $vo['id']?>" title="删除">删除</a>
        </td>
    </tr>
    <?php 
        if(!empty($vo['children'])){
            $GLOBALS['count_aa'] ++;
            listTreeDump($vo['children'], $strList);
            $GLOBALS['count_aa'] = 0;
        }
     ?>

<?php endforeach; ?>

<?php } ?>

<?php listTreeDump($listTree, $strList); ?>

<tr class="table_hover">
    <th width="20">
        
    </th>
    <th width="30" class="m_title">
        <input type="text" name="order" value="" style="margin-left:10px;width: 50px;text-align: center;height: 20px;line-height: 20px;" />
    </th>
    <th width="300" style="text-align: left;">
        <?php echo str_repeat('<span style="display:inline-block;width:15px;"></span>',$GLOBALS['count_aa']) ?>
        <input type="text" name="name" value="" style="text-align: left;height: 20px;line-height: 20px;" />
    </th>
    <th width="300">
        <select name="parent_id">
            <?php echo $strList; ?>
        </select>
    </th>
    <td class="fun_con">
        <a href="javascript:;" class="add" title="添加">添加</a>
    </td>
</tr>

<script type="text/javascript">
    $(document).ready(function() {
        var parent_select = jQuery.parseJSON('<?php echo json_encode($parent_ids); ?>');
        $.each(parent_select, function(key, val) {
            $("select" + key + '[parent_id]')
            $("select[name='" + key + "[parent_id]']").get(0).value = val;
        });
        $(".add").live('click',function(){
            var obj = $(this).parent("td").parent("tr");
            var postData = {
                name : obj.find("input[name='name']").val(),
                order : obj.find("input[name='order']").val(),
                parent_id : obj.find("select[name='parent_id']").val()
            };
            $.post('<?php echo spUrl("admin","term",array("do"=>"add"))?>', postData, function(data) {
                data = jQuery.parseJSON(data);
                if(data.status === 1){
                    alert("添加成功！");
                    window.location.reload();
                }else {
                    alert("添加失败！");
                }
            });
        });
    });
</script>
