

{include file='admin/header.html'}

<div id="content">
    <!--end-->
    <div class="con_cpage">
    	<style type="text/css">
    		th {
    			text-align: center;
    		}
    	</style>
        <form action="{spUrl c=admin a=usertag clean=true}" method="post">
            <table width="100%" border="0" cellspacing="0" cellpadding="0" class="table_model">
                <tr class="table_title">
                    <!-- →↓ -->
                    <th width="20"></th>
                    <th width="30" class="m_title">排序</th>
                    <th width="300">标题</th>
                    <th width="200">父类标题</th>
                    <th width="110">操作</th>
                </tr>
                {include_php './tplv2/admin/term_table.php'} 
                
                {foreach from=$listTree item=vo}
                    <tr class="table_hover">
                        <th width="20"></th>
                        <th width="30" class="m_title">
                            <input type="text" value="{$vo.order}" style="margin-left:10px;width: 50px;text-align: center;height: 20px;line-height: 20px;" />
                        </th>
                        <th width="300" style="text-align: left;">
                            <input type="text" value="{$vo.name}" style="text-align: left;height: 20px;line-height: 20px;" />
                        </th>
                        <th width="300">

                        </th>
                        <td class="fun_con">
                            <a class="f_delete" href="{spUrl c=admin a=cpage del=$vo.id}" title="删除">删除</a>
                        </td>
                    </tr>
                {/foreach}
            </table>
            <input type="submit" value="保存" style="margin: 50px;float: right;" />
        </form>
    </div>

</div>
{include file='admin/footer.html'}
