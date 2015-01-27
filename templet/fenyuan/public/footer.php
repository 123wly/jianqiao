<?php $skin_path = $_smarty_tpl->getVariable('skin_path')->value; ?>
<?php $articles  = spClass('db_article')->findAll(array('term_id'=>'29',"uid"=>"1"),'id desc','id,tpl,title','8');?>
<style>
    .foot_top ul li a {
        color: #FFF;
    }
</style>
<div id="footer">
	<div class="main">
    	<div class="foot_top">
            <ul>
            	<h3>为什么选择剑桥<span>Why Choose Jianqiao</span></h3>
                 <?php foreach ($articles as $key => $vo): ?>
                    <li><a href="<?php echo spUrl($vo['tpl'],'',array('id'=>$vo['id'])); ?>"><?php echo $vo['title']; ?></a></li>
                <?php endforeach ?>
            </ul>
            <div class="kongge"></div>
            <ul>
            	<h3>其他产业<span>Other Industries</span></h3>
                <li>华顿英语培训学校</li>
                <li>剑桥小学</li>
                <li>剑桥体育用品有限公司</li>
            </ul>
            <div class="kongge"></div>
            <ul>
            	<h3>联系我们<span>Contact Us</span></h3>
                <li>幼儿园客服热线：400 0312 501</li>
                <li>培训部客服热线：400 0312 502</li>
                <li>成人部客服热线：400 0312 503</li>
                <li>总部地址：高开区盛兴路369号</li>
                <li>总部电话：2035995 5992828</li>
            </ul>
            <div class="kongge"></div>
            <ul>
            	<h3>欢迎关注<span>Welcome Attention</span></h3>
                <li class="weix"><img src="<?php echo $skin_path; ?>images/wx.png" /></li>
            </ul>
        </div>
        <div class="foot_bottom">
        	<p>北京万虎时代网络科技有限公司版权所有 | Copyright 2014-2015 All rights reserved | <span>技术支持：<a href="http://www.wanhunet.com">万虎网络</a></span> </p>
        </div>
    </div>
</div>
</body>
</html>
<script type="text/javascript">
$(function() {
    $('.orgin_input').bind({
        focus: function() {
            if (this.value == this.defaultValue) {
                this.value = "";
            }
        },
        blur: function() {
            if (this.value == "") {
                  this.value = this.defaultValue;
            }
        }
    });
});
$(document).ready(function() {
    var firstLia = $(".nav > ul > li:first > a").attr("class");
    if(firstLia === "hover"){
        $(".nav > ul > li:first").addClass("hoverd");
        $(".nav > ul > li:first > a").addClass("gywmdj");
    }
    $(".nav > ul > li:first > a").hover(function() {
        $(".nav > ul > li:first").addClass("hoverd");
        $(".nav > ul > li:first > a").addClass("gywmdj");
    }, function() {
        if(firstLia !== "hover"){
            $(".nav > ul > li:first").removeClass("hoverd");
            $(".nav > ul > li:first > a").removeClass("gywmdj");
        }
    });
});
</script>