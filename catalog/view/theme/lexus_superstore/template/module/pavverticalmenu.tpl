<div id="pav-verticalmenu" class="box pav-verticalmenu highlighted">
	<div class="box-heading">
		<span><?php echo $this->language->get('text_catalog_menu'); ?></span>	
		<span class="shapes round"><em class="shapes bottom"></em></span>	
	</div>
	<div class="box-content">
		<div class="navbar navbar-default">
			<div id="verticalmenu" class="verticalmenu" role="navigation">
				<div class="navbar-header">
					<a href="javascript:;" data-target=".navbar-collapse" data-toggle="collapse" class="navbar-toggle">
						<span class="icon-bar"></span>		        
					</a>
					<div class="collapse navbar-collapse navbar-ex1-collapse">
						<?php echo $treemenu; ?>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>