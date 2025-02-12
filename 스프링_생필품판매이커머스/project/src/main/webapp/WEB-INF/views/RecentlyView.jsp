<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<style>
  .recently-viewed {
    padding: 40px 0;
    background-color: #f9f9f9;
  }
  .recently-viewed .section-title {
    font-size: 1.5rem;
    font-weight: 600;
    text-align: left;
    margin-bottom: 20px;
    color: #333;
  }
  .product-grid {
    display: grid;
    grid-template-columns: repeat(auto-fill, minmax(150px, 1fr));
    gap: 20px;
  }
  .product-card {
    text-align: center;
    background: #fff;
    padding: 15px;
    border: 1px solid #eaeaea;
    border-radius: 8px;
    transition: box-shadow 0.3s ease;
  }
  .product-card:hover {
    box-shadow: 0 4px 12px rgba(0, 0, 0, 0.1);
  }
  .product-image {
    max-width: 100%;
    height: auto;
    margin-bottom: 10px;
    border-radius: 4px;
  }
  .product-name {
    display: block;
    font-size: 1rem;
    font-weight: 500;
    color: #333;
    margin-bottom: 5px;
    text-decoration: none;
  }
  .product-name:hover {
    text-decoration: underline;
  }
  .product-price {
    font-size: 0.9rem;
    color: #777;
  }
</style>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<section class="recently-viewed">
  <div class="container">
    <h2 class="section-title">최근 본 상품</h2>
    <div class="product-grid">
      <!-- Example Product Card -->
      <div class="product-card">
        <a href="#">
          <img src="img/product1.jpg" alt="상품명" class="product-image">
        </a>
        <div class="product-info">
          <a href="#" class="product-name">상품명 예제 1</a>
          <p class="product-price">₩99,000</p>
        </div>
      </div>

      <div class="product-card">
        <a href="#">
          <img src="img/product2.jpg" alt="상품명" class="product-image">
        </a>
        <div class="product-info">
          <a href="#" class="product-name">상품명 예제 2</a>
          <p class="product-price">₩120,000</p>
        </div>
      </div>

      <div class="product-card">
        <a href="#">
          <img src="img/product3.jpg" alt="상품명" class="product-image">
        </a>
        <div class="product-info">
          <a href="#" class="product-name">상품명 예제 3</a>
          <p class="product-price">₩75,000</p>
        </div>
      </div>
    </div>
  </div>
</section>


</body>
</html>