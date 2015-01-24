<?php $skin_path = $_smarty_tpl->getVariable('skin_path')->value; ?>
<?php   $p_term=spClass("db_term")->findAll(array('phone'=>'1',"parent_id"=>'0'));
             
?>
   <div id="footer" class="footer-page">
            <p class="footer-p">&copy;保定剑桥英语 技术支持：<a style="color: #FFF;" href="">万虎网络</a></p>
    </div>
<div data-role="panel" id="defaultpanel" data-prosition="right"> 
            <div class="panel-content"> 
                <div class="status_bar"></div>
					<ul id="accordion" class="accordion">
			          	<?php foreach ($p_term	as $key => $vo): ?>
						<li>
							<div class="link"><?php echo $vo['name'];?></div>
								<ul class="submenu">
									<?php  
                            			$c_term=spClass("db_term")->findAll(array("parent_id"=>$vo['id'],"phone"=>'1'));
                             		?>
                             		<?php foreach ($c_term as $key => $cvo): ?>
                             				<li>
                             					<a href="<?php echo spUrl($cvo['ptpl'],'',array('tid'=>$cvo['id'])) ;?>" data-ajax="false">
                             					<?php echo $cvo['name']; ?>
                             					</a>
                             				</li>
                             		<?php endforeach ?>
								</ul>
						</li>
						<?php endforeach ?>
					
						<li><div class="link"><a style="color:#fff;" href="<?php echo spUrl("notice","",array('tid'=>'29')) ?>" data-ajax="false">选择剑桥</a></div>
						<li><div class="link"><a style="color:#fff;" data-ajax="false" href="#">进入分园</a></div>
					</ul>
            </div>
        </div> 
        <!-- 右侧导航结束--> 
    </div>
</body>
<script type="text/javascript">
	$(document).ready(function() {
		$("#page-con").css("min-height",($(window).height()-130));
		$(".ui-panel").css("min-height",($(window).height()-90));

		$(function() {
			var Accordion = function(el, multiple) {
				this.el = el || {};
				this.multiple = multiple || false;

				// Variables privadas
				var links = this.el.find('.link');
				// Evento
				links.on('click', {
					el: this.el, multiple: this.multiple
				}, this.dropdown)
			}

			Accordion.prototype.dropdown = function(e) {
				var $el = e.data.el;
					$this = $(this),
					$next = $this.next();

				$next.slideToggle();
				$this.parent().toggleClass('open');

				if (!e.data.multiple) {
					$el.find('.submenu').not($next).slideUp().parent().removeClass('open');
				};
			}	

			var accordion = new Accordion($('#accordion'), false);
		});

	});
</script>