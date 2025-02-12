<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<%@ include file="include/head.jsp" %>

<!DOCTYPE html>
<html lang="ko">

	

<body>

	<c:if test="${not empty msg}">
    	<script>
    		alert("${msg}");
    	</script>
    </c:if>

    <!-- Page Preloder -->
    <div id="preloder">
        <div class="loader"></div>
    </div>

	<%@ include file="include/main_header.jsp" %>

    <!-- Hero Section Begin -->
    
   <%@ include file="include/main_hero.jsp" %> 
<div class="container ">
</div>
    
    <!-- Hero Section End -->
	<div class="container">    
    <div class="col-lg-12">   	
                <div class="hero__item set-bg" data-setbg="img/hero/banner.png">
                        <div class="hero__text">
                            <span>PREMIUM DAILY CARE</span>
                            <h2>Essential Products <br />For Modern Living</h2>
                            <p>Discover Luxurious Quality in Everyday Essentials</p>
                            <a href="shopGrid" class="primary-btn">SHOP NOW</a>
                        </div>
                </div>
                </div>
               
        
    </div>
	<br> <br>
    <!-- Categories Section Begin -->
    <section class="categories">
        <div class="container">
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
    <!-- Categories Section End -->

    <!-- Featured Section Begin -->
    <section class="featured spad">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <div class="section-title">
                        <h2>Featured Product</h2>
                    </div>
                    <div class="featured__controls">
                        <ul>
                            <li class="active" data-filter="*">All</li>
                            <c:forEach items="${productCategory }" var = "category">
                            <li data-filter=".${category}">${category}</li>
                            </c:forEach>
                        </ul>
                    </div>
                </div>
            </div>
            <div class="row featured__filter">
            
            	<c:forEach var="product" items="${productList}">
                <div class="col-lg-3 col-md-4 col-sm-6 mix ${product.pcat}" id="productlist">
                <div class="featured__item">
                        <div class="featured__item__pic set-bg" data-setbg="${product.pimg1}">
                            <ul class="featured__item__pic__hover">
                                <li><a href="#"><i class="fa fa-heart"></i></a></li>
                                <li><a href="#"><i class="fa fa-retweet"></i></a></li>
                                <li><a href="/shopDetail?pno=${product.pno}"><i class="fa fa-shopping-cart"></i></a></li>
                            </ul>
                        </div>
                        <div class="featured__item__text">
                            <h6><a href="/shopDetail?pno=${product.pno}">${product.pname}</a></h6>
                            <h5>${product.pprice }원</h5>
                        </div>
                    </div>
                </div>
                </c:forEach>
                
            </div> <!-- feature filter end -->
        </div>
    </section>
    <!-- Featured Section End -->

    <!-- Banner Begin -->
  
    <!-- Banner End -->

    <!-- Latest Product Section Begin -->
   
    <!-- Latest Product Section End -->

    <!-- Blog Section Begin -->

    <!-- Blog Section End -->

    <!-- Footer Section Begin -->
<%@ include file="include/main_footer.jsp" %>
    <!-- Footer Section End -->

<%@ include file="include/footer.jsp" %>

</body>

</html>