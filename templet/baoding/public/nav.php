<?php $skin_path = $_smarty_tpl->getVariable('skin_path')->value; ?>
<?php $terms = spClass("db_term")->findAll(array("uid"=>THEME_UID)); $terms = create_tree($terms);?>
<div class="right rnav">
    <div class="sousuo">
        <p class="wpd left"><a href="">用户登录</a><a href="">注册</a>
        </p>
        <p class="sous left">
            <input class="text left orgin_input" type="text" value="查找您附近的幼儿园" />
            <input class="tij right" type="submit" value="" />
        </p>
        <div class="clear"></div>
    </div>
    <div class="clear"></div>
    <div class="nav">
        <ul class="jMenu">
            <li class="drop-menu-effect shouye">
                <a href="<?php echo spUrl('index','')?>" title="">
                    <img src="<?php echo $skin_path;?>images/shouye.png" />
                </a>
            </li>
            <?php foreach ($terms as $key => $vo): ?>
                <li class="drop-menu-effect"> 
                    <a href="<?php echo empty($vo['children']) ? spUrl($vo['tpl'],"",array('tid'=>$vo['id'])) : 'javascript:;' ?>" title="<?php echo $vo['name']; ?>"><?php echo $vo['name']; ?></a>
                    <?php if (!empty($vo['children'])): ?>
                        <ul class="submenu">
                            <div class="jiant">
                                <img src="<?php echo $skin_path;?>images/jiantou.png" />
                            </div>
                            <div class="left">
                                <ul>
                                    <?php foreach ($vo['children'] as $k => $v): ?>
                                        <li><a href="<?php echo spUrl($v['tpl'],"",array('tid'=>$v['id'])); ?>"><?php echo $v['name'] ?></a></li>
                                    <?php endforeach ?>
                                </ul>
                            </div>
                            <div class="sxian"></div>
                            <div class="right">
                                <img src="<?php echo __ROOT__;?>/uploads/<?php echo $vo['cover']; ?>" />
                                <p><?php echo $vo['brief']; ?></p>
                            </div>
                        </ul>
                        <div class="clear"></div>
                    <?php endif ?>
                </li>
            <?php endforeach ?>
        </ul>
    </div>
    <script>
    function dropMenu(obj) {
        $(obj).each(function() {
            var theSpan = $(this);
            var theMenu = theSpan.find(".submenu");
            var tarHeight = theMenu.height();
            theMenu.css({
                height: 0,
                opacity: 0
            });

            var t1;

            function expand() {
                clearTimeout(t1);
                theSpan.find('a').addClass("selected");
                theMenu.stop().show().animate({
                    height: tarHeight,
                    opacity: 1
                }, 200);
            }

            function collapse() {
                clearTimeout(t1);
                t1 = setTimeout(function() {
                    theSpan.find('a').removeClass("selected");
                    theMenu.stop().animate({
                        height: 0,
                        opacity: 0
                    }, 200, function() {
                        $(this).css({
                            display: "none"
                        });
                    });
                }, 250);
            }

            theSpan.hover(expand, collapse);
            theMenu.hover(expand, collapse);
        });
    }

    $(document).ready(function() {

        dropMenu(".drop-menu-effect");

    });
    </script>
</div>