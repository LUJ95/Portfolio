<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Product Detail - Admin</title>
</head>
<body>
    <div class="container">
        <h1>Product Details</h1>

        <!-- Check if the product object is available -->
        <c:if test="${not empty product}">
            <div class="product-detail">
                <div class="product-img">
                    <img src="${product.pimg1}" alt="Product Image" width = "100" height = "100" />
                </div>

                <div class="product-info">
                	
                    <h2>${product.pname}</h2>
                    
                    <p><strong>Brand:</strong> ${product.bname}</p>
                    <p><strong>Category:</strong> ${product.pcat}</p>
                    <p><strong>Description:</strong> ${product.pdes}</p>
                    <p><strong>Volume:</strong> ${product.pvol}</p>
                    <p><strong>Price:</strong> $${product.pprice}</p>
                    <p><strong>Quantity Available:</strong> ${product.pqt}</p>
                    <p><strong>Read Count:</strong> ${product.preadcnt}</p>
                    <p><strong>Status:</strong> ${product.pdel}</p>
                    <p><strong>Option:</strong> ${product.pop1}</p>

                    <a href="adminEdit?pno=${product.pno}">Edit Product</a>

                    
   					<a href="adminDelete?pno=${product.pno}">Delete Product</a>
				
                    
                </div>
            </div>
        </c:if>

        <!-- If the product is not found, show an error message -->
        <c:if test="${empty product}">
            <p>Product not found.</p>
        </c:if>
    </div>

    <!-- Optional: Add footer or other content -->

</body>
</html>
