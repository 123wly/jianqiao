<?php $skin_path = $_smarty_tpl->getVariable('skin_path')->value; ?>
<?php $schools = $_smarty_tpl->getVariable('schools')->value; $schools = implode("|",$schools);?>
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
                <h3>为什么选择剑桥<span>Why Choose Jianqiao</span></h3>
                <li class="weix"><img src="<?php echo $skin_path?>images/wx.png" />
                </li>
            </ul>
        </div>
        <div class="foot_bottom">
            <p>北京万虎时代网络科技有限公司版权所有 | Copyright 2014-2015 All rights reserved | <span>技术支持：<a href="http://www.wanhunet.com">万虎网络</a></span> </p>
        </div>
    </div>
</div>
<script type="text/javascript">
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