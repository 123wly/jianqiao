<?php $userInfo  = $_smarty_tpl->getVariable('info')->value; ?>
<tr>
    <td class="t_title">用户名</td>
    <td class="c_font c_input">
        <input type="text" value="<?php echo $userInfo['username'] ?>" onchange="changeInfo(this)" />
        
    </td>
</tr>
<tr>
    <td class="t_title">管理员</td>
    <td class="c_font c_input">
        <input type="radio" value="0" name="admin" <?php echo $userInfo["admin"] == 0 ? ' checked="checked"' : "";?> style="width:20px;" />否
        <input type="radio" value="1" name="admin" <?php echo $userInfo["admin"] == 1 ? ' checked="checked"' : "";?> style="width:20px;" />是
    </td>
</tr>
<tr>
    <td class="t_title">角色</td>
    <td class="c_font c_input">
        <select name="role">
            <?php foreach ($GLOBALS['spConfig']["urole"] as $key => $value): ?>
                <option value="<?php echo $key; ?>"><?php echo $value; ?></option>
            <?php endforeach ?>
        </select>
        <script type="text/javascript">
        $(document).ready(function() {
            $("select[name='role']").get(0).value = <?php echo $userInfo['role']; ?>;
        });
        </script>
    </td>
</tr>




<script type="text/javascript">
    function changeInfo(obj){
        console.log(obj);
        artDialog({
            id: 'Confirm',
            fixed: true,
            lock: true,
            width:'200px',
            content: '你确定要修改吗？',
            ok: function () {
              
            },
            cancel: function(){}
        });
    }
</script>