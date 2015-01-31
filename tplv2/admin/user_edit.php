<?php $userInfo  = $_smarty_tpl->getVariable('info')->value; ?>
<tr>
    <td class="t_title">用户名</td>
    <td class="c_font c_input">
        <input type="text" value="<?php echo $userInfo['username'] ?>" name="username" />
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
    <td class="t_title">用户角色</td>
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

<tr>
    <td class="t_title">用户类型</td>
    <td class="c_font c_input">
        <select name="type">
            <?php foreach ($GLOBALS['spConfig']["utype"] as $key => $value): ?>
                <option value="<?php echo $key; ?>"><?php echo $value; ?></option>
            <?php endforeach ?>
        </select>
        <script type="text/javascript">
        $(document).ready(function() {
            $("select[name='type']").get(0).value = <?php echo $userInfo['type']; ?>;
        });
        </script>
    </td>
</tr>
<tr>
    <td class="t_title">所属用户UID</td>
    <td class="c_font c_input">
        <input type="text" value="<?php echo $userInfo['puid'] ?>" name="puid" />
    </td>
</tr>
<tr>
    <td class="t_title" style="color: red;">
        注意:
    </td>
    <td class="c_font c_input">
        -------------------------------------------<br />
        <span style="color:red;">以下配置仅在分园和主园中生效</span><br />
        -------------------------------------------
    </td>
</tr>
<tr>
    <td class="t_title">电脑模板</td>
    <td class="c_font c_input">
        <input type="text" value="<?php echo $userInfo['theme'] ?>" name="theme" />
    </td>
</tr>
<tr>
    <td class="t_title">手机模板</td>
    <td class="c_font c_input">
        <input type="text" value="<?php echo $userInfo['mtheme'] ?>" name="mtheme" />
    </td>
</tr>
<tr>
    <td class="t_title">访问域名前缀</td>
    <td class="c_font c_input">
        <input type="text" value="<?php echo $userInfo['realm'] ?>" name="realm" />
    </td>
</tr>
<input type="hidden" value="<?php echo $_GET['uid']; ?>" id="eUid" />
<tr>
    <td class="t_title" style="color: red;">
        注意:
    </td>
    <td class="c_font c_input">
        -------------------------------------------<br />
        <span style="color:red;">以上配置仅在分园和主园中生效</span><br />
        -------------------------------------------
    </td>
</tr>


<script type="text/javascript">
    $(document).ready(function() {
        $("input,select").change(function(){
            changeInfo(this);
        });
    });
    function changeInfo(obj){
        artDialog({
            id: 'Confirm',
            fixed: true,
            lock: true,
            width:'200px',
            content: '你确定要修改吗？',
            ok: function () {
                var postData = {
                    name : $(obj).attr("name"),
                    val  : $(obj).val(),
                    eUid : $("#eUid").val()
                }
                $.post('<?php echo spUrl("admin","userEdit"); ?>', postData, function(data) {
                    if(data === '1'){
                        alert("更新成功");
                    }else {
                        alert("更新失败");
                    }
                });
            },
            cancel: function(){
                window.location.reload();
            }
        });
    }
</script>