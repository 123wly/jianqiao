   <script src="./statics/showdate.js"></script>
<div class="gy_bottom">
            	<h4>幼儿园预约试听</h4>
                <h6>预约电话：0312-1234567</h6>
                <form action="<?php echo spUrl("publicc","bmorder"); ?>" method="post">
                <table>
                  <tr>
                    <td class="wenz left">宝宝姓名：</td>
                    <td class="text left"><input name="bbname" value="" type="text" /></td>
                  </tr>
                  <tr>
                    <td class="left wenz">&nbsp;</td>
                    <td class="left">
                    	<input type="radio" name="gender" value="男" checked="checked" />男
                    	<input type="radio" name="gender" value="女" checked="checked" />女
                    </td>
                  </tr>
                  <tr>
                    <td class="wenz left">联系电话：</td>
                    <td class="text left"><input name="tel" value="" type="text" /></td>
                  </tr>
                  <tr>
                    <td class="wenz left">试听时间：</td>
                    <td class="text left">
                      <input name="ruyuan" id="ruyuan1" value="" type="text" onclick="return Calendar('ruyuan1');" /></td>
                  </tr>
            </table>
			     <p><input name="" type="submit" value="提 交" /></p>
            </div>
          </form>
