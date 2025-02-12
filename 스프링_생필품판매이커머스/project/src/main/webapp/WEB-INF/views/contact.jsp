<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="utf-8">

<%@ include file="include/head.jsp"%>

<body>
	<!-- Page Preloder -->
	<div id="preloder">
		<div class="loader"></div>
	</div>

	<%@ include file="include/main_header.jsp"%>

	<!-- Hero Section Begin -->
	<%@ include file="include/main_hero.jsp"%>
	<!-- Hero Section End -->

	<!-- Breadcrumb Section Begin -->
	<section class="breadcrumb-section set-bg"
		data-setbg="img/breadcrumb.jpg">
		<div class="container">
			<div class="row">
				<div class="col-lg-12 text-center">
					<div class="breadcrumb__text">
						<h2>Contact Us</h2>
						<div class="breadcrumb__option">
							<a href="/">Home</a> <span>Contact Us</span>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
	<!-- Breadcrumb Section End -->

	<!-- Contact Section Begin -->
	<section class="contact spad">
		<div class="container">
			<div class="row">
				<div class="col-lg-3 col-md-3 col-sm-6 text-center">
					<div class="contact__widget">
						<span class="icon_phone"></span>
						<h4>Phone</h4>
						<p>031-548-4664</p>
					</div>
				</div>
				<div class="col-lg-3 col-md-3 col-sm-6 text-center">
					<div class="contact__widget">
						<span class="icon_pin_alt"></span>
						<h4>Address</h4>
						<p>경기 수원시 팔달구 권광로 146 벽산그랜드코아 401호</p>
					</div>
				</div>
				<div class="col-lg-3 col-md-3 col-sm-6 text-center">
					<div class="contact__widget">
						<span class="icon_clock_alt"></span>
						<h4>Open time</h4>
						<p>10:00 am to 23:00 pm</p>
					</div>
				</div>
				<div class="col-lg-3 col-md-3 col-sm-6 text-center">
					<div class="contact__widget">
						<span class="icon_mail_alt"></span>
						<h4>Email</h4>
						<p>hello@mbc.com</p>
					</div>
				</div>
			</div>
		</div>
	</section>
	<!-- Contact Section End -->

	<!-- Map Begin -->
	<div class="map">
		<iframe
			src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d25401.132119919672!2d126.96420281083984!3d37.2680712!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x357b43bd1fc64201%3A0x4bd2c476a7e14843!2zTUJD7JWE7Lm0642w66-47Lu07ZOo7YSw6rWQ7Jyh7IS87YSw!5e0!3m2!1sko!2skr!4v1733368380790!5m2!1sko!2skr"
			width="600" height="450" style="border: 0;" allowfullscreen=""
			loading="lazy" referrerpolicy="no-referrer-when-downgrade"></iframe>
		<div class="map-inside">
			<i class="icon_pin"></i>
			<div class="inside-widget">
				<h4>수원 MBC 아카데미</h4>
				<ul>
					<li>Phone: 031-548-4664</li>
					<li>Add: 경기 수원시 팔달구 권광로 146 벽산그랜드코아 401호, suwon</li>
				</ul>
			</div>
		</div>
	</div>
	<!-- Map End -->

	<!-- Contact Form Begin -->
	<div class="contact-form spad">
		<div class="container">
			<div class="row">
				<div class="col-lg-12">  
					<div class="contact__form__title">
						<h2>연락하는 법</h2>
					</div>
				</div>
			</div>
			<form action="#">
				<div class="row">
					<div class="col-lg-6 col-md-6">
						<input type="text" placeholder="phone number" readonly>
					</div>
					<div class="col-lg-6 col-md-6">
						<input type="text" placeholder="031-548-4664" readonly>
					</div>
					<div class="col-lg-12 text-center">
						<textarea placeholder="비즈니스, 제품 문의나 찾아오시는 곳은 위와 같습니다.   먼저 연락주시면 친절히 상담 도와드리겠습니다." readonly></textarea>
					</div>
				</div>
			</form>
		</div>
	</div>
	<!-- Contact Form End -->

	<!-- Footer Section Begin -->
	<%@ include file="include/main_footer.jsp"%>
	<!-- Footer Section End -->

	<%@ include file="include/footer.jsp"%>



</body>

</html>