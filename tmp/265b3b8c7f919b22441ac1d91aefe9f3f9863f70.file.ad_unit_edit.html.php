<?php /* Smarty version Smarty-3.0.6, created on 2014-12-28 10:07:50
         compiled from "tplv2\admin/ad_unit_edit.html" */ ?>
<?php /*%%SmartyHeaderCode:8226549f65f6287961-12455711%%*/if(!defined('SMARTY_DIR')) exit('no direct access allowed');
$_smarty_tpl->decodeProperties(array (
  'file_dependency' => 
  array (
    '265b3b8c7f919b22441ac1d91aefe9f3f9863f70' => 
    array (
      0 => 'tplv2\\admin/ad_unit_edit.html',
      1 => 1341154848,
      2 => 'file',
    ),
  ),
  'nocache_hash' => '8226549f65f6287961-12455711',
  'function' => 
  array (
  ),
  'has_nocache_code' => false,
)); /*/%%SmartyHeaderCode%%*/?>
<?php $_template = new Smarty_Internal_Template('admin/header.html', $_smarty_tpl->smarty, $_smarty_tpl, $_smarty_tpl->cache_id, $_smarty_tpl->compile_id, null, null);
 echo $_template->getRenderedTemplate();?><?php $_template->updateParentVariables(0);?><?php unset($_template);?>
<?php if ($_smarty_tpl->getVariable('isshow')->value==1){?>
<div id="content">

    <div class="t_con">
	    <h3>广告位信息</h3>
		
		<table width="100%" cellpadding="0" cellspacing="0" border="0" class="table_padding">
			       <tr>
				       <td width="90" class="t_title">广告位ID</td>
					   <td class="c_font"><?php echo $_smarty_tpl->getVariable('rs')->value['id'];?>
</td>
				   </tr>
				   <tr>
				       <td class="t_title">广告位标题</td>
					   <td class="c_font"><?php echo $_smarty_tpl->getVariable('rs')->value['title'];?>
</td>
				   </tr>
				   <tr>
				       <td class="t_title">广告描述</td>
					   <td class="c_font"><?php echo $_smarty_tpl->getVariable('rs')->value['adesc'];?>
</td>
				   </tr>    
				   <tr>
				       <td class="t_title">广告位置截图</td>
					   <td class="co_img"><img src="<?php echo $_smarty_tpl->getVariable('syskin')->value;?>
/admin/style/ad_unit/<?php echo $_smarty_tpl->getVariable('rs')->value['img'];?>
" alt="#" /></td>
				   </tr>    
				   <tr>
                       <td class="t_title">排序:</td>
                       <td class="c_font"><?php echo $_smarty_tpl->getVariable('rs')->value['orders'];?>
</td>
				   </tr>
				   <tr>
                       <td class="t_title">是否显示:</td>
                       <td><?php if ($_smarty_tpl->getVariable('rs')->value['is_show']==1){?><div class="fun_yes" title="显示"></div><?php }else{ ?><div class="fun_no" title="隐藏"></div><?php }?></td>
                   </tr>
				   <?php if ($_smarty_tpl->getVariable('rs')->value['system']!=1){?>
				   <tr>
                       <td class="t_title">调用脚本</td>
                       <td>
					       <table class="table_code" cellpadding="0" cellspacing="0">
						       <tr>
								   <td colspan="3" class="table_tip">
								       <p>请把如下代码的：UNITID 替换成: <?php echo $_smarty_tpl->getVariable('rs')->value['id'];?>
</p>
									   <p>请把如下代码的：#DOM_ID 替换成你要展示广告的div</p>
									   <p>请把如下代码的：TIMELIMIT 替换成你需要刷新广告位的时间（3000为30秒）</p>
								   </td>
							   </tr>
							   <pre>
							   
							   <tr class="table_tr">
							       <td class="table_left">1.</td>
								   <td class="table_center"></td>
								   <td class="table_right tbpl_10">{if isset($adunit.UNITID) &amp;&amp; $adunit.UNITID.is_show == 1}</td>
							   </tr>
							   <tr class="table_tr">
							       <td class="table_left">2.</td>
								   <td class="table_center"></td>
								   <td class="table_right tbpl_10">&lt;div id=&quot;DOM_ID&quot;&gt;&lt;/div&gt;</td>
							   </tr>
							   <tr class="table_tr">
							       <td class="table_left">3.</td>
								   <td class="table_center"></td>
								   <td class="table_right tbpl_10">&lt;script&gt;</td>
							   </tr>
							   <tr class="table_tr">
							       <td class="table_left">4.</td>
								   <td class="table_center"></td>
								   <td class="table_right tbpl_30">$(document).ready(function(){</td>
							   </tr>
							   <tr class="table_tr">
							       <td class="table_left">5.</td>
								   <td class="table_center"></td>
								   <td class="table_right tbpl_50">ad_aside('#DOM_ID',UNITID);</td>
							   </tr>
							   <tr class="table_tr">
							       <td class="table_left">6.</td>
								   <td class="table_center"></td>
								   <td class="table_right tbpl_50">setInterval(function(){</td>
							   </tr>
							   <tr class="table_tr">
							       <td class="table_left">7.</td>
								   <td class="table_center"></td>
								   <td class="table_right tbpl_50">ad_aside('#DOM_ID',UNITID);</td>
							   </tr>
							   <tr class="table_tr">
							       <td class="table_left">8.</td>
								   <td class="table_center"></td>
								   <td class="table_right tbpl_50">}, TIMELIMIT);</td>
							   </tr>
							   <tr class="table_tr">
							       <td class="table_left">9.</td>
								   <td class="table_center"></td>
								   <td class="table_right tbpl_30">})</td>
							   </tr>
							   <tr class="table_tr">
							       <td class="table_left">10.</td>
								   <td class="table_center"></td>
								   <td class="table_right tbpl_10">&lt;/script&gt;</td>
							   </tr>
							   <tr class="table_tr">
							       <td class="table_left">11.</td>
								   <td class="table_center"></td>
								   <td class="table_right tbpl_10">{/if}</td>
							   </tr>
							   
							   </pre>
						   </table>
					   </td>
                   </tr>
				   <?php }?>
				   
				   
		 </table>
		
	</div>

	
	<div class="btn_area">
	    <input  type="button" value="返回" class="btn_return" id="_back" onclick="javascript:history.go(-1)" style="float:left;" />
	</div>

</div>
<?php }else{ ?>

<div id="content">
<form action="" method="post"  name="form1" id="form1">
    <div class="t_con">
	    <h3>编辑广告位</h3>
		
		<table width="100%" cellpadding="0" cellspacing="0" border="0" class="table_padding">
			       <tr>
				       <td width="90" class="t_title">广告位标题</td>
					   <td class="c_input"><input type="text" value="<?php echo $_smarty_tpl->getVariable('rs')->value['title'];?>
" name="title" /></td>
				   </tr>
				   <tr>
				       <td class="t_title">广告描述:</td>
                       <td class="c_input"><input type="text" value="<?php echo $_smarty_tpl->getVariable('rs')->value['adesc'];?>
" name="adesc" /></td>
				   </tr>
				   <tr>
				       <td class="t_title">广告位置截图:</td>
                       <td class="co_img c_input">
					       <img src="<?php echo $_smarty_tpl->getVariable('rs')->value['img'];?>
" alt="#" /><br />
						   <input type="text" name="img" value="<?php echo $_smarty_tpl->getVariable('rs')->value['img'];?>
" />
						</td>
				   </tr>    
				   <tr>
				       <td class="t_title">是否显示:</td>
                       <td class="c_radio"><label><input type="radio" name="is_show" id="is_show" value="1" <?php if ($_smarty_tpl->getVariable('rs')->value['is_show']==1){?>checked="checked"<?php }?>/>启用</label>
                                <label><input type="radio" name="is_show" id="is_show" value="0" <?php if ($_smarty_tpl->getVariable('rs')->value['is_show']==0){?>checked="checked"<?php }?>/>停用</label>
					   </td>
				   </tr>    
				   
	    </table>
		<input type="hidden" name="id" value="<?php echo $_smarty_tpl->getVariable('rs')->value['id'];?>
" />
		
	</div>
	<div class="btn_area">
	    <input  type="submit" class="btn_save" name="editUp" value="修改"/>
		<input  type="button" class="btn_return" value="返回" id="_back" />
    </div>
 
</form>   
</div>
<script type="text/javascript">
    $(function(){
        $("#_back").click(function(){
            window.location.href="<?php echo spUrl('admin','adUnit');?>
";
        });
        //复制调用地址
    });
</script>
<?php }?>
<?php $_template = new Smarty_Internal_Template('admin/footer.html', $_smarty_tpl->smarty, $_smarty_tpl, $_smarty_tpl->cache_id, $_smarty_tpl->compile_id, null, null);
 echo $_template->getRenderedTemplate();?><?php $_template->updateParentVariables(0);?><?php unset($_template);?>
