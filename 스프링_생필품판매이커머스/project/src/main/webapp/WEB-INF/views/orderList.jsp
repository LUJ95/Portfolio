<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>  
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>  

<%@ include file="include/head.jsp" %>

<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>주문 내역</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
<c:if test="${not empty msg}">
    <script>
    	alert("${msg}");
    </script>
</c:if>


<%@ include file="include/main_header.jsp" %>

<div class="container mt-5">
        <h2 class="text-center mb-4">주문 내역</h2>
        
        <!-- 주문 내역 테이블 -->
        <table class="table table-bordered table-striped">
            <thead class="table-light">
                <tr>
                    <th scope="col">주문 번호</th>
                    <th scope="col">주문 날짜</th>
                    <th scope="col">상품명</th>
                    <th scope="col">수량</th>
                    <th scope="col">상태</th>
                    <th scope="col">가격</th>
                    <th scope="col">상세 보기</th>
                </tr>
            </thead>
            <tbody>
            
            
            
               <c:forEach var="item" items="${orderPageList}">
                <tr>
                    <td>${item.ono}</td>
                    <td>${item.odate}</td>
                    <td>${item.pname}</td>
                    <td>${item.orderquan}</td>
                    <td><span class="badge bg-success">
                    <c:if test="${item.ostatus == 'D001' }">
                    	Pending
                    </c:if>
                    <c:if test="${item.ostatus == 'D003' }">
                    	On delivery
                    </c:if>
                    <c:if test="${item.ostatus == 'D004' }">
                    	Delivered
                    </c:if>
                   </span></td>
                    <td>${item.ototal}</td>
                    <td><a href="orderDetail?oid=${item.oid}&pno=${item.pno}" class="btn btn-info btn-sm">상세 보기</a></td>
                     <td><form action="orderList" method="POST">
                <button value="${item.ostatus }" name="selectedOption" type="submit">배송완료!</button>
                </form>
                </td>
                </tr>
                </c:forEach>
                
               
            
                
            </tbody>
        </table>
		
		<div class="product__pagination" align="center">
                  
                  <c:choose>
                     <c:when test="${pageListNUM>1}">
                     <a href="orderList?pageListNUM=${pageListNUM-1}&pageNUM=${pageListNUM*10-10}"> &lt; </a>
                  </c:when>
                  <c:otherwise>
                     <a style="color:lightgray;"> &lt; </a> 
                  </c:otherwise>
                  </c:choose>
                   &nbsp;
                          
               <c:forEach var="i" begin="${startPage }" end="${endPage }">
               
                  <c:choose>
                     <c:when test="${i == 1 && param.pageNUM == null }">
                        <a href="orderList?pageListNUM=${pageListNUM }&pageNUM=${i }" style="color: #ca1515;"> ${i } </a>
                     </c:when>
                     <c:when test="${i == param.pageNUM }">
                        <a href="orderList?pageListNUM=${pageListNUM }&pageNUM=${i }" style="color: #ca1515;"> ${i } </a>
                     </c:when>
                     <c:otherwise>
                        <a href="orderList?pageListNUM=${pageListNUM }&pageNUM=${i }" > ${i } </a>
                     </c:otherwise>
                  </c:choose>
                  &nbsp;
               
               </c:forEach>
                       
               <c:choose>
                     <c:when test="${pageListNUM<(totalPage/10)}">
                     <a href="orderList?pageListNUM=${pageListNUM+1}&pageNUM=${pageListNUM*10+1}"> &gt; </a>
                  </c:when>
                  <c:otherwise>
                     <a style="color:lightgray;"> &gt; </a> 
                  </c:otherwise>
                  </c:choose>        
               
               
                </div>
		
		<br>
		
        <!-- 주문 내역 없을 때 메시지 -->
        <div class="alert alert-info text-center" role="alert">
            아직 주문 내역이 없습니다.
        </div>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>

<%@ include file="include/footer.jsp" %>
</body>
</html>