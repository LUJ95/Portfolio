<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>adminListtest2</title>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.3.0/css/bootstrap.min.css">
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<style>
redbutton{
background-color: red;
	color: white;
	padding: 12px 25px; /* 충분히 넓게 설정 */
	font-size: 16px;
	border-radius: 5px;
	text-decoration: none;
	display: inline-block;
	border: none; /* 버튼 테두리 제거 */
	cursor: pointer; /* 버튼 클릭 가능 표시 */
	text-align: center;
	margin: 5px; /* 간격 조정 */
}
body {
	font-family: Arial, sans-serif;k
	background-color: #f4f4f4;
	margin: 0;
	padding: 0;
	text-align: center; /* 전체 텍스트 중앙 정렬 */
}

h1 {
	color: #333;
	margin-top: 20px;
}

.content {
	max-width: 1200px;
	margin: 20px auto;
	padding: 20px;
	background-color: #fff;
	border-radius: 8px;
	box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
	text-align: center; /* 내용 전체를 가운데 정렬 */
}

.table-responsive {
	overflow-x: auto;
	margin-bottom: 20px;
}

table {
	width: 80%; /* 테이블의 너비를 80%로 설정 */
	margin: 0 auto; /* 테이블을 화면 가운데로 */
	border-collapse: collapse;
	margin-bottom: 20px;
}

th, td {
	padding: 10px;
	text-align: center; /* 테이블 셀의 텍스트를 가운데 정렬 */
	border: 1px solid #ddd;
}

th {
	background-color: #007bff; /* 필터링 버튼과 동일한 색상 */
	color: #fff;
	white-space: nowrap; /* 텍스트가 한 줄로 표시되도록 */
}

td {
	background-color: #f9f9f9;
}

tr:hover td {
	background-color: #f1f1f1;
}

a {
	color: #007bff;
	text-decoration: none;
}

a:hover {
	text-decoration: underline;
}

.badge {
	background-color: #28a745;
	color: #fff;
	padding: 3px 8px;
	border-radius: 12px;
}

.box {
	text-align: center; /* 상품 등록 박스를 가운데 정렬 */
	margin-top: 20px;
}

.box a {
	background-color: #28a745;
	color: white;
	padding: 12px 25px; /* 충분히 넓게 설정하여 짤리지 않게 */
	font-size: 16px;
	border-radius: 5px;
	text-decoration: none;
	display: inline-block; /* 버튼이 가로로 배치되도록 */
}

.box a:hover {
	background-color: #218838;
}

.msg {
	background-color: #d4edda;
	color: #155724;
	padding: 10px;
	margin-bottom: 20px;
	border: 1px solid #c3e6cb;
	border-radius: 5px;
	display: inline-block;
	text-align: center;
}

/* 반응형 디자인 */
@media ( max-width : 768px) {
	table {
		width: 95%; /* 작은 화면에서 테이블 너비를 늘림 */
		font-size: 14px;
	}
	.content {
		padding: 10px;
	}
	.box a {
		padding: 10px 20px; /* 작은 화면에서 버튼 크기 조정 */
		font-size: 14px;
	}
}
/* 공통 스타일 */
.box {
	text-align: center; /* 상품 등록 박스를 가운데 정렬 */
	margin-top: 20px;
}

.box a, .box button {
	background-color: #28a745;
	color: white;
	padding: 12px 25px; /* 충분히 넓게 설정 */
	font-size: 16px;
	border-radius: 5px;
	text-decoration: none;
	display: inline-block;
	border: none; /* 버튼 테두리 제거 */
	cursor: pointer; /* 버튼 클릭 가능 표시 */
	text-align: center;
	margin: 5px; /* 간격 조정 */
}

.box a:hover, .box button:hover {
	background-color: #218838;
}

.box button {
	font-family: inherit; /* 폰트를 a 태그와 동일하게 */
}
</style>
<script>
	//전체 체크박스 선택 및 해제
	function toggleAllCheckboxes(source) {
		const isChecked = source.checked;
		$(".item-checkbox").prop("checked", isChecked);
	}
	function updatePdelToG002() {
		const selectedProducts = [];
		$(".item-checkbox:checked").each(function() {
			const row = $(this).closest("tr");
			const product = {
				pno : row.find("td:nth-child(2)").text().trim(),
				pname : row.find("td:nth-child(3)").text().trim(),
				bname : row.find("td:nth-child(5)").text().trim(),
				pvol : row.find("td:nth-child(6)").text().trim(),
				pprice : row.find("td:nth-child(7)").text().trim(),
				pcat : row.find("td:nth-child(8)").text().trim(),
				pdel : "G002"
			};
			selectedProducts.push(product);
		});

		if (selectedProducts.length === 0) {
			alert("판매 중지할 상품을 선택하세요.");
			return;
		}

		$.ajax({
			url : "/product/updatePdel",
			type : "POST",
			contentType : "application/json",
			data : JSON.stringify(selectedProducts),
			success : function(response) {
				alert("선택된 상품이 판매 중지되었습니다.");
				location.reload();
			},
			error : function(xhr, status, error) {
				console.error("Error:", error);
				alert("판매 중단 중 문제가 발생했습니다.");
			}
		});
	}

	// 구분선 ------------------------------------------------

	function updatePdelToG001() {
		const selectedProducts = [];
		$(".item-checkbox:checked").each(function() {
			const row = $(this).closest("tr");
			const product = {
				pno : row.find("td:nth-child(2)").text().trim(),
				pname : row.find("td:nth-child(3)").text().trim(),
				bname : row.find("td:nth-child(5)").text().trim(),
				pvol : row.find("td:nth-child(6)").text().trim(),
				pprice : row.find("td:nth-child(7)").text().trim(),
				pcat : row.find("td:nth-child(8)").text().trim(),
				pdel : "G001"
			};
			selectedProducts.push(product);
		});

		if (selectedProducts.length === 0) {
			alert("판매 중으로 설정할 상품을 선택하세요.");
			return;
		}

		$.ajax({
			url : "/product/updatePdel_1",
			type : "POST",
			contentType : "application/json",
			data : JSON.stringify(selectedProducts),
			success : function(response) {
				alert("선택된 상품이 판매 중으로 설정되었습니다.");
				location.reload();
			},
			error : function(xhr, status, error) {
				console.error("Error:", error);
				alert("판매 중 설정 중 문제가 발생했습니다.");
			}
		});
	}

	// 구분선 ------------------------------------------------

	function updatePdelToG003() {
		const productsToUpdate = [];
		$(".item-checkbox:checked").each(function() {
			const row = $(this).closest("tr");
			const productNo = row.find("td:nth-child(2)").text().trim();
			const productQty = row.find("td:nth-child(11)").text().trim();

			if (productQty === "0") {
				productsToUpdate.push(productNo);
			}
		});

		if (productsToUpdate.length === 0) {
			alert("재고가 0인 상품을 선택하세요.");
			return;
		}

		$.ajax({
			url : "/product/updateToG003",
			type : "POST",
			contentType : "application/json",
			data : JSON.stringify(productsToUpdate),
			success : function(response) {
				alert("선택된 상품의 상태가 변경되었습니다.");
				location.reload();
			},
			error : function(xhr, status, error) {
				console.error("Error:", error);
				alert("상태 변경 중 문제가 발생했습니다.");
			}
		});
	}
	
	
	<!-- ------------------------------------------- -->
	function deleteProducts() {
	    const selectedProductIds = [];
	    $(".item-checkbox:checked").each(function() {
	        const row = $(this).closest("tr");
	        const productId = row.find("td:nth-child(2)").text().trim();
	        selectedProductIds.push(productId);
	    });

	    if (selectedProductIds.length === 0) {
	        alert("삭제할 상품을 선택하세요.");
	        return;
	    }

	    $.ajax({
	        url: "/product/deleteProducts",
	        type: "POST",
	        contentType: "application/json",
	        data: JSON.stringify(selectedProductIds),
	        success: function(response) {
	            alert(response);
	            location.reload();
	        },
	        error: function(xhr, status, error) {
	            console.error("Error:", error);
	            alert("상품 삭제 중 문제가 발생했습니다.");
	        }
	    });
	}
	
</script>
</head>
<body class="bg-light">
	<div class="container mt-4">
		<h1 class="text-center mb-4">Product List</h1>
	
		<!-- 필터 섹션 -->
		<div class="filter-section text-center">
			<form action="category" method="post" class="form-inline">
				<input type="hidden" name="pageNUM" value="${param.pageNUM}" />
				<!-- 현재 페이지 -->
				<input type="hidden" name="pageListNUM" value="${pageListNUM}" />
				<!-- 현재 페이지 그룹 -->
				<div class="mb-3">
				<div class="box">
					<select name="cate1" class="form-select d-inline w-auto">
						<option value="default">전체 용량</option>
						<option value="50ml">50ml</option>
						<option value="100ml">100ml</option>
						<option value="150ml">150ml</option>
						<option value="300ml">300ml</option>
						<option value="500ml">500ml</option>
						<option value="1000ml">1000ml</option>
					</select> <select name="cate2" class="form-select d-inline w-auto">
						<option value="default">전체 카테고리</option>
						<option value="shampoo">Shampoo</option>
						<option value="Treatment/Conditioner">Treatment/Conditioner</option>
						<option value="Bodywash">Bodywash</option>
						<option value="Set">Set</option>
						<option value="Toner">Toner</option>
						<option value="Serum">Serum</option>
						<option value="Mask">Mask</option>
					</select> <select name="cate3" class="form-select d-inline w-auto">
						<option value="default">전체 상태</option>
						<option value="G001">G001</option>
						<option value="G002">G002</option>
						<option value="G003">G003</option>
					</select>
					
					<button type="submit" class="btn btn-primary">필터링</button>
						<a href="/admin_home">home</a>
						</div>
				</div>
			</form>
		</div>

		<!-- 결과 테이블 -->
		<div class="table-responsive">
			<table class="table table-striped table-hover">
				<thead>
					<tr>
						<th>ALL<input type="checkbox" id="all-checkbox"
							onclick="toggleAllCheckboxes(this)"></th>
						<th>상품 번호</th>
						<th>상품 이름</th>
						<th>이미지</th>
						<th>브랜드명</th>
						<th>상품 용량</th>
						<th>상품 가격</th>
						<th>상품 카테고리</th>
						<th>상품 상태</th>
						<th>상품 옵션</th>
						<th>재고 수량</th>
						<th>조회수</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="product" items="${list}">
						<tr>
							<td><input type="checkbox" class="item-checkbox"></td>
							<td>${product.pno}</td>
							<td><a href="/admin_Editupload?pno=${product.pno}"
								class="text-decoration-none">${product.pname}</td>
							<td><img src="${product.pimg1}" width="100" height="100"></td>
							<td>${product.bname}</td>
							<td>${product.pvol}</td>
							<td>${product.pprice}</td>
							<td>${product.pcat}</td>
							<td><c:choose>
									<c:when test="${product.pdel == 'G001'}">
                   					판매중
                					</c:when>
									<c:when test="${product.pdel == 'G002'}">
                   					판매 중지
                					</c:when>
									<c:when
										test="${product.pdel == 'G003'} || ${product.pqt =='0'}">
                   					상품 매진
                					</c:when>
									<c:when test="${product.pqt == '0'}">
                   					상품 매진
                					</c:when>
									<c:otherwise>
                    				${product.pdel}
                					</c:otherwise>
								</c:choose></td>
							<td>${product.pop1}</td>
							<td><c:choose>
									<c:when test="${product.pqt < 5 && product.pqt > 0}">
                   					재고 추가요 <br>${product.pqt}
                					</c:when>
									<c:when test="${product.pqt == '0'}">
                   					상품 매진
                					</c:when>
									<c:otherwise>
									${product.pqt}
                					</c:otherwise>
								</c:choose></td>
							<td><span class="badge bg-secondary">${product.preadcnt}</span></td>
						</tr>
					</c:forEach>


				</tbody>
			</table>
			<div>

				<c:choose>
					<c:when test="${pageListNUM>1}">
						<a
							href="adminListtest2?pageListNUM=${pageListNUM-1}&pageNUM=${pageListNUM*10-10}">
							&lt; </a>
					</c:when>
					<c:otherwise>
						<a style="color: lightgray;"> &lt; </a>
					</c:otherwise>
				</c:choose>
				&nbsp;

				<c:forEach var="i" begin="${startPage }" end="${endPage }">

					<c:choose>
						<c:when test="${i == 1 && param.pageNUM == null }">
							<a
								href="adminListtest2?pageListNUM=${pageListNUM }&pageNUM=${i }"
								style="color: #ca1515;"> ${i } </a>
						</c:when>
						<c:when test="${i == param.pageNUM }">
							<a
								href="adminListtest2?pageListNUM=${pageListNUM }&pageNUM=${i }"
								style="color: #ca1515;"> ${i } </a>
						</c:when>
						<c:otherwise>
							<a
								href="adminListtest2?pageListNUM=${pageListNUM }&pageNUM=${i }">
								${i } </a>
						</c:otherwise>
					</c:choose>
                  &nbsp;
               
               </c:forEach>

				<c:choose>
					<c:when test="${pageListNUM<(totalPage/10)}">
						<a
							href="adminListtest2?pageListNUM=${pageListNUM+1}&pageNUM=${pageListNUM*10+1}">
							&gt; </a>
					</c:when>
					<c:otherwise>
						<a style="color: lightgray;"> &gt; </a>
					</c:otherwise>
				</c:choose>
				<!-- CATEGORY 페이징 버튼 -->
		
			</div>


		</div>
	</div>
	<!-- 상품등록 링크 -->
	<div class="box">
		<div class="box-header with-border">
			<a href="admin_write">상품등록</a>
			<button type="button" onclick="updatePdelToG002()">판매 중지</button>
			<button type="button" onclick="updatePdelToG001()">판매 중</button>
			<button class="redbutton" type="button" onclick="deleteProducts()">상품 삭제</button>
			<button onclick="history.back()">뒤로 가기</button>
		</div>
	</div>

	<script
		src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.3.0/js/bootstrap.min.js"></script>
</body>
</html>
