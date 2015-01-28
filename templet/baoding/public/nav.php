<?php $skin_path = $_smarty_tpl->getVariable('skin_path')->value; ?>
<?php $terms = spClass("db_term")->findAll(array("uid"=>THEME_UID,"nav"=>'1'),"`order` asc"); $terms = create_tree($terms);?>
<div class="right rnav">
    <form action="<?php echo spUrl('search',''); ?>" method="get">
        <div class="sousuo">
            <p class="wpd left">
                <a href="http://0032.jiaoyinet.com">用户登录</a>
                <a href="http://0032.jiaoyinet.com">注册</a>
            </p>
            <p class="sous left">
                <input type="hidden" name="c" value="search" />
                <input class="text left orgin_input" type="text" name="keyword" value="搜索本站" />
                <input class="tij right" type="submit" value="" />
            </p>
            <div class="clear"></div>
        </div>
    </form>
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
                            <?php if ($vo["name"] == "剑桥分园"): ?>
                                <?php foreach ($vo["children"] as $k => $v): ?>
                                    <div class="left">
                                        <ul>
                                            <h3><?php echo $v["name"]; ?></h3>
                                            <?php $ars = spClass("db_article")->findAll(array("term_id"=>$v["id"])); ?>
                                            <?php foreach ($ars as $k1 => $v1): ?>
                                                <li>
                                                    <a href="<?php echo $v1['tpl'] ?>"><?php echo $v1["title"]; ?></a>
                                                </li>
                                            <?php endforeach ?>
                                            <p>
                                                <a href="<?php echo spUrl($v['tpl'],'',array('tid'=>$v['id'])) ?>">更多...</a>
                                            </p>
                                        </ul>
                                    </div>
                                    <div class="sxian"></div>
                                <?php endforeach ?>
                            <?php else: ?>
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
                            <?php endif ?>
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