<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Chi tiết đơn hàng</title>
</head>
<body>
	<h2>Thông tin đơn hàng</h2>
	<table>
		<tr>
			<td style="width: 150px">Mã đơn hàng</td>
			<td>${order.id}</td>
			<td></td>
		</tr>
		<tr>
			<td>Ngày tạo</td>
			<td><fmt:formatDate value="${order.createDate }" pattern="dd/MM/yyyy"/></td>
			<td></td>
		</tr>
		<tr>
			<td>Tổng tiền</td>
			<td><fmt:formatNumber value="${order.total}"/></td>
			<td></td>
		</tr>
		<tr>
			<td></td>
			<td></td>
			<td>
				<c:if test="${not order.status && not order.cancel}"><a href="#huydon" data-id="${order.id}">Hủy đơn hàng</a></c:if>
				<c:if test="${order.status && not order.cancel }"><b>Đơn hàng đã xử lý</b></c:if>
				<c:if test="${order.cancel }"><b>Đơn hàng đã hủy</b></c:if>
			</td>
		</tr>
	</table>
	<h4>Chi tiết đơn hàng</h4>
	<table class="table table-striped">
		<tr>
			<th>STT</th>
			<th>Mã SP</th>
			<th>Tên SP</th>
			<th>Số lượng</th>
			<th>Giá</th>
		</tr>
	<c:set var="stt" value="1"/>
	<c:forEach var="ods" items="${order.orderDetails}">
		<tr>
			<td>${stt }</td>
			<td>${ods.product.id}</td>
			<td>${ods.product.name}</td>
			<td>${ods.quantity}</td>
			<td><fmt:formatNumber value="${ods.price}"/></td>
		</tr>
		<c:set var="stt" value="${stt+1}"/>
	</c:forEach>
	</table>
	<script>
		$(document).ready(function(){
			$("a[href='#huydon']").on("click", function(evt){
				let idOrder = $(this).data("id");
				if(confirm(`Bạn muốn hủy đơn hàng có id: "${"${"}idOrder}" phải không?`)){
					window.location.href="/order/cancel?id="+idOrder;
				}
				evt.preventDefault();
			})	
		});
		
	</script>
</body>
</html>