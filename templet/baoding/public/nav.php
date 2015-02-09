<?php $skin_path = $_smarty_tpl->getVariable('skin_path')->value; ?>
<?php $terms = spClass("db_term")->findAll(array("uid"=>THEME_UID,"nav"=>'1'),"`order` asc"); $terms = create_tree($terms);?>
<div class="right rnav">
    <form action="<?php echo spUrl('search',''); ?>" method="get">
        <div class="sousuo">
            <p class="wpd left">
                <a href="http://0032.jiaoyinet.com"><img src="<?php echo $skin_path; ?>images/yonghu del.png" /></a>
                <a href="http://0032.jiaoyinet.com"><img src="<?php echo $skin_path; ?>images/zhuce.png" /></a>
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
                    <img src="<?php echo $skin_path;?>images/nav/shouye.png" />
                </a>
            </li>
            <?php foreach ($terms as $key => $vo): ?>
                <li class="drop-menu-effect" style="background-color: transparent;"> 
                    <a style="" href="<?php echo empty($vo['children']) ? spUrl($vo['tpl'],"",array('tid'=>$vo['id'])) : 'javascript:;' ?>" title="<?php echo $vo['name']; ?>">
                        <?php $imgname = str_replace(" ","_",strtolower($vo["en_name"])); ?>
                        <img src="<?php echo $skin_path; ?>images/nav/<?php echo $imgname; ?>.png" />
                    </a>
                    <?php if (!empty($vo['children'])): ?>
                        <ul class="submenu" style="margin-left: -100px; +margin-top:6px;">
                            <div class="jiant" style="left: 129px;+left:90px;+top: -25px;">
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
                                                    <?php if ($v1["recommend"] == 1): ?>
                                                        <?php $redLi = ' style="color:red;"'; ?>
                                                    <?php else: ?>
                                                        <?php $redLi = ''; ?>
                                                    <?php endif; ?>
                                                    <a target="_blank" href="<?php echo $v1['tpl'] ?>" <?php echo $redLi; ?>><?php echo $v1["title"]; ?></a>
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
                // theSpan.find('a').addClass("selected");
                
                var oldSrc = theSpan.find('a').find("img").attr("src");
                if(oldSrc.indexOf("_h.png") < 0){
                    var newSrc = oldSrc.replace(".png","_h.png");
                    theSpan.find('a').find("img").attr("src",newSrc);
                }

                theMenu.stop().show().animate({
                    height: tarHeight,
                    opacity: 1
                }, 200);
            }

            function collapse() {
                clearTimeout(t1);
                t1 = setTimeout(function() {
                    // theSpan.find('a').removeClass("selected");
                    
                    var oldSrc = theSpan.find('a').find("img").attr("src");
                    var newSrc = oldSrc.replace("_h","");
                    theSpan.find('a').find("img").attr("src",newSrc);

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
        $(window).scroll(function(){
            var top = 40 - $(window).scrollTop();
            if(top > 0){
                $("#header").css("top", top + "px");
            }
            if(top < 0 || top ===0){
                $("#header").css("top","0px");
            }
            
        });

    });
    </script>
</div>