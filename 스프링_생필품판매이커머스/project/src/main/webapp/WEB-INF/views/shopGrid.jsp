<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>



<!DOCTYPE html>
<html lang="ko">

	<%@ include file="include/head.jsp" %>
	
<body>
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
                        <h2>Premium Daily Shop</h2>
                        <div class="breadcrumb__option">
                            <a href="/">Home</a>
                            <span>Shop</span>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- Breadcrumb Section End -->

    <!-- Product Section Begin -->
    <section class="product spad">
        <div class="container">
            <div class="row">
            	<div class="col-lg-1 ">
            	</div>
                <div class="col-lg-11 col-md-7">
                	<section class="categories">
				        <div class="container" align="center">
				            <div class="row">
				            <div class="col-lg-12 ">
				            	<div class="section-title">
				            	<h2>Popular Product</h2>
				            	</div>
				                <div class="categories__slider owl-carousel">
				               		<c:forEach var="Top10" items="${productTop10}">
				               		<div class="col-lg-3">
				                        <div class="categories__item set-bg" data-setbg="${Top10.pimg1}">
				                            <h5><a href="/shopDetail?pno=${Top10.pno}">${Top10.pname}</a></h5>
				                        </div>
				                    </div>
				               		</c:forEach>
				                </div>
				            </div>
				            
				            </div>
				        </div>
				    </section>
				    <br><br>
                    <div class="filter__item">
                        <div class="row">
                            <div class="col-lg-4 col-md-5">
                            </div>
                            <div class="col-lg-4 col-md-4">
                                <div class="filter__found">
                                    <h6><span></span> Products found</h6>
                                </div>
                            </div>
                            <div class="col-lg-4 col-md-3">
                                <div class="filter__option">
                                    <span class="icon_grid-2x2"></span>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                    
                    <c:forEach var="product" items="${productList}">
                        <div class="col-lg-4 col-md-6 col-sm-6">
                            <div class="product__item">
                                <div class="product__item__pic set-bg" data-setbg="${product.pimg1}">
                                    <ul class="product__item__pic__hover">
                                        <li><a href="#"><i class="fa fa-heart"></i></a></li>
                                        <li><a href="#"><i class="fa fa-retweet"></i></a></li>
                                        <li><a href="/shopDetail?pno=${product.pno}"><i class="fa fa-shopping-cart"></i></a></li>
                                    </ul>
                                </div>
                                <div class="product__item__text">
                                    <h6><a href="/shopDetail?pno=${product.pno}">${product.pname}</a></h6>
                                    <h5>${product.pprice}원</h5>
                                </div>
                            </div>
                        </div>
                    </c:forEach>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- Product Section End -->

    <!-- Footer Section Begin -->
    <%@ include file="include/main_footer.jsp" %>
    <!-- Footer Section End -->

<%@ include file="include/footer.jsp" %>

</body>

</html>