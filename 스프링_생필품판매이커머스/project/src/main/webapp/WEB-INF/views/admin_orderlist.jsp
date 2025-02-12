<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admin Order View</title>
    <style>
 <style>
     /* Container to hold both tables side by side */
		body {
		display: inline-block;
		width: 100%;
		}
       .container {
       display: inline-block;
       padding: 20px 40px 0 40px;
       }
       .con{
       display: block;
       padding: 40px 40px 40xp 40xp;
       }
        /* Styling for individual tables */
        table {
            width: 100%; /* Each table will take up 48% of the container's width */
            margin-right: 20px;

            border-collapse: collapse;
            box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
        }

        th, td {
            padding: 8px;
            text-align: left;
            border: 1px solid #ddd;
        }

        th {
            background-color: #f4f4f4;
        }

        .status {
            font-weight: bold;
        }

        a {
    color: #007bff;
    text-decoration: none;
    display: block;
}

a:hover {
    text-decoration: underline;
}

/* Form Styling */
form {
    margin-top: 20px;
}

input[type="checkbox"] {
    margin-right: 10px;
}

select {
    padding: 8px;
    border-radius: 5px;
    border: 1px solid #ccc;
    margin-right: 10px;
}

button[type="submit"] {
    background-color: #28a745;
    color: white;
    padding: 8px 16px;
    border: none;
    border-radius: 5px;
    cursor: pointer;
    transition: background-color 0.3s ease;
}

button[type="submit"]:hover {
    background-color: #218838;
}

label {
    font-weight: bold;
}

/* Select All Checkbox Styling */
#selectAll {
    margin-right: 10px;
}

/* Responsive Layout */
@media screen and (max-width: 768px) {
    table, th, td {
        font-size: 14px;
        padding: 8px;
    }

    .container {
        margin: 10px;
        padding: 15px;
    }

    button[type="submit"], .btn {
        padding: 8px 12px;
    }
    </style>
</head>
<body>

<header>
    <h1>Admin - View Orders</h1>
</header>

<a href="admin_home" class="btn">Go to AdminHomepage</a>

<div class="container">
<h2>Orders</h2>
<label>
        <input type="checkbox" id="selectAll" /> Select All
    </label>
    <table>
        <thead>
            <tr>
                <th>Order Number</th>
                <th>Customer Number</th>
                <th>Total Purchase</th>
                <th>Delivery Status</th>
                <th>Order Date</th>
            </tr>
        </thead>
        <tbody>
        
<form action="admin_orderlist" method="POST"> 
<c:forEach var="p" items="${pending}">
        <tr>
        	<td><input type="checkbox" name="chkBox" value="${p.oid}" class="checkbox"></td>
            <td>${p.oid}</td> 
            <td>${p.cno}</td>
            <td>${p.ototal}</td>
            <td class="status">${p.ostatus}</td>
            <td>${p.odate}</td>
            <td><a href="admin_orderDetail?oid=${p.oid}">Details</a></td>
            
        </tr>
</c:forEach>  
            <button type="submit">On Delivery</button>
            </form>
        </tbody>
    </table>
</div>

<div class="container">
<h2>Orders Completed</h2>
    <table>
        <thead>
            <tr>
                <th>Order Number</th>
                <th>Customer Number</th>
                <th>Total Purchase</th>
                <th>Delivery Status</th>
                <th>Order Date</th>
            </tr>
        </thead>
        <tbody>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<c:forEach var="d" items="${delivery}" varStatus="status">
        <tr>
            <td>${d.oid}</td> 
            <td>${d.cno}</td>
            <td>${d.ototal}</td>
            <td class="status">${d.ostatus}</td>
            <td>${d.odate}</td>
            <td><a href="admin_orderDetail?oid=${d.oid}">Details</a></td>
        </tr>
</c:forEach>
        </tbody>
    </table>
</div>
<br><br><br><br>
<div class="con">
<label for="dropdown">Category</label>
			<form action="admin_orderlist" method="Get">
            <select id="option" name="option">
            	<option value="" selected disabled>Select an option</option>
                <option value="D001">D001</option>
                <option value="D003">D003</option>
                <option value="D004">D004</option>
            </select>
            <button type="submit">Filter</button>
            </form>
         </div>   
<div class="con">
<h2>Orders</h2>
    <table>
        <thead>
            <tr>
                <th>Order Number</th>
                <th>Customer Number</th>
                <th>Total Purchase</th>
                <th>Delivery Status</th>
                <th>Order Date</th>
            </tr>
        </thead>
        <tbody>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>



<c:forEach var="order" items="${admin_orderlist}" varStatus="status">
        <tr>
            <td>${order.oid}</td> 
            <td>${order.cno}</td>
            <td>${order.ototal}</td>
            <td class="status">${order.ostatus}</td>
            <td>${order.odate}</td>
            <td><a href="admin_orderDetail?oid=${order.oid}">Details</a></td>
        </tr>
</c:forEach>
        </tbody>
    </table>
</div>  
         
<script>
// JavaScript to check/uncheck all checkboxes when "Select All" is clicked
document.getElementById('selectAll').addEventListener('change', function() {
    var checkboxes = document.querySelectorAll('.checkbox');  // Get all checkboxes with class 'checkbox'
    checkboxes.forEach(function(checkbox) {
        checkbox.checked = document.getElementById('selectAll').checked;  // Set each checkbox to the state of the "Select All"
    });
});
</script>  
</body>
</html>
