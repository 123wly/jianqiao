<?php $skin_path = $_smarty_tpl->getVariable('skin_path')->value; ?>
<?php $schools = $_smarty_tpl->getVariable('schools')->value; $schools = implode("|",$schools);?>
<?php $articles  = spClass('db_article')->findAll(array('term_id'=>'29',"uid"=>"1"),'id desc','id,tpl,title','8');?>
<style>
    .foot_top ul li a {
        color: #FFF;
    }
</style>

<!-- <div id="right_xf">
    <ul>
        <li class="bm"><a href="{spUrl c=wybm tid=27}" title="报名"><span>我要报名</span></a></li>
        <li class="kf"><a target="_blank" href="http://wpa.qq.com/msgrd?v=3&uin=435690026&site=qq&menu=yes" title="客服"><span>在线客服</span></a></li>
        <li class="hdzs"><a href="{spUrl c=life tid=20}" title="活动展示"></a></li>
        <li class="ysfb"><a href="{spUrl c=park tid=2}" title="园所分布"></a></li>
        <li class="jrwm"><a href="{spUrl c=jiamenjianqiao tid=8}" title="加入我们"></a></li>
        <li class="fhdb"><a href="#top" title="返回顶部"></a></li>
    </ul>
</div> -->

<div id="right_xf">
    <ul>
        <li class="bm"><a href="" title="报名"><span>我要报名</span></a></li>
        <li class="kf"><a href="" title="客服"><span>在线客服</span></a></li>
        <li class="hdzs"><a href="" title="活动展示"><span>活动展示</span></a></li>
        <li class="ysfb"><a href="" title="园所分布"><span>园所分布</span></a></li>
        <li class="jrwm"><a href="" title="加入我们"><span>加入我们</span></a></li>
    </ul>
    <p class="fhdb"><a href="#top" title="返回顶部"></a></p>
</div>

<div id="footer">
    <div class="foot_top">
         <p>
            <?php 
                $foot   = spClass("db_ad_unit")->find(array("title"=>"底部导航"),"","id");
                $footId = $foot["id"];
                $foot = spClass("db_ad_list")->findAll(array("auid"=>$footId));
                // var_dump($foot);
             ?>
             <?php foreach ($foot as $key => $value): ?>
                 <a href="<?php echo $value["body"]; ?>"><?php echo $value["title"]; ?></a>  <?php echo $key != count($foot) - 1 ? "|" : "";  ?> 
             <?php endforeach ?>
        </p>  
    </div>
    <div class="foot_bottom">
        <p><a href="">剑桥简介</a>   <a href="">为什么选择剑桥</a>   <a href="">联系我们</a>   <a href="">加盟剑桥</a>   <a href="">招聘信息</a></p>
        <p>保定剑桥教育集团版权所有 | Copyright 2015-2018 All rights reserved | 技术支持：万虎网络</p>
        <p>咨询热线：400-850-xxxx</p>
    </div>
</div>
<script type="text/javascript">
$(document).ready(function() {
    try{
        (autoComplete = {
            pop_len: 10,
            pop_cn: 'autoDis',
            hover_cn: 'cur',
            source: '<?php echo $schools; ?>'.split('|'),
            init: function() {
                this.setDom();
                return this;
            },
            bind: function(x) {
                if (x.getAttribute('type') != 'text' || x.nodeName != 'INPUT')
                    return null;
                var self = this;
                x.onkeyup = function(e) {
                    e = e || window.event;
                    var lis = self.pop.getElementsByTagName('li'),
                        lens = self.pop.getElementsByTagName('li').length,
                        n = lens,
                        temp;
                    if (e.keyCode == 38) { //键盘up键被按下
                        if (self.pop.style.display != 'none') {
                            for (var i = 0; i < lens; i++) { //遍历结果数据，判断是否被选中
                                if (lis[i].className) {
                                    temp = i;
                                } else
                                    n--;
                            }
                            if (n == 0) { //如果没有被选中的li元素，则选中最后一个
                                lis[lens - 1].className = self.hover_cn;
                                this.value = lis[lens - 1].innerHTML;
                            } else { //如果有被选中的元素，则选择上一个元素并赋值给input
                                if (lis[temp] == lis[0]) { //如果选中的元素是第一个孩子节点则跳到最后一个选中
                                    lis[lens - 1].className = self.hover_cn;
                                    this.value = lis[lens - 1].innerHTML;
                                    lis[temp].className = '';
                                } else {
                                    lis[temp - 1].className = self.hover_cn;
                                    this.value = lis[temp - 1].innerHTML;
                                    lis[temp].className = '';
                                }
                            }
                        } else //如果弹出层没有显示则执行插入操作，并显示弹出层
                            self.insert(this);
                    } else if (e.keyCode == 40) { //down键被按下，原理同up键
                        if (self.pop.style.display != 'none') {
                            for (var i = 0; i < lens; i++) {
                                if (lis[i].className)
                                    temp = i;
                                else
                                    n--;
                            }
                            if (n == 0) {
                                lis[0].className = self.hover_cn;
                                this.value = lis[0].innerHTML;
                            } else {
                                if (lis[temp] == lis[lens - 1]) {
                                    lis[0].className = self.hover_cn;
                                    this.value = lis[0].innerHTML;
                                    lis[temp].className = '';
                                } else {
                                    lis[temp + 1].className = self.hover_cn;
                                    this.value = lis[temp + 1].innerHTML;
                                    lis[temp].className = '';
                                }
                            }
                        } else
                            self.insert(this);
                    } else //如果按下的键既不是up又不是down那么直接去匹配数据并插入
                        self.insert(this);
                };
                x.onblur = function() { //这个延迟处理是因为如果失去焦点的时候是点击选中数据的时候会发现先无法触发点击事件
                    setTimeout(function() {
                        self.pop.style.display = 'none';
                    }, 300);
                };
                return this;
            },
            setDom: function() {
                var self = this;
                var dom = document.createElement('div'),
                    frame = document.createElement('iframe'),
                    ul = document.createElement('ul');
                document.body.appendChild(dom);
                with(frame) { //用来在ie6下遮住select元素
                    setAttribute('frameborder', '0');
                    setAttribute('scrolling', 'no');
                    style.cssText = 'z-index:-1;position:absolute;left:0;top:0;'
                }
                with(dom) { //对弹出层li元素绑定onmouseover，onmouseover
                    className = this.pop_cn;
                    appendChild(frame);
                    appendChild(ul);
                    onmouseover = function(e) { //在li元素还没有加载的时候就绑定这个方法，通过判断target是否是li元素进行处理
                        e = e || window.event;
                        var target = e.srcElement || e.target;
                        if (target.tagName == 'LI') { //添加样式前先把所有的li样式去掉，这里用的是一种偷懒的方式，没有单独写removeClass方法
                            for (var i = 0, lis = self.pop.getElementsByTagName('li'); i < lis.length; i++)
                                lis[i].className = '';
                            target.className = self.hover_cn; //也没有写addClass方法，直接赋值了
                        }
                    };
                    onmouseout = function(e) {
                        e = e || window.event;
                        var target = e.srcElement || e.target;
                        if (target.tagName == 'LI')
                            target.className = '';
                    };
                }
                this.pop = dom;
            },
            insert: function(self) {
                var bak = [],
                    s, li = [],
                    left = 0,
                    top = 0,
                    val = self.value;
                for (var i = 0, leng = this.source.length; i < leng; i++) { //判断input的数据是否与数据源里的数据一致
                    if (!!val && val.length <= this.source[i].length && this.source[i].indexOf(val) >= 0) {
                        bak.push(this.source[i]);
                    }
                }
                if (bak.length == 0) { //如果没有匹配的数据则隐藏弹出层
                    this.pop.style.display = 'none';
                    return false;
                } //这个弹出层定位方法之前也是用循环offsetParent，但发现ie跟ff下差别很大（可能是使用方式不当），所以改用这个getBoundingClientRect
                left = $(self).position().left;
                top = $(self).position().top + $("#input_schools").height();
                with(this.pop) {
                    style.cssText = 'width:' + self.offsetWidth + 'px;' + 'position:absolute;left:' + left + 'px;top:' + top + 'px;display:none;';
                    getElementsByTagName('iframe')[0].setAttribute('width', self.offsetWidth);
                    getElementsByTagName('iframe')[0].setAttribute('height', self.offsetHeight);
                    onclick = function(e) {
                        e = e || window.event;
                        var target = e.srcElement || e.target;
                        if (target.tagName == 'LI')
                            self.value = target.innerHTML;
                        this.style.display = 'none';
                    };
                }
                s = bak.length > this.pop_len ? this.pop_len : bak.length;
                for (var i = 0; i < s; i++)
                    li.push('<li>' + bak[i] + '</li>');
                this.pop.getElementsByTagName('ul')[0].innerHTML = li.join('');
                this.pop.style.display = 'block';
            }
        }).init().bind(document.getElementById('input_schools')).bind(document.getElementById('input_schoolss'));
    }catch(e){
        // console.log(e);
    }

});

</script>
<style type="text/css">
a {
    text-decoration: none;
}
#wrap {
    width: 650px;
    margin: 0 auto;
}
.txt {
    width: 210px;
    height: 25px;
    border: 1px solid #ccc;
    line-height: 25px;
    padding: 0 5px;
}
.autoDis {
    border: 1px solid #999;
    position: absolute;
    overflow: hidden;
}
.autoDis p {
    line-height: 25px;
    cursor: default;
    padding: 0 5px;
}
.autoDis li {
    line-height: 25px;
    cursor: default;
    padding: 0 5px;
    background-color: #fff;
}
.autoDis .cur {
    background: #ccc;
}
</style>