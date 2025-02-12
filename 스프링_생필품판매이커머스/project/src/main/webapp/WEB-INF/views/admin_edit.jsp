<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
   <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Product Detail - Admin</title>
    
    <style>
    /* General Reset */
* {
    margin: 0;
    padding: 0;
    box-sizing: border-box;
}

/* Body and Page Structure */
body {
    font-family: Arial, sans-serif;
    background-color: #f4f4f9;
    color: #333;
    line-height: 1.6;
    margin: 20px;
}

.container {
    max-width: 1200px;
    margin: 0 auto;
    padding: 20px;
    background-color: #fff;
    box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
    border-radius: 8px;
}

/* Heading */
h1 {
    font-size: 2.5rem;
    margin-bottom: 20px;
    color: #4CAF50;
    text-align: center;
}

/* Form Styling */
form {
    display: flex;
    flex-direction: column;
    gap: 20px;
}

label {
    font-size: 1rem;
    margin-bottom: 5px;
    font-weight: bold;
}

input[type="text"], select {
    padding: 10px;
    font-size: 1rem;
    border: 1px solid #ddd;
    border-radius: 4px;
    width: 100%;
}

input[type="text"]:focus, select:focus {
    border-color: #4CAF50;
    outline: none;
}

button[type="submit"] {
    padding: 12px 20px;
    background-color: #4CAF50;
    color: white;
    font-size: 1rem;
    border: none;
    border-radius: 4px;
    cursor: pointer;
    transition: background-color 0.3s ease;
}

button[type="submit"]:hover {
    background-color: #45a049;
}

/* Product Image */
.product-details {
    display: flex;
    gap: 30px;
    flex-wrap: wrap;
}

.product-img {
    flex: 1;
    text-align: center;
}

.product-img img {
    max-width: 100%;
    height: auto;
    border-radius: 8px;
}

/* Product Info Section */
.product-info {
    flex: 2;
}

.product-info input[type="text"], 
.product-info select {
    margin-bottom: 15px;
}

/* Links */
a {
    display: inline-block;
    margin-top: 20px;
    padding: 10px 15px;
    background-color: #f44336;
    color: white;
    text-decoration: none;
    border-radius: 4px;
    font-size: 1rem;
    text-align: center;
}

a:hover {
    background-color: #d32f2f;
}

/* Conditional Message */
p {
    font-size: 1.2rem;
    color: #ff5722;
    text-align: center;
}

/* Responsive Design */
@media (max-width: 768px) {
    .product-details {
        flex-direction: column;
    }

    .product-img, .product-info {
        flex: 1 1 100%;
    }

    h1 {
        font-size: 2rem;
    }
}
    </style>
</head>
<body>

<div class="container">
<h1>Product Details</h1>
<form action="adminEdit" method="POST">
<c:if test = "${not empty edit }">

<div class="product-details">
	<div class="product-img">
	<img src="${edit.pimg1 }">
	//make image editable
	</div>
	
	<div class="product-info">
	<h2>${edit.pname }</h2>
	<label for="pno">Product Number: </label>
	<input type="text" id = "pno" name="pno" value="${pno }" readonly>
	<br>
	<label for="pname">Product Name: </label>
	<input type="text" id = "pname" name="pname" value="${edit.pname }">
	<br>
	<label for="bname">Brand Name: </label>
	<input type="text" id = "bname" name="bname" value="${edit.bname }">
	<br>
	<label for="category">카테고리</label>
        <select id="pcat" name="pcat">
            <option value="${edit.pcat }">${edit.pcat }</option>
            <option value="Shampoo">Shampoo</option>
            <option value="Bodywash">Bodywash</option>
            <option value="Toner">Toner</option>
            <option value="Serum">Serum</option>
            <option value="Mask">Mask</option>
        </select>
	<br>
	<label for="pdes">Description: </label>
	<input type="text" id = "pdes" name = "pdes" value="${edit.pdes }">
	<br>
	<label for="pvol">Volume: </label>
	<input type="text" id = "pvol" name = "pvol" value="${edit.pvol }">
	<br>
	<label for="pprice">Price: </label>
	<input type="text" id = "pprice" name = "pprice" value="${edit.pprice }">
	<br>
	<label for="pqt">Product Quantity: </label>
	<input type="text" id = "pqt" name = "pqt" value="${edit.pqt }">
	<br>
	<label for="preadcnt">Read Count: </label>
	<input type="text" id = "preadcnt" name = "preadcnt" value="${edit.preadcnt }" readonly>
	<br>
	<label for="pdel">Delivery: </label>
	<input type="text" id = "pdel" name = "pdel" value="${edit.pdel }" readonly>
	<br>
	<label for="pop1">Option: </label>
	<input type="text" id = "pop1" name = "pop1" value="${edit.pop1 }">
	<br>
	
	<button type="submit">Edit</button>
    </c:if>
</form>

<a href="adminDelete?pno=${edit.pno}">Delete Product</a>
 <c:if test="${empty product}">
            <p>Product not found.</p>
 </c:if>
	</div>
</div>

</body>
</html>