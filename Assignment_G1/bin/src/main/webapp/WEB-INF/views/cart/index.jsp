<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta content="width=device-width, initial-scale=1.0" name="viewport">
<meta content="Free HTML Templates" name="keywords">
<meta content="Free HTML Templates" name="description">
<title>Louvre Petshop G1</title>

<!-- Favicon -->
<link href="/img/favicon.ico" rel="icon">

<!-- Google Web Fonts -->
<link
	href="https://fonts.googleapis.com/css2?family=Nunito+Sans&family=Nunito:wght@600;700;800&display=swap"
	rel="stylesheet">

<!-- Font Awesome -->
<link
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.10.0/css/all.min.css"
	rel="stylesheet">

<!-- Flaticon Font -->
<link href="/lib/flaticon/font/flaticon.css" rel="stylesheet">

<!-- Libraries Stylesheet -->
<link href="/lib/owlcarousel/assets/owl.carousel.min.css"
	rel="stylesheet">
<link href="/lib/tempusdominus/css/tempusdominus-bootstrap-4.min.css"
	rel="stylesheet" />

<!-- Customized Bootstrap Stylesheet -->
<link rel="stylesheet" href="/css/style.css" type="text/css">
</head>
<body>
	<!-- Topbar Start -->
	<div class="container-fluid ">
		<div class="navbar-container row bg-secondary py-2 px-lg-5">
			<div class="col-lg-6 text-center text-lg-left mb-2 mb-lg-0">
				<div class="d-inline-flex align-items-center">
					<a class="text-white pr-3" href="">FAQs</a> <span
						class="text-white">|</span> <a class="text-white px-3" href="">Help</a>
					<span class="text-white">|</span> <a class="text-white pl-3"
						href="">Support</a>
				</div>
			</div>
			<div class="col-lg-6 text-center text-lg-right">
				<div class="d-inline-flex align-items-center">
					<a class="text-white px-3" href=""> <i
						class="fab fa-facebook-f"></i>
					</a> <a class="text-white px-3" href=""> <i class="fab fa-twitter"></i>
					</a> <a class="text-white px-3" href=""> <i
						class="fab fa-linkedin-in"></i>
					</a> <a class="text-white px-3" href=""> <i
						class="fab fa-instagram"></i>
					</a> <a class="text-white pl-3" href=""> <i class="fab fa-youtube"></i>
					</a>
				</div>
			</div>
		</div>
		<div class="row py-3 px-lg-5">
			<div class="col-lg-4">
				<a href="" class="navbar-brand d-none d-lg-block">
					<h1 class="m-0 display-5 text-capitalize">
						<span class="text-primary">Louvre</span>PetShop
					</h1>
				</a>
			</div>
			<div class="col-lg-8 text-center text-lg-right">
				<div class="d-inline-flex align-items-center">
					<div
						class="d-inline-flex flex-column text-center pr-3 border-right">
						<h6>Opening Hours</h6>
						<p class="m-0">8.00AM - 9.00PM</p>
					</div>
					<div
						class="d-inline-flex flex-column text-center px-3 border-right">
						<h6>Email Us</h6>
						<p class="m-0">louvre@gmail.com</p>
					</div>
					<div class="d-inline-flex flex-column text-center pl-3">
						<h6>Call Us</h6>
						<p class="m-0">+012 345 6789</p>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- Topbar End -->


	<!-- Navbar Start -->
    <div class="container-fluid p-0">
        <nav class="navbar position-relative navbar-expand-lg bg-dark navbar-dark py-3 py-lg-0 px-lg-5">
            <a href="" class="navbar-brand d-block d-lg-none">
                <h1 class="m-0 display-5 text-capitalize font-italic text-white"><span class="text-primary">Louvre</span>PetShop</h1>
            </a>
            <button type="button" class="navbar-toggler" data-toggle="collapse" data-target="#navbarCollapse">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse justify-content-between px-3" id="navbarCollapse">
                <div class="navbar-nav mr-auto py-0">
                    <a href="/index" class="nav-item nav-link ">Trang chủ</a>
                    <a href="/admin/product/add" class="nav-item nav-link">Thêm Mới</a>
                    <a href="/admin/thongke/top10" class="nav-item nav-link ">Thống Kê</a>
                    <a href="/admin/product" class="nav-item nav-link " >Sản Phẩm</a>
                    <a href="/booking" class="nav-item nav-link">Booking</a>
                    <a href="/contact" class="nav-item nav-link">Contact</a>
                     <div class="nav-item dropdown">
                    <c:if test="${sessionScope.user != null}">
                        <a href="#" class="nav-link dropdown-toggle" data-toggle="dropdown">${user.fullname}</a>
                        <div class="dropdown-menu rounded-0 m-0">
                            <a href=javascript:logout()"/blog" class="dropdown-item">Blog Grid</a>
                            <a href="/single" class="dropdown-item">Blog Detail</a>
                            <div class="dropdown-divider"></div>
                            <a href="javascript:logout()" class="dropdown-item">
						Đăng xuất</a>
						     
                            </c:if>
 <a href="/login" class="nav-item nav-link">Đăng Nhập/Đăng Ký</a>
                        </div>
                    
                </div>
           
            </div>
                 <c:if test="${sessionScope.user.admin}"><a href="/admin/product"  >Trang quản trị</a></c:if>
          		<a href="/cart/view"><span class="fas fa-shopping-cart"></span>
					${sessionScope['scopedTarget.cart'].items.size()} sản phẩm - <span
					class="badge badge-warning"><fmt:formatNumber
							value="0${sessionScope['scopedTarget.cart'].amount}" /> đ</span></a>
        </nav>
    </div>
     <script>
		function logout(){
			if(confirm("Bạn muốn đăng xuất phải không?")){
				window.location.href="/logout";
			}
		}
	</script>
    <!-- Navbar End -->
	<div class="container ">
	<div class="form-group">
		<div class="span12">
			
			<div class="well well-small">
				<h1>
					Giỏ hàng <small class="pull-right">Có ${cart.items.size()}
						sản phẩm trong giỏ hàng</small>
				</h1>
				<hr class="soften" />

				<table class="table table-bordered table-condensed">
					<thead>
						<tr>
							<th>Product</th>
							<th>Description</th>
							<th>Ref.</th>
							<th>Avail.</th>
							<th>Unit price</th>
							<th>Qty</th>
							<th>Total</th>
						</tr>
					</thead>
					<tbody>
						<c:set var="tongsp" value="0" />
						<c:forEach items="${cart.items}" var="i">
							<tr>
								<td>${i.p.name }</td>
								<td></td>
								<td>-</td>
								<td><c:if test="${ i.p.available}">
										<span class="shopBtn"><span class="icon-ok"></span></span>
									</c:if></td>
								<td><fmt:formatNumber value="${i.p.price}" /></td>
								<td>
									<form action="/cart/update" method="POST">
										<input type="hidden" value="${i.p.id}" name="id" /> <input
											class="span1" style="max-width: 34px" placeholder="1"
											name="quatity" size="16" type="text" value="${i.quatity}"
											onblur="this.form.submit()">
										<div class="input-append">
											<button formaction="/cart/delete"
												class="btn btn-mini btn-danger" type="submit">
												<span class="fa fa-trash"></span>
											</button>
										</div>
									</form>
								</td>
								<td><fmt:formatNumber value="${i.p.price * i.quatity}" /></td>
							</tr>
						</c:forEach>
						<tr>
							<td colspan="6" class="alignR">Tổng số sản phẩm:</td>
							<td>${cart.count }</td>
						</tr>
						<tr>
							<td colspan="6" class="alignR">Tổng tiền:</td>
							<td><b><fmt:formatNumber value="${cart.amount }" /></b></td>
						</tr>
					</tbody>
				</table>
				<br /> <a href="/index" class="shopBtn btn btn-primary border-2"><span
					class="icon-arrow-left"></span> Mua tiếp </a> <a href="/thanhtoan"
					class="shopBtn  btn btn-info border-2">Thanh toán <span
					class="icon-arrow-right"></span></a>

			</div>
		</div>
	</div>
	</div>
	
	<!-- Footer Start -->
	<div
		class="container-fluid bg-dark text-white mt-5 py-5 px-sm-3 px-md-5">
		<div class="row pt-5">
			<div class="col-lg-4 col-md-12 mb-5">
				<h1 class="mb-3 display-5 text-capitalize text-white">
					<span class="text-primary">Louvre</span>PetShop
				</h1>
				<p class="m-0">Thương hiệu LouvrePetshop thuộc sở hữu của Công
					ty Cổ phần Louvre Việt Nam. Chúng tôi cũng là thành viên của Hiệp
					hội những nhà nhân giống chó tại Việt Nam (VKA) từ năm 2018. Là một
					trong những đơn vị đầu tiên nhập khẩu chó mèo cảnh tại Việt Nam.
					Sau nhiều năm, Louvre đã mang đến cho cộng đồng yêu cún cưng nhiều
					thế hệ thú cưng thuần chủng, chất lượng.</p>
			</div>
			<div class="col-lg-8 col-md-12">
				<div class="row">
					<div class="col-md-4 mb-5">
						<h5 class="text-primary mb-4">Get In Touch</h5>
						<p>
							<i class="fa fa-map-marker-alt mr-2"></i>Ninh kiều , Cần Thơ,
							Việt Nam
						</p>
						<p>
							<i class="fa fa-phone-alt mr-2"></i>+012 345 67890
						</p>
						<p>
							<i class="fa fa-envelope mr-2"></i>louvre@fpt.edu.vn
						</p>
						<div class="d-flex justify-content-start mt-4">
							<a
								class="btn btn-outline-light rounded-circle text-center mr-2 px-0"
								style="width: 36px; height: 36px;" href="#"><i
								class="fab fa-twitter"></i></a> <a
								class="btn btn-outline-light rounded-circle text-center mr-2 px-0"
								style="width: 36px; height: 36px;" href="#"><i
								class="fab fa-facebook-f"></i></a> <a
								class="btn btn-outline-light rounded-circle text-center mr-2 px-0"
								style="width: 36px; height: 36px;" href="#"><i
								class="fab fa-linkedin-in"></i></a> <a
								class="btn btn-outline-light rounded-circle text-center mr-2 px-0"
								style="width: 36px; height: 36px;" href="#"><i
								class="fab fa-instagram"></i></a>
						</div>
					</div>
					<div class="col-md-4 mb-5">
						<h5 class="text-primary mb-4">Popular Links</h5>
						<div class="d-flex flex-column justify-content-start">
							<a class="text-white mb-2" href="#"><i
								class="fa fa-angle-right mr-2"></i>Trang chủ</a> <a
								class="text-white mb-2" href="#"><i
								class="fa fa-angle-right mr-2"></i>Về chúng tôi</a> <a
								class="text-white mb-2" href="#"><i
								class="fa fa-angle-right mr-2"></i>Dịch vụ</a> <a
								class="text-white mb-2" href="#"><i
								class="fa fa-angle-right mr-2"></i>Thành viên</a> <a
								class="text-white" href="#"><i
								class="fa fa-angle-right mr-2"></i>Liên hệ</a>
						</div>
					</div>
					<div class="col-md-4 mb-5">
						<h5 class="text-primary mb-4">Tin mới</h5>
						<form action="">
							<div class="form-group">
								<input type="text" class="form-control border-0"
									placeholder="Nhập tên" required="required" />
							</div>
							<div class="form-group">
								<input type="email" class="form-control border-0"
									placeholder="Nhập Email" required="required" />
							</div>
							<div>
								<button class="btn btn-lg btn-primary btn-block border-0"
									type="submit">Gửi ngay</button>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
	<div class="container-fluid text-white py-4 px-sm-3 px-md-5"
		style="background: #111111;">
		<div class="row">
			<div class="col-md-6 text-center text-md-left mb-3 mb-md-0">
				<p class="m-0 text-white">
					&copy; <a class="text-white font-weight-bold" href="">Louvre</a>.
					All Rights Reserved. Designed by <a
						class="text-white font-weight-bold" href="">G1 - </a>
				</p>
			</div>
			<div class="col-md-6 text-center text-md-right">
				<ul class="nav d-inline-flex">
					<li class="nav-item"><a class="nav-link text-white py-0"
						href="#">Privacy</a></li>
					<li class="nav-item"><a class="nav-link text-white py-0"
						href="#">Terms</a></li>
					<li class="nav-item"><a class="nav-link text-white py-0"
						href="#">FAQs</a></li>
					<li class="nav-item"><a class="nav-link text-white py-0"
						href="#">Help</a></li>
				</ul>
			</div>
		</div>
	</div>
	<!-- Footer End -->
	<!-- Back to Top -->
	<a href="#" class="btn btn-lg btn-primary back-to-top"><i
		class="fa fa-angle-double-up"></i></a>
	<!-- Optional JavaScript -->
	<!-- JavaScript Libraries -->
	<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
	<script
		src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.bundle.min.js"></script>
	<script src="/lib/easing/easing.min.js"></script>
	<script src="/lib/owlcarousel/owl.carousel.min.js"></script>
	<script src="/lib/tempusdominus/js/moment.min.js"></script>
	<script src="/lib/tempusdominus/js/moment-timezone.min.js"></script>
	<script src="/lib/tempusdominus/js/tempusdominus-bootstrap-4.min.js"></script>

	<!-- Contact Javascript File -->
	<script src="/mail/jqBootstrapValidation.min.js"></script>
	<script src="/mail/contact.js"></script>

	<!-- Template Javascript -->


	<!-- Template Javascript -->

	<script src="/js/main.js"></script>
	<script src="/js/app.js"></script>
</body>
</html>