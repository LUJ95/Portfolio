<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

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
                        <h2>Shopping Cart</h2>
                        <div class="breadcrumb__option">
                            <a href="./index.html">Home</a>
                            <span>Shopping Cart</span>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- Breadcrumb Section End -->

    <!-- Shoping Cart Section Begin -->
    <section class="shoping-cart spad">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <div class="shoping__cart__table">
                        <table>
                            <thead>
                                <tr>
                                    <th class="shoping__product">Products</th>
                                    <th>Name</th>
                                    <th>Price</th>
                                    <th>Quantity</th>
                                    <th>Total</th>
                                    <th></th>
                                </tr>
                            </thead>
                            <tbody>
                                <c:forEach var="cart" items="${CartList}">
                                <tr class="cart-row">
                                    <td class="shoping__cart__item">
                                        <img src="${cart.pimg1}" alt="" width="100" height="100">
                                    </td>
                                    <td class="shoping__cart__item">
                                        <h5 id="name">${cart.pname }</h5>
                                    </td>
                                    <td class="shoping__cart__price">
                                        <h5 class="price">${cart.pprice}원</h5>
                                    </td>
                                    <td class="shoping__cart__quantity">
                                        <div class="quantity">
                                            <div class="pro-qty">
                                                <c:forEach var="item" items="${cartItems}">
                                                	<c:if test="${item.pno == cart.pno && item.cno == user.cno}">
                                                	<input type="text" id="qty" class="qty" value="${item.cartQuant}" data-pno="${item.pno}" data-cno="${user.cno}">
                                                	</c:if>
                                            	</c:forEach>
                                            </div>
                                        </div>
                                    </td>
                                    <td class="shoping__cart__total">
                                        <span class="total">0원</span>
                                    </td>
                                    <c:forEach var="item" items="${cartItems}">
                                    	<c:if test="${item.pno == cart.pno && item.cno == user.cno}">
		                                    <td class="shoping__cart__item__close">
		                                        <span id="deleteCartItem" data-pno="${item.pno}" data-cno="${user.cno}" class="deleteCartItem icon_close"></span>
		                                    </td>
                                    	</c:if>
                                    </c:forEach>
                                </tr>
                                </c:forEach>
                             <script>   
							 $(document).ready(function () {
								 
							    let subtotal = 0;
							    let total = 0;
							
							    // 쿠키 값을 가져오는 함수
							    function getCookie(name) {
							        const cookies = document.cookie.split('; ');
							        for (let cookie of cookies) {
							            const [key, value] = cookie.split('=');
							            if (key === name) {
							                return decodeURIComponent(value);
							            }
							        }
							        return null; // 쿠키가 없는 경우
							    }
							
							    // 모든 .cart-row에 대해 동작
								    $(".cart-row").each(function () {
								        const row = $(this); // 현재 row를 jQuery 객체로 저장
								        const subtotalElement = $(".subtotal");
								        const alltotalElement = $(".alltotal");
								        const priceElement = row.find(".price");
								        const qtyElement = row.find(".qty");
								        const totalElement = row.find(".total");
								
								        // 가격 가져오기
								        const priceText = priceElement.text().replace("원", "").trim();
								        const price = parseFloat(priceText);
								        if (isNaN(price)) {
								            console.error("Invalid price format: ", priceText);
								            return;
								        }
								
								        // 총합 업데이트 함수
								        function updateTotal() {
								            const qty = parseInt(qtyElement.val()) || 0;
								            const total = parseFloat(price * qty);
								            totalElement.text(total + "원");
								            subtotal += total;
								        }
								
								        function updateIncTotal() {
								            const qty = parseInt(qtyElement.val()) || 0; // 수량 가져오기
								            total = parseFloat(price * qty); // 총합 계산
								            subtotal += price;
								            totalElement.text(total + "원"); // 총합 표시
								        }
								
								        function updateDecTotal() {
								            const qty = parseInt(qtyElement.val()) || 0;
								            total = parseFloat(price * qty);
								            subtotal -= price;
								            totalElement.text(total + "원");
								        }
								        
								        row.find(".deleteCartItem").on("click", function () {
								        	alert('hey');
								        	const deleteInput = $(this);
								        	const pno = deleteInput.data('pno');
								        	const cno = deleteInput.data('cno');
								        	
								        	$.ajax({
								        		url: '/deleteCartItem',
								        		type: 'POST',
								        		data: { pno : pno, cno : cno},
								        		success: function(response) {
								        			alert(" 해당 장바구니 물품 삭제 완료");
								        			location.reload();
								        		},
								        		error: function(xhr, status, error) {
								        			console.error('Error다 이말이야.', error);
								        			alert("에러 발생");
								        		}
								        	});
								        });
								
								        // 수량 변경 버튼에 이벤트 추가
								        row.find(".pro-qty .qtybtn").on("click", function () {
								            let currentQty = parseInt(qtyElement.val()) || 0;
								
								            if ($(this).hasClass("inc")) {
								                currentQty++; // 증가 버튼
								                qtyElement.val(currentQty); // 수량 업데이트
								                updateIncTotal(); // 총합 업데이트
								                currentQty--;
								                subtotalElement.text(parseFloat(subtotal) + "원");
								                alltotalElement.text(parseFloat(subtotal) + "원");
								            } else if ($(this).hasClass("dec") && currentQty > 0) {
								                currentQty--; // 감소 버튼
								                qtyElement.val(currentQty); // 수량 업데이트
								                updateDecTotal(); // 총합 업데이트
								                subtotalElement.text(parseFloat(subtotal) + "원");
								                alltotalElement.text(parseFloat(subtotal) + "원");
								                currentQty++;
								            }
								            qtyElement.val(currentQty);
								
								            const productId = row.data("id") || "default";
								            console.log(productId + " product Id 값");
								            document.cookie = `${productId}_qty=${currentQty}; path=/; max-age=604800`;
								            console.log(`쿠키 저장 : ${productId}_qty=${currentQty}`);
								        });
								
								        // 초기 총합 계산
								        updateTotal();
								        subtotalElement.text(parseFloat(subtotal) + "원");
								        alltotalElement.text(parseFloat(subtotal) + "원");
								    });
							    
							    	$('#updateToCartBtn').click(function() {
							    		const quantities = [];
							    		
							    		
							    		$('.pro-qty .qty').each(function() {
							    			const qtyInput = $(this);
							    			const qtyValue = parseInt(qtyInput.val()) || 0;
							    			const pno = qtyInput.data('pno');
							    			const cno = qtyInput.data('cno');
							    			
							    			quantities.push({
							    				pno: pno,
							    				cno: cno,
							    				cartQuant: qtyValue
							    			});
							    		});
							    		console.log(quantities);
							    		
							    		$.ajax({
							    			url: '/updateCart',
							    			type: 'POST',
							    			contentType: 'application/json',
							    			data: JSON.stringify(quantities),
							    			success: function (response) {
							    				alert('장바구니 업데이트 완료');
							    				console.log(response);
							    			},
							    			error: function(xhr, status, error) {
							    				console.error('Error다 이말이야.', error);
							    				alert('Failed to update cart.');
							    			}
							    		})
							    	});	
							    	
							    	
							 });	
							    	
							   </script>                          
                                
                                
                               <!--  <script>
                                let subtotal = 0;
                                let total = 0;
                                
                                document.addEventListener("DOMContentLoaded", () => {
                                	function getCookie(name) {
                                	    const cookies = document.cookie.split('; ');
                                	    console.log(cookies);
                                	    for (let cookie of cookies) {
                                	        const [key, value] = cookie.split('=');
                                	        if (key === name) {
                                	            return decodeURIComponent(value);
                                	        }
                                	    }
                                	    return null; // 쿠키가 없는 경우
                                	}
                                    // 모든 cart-row에 대해 동작
                                    document.querySelectorAll(".cart-row").forEach((row) => {
                                    	const subtotalElement = document.querySelector(".subtotal");
                                    	const alltotalElement = document.querySelector(".alltotal");
                                        const priceElement = row.querySelector(".price");
                                        const qtyElement = row.querySelector(".qty");
                                        const totalElement = row.querySelector(".total");
                                        // 가격 가져오기
                                        const priceText = priceElement.textContent.replace("원", "").trim();
                                        const price = parseFloat(priceText);
                                        if (isNaN(price)) {
                                            console.error("Invalid price format: ", priceText);
                                            return;
                                        }
                                        // 총합 업데이트 함수
                                        function updateTotal() {
                                        	const qty = parseInt(qtyElement.value) || 0;
                                        	const total = parseFloat(price * qty);
                                        	totalElement.textContent = total + "원";
                                        	subtotal += total;
                                        }
                                        function updateIncTotal() {
                                            const qty = parseInt(qtyElement.value) || 0; // 수량 가져오기
                                            total = parseFloat(price * qty); // 총합 계산
                                            subtotal += price;
                                            totalElement.textContent = total + "원"; // 총합 표시
                                            
                                        }
                                        function updateDecTotal() {
                                        	const qty = parseInt(qtyElement.value) || 0;
                                        	total = parseFloat(price * qty);
                                        	subtotal -= price;
                                        	totalElement.textContent = total + "원";
                                        	
                                        }
                                        // 수량 변경 버튼에 이벤트 추가
                                        row.querySelectorAll(".pro-qty .qtybtn").forEach((btn) => {
                                            btn.addEventListener("click", () => {
                                                // 버튼 클릭에 따라 수량 조정
                                                let currentQty = parseInt(qtyElement.value) || 0;
                                                
                                                if (btn.classList.contains("inc")) {
                                                    ++currentQty; // 증가 버튼
                                                    qtyElement.value = currentQty; // 수량 업데이트
                                                    updateIncTotal(); // 총합 업데이트
                                                    --currentQty;
                                                    subtotalElement.textContent = parseFloat(subtotal) + "원";
                                                    
                                                } else if (btn.classList.contains("dec") && currentQty > 0) {
                                                    --currentQty; // 감소 버튼
                                                    qtyElement.value = currentQty; // 수량 업데이트
                                                    updateDecTotal(); // 총합 업데이트
                                                    subtotalElement.textContent = parseFloat(subtotal) + "원";
                                                    ++currentQty;
                                                }
                                                qtyElement.value = currentQty;
                                                
                                                const productId =row.getAttribute("data-id") || "default";
                                                console.log(productId + ' product Id 값');
                                                document.cookie = '${productId}_qty = ${currentQty}; path=/; max-age=604800';
                                                console.log('쿠키 저장 : ${productId}_qty = ${currentQty}');
                                            });
                                        });
                                        // 초기 총합 계산
                                        updateTotal();
                                        subtotalElement.textContent = parseFloat(subtotal) + "원";
                                    });
                                });
                                </script>  -->
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-lg-12">
                    <div class="shoping__cart__btns">
                        <a href="#" class="primary-btn cart-btn">CONTINUE SHOPPING</a>
                        <button id="updateToCartBtn" class="primary-btn cart-btn cart-btn-right"><span class="icon_loading"></span>
                            Upadate Cart</button>
                    </div>
                </div>
                <div class="col-lg-6">
                    <div class="shoping__continue">
                        <div class="shoping__discount">
                            <h5>Discount Codes</h5>
                            <form action="#">
                                <input type="text" placeholder="Enter your coupon code">
                                <button type="submit" class="site-btn">APPLY COUPON</button>
                            </form>
                        </div>
                    </div>
                </div>
                <div class="col-lg-6">
                    <div class="shoping__checkout">
                        <h5>Cart Total</h5>
                        <ul>
                            <li>Subtotal <span class="subtotal"></span></li>
                            <li>Total <span class="alltotal"></span></li>
                        </ul>
                        <form action ="/checkout" method="POST" id="checkout-form">
                        	<input type="hidden" name="subtotal" id="subtotal-input">
                        	<input type="hidden" name="alltotal" id="alltotal-input">
                        	<button type="submit" class="primary-btn">PROCEED TO CHECKOUT</button>
                        </form>
                        
                        <script>
                        	$(document).ready(function() {
                        		$('#checkout-form').on('submit', function() {
                        			event.preventDefault();
                        			$('#subtotal-input').val($('.subtotal').text().trim());
                        			$('#alltotal-input').val($('.alltotal').text().trim());
                        			this.submit();
                        		});
                        	});
                        </script>
                        
                        
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- Shoping Cart Section End -->

    <!-- Footer Section Begin -->
    <%@ include file="include/main_footer.jsp" %>
    <!-- Footer Section End -->

<%@ include file="include/footer.jsp" %>


</body>

</html>