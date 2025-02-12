<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import = "java.net.URLDecoder" %>
<%@ page import = "java.util.Arrays" %>
<%@ page import = "javax.servlet.http.Cookie" %>
<%@ page import = "java.util.Map" %>
<%@ page import = "java.util.HashMap" %>
<%@ page import = "javax.servlet.http.HttpSession" %>


<%
// 현재 URI 가져오기
String currentURI = request.getRequestURI();
String homeActive = currentURI.contains("main") ? "active" : "";
String shopActive = currentURI.contains("shopGrid") ? "active" : "";
String blogActive = currentURI.contains("blog") ? "active" : "";
String contactActive = currentURI.contains("contact") ? "active" : "";
%>

<!-- Humberger Begin -->
<div class="humberger__menu__overlay"></div>
<div class="humberger__menu__wrapper">
	<div class="humberger__menu__logo">
		<a href="/"><img src="img/logo.png" alt=""></a>
	</div>
	<div class="humberger__menu__cart">
		<ul>
			<li><a href="#"><i class="fa fa-shopping-bag"></i> <span>3</span></a></li>
		</ul>
		<div class="header__cart__price">
			item: <span>$150.00</span>
		</div>
	</div>
	<div class="humberger__menu__widget">
		<div class="header__top__right__language">
			<img src="img/language.png" alt="">
			<div>English</div>
			<span class="arrow_carrot-down"></span>
			<ul>
				<li><a href="#">Spanis</a></li>
				<li><a href="#">English</a></li>
			</ul>
		</div>
		<div class="header__top__right__auth">
			<c:if test="${user==null }">
				<div class="header__top__right__auth">
					<a href="projectLogin"><i class="fa fa-user"></i> Login</a>
				</div>
			</c:if>

			<c:if test="${user!=null }">
				<div class="header__top__right__auth">
					<a href="myPage"><i class="fa fa-user"></i>
						${user.cname}</a>
				</div>
			</c:if>
		</div>
	</div>
	<nav class="humberger__menu__nav mobile-menu">
		<ul>
			<li class="active"><a href="/">Home</a></li>
			<li><a href="shopGrid">Shop</a></li>
			<li><a href="contact">Contact</a></li>
		</ul>
	</nav>
	<div id="mobile-menu-wrap"></div>
	<div class="header__top__right__social">
	
		<a href="#"><i class="fa fa-facebook"></i></a> <a href="#"><i
			class="fa fa-twitter"></i></a> <a href="#"><i class="fa fa-linkedin"></i></a>
		<a href="#"><i class="fa fa-pinterest-p"></i></a>
	</div>
	<div class="humberger__menu__contact">
		<ul>
			<li><i class="fa fa-envelope"></i> HELLOWWORLD@NAVER.COM</li>
			<li>IF YOU WANT TO GIVE ME SOME MONEY?</li>
		</ul>
	</div>
</div>
<!-- Humberger End -->

<!-- Header Section Begin -->
<header class="header">
	<div class="header__top">
		<div class="container">
			<div class="row">
				<div class="col-lg-6 col-md-6">
					<div class="header__top__left">
						<ul>
							<li><i class="fa fa-envelope"></i> HELLOWWORLD@NAVER.COM</li>
							<li>IF YOU WANT TO GIVE ME SOME MONEY?</li>
						</ul>
					</div>
				</div>
				<div class="col-lg-6 col-md-6">
					<div class="header__top__right">
						
						<c:if test="${sessionScope.cno == 1}">
							<div class="header__top__right__auth">
								<a href="admin_home"><i class="fa fa-gear"></i></a>
							</div>
						</c:if>


						<c:if test="${user==null }">
							<div class="header__top__right__auth">
								<a href="projectLogin"><i class="fa fa-user"></i> Login</a>
							</div>
						</c:if>

						<c:if test="${user!=null }">
							<div class="header__top__right__auth">
								<a href="myPage"><i class="fa fa-user"></i>
									${user.cname}</a>
							</div>
						</c:if>
						
						
					</div>
				</div>
			</div>
		</div>
	</div>
	<div class="container">
		<div class="row">
			<div class="col-lg-3">
				<div class="header__logo">
					<a href="/"><img src="img/logo.png" alt=""></a>
				</div>
			</div>
			<div class="col-lg-6">
				<nav class="header__menu">
					<ul>
						<li class="<%=homeActive%>"><a href="/">Home</a></li>
						<li class="<%=shopActive%>"><a href="shopGrid">Shop</a></li>
					
						<li class="<%=contactActive%>"><a href="contact">Contact</a></li>
					</ul>
				</nav>
			</div>
			<div class="col-lg-3">
				<div class="header__cart">
					<ul>
					<%
					
					
						// 초기화
						int allcartQuant = 0;
						Map<String,Object> user = (Map<String,Object>) session.getAttribute("user");
						
											
						// 요청에서 쿠키 배열 가져오기
						Cookie[] cookies = request.getCookies();
						if (user != null) {
							int cno = (Integer) user.get("cno");
						if (cookies != null) {
							for (Cookie cookie : cookies) {
								if ("cart".equals(cookie.getName())) {
									// cart 쿠키 값을 JSON 문자열로 가져옴
									String cartValue = cookie.getValue();
									cartValue = URLDecoder.decode(cookie.getValue(), "UTF-8");
									// JSON 문자열을 분해하여 cartQuant 값을 추출
									// {pno:10,cno:1,cartQuant:4},{pno:10,cno:1,cartQuant:5} 형태로 가정
									cartValue = cartValue.replaceAll("[\\[\\]]", ""); // 대괄호 삭제
									String[] items = cartValue.split("\\},\\{"); // JSON 객체 분리
									
									for (String item : items) {
										item = item.replaceAll("[{}]","");
										String[] attributes = item.split(",");
										int currentCno = -1;
										int currentCartQuant = 0;
										
										
										for (String attribute : attributes) {
											String[] keyValue = attribute.split(":");
											String key = keyValue[0].replaceAll("\"", "").trim();
											System.out.println(key);
											String value = keyValue[1].trim();
											System.out.println(value);
											
											if ("cno".equals(key)) {
												currentCno = Integer.parseInt(value);
											} else if ("cartQuant".equals(key)) {
												currentCartQuant = Integer.parseInt(value);
											}
										}
										if (currentCno == cno) {
											allcartQuant += currentCartQuant;
										}
										
									}
								} // cart if문 끝
							}
						}// cookie if문
						}
						
					%>
					
					
						
						
						<script>
							const allcartQuant = <%= allcartQuant %>;
							
							$(document).ready(function() {
								$('#cartQuantity').text(allcartQuant);								
							});
						</script>
						
						
						<li><a href="shoppingCart"><i class="fa fa-shopping-bag"></i> <span id="cartQuantity"></span></a></li>
					</ul>
				</div>
			</div>
		</div>
		<div class="humberger__open">
			<i class="fa fa-bars"></i>
		</div>
	</div>
</header>
<!-- Header Section End -->
