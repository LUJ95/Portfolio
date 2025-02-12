<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<style>
/* Reset default styling */
* {
    margin: 0;
    padding: 0;
    box-sizing: border-box;
}

/* Body styling */
body {
    font-family: Arial, sans-serif;
    background-color: #f8f8f8; /* Light gray background */
    color: #333; /* Dark text color */
    padding: 20px;
}

/* Table styling */
table {
    width: 100%;
    border-collapse: collapse;
    margin-bottom: 20px;
}

/* Table header styling */
th {
    background-color: #333; /* Dark background */
    color: white;
    padding: 10px;
    text-align: left;
}

/* Table data cell styling */
td {
    background-color: #fff; /* White background */
    padding: 10px;
    text-align: left;
    border-top: 1px solid #ddd; /* Light border */
}

/* Row hover effect */
tr:hover {
    background-color: #f0f0f0; /* Light gray hover effect */
}

/* Form and button styling */
form {
    margin-top: 10px;
}

select {
    padding: 5px;
    margin-right: 10px;
    border: 1px solid #ccc; /* Light border for select */
    background-color: #fff; /* White background */
}

button {
    padding: 6px 12px;
    background-color: #333; /* Dark background */
    color: #fff; /* White text */
    border: 1px solid #ccc; /* Light border */
    cursor: pointer;
}

button:hover {
    background-color: #555; /* Slightly lighter dark background on hover */
}

/* Footer styling */
footer {
    margin-top: 20px;
    text-align: center;
    color: #888; /* Light gray text */
    font-size: 0.8em;
}
</style>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>


  <table>
        <thead>
        	<tr>
        	<th>Order Number</th>
        	<th>Customer Number</th>
        	<th>Order Status</th>
        	</tr>
        </thead>
        <tbody>
        	<tr>
        	<c:forEach var="order" items="${admin_order }" varStatus="status">
        	<c:if test="${status.index==0 }">
        	<td> ${order.oid } </td>
        	<td> ${order.cno } </td>
        	<td>
        	<form action="admin_orderDetailSave" method="POST">
        	<input type="hidden" name="oid" value="${order.oid}" readonly/>
            <label for="dropdown">${order.ostatus }</label>
            <select id="dropdown" name="selectedOption">
                <option value="D001">D001</option>
                <option value="D003">D003</option>
            </select>
            <button type="submit">Submit</button>
            </form>
            
            </td>
        	</c:if>
        	</c:forEach>
        </tbody>
 </table>
 <table>
 	<thead>
            <tr>
                <th>Product Number</th>
                <th>Product Name</th>
                <th>Order Quantity</th>
                <th>Order Date</th>
            </tr>
        </thead>
        <tbody>
<c:forEach var="order" items="${admin_order }">
        <tr>
            <td>${order.pno}</td> 
            <td>${order.pname}</td>
            <td>${order.orderquan}</td>
            <td>${order.odate}</td>
        </tr>
</c:forEach>
        </tbody>
    </table>

</body>
</html>
