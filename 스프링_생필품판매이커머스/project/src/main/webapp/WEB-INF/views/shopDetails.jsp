<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>  
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>  
    
<!DOCTYPE html>
<html lang="ko">

<%@ include file="include/head.jsp" %>

<body>

<script src="/resources/jQuery/jquery-3.4.1.min.js"></script>
<script>
	$(document).ready(function() {
		$('#addToCartBtn').click(function() {
			const pno = $(this).data('pno'); // 상품 번호
			const quantity = $(this).data('quantity'); // 수량
			const cno = $(this).data('cno'); // 고객번호
			
			$.ajax({
				type : 'POST',
				url : '/addCartItem',
				data : { pno : pno, quantity : quantity, cno : cno },
				success : function() {
					
					// 서버에서 반환된 메시지 표시
					alert('장바구니 추가 성공!');
				},
				error: function() {
					// 에러 처리
					alert('장바구니 추가 실패!'); // 실패시 메시지 표시
				}
			})
		})
	});
</script>


    <!-- Page Preloder -->
    <div id="preloder">
        <div class="loader"></div>
    </div>

   <%@ include file="include/main_header.jsp" %> 

    <!-- Hero Section Begin -->
    <%@ include file="include/main_hero.jsp" %>
    <!-- Hero Section End -->

    <!-- Breadcrumb Section Begin -->
    <section class="breadcrumb-section set-bg" data-setbg="img/breadcrumb.jpg">
        <div class="container">
            <div class="row">
                <div class="col-lg-12 text-center">
                    <div class="breadcrumb__text">
                        <h2>${productByPno.pcat}</h2>
                        <div class="breadcrumb__option">
                            <a href="/">Home</a>
                            <span>${productByPno.pcat}</span>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- Breadcrumb Section End -->

    <!-- Product Details Section Begin -->
    <section class="product-details spad">
        <div class="container">
            <div class="row">
                <div class="col-lg-6 col-md-6">
                    <div class="product__details__pic">
                        <div class="product__details__pic__item">
                            <img class="product__details__pic__item--large"
                                src="${productImages.pimg1}" width="400" height="400">
                        </div>
                        <div class="product__details__pic__slider owl-carousel">
                        	<c:forEach var="images" items="${productImages}">
                        		<c:if test="${not empty images.value}">
                        			<img data-imgbigurl="${images.value}" src="${images.value}" width="100" height="100">   
                        		</c:if>
                        	</c:forEach>
                        </div>
                    </div>
                </div>
                <div class="col-lg-6 col-md-6">
                    <div class="product__details__text">
                        <h3>${productByPno.pname}</h3>
                        <div class="product__details__rating">
                            <i class="fa fa-star"></i>
                            <i class="fa fa-star"></i>
                            <i class="fa fa-star"></i>
                            <i class="fa fa-star"></i>
                            <i class="fa fa-star-half-o"></i>
                            <span> </span>
                        </div>
                        <div class="product__details__price">${productByPno.pprice}원</div>
                        <p>${productByPno.pdes}</p>
                        <!-- <div class="product__details__quantity">
                            <div class="quantity">
                                <div class="pro-qty">
                                    <input type="text" value="1" name="quantity">
                                </div>
                            </div>
                        </div> -->
                        <button id="addToCartBtn" data-pno="${productByPno.pno}" data-quantity="1" data-cno="${user.cno}" class="primary-btn">ADD TO CART</button>
                        
                        <ul>
                            <li><b>판매 상태</b> <span>
                            <c:if test="${productByPno.pdel =='G001' }">
                            <a>판매 중</a>
                            </c:if>
                            <c:if test="${productByPno.pdel =='G002' }">
                            <a>판매 중지</a>
                            </c:if>
                            <c:if test="${productByPno.pdel =='G003' }">
                            <a>재고 없음</a>
                            </c:if>
                            </span></li>
                            <li><b>수량</b> <span>${productByPno.pqt} ea</span></li>
                            <li><b>용량</b> <span>${productByPno.pvol} </span></li>
                            <li><b>관심도</b> <span>${productByPno.preadcnt} </span></li>
                        </ul>
                    </div>
                </div>
                <div class="col-lg-12">
                    <div class="product__details__tab">
                        <ul class="nav nav-tabs" role="tablist">
                            <li class="nav-item">
                                <a class="nav-link active" data-toggle="tab" href="#tabs-1" role="tab"
                                    aria-selected="true">Description</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" data-toggle="tab" href="#tabs-2" role="tab"
                                    aria-selected="false">Information</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" data-toggle="tab" href="#tabs-3" role="tab"
                                    aria-selected="false">Reviews <span>(1)</span></a>
                            </li>
                        </ul>
                        <div class="tab-content">
                            <div class="tab-pane active" id="tabs-1" role="tabpanel">
                                <div class="product__details__tab__desc">
                                    <h6>Products Infomation</h6>
                                    <p>${productByPno.pdes}</p>
                                </div>
                            </div>
                            <div class="tab-pane" id="tabs-2" role="tabpanel">
                                <div class="product__details__tab__desc">
                                    <h6>Products Infomation</h6>
                                    <p>${productByPno.pdes}</p>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- Product Details Section End -->
<%@ include file="include/Reviews.jsp" %>
    <!-- Related Product Section Begin -->
   
    <!-- Related Product Section End -->

    <!-- Footer Section Begin -->
    <%@ include file="include/main_footer.jsp" %>
    <!-- Footer Section End -->

<%@ include file="include/footer.jsp" %>


</body>

</html>