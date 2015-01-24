<?php $skin_path = $_smarty_tpl->getVariable('skin_path')->value; ?>
<?php   $p_term=spClass("db_term")->findAll(array('phone'=>'1',"parent_id"=>'0'));
       
?>
        <div id="header">
            <div class="header-top">
                <div class="container clearFloat">
                    <div class="logo_wrapper">
                        <a href="index.html" class="logo scroll-to">
                            <img src="<?php echo $skin_path; ?>images/logo.png" alt="剑桥" class="img-responsive-old">
                        </a>
                    </div>
                    <button id="nav-button" type="button">
                        <span class="sr-only">Toggle navigation</span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                    </button>
                </div>
            </div>
            <div class="container navbar-box">
                <div class="navbar collapse">
                    <ul class="navbar-nav clearfix">
                    <?php foreach ($p_term as $key => $vo): 
                    if($key=="0"){
                        $display="block";
                        $class="class='active'";
                    }else{
                        $display="none";
                        $class="";
                    }
                    ?>
                         <li class="sub-menua">
                            <div class="linka">
                                <a <?php echo $class; ?>  href="#"><?php echo $vo['name']; ?></a>
                            </div>
                            <?php  
                            $c_term=spClass("db_term")->findAll(array("parent_id"=>$vo['id'],"phone"=>'1'));
                             ?>
                            <ul class="sub-menu" id="tab_kc<?php echo $key+1; ?>" style="display: <?php echo $display; ?>;">
                                <?php foreach ($c_term as $key => $child): ?>
                                <li><a href="<?php echo spUrl($child['ptpl'],'',array('tid'=>$child['id'])) ;?> " data-aiax="false"><?php echo $child['name'] ?></span></a>
                                </li>
                                <?php endforeach ?>
                                
                            </ul> 
                        </li>
                    <?php endforeach ?>
                       
                        
                        <li class=" sub-menua"><div class="linka"><a href="<?php echo spUrl("notice","",array('tid'=>'29')) ?>" data-ajax="false">选择剑桥</a></div>
                        </li>
                        <li class=" sub-menua"><div class="linka"><a href="<?php echo spUrl("garden","",array('tid'=>'29')) ?>" data-ajax="false">进入分园</a></div>
                        </li>
                    </ul>
                </div>
            </div>
        </div>
