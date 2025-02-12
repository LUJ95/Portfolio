<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="UTF-8">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Edit Product</title>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.3.0/css/bootstrap.min.css">
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<style>
body {
	font-family: Arial, sans-serif;
	background-color: #f4f4f4;
	margin: 0;
	padding: 0;
	display: flex;
	justify-content: center; /* 가로 중앙 정렬 */
	align-items: center;    /* 세로 중앙 정렬 */
	height: 100vh;          /* 화면 전체 높이 */
}

.container-wrapper {
	display: flex;
	gap: 20px; /* 컨테이너 간 간격 */
}

.container1 {
	width: 30%; /* 적절히 줄인 컨테이너 너비 */
	background: #fff;
	padding: 10px;
	border-radius: 10px;
	box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
	overflow-y: auto; /* 내용이 많을 경우 스크롤 */
	max-height: 80vh; /* 화면 높이에 맞춘 최대 높이 */
	text-align: center;
}

.container1 img {
	display: block; /* 이미지를 세로로 나열 */
	margin: 10px auto; /* 이미지 간격 및 가운데 정렬 */
	width: 100px;
	height: 150px;
	object-fit: cover; /* 이미지 비율 유지 */
}

.container2 {
	width: 60%;
	background: #fff;
	padding: 20px;
	border-radius: 10px;
	box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
}
</style>
</head>
<body>
	<div class="container1" >
		<div class="mb-3">
		
				<h3>기존 이미지 입니다.</h3><br>
				<c:if test="${not empty product.pimg1}">
    <img src="${product.pimg1}" alt="Main Image 1" class="img-thumbnail mt-2" style="width: 250px; height: 300px;">
</c:if>
<c:if test="${not empty product.pimg2}">
    <img src="${product.pimg2}" alt="Main Image 2" class="img-thumbnail mt-2" style="width: 250px; height: 300px;">
</c:if>
<c:if test="${not empty product.pimg3}">
    <img src="${product.pimg3}" alt="Main Image 3" class="img-thumbnail mt-2" style="width: 250px; height: 300px;">
</c:if>
<c:if test="${not empty product.pimg4}">
    <img src="${product.pimg4}" alt="Main Image 4" class="img-thumbnail mt-2" style="width: 250px; height: 300px;">
</c:if>
<c:if test="${not empty product.pimg5}">
    <img src="${product.pimg5}" alt="Main Image 5" class="img-thumbnail mt-2" style="width: 250px; height: 300px;">
</c:if>
<c:if test="${not empty product.pimg6}">
    <img src="${product.pimg6}" alt="Main Image 6" class="img-thumbnail mt-2" style="width: 250px; height: 300px;">
</c:if>
<c:if test="${not empty product.pimg7}">
    <img src="${product.pimg7}" alt="Main Image 7" class="img-thumbnail mt-2" style="width: 250px; height: 300px;">
</c:if>
<c:if test="${not empty product.pimg8}">
    <img src="${product.pimg8}" alt="Main Image 8" class="img-thumbnail mt-2" style="width: 250px; height: 300px;">
</c:if>
<c:if test="${not empty product.pimg9}">
    <img src="${product.pimg9}" alt="Main Image 9" class="img-thumbnail mt-2" style="width: 250px; height: 300px;">
</c:if>
<c:if test="${not empty product.pimg10}">
    <img src="${product.pimg10}" alt="Main Image 10" class="img-thumbnail mt-2" style="width: 250px; height: 300px;">
</c:if>
		</div>
	</div>
	<div class="container2" >
		<h2 class="text-center mb-4">상품 수정</h2>
		<!-- form to display and edit product -->
		<form action="product_Update" method="POST"
			enctype="multipart/form-data">
			<!-- Hidden field for product ID -->
			<input type="hidden" name="pno" value="${product.pno}">

			<div class="mb-3">
				<label for="pname" class="form-label">상품 명</label> <input
					type="text" id="pname" name="pname" class="form-control"
					value="${product.pname}" required>
			</div>

			<div class="mb-3">
				<label for="bname" class="form-label">브랜드 명</label> <input
					type="text" id="bname" name="bname" class="form-control"
					value="${product.bname}" required>
			</div>

			<div class="mb-3">
				<label for="pdes" class="form-label">상품 설명</label>
				<textarea id="pdes" name="pdes" class="form-control" rows="4">${product.pdes}</textarea>
			</div>

			<div class="mb-3">
				<label for="pvol" class="form-label">용량</label> <input type="text"
					id="pvol" name="pvol" class="form-control" value="${product.pvol}"
					required>
			</div>

			<div class="mb-3">
				<label for="pprice" class="form-label">가격</label> <input
					type="number" id="pprice" name="pprice" class="form-control"
					value="${product.pprice}" required>
			</div>

			<div class="mb-3">
				<label for="pcat" class="form-label">카테고리</label> <input type="text"
					id="pcat" name="pcat" class="form-control" value="${product.pcat}"
					required>
			</div>

			<div class="mb-3">
				<label for="pdel" class="form-label">제품 상태</label> <select id="pdel"
					name="pdel" class="form-select">
					<option value="G001" ${product.pdel == 'G001' ? 'selected' : ''}>판매 중</option>
					<option value="G002" ${product.pdel == 'G002' ? 'selected' : ''}>판매 중지</option>
					<option value="G003" ${product.pdel == 'G003' ? 'selected' : ''}>상품 매진</option>
				</select>
			</div>

			<div class="mb-3">
				<label for="pqt" class="form-label">갯수</label> <input type="number"
					id="pqt" name="pqt" class="form-control" value="${product.pqt}"
					required>
			</div>
			<%-- <div class="mb-3">
				<label for="pop1" class="form-label">옵션     EX:용량 등</label> <input type="number"
					id="pop1" name="pop1" class="form-control" value="${product.pop1}"
					required>
			</div> --%>
			<div class="mb-3">
					<label for="multiFile">이미지 업로드 (반드시 사진을 넣어주세요. 최대 10장)</label> <input
					type="file" id="multiFile" name="multiFile" accept="image/*" multiple>
			</div>




			<!-- Buttons -->
			<div class="d-flex justify-content-between">
				<button type="submit" class="btn btn-success">업데이트하기</button>
				<button type="button" class="btn btn-secondary" onclick="history.back()">뒤로가기</button>
			</div>
		</form>
	</div>
	<script
		src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.3.0/js/bootstrap.min.js"></script>
</body>
</html>
