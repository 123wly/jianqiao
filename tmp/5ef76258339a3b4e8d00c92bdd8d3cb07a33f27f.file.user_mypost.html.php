<?php /* Smarty version Smarty-3.0.6, created on 2014-12-27 15:16:04
         compiled from "tplv2\user_mypost.html" */ ?>
<?php /*%%SmartyHeaderCode:22749549e5cb44f2634-14746056%%*/if(!defined('SMARTY_DIR')) exit('no direct access allowed');
$_smarty_tpl->decodeProperties(array (
  'file_dependency' => 
  array (
    '5ef76258339a3b4e8d00c92bdd8d3cb07a33f27f' => 
    array (
      0 => 'tplv2\\user_mypost.html',
      1 => 1341154870,
      2 => 'file',
    ),
  ),
  'nocache_hash' => '22749549e5cb44f2634-14746056',
  'function' => 
  array (
  ),
  'has_nocache_code' => false,
)); /*/%%SmartyHeaderCode%%*/?>
<?php $_template = new Smarty_Internal_Template("require_header.html", $_smarty_tpl->smarty, $_smarty_tpl, $_smarty_tpl->cache_id, $_smarty_tpl->compile_id, null, null);
$_template->assign('gallery','yes'); echo $_template->getRenderedTemplate();?><?php $_template->updateParentVariables(0);?><?php unset($_template);?>
<script type="text/javascript">
$(document).ready(function(){ 
	do_run_post();
})
</script>
<div id="index">
    <div id="article">
	<?php $_template = new Smarty_Internal_Template("require_post.html", $_smarty_tpl->smarty, $_smarty_tpl, $_smarty_tpl->cache_id, $_smarty_tpl->compile_id, null, null);
 echo $_template->getRenderedTemplate();?><?php $_template->updateParentVariables(0);?><?php unset($_template);?>
	<div class="clear"></div>
	<div id="userpost">
	    <div class="post_bg">
	        <a href="javascript:;" onclick="do_run_post('')"><span class="current" id="curr_post">我发布</span></a>
	        <a href="javascript:;" onclick="do_run_post('draft')"><span id="curr_draft">草稿</span></a>
		</div>
	</div>
	<div class="clear"></div>
	<div id="feedArea">
		<div id="feed_loading"></div>
		<div id="feed_box"></div>
	</div>
	<div class="feed_none" id="feed_none" style="display:none">
		<div class="follow_font">
			<h2>暂时没有内容</h2>
		</div>
	</div>
	
	<div id="paging"></div>  
	<div class="clear"></div>
	
	</div>
	<div id="aside">
        <?php $_template = new Smarty_Internal_Template("require_sider.html", $_smarty_tpl->smarty, $_smarty_tpl, $_smarty_tpl->cache_id, $_smarty_tpl->compile_id, null, null);
 echo $_template->getRenderedTemplate();?><?php $_template->updateParentVariables(0);?><?php unset($_template);?>
    </div>
</div>
<?php $_template = new Smarty_Internal_Template("require_footer.html", $_smarty_tpl->smarty, $_smarty_tpl, $_smarty_tpl->cache_id, $_smarty_tpl->compile_id, null, null);
 echo $_template->getRenderedTemplate();?><?php $_template->updateParentVariables(0);?><?php unset($_template);?>