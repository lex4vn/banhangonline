<?php
	$cols = 4;
	$span = 12/$cols;
	$active = 'latest';
	$id = rand(1,time()+9);	
	$bspan = 12-$block_width;
	$themeConfig = (array)$this->config->get('themecontrol');
	$categoryConfig = array(
		'category_pzoom'                     => 1,
		'quickview'                          => 0,
		'show_swap_image'                    => 0,
	);
	$categoryConfig     = array_merge($categoryConfig, $themeConfig );
	$categoryPzoom 	    = $categoryConfig['category_pzoom'];
	$quickview          = $categoryConfig['quickview'];
	$swapimg            = $categoryConfig['show_swap_image'];
	$categoryPzoom = isset($themeConfig['category_pzoom']) ? $themeConfig['category_pzoom']:0; 

?>
<div class="box featured <?php echo $addition_class;?>">
	<div class="box-heading"><span><?php echo $heading_title; ?></span></div>
	<div class="box-content">
 		<div class="box-products slide" id="productfeatured<?php echo $id;?>">
 			<div class="featured-banner">
 				<?php if ( $banner ) { ?>
				<img src="image/<?php echo $banner; ?>">
 				<?php } ?>
				<?php if( trim($message) ) { ?>
				<div class="box-description"><?php echo $message;?></div>
				<?php } ?>
			</div>
			<div class="featured-products">
						<?php if( count($products) > $itemsperpage ) { ?>
						<div class="carousel-controls">
							<a class="carousel-control left fa fa-angle-left" href="#productfeatured<?php echo $id;?>" data-slide="prev"></a>
							<a class="carousel-control right fa fa-angle-right" href="#productfeatured<?php echo $id;?>" data-slide="next"></a>
						</div>
						<?php } ?>
						<div class="carousel-inner">		
						 <?php  $pages = array_chunk( $products, $itemsperpage);  ?>	
						  <?php foreach ($pages as  $k => $tproducts ) {   ?>
								<div class="item <?php if($k==0) {?>active<?php } ?>">
									<?php foreach( $tproducts as $i => $product ) {  $i=$i+1;?>
										<?php if( $i%$cols == 1 ) { ?>
										  <div class="row box-product">
										<?php } ?>
											  <div class="col-lg-<?php echo $span;?> col-md-<?php echo $span;?> col-sm-6 col-xs-12 product-cols">
											  	<div class="product-block">
												<?php if ($product['thumb']) { ?>
												<div class="image">
													<?php if( $product['special'] ) {   ?>
													<span class="product-label product-label-special"><span><?php echo $this->language->get( 'text_sale' ); ?></span></span>
													<?php } ?>
													<a href="<?php echo $product['href']; ?>"><img class="img img-responsive" src="<?php echo $product['thumb']; ?>" alt="<?php echo $product['name']; ?>" /></a>


													<!-- zoom image-->
													<?php if( $categoryPzoom ) { $zimage = str_replace( "cache/","", preg_replace("#-\d+x\d+#", "",  $product['thumb'] ));  ?>
														<a href="<?php echo $zimage;?>" class="btn btn-theme-default colorbox product-zoom" title="<?php echo $product['name']; ?>"><i class="fa fa-search-plus"></i></a>
													<?php } ?>

													<!-- Show Swap -->
													<?php
											  			if( $swapimg ){
											      		$product_images = $this->model_catalog_product->getProductImages( $product['product_id'] );
														if(isset($product_images) && !empty($product_images)) {
															$thumb2 = $this->model_tool_image->resize($product_images[0]['image'],  $this->config->get('config_image_product_width'),  $this->config->get('config_image_product_height') );
														?>
														<a class="hover-image" href="<?php echo $product['href']; ?>"><img class="img-responsive" src="<?php echo $thumb2; ?>" alt="<?php echo $product['name']; ?>"></a>
													<?php } } ?>
													<!-- Show Swap -->

													<?php //#2 Start fix quickview in fw?>
														<?php if ($quickview) { ?>
															<a class="pav-colorbox btn btn-theme-default" href="<?php echo $this->url->link("themecontrol/product",'product_id='.$product['product_id'] );?>"><em class="fa fa-eye"></em><span><?php echo $this->language->get('quick_view'); ?></span></a>
														<?php } ?>
													<?php //#2 End fix quickview in fw?>

												</div>
												<?php } ?>
												<div class="product-meta">
													<div class="name"><a href="<?php echo $product['href']; ?>"><?php echo $product['name']; ?></a></div>
													<div class="description">
														<?php echo utf8_substr( strip_tags($product['description']),0,58);?>...
													</div>
													<?php if ($product['price']) { ?>
													<div class="price">
													  <?php if (!$product['special']) { ?>
													  <?php echo $product['price']; ?>
													  <?php } else { ?>
													  <span class="price-old"><?php echo $product['price']; ?></span> 
													  <span class="price-new"><?php echo $product['special']; ?></span>
													  <?php } ?>
													</div>
													<?php } ?>
													<?php if ($product['rating']) { ?>
												    <div class="rating"><img src="catalog/view/theme/<?php echo $this->config->get('config_template');?>/image/stars-<?php echo $product['rating']; ?>.png" alt="<?php echo $product['rating']; ?>"></div>
												    <?php } else { ?>
											        <div class="norating"><img alt="0" src="catalog/view/theme/<?php echo $this->config->get('config_template');?>/image/stars-0.png"></div>
											        <?php } ?>
													<div class="action">
														<div class="cart">
															<button onclick="addToCart('<?php echo $product['product_id']; ?>');" class="btn btn-shopping-cart">
																<span><?php echo $button_cart; ?></span>
															</button>
														</div>
														<div class="button-group">
															<div class="wishlist">
																<a onclick="addToWishList('<?php echo $product['product_id']; ?>');" title="<?php echo $this->language->get("button_wishlist"); ?>" class="fa fa-heart product-icon">
																	<span><?php echo $this->language->get("button_wishlist"); ?></span>
																</a>	
															</div>
															<div class="compare">			
																<a onclick="addToCompare('<?php echo $product['product_id']; ?>');" title="<?php echo $this->language->get("button_compare"); ?>" class="fa fa-refresh product-icon">
																	<span><?php echo $this->language->get("button_compare"); ?></span>
																</a>	
															</div>
														</div>
													</div>
												  </div>
												</div>
											</div>
									  
									  <?php if( $i%$cols == 0 || $i==count($tproducts) ) { ?>
										 </div>
										<?php } ?>
									<?php } //endforeach; ?>
								</div>
						  <?php } ?>
						</div> 
				</div> 
		</div>
 </div> </div>


<script>
 
$('#productfeatured<?php echo $id;?>').carousel({interval:false,auto:false,pause:'hover'});
</script>
