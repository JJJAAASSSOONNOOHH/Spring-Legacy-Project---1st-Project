<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!-- Modal1 -->
<div class="wrap-modal1 js-modal1 p-t-60 p-b-20">
	<div class="overlay-modal1 js-hide-modal1"></div>

	<div class="container">
		<div class="bg0 p-t-60 p-b-30 p-lr-15-lg how-pos3-parent">
			<button class="how-pos3 hov3 trans-04 js-hide-modal1">
				<img src="/resources/images/icons/icon-close.png" alt="CLOSE">
			</button>
			<div class="row">
				<div class="col-md-6 col-lg-7 p-b-30">
					<div class="p-l-25 p-r-30 p-lr-0-lg">
						<div class="wrap-slick3 flex-sb flex-w">
							<div class="wrap-slick3-dots"></div>
							<div class="wrap-slick3-arrows flex-sb-m flex-w"></div>

							<div class="slick3 gallery-lb modalImgList">
								<div class="item-slick3"
									data-thumb="/resources/images/product-detail-01.jpg">
									<div class="wrap-pic-w pos-relative">
										<img src="/resources/images/product-detail-01.jpg"
											alt="IMG-PRODUCT"> <a
											class="flex-c-m size-108 how-pos1 bor0 fs-16 cl10 bg0 hov-btn3 trans-04"
											href="/resources/images/product-detail-01.jpg"> <i
											class="fa fa-expand"></i>
										</a>
									</div>
								</div>


							</div>
						</div>
					</div>
				</div>

				<div class="col-md-6 col-lg-5 p-b-30">
					<div class="p-r-50 p-t-5 p-lr-0-lg">
						<input type="hidden" name="product_id" data-product_id="">
						<input type="hidden" name="product_name" data-product_name="">
						<h4 class="mtext-105 cl2 js-name-b2 p-b-14 productName">Lightweight
							Jacket</h4>

						<span class="mtext-106 cl2 productPrice"> $58.79 </span>

						<!--  -->
						<div class="p-t-33">
							<div class="flex-w flex-r-m p-b-10">
								<div class="size-203 flex-c-m respon6">Size</div>

								<div class="size-204 respon6-next">
									<div class="rs1-select2 bor8 bg0">
										<select class="js-select2 size_id" name="size">
											<option value="">Choose an option</option>
											<option value="s">Size S</option>
											<option value="m">Size M</option>
											<option value="l">Size L</option>
										</select>
										<div class="dropDownSelect2"></div>
									</div>
								</div>
							</div>

							<div class="flex-w flex-r-m p-b-10">
								<div class="size-203 flex-c-m respon6">Color</div>

								<div class="size-204 respon6-next">
									<div class="rs1-select2 bor8 bg0">
										<select class="js-select2 color_id" name="color">
											<option value="">Choose an option</option>
											<option value="black">Black</option>
											<option value="green">Green</option>
											<option value="red">Red</option>
											<option value="white">White</option>
										</select>
										<div class="dropDownSelect2"></div>
									</div>
								</div>
							</div>

							<div class="flex-w flex-r-m p-b-10">
								<div class="size-204 flex-w respon6-next" style="justify-content:flex-end ;">
									<div class="wrap-num-product flex-w m-r-20 m-tb-10" >
										<div
											class="btn-num-product-down cl8 hov-btn3 trans-04 flex-c-m">
											<i class="fs-16 zmdi zmdi-minus"></i>
										</div>

										<!-- 이 부분이 수량 조정 부분 -->
										<input class="mtext-104 cl3 txt-center num-product"
											type="number" name="num-product" value="1" >

										<div class="btn-num-product-up cl8 hov-btn3 trans-04 flex-c-m">
											<i class="fs-16 zmdi zmdi-plus"></i>
										</div>
									</div>
									<div  style="display: flex; justify-content: space-between; margin:10px 0; width: 100%;" >
									
									<button
									class="flex-c-m stext-101 cl0 size-101 bg1 bor1 hov-btn1 p-lr-15 trans-04 js-addcart-detail modalCart">
											Add to cart</button>
									<button
									class="flex-c-m stext-101 cl0 size-101 bg1 bor1 hov-btn1 p-lr-15 trans-04 js-addwish-detail"data-product_name="" data-product_id="">
											wishLists</button>
									</div>
								</div>
							</div>
						</div>

						<!--  -->
					
					</div>
				</div>
			</div>
		</div>
	</div>

</div>
<script type="text/javascript">
$('.js-addwish-detail').each(function() {
			var nameProduct = $(this).parent().parent().parent().parent()
					.find('.js-name-detail').html();
			$(this).on('click', function() 
					{
				var pName = $("button[data-product_name]").val();
				var pId = $("input[data-product_id]").val();
				
				console.log(pName);
				  $.ajax({
		                type: 'POST',
		                url: "/productDetail/postWish",
		                contentType: 'application/json',
		                data: JSON.stringify({ product_name: pName }),
		                success: function (response) {
		                	 
		                    	Swal.fire({
				  					  position: "center",
				  					  icon: "success",
				  					  title: "Added to your wishLists!",
				  					  showConfirmButton: false,
				  					  timer: 1500
				  					});
		                    	
		                
		                },
		                error: function (xhr, status, error) {
		                	
		                    Swal.fire("This product has already been registered on WishList.", "", "error");
		                }
		            });
				  $.ajax({
			            type: 'GET',
			            url: '/productDetail/checkWishStatus/' + pId,
			            success: function (response) {
			                if (response === "exists") {
			                	
			                    console.log("존재" + pId)
			                } else {
			                	console.log("존재안함" + pId)
			                }
			            },
			            error: function (xhr, status, error) {
			                console.error(xhr.responseText);
			            }
			        });
				
			});
		});

$('.modalCart').each(function() {
	
	
	$(this).on("click",function(){
	
		var color_id = $(".color_id").val(); 
		var size_id = $(".size_id").val();
		var count = $(".num-product").val();
		var product_name = $("button[data-product_name]").val();
		console.log("color_id -> " + color_id + ", size_id -> " + size_id + ", count -> " + count + ", product_name -> " + product_name)
		
	
		
		$.ajax({
            type: 'POST',
            url: "/productDetail/postCart?count=" + count,
            contentType: 'application/json',
            data: JSON.stringify({product_name: product_name,color_id: color_id, size_id: size_id}),
            success: function (response) {
            	 
                	Swal.fire({
	  					  position: "center",
	  					  icon: "success",
	  					  title: "Added to your cart!",
	  					  showConfirmButton: false,
	  					  timer: 1500
	  					});
                	
            
            },
            error: function (xhr, status, error) {
            	
                Swal.fire("This product has already been registered on WishList.", "", "error");
            }
        });
	})
	
})
</script>