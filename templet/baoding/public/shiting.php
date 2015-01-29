<?php $skin_path = $_smarty_tpl->getVariable('skin_path')->value; ?>
<?php $schools = $_smarty_tpl->getVariable('schools')->value; ?>
<div class="right rhz">
    <h3>幼儿园预约试听</h3>
    <form action="<?php echo spUrl('publicc','bmorder'); ?>" method="post">
        <table>
            <tr>
                <td class="wenz left">宝宝姓名：</td>
                <td class="text left">
                    <input type="text" value="" name="bbname" />
                </td>
            </tr>
            <tr>
                <td class="wenz left">联系电话：</td>
                <td class="text left">
                    <input type="text" value="" name="tel" />
                </td>
            </tr>
            <!-- <tr>
                <td class="wenz left">选择省份：</td>
                <td class="text left">
                    <select name="">
                        <option>河北省</option>
                        <option>河北省</option>
                        <option>河北省</option>
                        <option>河北省</option>
                        <option>河北省</option>
                    </select>
                </td>
            </tr>
            <tr>
                <td class="wenz left">选择区县：</td>
                <td class="text left">
                    <select name="">
                        <option>河北省</option>
                        <option>河北省</option>
                        <option>河北省</option>
                        <option>河北省</option>
                        <option>河北省</option>
                    </select>
                </td>
            </tr> -->
            <tr>
                <td class="wenz left">选择园所：</td>
                <td class="text left">
                    <input id="input_schools" type="text" name="xuexiao" class="txt">
                </td>
            </tr>
            <tr>
                <td class="wenz left">试听时间：</td>
                <td class="text left">
                    <input type="text" value="" name="stdate" />
                </td>
            </tr>
            <!-- <tr>
                <td class="wenz left">验证码：</td>
                <td class="yzm left">
                    <input class="left" type="text" value="" name="" />
                    <span class="left"><img src="<?php echo $skin_path; ?>images/yanzhenm.jpg" /></span>
                </td>
            </tr> -->
        </table>
        <p>
            <input type="submit" value="提交" />
        </p>
    </form>
</div>
<div class="clear"></div>