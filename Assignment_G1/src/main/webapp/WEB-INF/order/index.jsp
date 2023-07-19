<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@taglib uri="http://java.sun.com/jstl/fmt_rt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Quản lý đơn hàng</title>
</head>
<body>
	<h3 class='text-center'>DANH SÁCH ĐƠN HÀNG</h3>
	<table class="table table-striped">
		<tr>
			<th>Mã hóa đơn</th>
			<th>Ngày tạo</th>
			<th>Tổng tiền</th>
			<th>Trạng thái</th>
			<th> </th>
			<th></th>
		</tr>
		<c:forEach var="o" items="${orders }">
			<tr>
				<td>${o.id }</td>
				<td><fmt:formatDate value="${o.createDate }" pattern="dd/MM/yyyy"/> </td>
				<td><fmt:formatNumber value="${o.total }"/> </td>
				<td>${o.status ? "Đã xử lý":"Chờ xử lý" }</td>
				<td><a style="text-decoration: none" href="/order/detail?id=${o.id}"><i class="icon-eye-open"></i></a></td>
			</tr>
		</c:forEach>
	</table>
	
</body>
</html>