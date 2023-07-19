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
			<th>Khách hàng</th>
			<th>Ngày tạo</th>
			<th>Tổng tiền</th>
			<th>Trạng thái</th>
			<th></th>
		</tr>
		<c:forEach var="o" items="${pages.content }">
			<tr>
				<td>${o.id }</td>
				<td>${o.account.fullname }</td>
				<td><fmt:formatDate value="${o.createDate }"
						pattern="dd/MM/yyyy" /></td>
				<td><fmt:formatNumber value="${o.total }" /></td>
				<td>${o.status ? "Đã xử lý":"Chờ xử lý" }</td>
				<td><a style="text-decoration: none"
					href="/admin/order/detail?id=${o.id}"><i class="fas fa-eye"></i></a></td>
			</tr>
		</c:forEach>
	</table>
	<nav aria-label="Phân trang">
		<ul class="pagination" style="align-items: center; justify-content: center;" >
			<li class="page-item"><a class="page-link" href="?p=${pages.number-1}">&lt;&lt;</a></li>
			<c:forEach var="i" begin="1" end="${pages.totalPages}">
				<li class='page-item ${pages.number == i-1 ? "active":""}'>
					<a class="page-link" href="?p=${i-1}">${i}</a>
				</li>
			</c:forEach>
			<li class="page-item"><a class="page-link" href="?p=${pages.number+1}">&gt;&gt;</a></li>
		</ul>
	</nav>
</body>
</html>