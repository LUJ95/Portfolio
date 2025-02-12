<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<style>
table{
border: 1px black solid;
border-collapse: collapse;
}
</style>
</head>
<body>

  <h1>Search Products</h1>
    <form action="admin_search" method="post">
        <input type="text" name="pname" placeholder="Enter product name" required>
        <button type="submit">Search</button>
    </form>
<img alt="응애" src="resources\uploadFiles\ae97fb53-ee77-4bfb-84e2-11dc2c84dd6d_1001_main.jpg.jpg">
<table>
<tr>
	<td> product image</td>
	<td> product number </td>
	<td> product name </td>
	<td> brand name</td>
	<td> product description</td>
	<td> product volume</td>
	<td> product category </td>
	<td> product quantity</td>
	<td> product status</td>
	<td> product option</td>
</tr>
<c:forEach var="i" items="${admin_list}" >
<tr>
	<td> <img src = "$resources\uploadFiles\" + "'{i.pimg1 }'"> </td>
	
	
	<td> ${i.pno } </td>
	<td> ${i.pname } </td>
	<td> ${i.bname } </td>
	<td> ${i.pdes } </td>
	<td> ${i.pvol } </td>
	<td> ${i.pprice }</td>
	<td> ${i.pcat } </td>
	<td> ${i.pqt }</td>
	<td> ${i.pdel }</td>
	<td> ${i.pop1 } </td>
	<td><a href="admin_product?pno=${i.pno }">Edit Product</a></td>
</tr>
</c:forEach>

 <c:forEach var="j" items="${products}" >
<tr>
	<td> <img src = "${j.pimg1 }"> </td>
	<td> ${j.pno } </td>
	<td> ${j.pname } </td>
	<td> ${j.bname } </td>
	<td> ${j.pdes } </td>
	<td> ${j.pvol } </td>
	<td> ${j.pprice }</td>
	<td> ${j.pcat } </td>
	<td> ${j.pqt }</td>
	<td> ${j.pop1 } </td>
	<td> <a href="admin_product?pno=${j.pno }">Edit Product</a></td>

</tr>
</c:forEach>
</table>
<a href="admin_list">Product List</a>
</body>
</html>