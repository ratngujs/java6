<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%> 
	<%@taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@taglib uri="http://java.sun.com/jstl/fmt_rt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta content="width=device-width, initial-scale=1.0" name="viewport">
    <meta content="Free HTML Templates" name="keywords">
    <meta content="Free HTML Templates" name="description">
<title>Louvre Petshop G1</title>

<!-- Favicon -->
    <link href="/img/favicon.ico" rel="icon">

    <!-- Google Web Fonts -->
    <link href="https://fonts.googleapis.com/css2?family=Nunito+Sans&family=Nunito:wght@600;700;800&display=swap" rel="stylesheet"> 

    <!-- Font Awesome -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.10.0/css/all.min.css" rel="stylesheet">

    <!-- Flaticon Font -->
    <link href="/lib/flaticon/font/flaticon.css" rel="stylesheet">

    <!-- Libraries Stylesheet -->
    <link href="/lib/owlcarousel/assets/owl.carousel.min.css" rel="stylesheet">
    <link href="/lib/tempusdominus/css/tempusdominus-bootstrap-4.min.css" rel="stylesheet" />

    <!-- Customized Bootstrap Stylesheet -->
   <link rel="stylesheet" href="/css/style.css" type="text/css">
</head>
<body>
 <!-- Topbar Start -->
    <div class="container-fluid ">
        <div class="navbar-container row bg-secondary py-2 px-lg-5">
            <div class="col-lg-6 text-center text-lg-left mb-2 mb-lg-0">
                <div class="d-inline-flex align-items-center">
                    <a class="text-white pr-3" href="">FAQs</a>
                    <span class="text-white">|</span>
                    <a class="text-white px-3" href="">Help</a>
                    <span class="text-white">|</span>
                    <a class="text-white pl-3" href="">Support</a>
                </div>
            </div>
            <div class="col-lg-6 text-center text-lg-right">
                <div class="d-inline-flex align-items-center">
                    <a class="text-white px-3" href="">
                        <i class="fab fa-facebook-f"></i>
                    </a>
                    <a class="text-white px-3" href="">
                        <i class="fab fa-twitter"></i>
                    </a>
                    <a class="text-white px-3" href="">
                        <i class="fab fa-linkedin-in"></i>
                    </a>
                    <a class="text-white px-3" href="">
                        <i class="fab fa-instagram"></i>
                    </a>
                    <a class="text-white pl-3" href="">
                        <i class="fab fa-youtube"></i>
                    </a>
                </div>
            </div>
        </div>
        <div class="row py-3 px-lg-5">
            <div class="col-lg-4">
                <a href="" class="navbar-brand d-none d-lg-block">
                    <h1 class="m-0 display-5 text-capitalize"><span class="text-primary">Louvre</span>PetShop</h1>
                </a>
            </div>
            <div class="col-lg-8 text-center text-lg-right">
                <div class="d-inline-flex align-items-center">
                    <div class="d-inline-flex flex-column text-center pr-3 border-right">
                        <h6 >Opening Hours</h6>
                        <p class="m-0">8.00AM - 9.00PM</p>
                    </div>
                    <div class="d-inline-flex flex-column text-center px-3 border-right">
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
                    <a href="/index" class="nav-item nav-link active">Trang Chủ</a>
                    <a href="/about" class="nav-item nav-link">Giới Thiệu</a>
                    <a href="/service" class="nav-item nav-link">Dịch Vụ</a>
                    <a href="/price" class="nav-item nav-link">Giá Thành</a>
                    <a href="/booking" class="nav-item nav-link">Đặt Trước</a>
                     <a href="/contact" class="nav-item nav-link">Liên Hệ</a>
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
                <c:if test="${sessionScope.user.admin}"><a class="mr-2" href="/admin/product"  ><span class="fa fa-user-circle">Trang quản trị</span> </a></c:if>
                <a href="/cart/view"><span class="fas fa-shopping-cart"></span>
					${sessionScope['scopedTarget.cart'].items.size()} sản phẩm - <span
					class="badge badge-warning"><fmt:formatNumber
							value="0${sessionScope['scopedTarget.cart'].amount}" /> đ</span></a>
            </div>
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
	
						
						

    <!-- Carousel Start -->
    <div class="container-fluid p-0">
        <div id="header-carousel" class="carousel slide" data-ride="carousel">
            <div class="carousel-inner">
                <div class="carousel-item active">
                    <img class="w-100" src="img/carousel-1.jpg" alt="Image">
                    <div class="carousel-caption d-flex flex-column align-items-center justify-content-center">
                        <div class="p-3" style="max-width: 800px;">
                            <h3 class="text-white mb-3 d-none d-sm-block">Dịch Vụ Thú Cưng Tốt Nhất</h3>
                            <h1 class="display-3 text-white mb-3">Keep Your Pet Happy</h1>
                            <h5 class="text-white mb-3 d-none d-sm-block">Thú cưng của bạn sẽ cảm thấy hạnh phúc và thoải mái</h5>
                            <a href="" class="btn btn-lg btn-primary mt-3 mt-md-4 px-4">Book Ngay</a>
                            <a href="" class="btn btn-lg btn-secondary mt-3 mt-md-4 px-4">Tìm hiểu thêm</a>
                        </div>
                    </div>
                </div>
                <div class="carousel-item">
                    <img class="w-100" src="img/carousel-2.jpg" alt="Image">
                    <div class="carousel-caption d-flex flex-column align-items-center justify-content-center">
                        <div class="p-3" style="max-width: 900px;">
                            <h3 class="text-white mb-3 d-none d-sm-block">Dịch Vụ Thú Cưng Tốt Nhất</h3>
                            <h1 class="display-3 text-white mb-3">Pet Spa & Grooming</h1>
                            <h5 class="text-white mb-3 d-none d-sm-block">Chăm sóc & điều trị cho thú cưng của bạn</h5>
                            <a href="" class="btn btn-lg btn-primary mt-3 mt-md-4 px-4">Book Ngay</a>
                            <a href="" class="btn btn-lg btn-secondary mt-3 mt-md-4 px-4">Tìm Hiểu Thêm</a>
                        </div>
                    </div>
                </div>
            </div>
            <a class="carousel-control-prev" href="#header-carousel" data-slide="prev">
                <div class="btn btn-primary rounded" style="width: 45px; height: 45px;">
                    <span class="carousel-control-prev-icon mb-n2"></span>
                </div>
            </a>
            <a class="carousel-control-next" href="#header-carousel" data-slide="next">
                <div class="btn btn-primary rounded" style="width: 45px; height: 45px;">
                    <span class="carousel-control-next-icon mb-n2"></span>
                </div>
            </a>
        </div>
    </div>
    <!-- Carousel End -->


    <!-- Booking Start -->
    <div class="container-fluid bg-light">
        <div class="container">
            <div class="row align-items-center">
                <div class="col-lg-5">
                    <div class="bg-primary py-5 px-4 px-sm-5">
                        <form class="py-5">
                            <div class="form-group">
                                <input type="text" class="form-control border-0 p-4" placeholder="Tên của bạn" required="required" />
                            </div>
                            <div class="form-group">
                                <input type="email" class="form-control border-0 p-4" placeholder="Email của bạn" required="required" />
                            </div>
                            <div class="form-group">
                                <div class="date" id="date" data-target-input="nearest">
                                    <input type="text" class="form-control border-0 p-4 datetimepicker-input" placeholder="Ngày đăng kí" data-target="#date" data-toggle="datetimepicker"/>
                                </div>
                            </div>
                            <div class="form-group">
                                <div class="time" id="time" data-target-input="nearest">
                                    <input type="text" class="form-control border-0 p-4 datetimepicker-input" placeholder="Thời gian đăng kí" data-target="#time" data-toggle="datetimepicker"/>
                                </div>
                            </div>
                            <div class="form-group">
                                <select class="custom-select border-0 px-4" style="height: 47px;">
                                    <option selected>Chọn Dịch Vụ</option>
                                    <option value="1">Gói dịch vụ 1</option>
                                    <option value="2">Gói dịch vụ 2</option>
                                    <option value="3">Gói dịch vụ 3</option>
                                </select>
                            </div>
                            <div>
                                <button class="btn btn-dark btn-block border-0 py-3" type="submit">Book Ngay</button>
                            </div>
                        </form>
                    </div>
                </div>
                <div class="col-lg-7 py-5 py-lg-0 px-3 px-lg-5">
                    <h4 class="text-secondary mb-3">Bạn bận việc hoặc có kì nghỉ?</h4>
                    <h1 class="display-4 mb-4">Book cho <span class="text-primary">Thú cưng</span></h1>
                    <p>Dịch vụ tận tâm , chăm sóc chu đáo, đảm bảo về dinh dưỡng, an toàn cho thú cưng của bạn</p>
                    <div class="row py-2">
                        <div class="col-sm-6">
                            <div class="d-flex flex-column">
                                <div class="d-flex align-items-center mb-2">
                                    <h1 class="flaticon-house font-weight-normal text-secondary m-0 mr-3"></h1>
                                    <h5 class="text-truncate m-0">Khách sạn thú cưng</h5>
                                </div>
                                <p>không gian rộng rãi, sạch sẽ và an toàn đảm bảo điều kiện thoải mái nhất cho thú cưng</p>
                            </div>
                        </div>
                        <div class="col-sm-6">
                            <div class="d-flex flex-column">
                                <div class="d-flex align-items-center mb-2">
                                    <h1 class="flaticon-food font-weight-normal text-secondary m-0 mr-3"></h1>
                                    <h5 class="text-truncate m-0">dịch vụ ăn uống</h5>
                                </div>
                                <p>Thức ăn đảm bảo về dinh dưỡng, phù hợp với từng loại thú cưng</p>
                            </div>
                        </div>
                        <div class="col-sm-6">
                            <div class="d-flex flex-column">
                                <div class="d-flex align-items-center mb-2">
                                    <h1 class="flaticon-grooming font-weight-normal text-secondary m-0 mr-3"></h1>
                                    <h5 class="text-truncate m-0">dịch vụ Spa</h5>
                                </div>
                                <p class="m-0">chăm sóc lông, cắt tỉa, tắm gội cho thú cưng</p>
                            </div>
                        </div>
                        <div class="col-sm-6">
                            <div class="d-flex flex-column">
                                <div class="d-flex align-items-center mb-2">
                                    <h1 class="flaticon-toy font-weight-normal text-secondary m-0 mr-3"></h1>
                                    <h5 class="text-truncate m-0">Tranning kĩ năng</h5>
                                </div>
                                <p class="m-0">dịch vụ dạy học các kĩ năng , động tác cho thú cưng</p>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- Booking End -->


    <!-- About Start -->
    <div class="container py-5">
        <div class="row py-5">
            <div class="col-lg-7 pb-5 pb-lg-0 px-3 px-lg-5">
                <h4 class="text-secondary mb-3">About Us</h4>
                <h1 class="display-4 mb-4"><span class="text-primary">Nội trú</span> & <span class="text-secondary">Chăm sóc thú y</span></h1>
                <h5 class="text-muted mb-3">VÌ SAO NÊN CHỌN ĐIỀU TRỊ NỘI TRÚ THÚ CƯNG TẠI LOUVREPETSHOP?</h5>
                <p class="mb-4">Việc điều trị nội trú tạo điều kiện cho đội ngũ bác sĩ có cơ hội tiếp cận thường xuyên hơn với thú cưng và điều chỉnh phác đồ điều trị dựa trên sự thay đổi đó , ngoài ra chúng tôi còn đưa ra một chế độ dinh dưỡng phù hợp hơn cho thú cưng của bạn.</p>
                <ul class="list-inline">
                    <li><h5><i class="fa fa-check-double text-secondary mr-3"></i>Dịch vụ tốt nhất</h5></li>
                    <li><h5><i class="fa fa-check-double text-secondary mr-3"></i>Dịch vụ chu đáo , tận tình , phục vụ cả ngày lễ tết</h5></li>
                    <li><h5><i class="fa fa-check-double text-secondary mr-3"></i>Hỗ trợ khách hàng và đội ngũ bác sĩ trực 24/7</h5></li>
                   
                </ul>
                <a href="" class="btn btn-lg btn-primary mt-3 px-4">Tìm Hiểu Thêm</a>
            </div>
            <div class="col-lg-5">
                <div class="row px-3">
                    <div class="col-12 p-0">
                        <img class="img-fluid w-100" src="img/about-1.jpg" alt="">
                    </div>
                    <div class="col-6 p-0">
                        <img class="img-fluid w-100" src="img/about-2.jpg" alt="">
                    </div>
                    <div class="col-6 p-0">
                        <img class="img-fluid w-100" src="img/about-3.jpg" alt="">
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- About End -->


    <!-- Services Start -->
    <div class="container-fluid bg-light pt-5">
        <div class="container py-5">
            <div class="d-flex flex-column text-center mb-5">
                <h4 class="text-secondary mb-3">Dịch Vụ Của Chúng Tôi</h4>
                <h1 class="display-4 m-0"><span class="text-primary">Dịch vụ thú cưng</span> Cao cấp</h1>
            </div>
            <div class="row pb-3">
                <div class="col-md-6 col-lg-4 mb-4">
                    <div class="d-flex flex-column text-center bg-white mb-2 p-3 p-sm-5">
                        <h3 class="flaticon-house display-3 font-weight-normal text-secondary mb-3"></h3>
                        <h3 class="mb-3">Nội trú thú cưng</h3>
                        <p>cung cấp các tiện nghi, ăn uống, nghỉ ngơi, vui chơi giải trí và một số thông tin khác ,các phòng nội trú khác nhau phù hợp từng loại “thú cưng”</p>
                        <a class="text-uppercase font-weight-bold" href="">Xem Thêm</a>
                    </div>
                </div>
                <div class="col-md-6 col-lg-4 mb-4">
                    <div class="d-flex flex-column text-center bg-white mb-2 p-3 p-sm-5">
                        <h3 class="flaticon-food display-3 font-weight-normal text-secondary mb-3"></h3>
                        <h3 class="mb-3">Dịch vụ ăn uống</h3>
                        <p>Cung cấp khẩu phần ăn đặc biệt và phù hợp cho từng loại thú cưng của bạn , ngoài ra dịch vụ còn cung cấp thực đơn theo khẩu phần ăn đầy đủ dinh dưỡng cho các loại "thú cưng"</p>
                        <a class="text-uppercase font-weight-bold" href="">Xem Thêm</a>
                    </div>
                </div>
                <div class="col-md-6 col-lg-4 mb-4">
                    <div class="d-flex flex-column text-center bg-white mb-2 p-3 p-sm-5">
                        <h3 class="flaticon-grooming display-3 font-weight-normal text-secondary mb-3"></h3>
                        <h3 class="mb-3">Dịch vụ Spa</h3>
                        <p>Spa thú cưng là các dịch vụ chăm sóc và “ làm đẹp” cho thú cưng bằng các công việc như cắt tỉa, cạo lông, nhuộm, tắm và vệ sinh cho chó mèo ,tư vấn dinh dưỡng</p>
                        <a class="text-uppercase font-weight-bold" href="">Xem Thêm</a>
                    </div>
                </div>
                <div class="col-md-6 col-lg-4 mb-4">
                    <div class="d-flex flex-column text-center bg-white mb-2 p-3 p-sm-5">
                        <h3 class="flaticon-cat display-3 font-weight-normal text-secondary mb-3"></h3>
                        <h3 class="mb-3">Pet Training</h3>
                        <p>Pet Training là hình thức day các kĩ năng cho thú cưng ,dù chỉ mới được phát triển gần đây , nhưng được nhiều người quan tâm và yêu thích</p>
                        <a class="text-uppercase font-weight-bold" href="">Xem Thêm</a>
                    </div>
                </div>
                <div class="col-md-6 col-lg-4 mb-4">
                    <div class="d-flex flex-column text-center bg-white mb-2 p-3 p-sm-5">
                        <h3 class="flaticon-dog display-3 font-weight-normal text-secondary mb-3"></h3>
                        <h3 class="mb-3">Bài tập thú cưng</h3>
                        <p>thú cưng của bạn sẽ được học các lệnh , thưởng phạt theo hành vi ,dạy thú cưng các động tác bắt tay , đi vệ sinh đúng chổ... </p>
                        <a class="text-uppercase font-weight-bold" href="">Xem Thêm</a>
                    </div>
                </div>
                <div class="col-md-6 col-lg-4 mb-4">
                    <div class="d-flex flex-column text-center bg-white mb-2 p-3 p-sm-5">
                        <h3 class="flaticon-vaccine display-3 font-weight-normal text-secondary mb-3"></h3>
                        <h3 class="mb-3">Điều trị thú cưng</h3>
                        <p>cung cấp dịch vụ y tế , chăm sóc và điều trị triệt để các bệnh của thú cưng , ngoài ra còn có các vaccine phòng bệnh ở thú cưng</p>
                        <a class="text-uppercase font-weight-bold" href="">Xem Thêm</a>
                    </div>
                </div>
            </div>
        </div>
    </div>

   
    <!-- Services End -->

    <!-- Products  -->
 <div class="container-fluid bg-light pt-5">
        <div class="container py-5">
            <div class="d-flex flex-column text-center mb-5">
                <h4 class="text-secondary mb-3">Các sản phẩm nổi bật</h4>
                <h1 class="display-4 m-0"><span class="text-primary">Sản phẩm</span> Bán chạy</h1>
            </div>
            
           <section class="shop" id="shop">
				<div class="box-container">
				
					<c:forEach items="${newProduct}" var="p">
						<div class="box">
							<div class="icons">
								<a href="/cart/add?id=${p.id }" title="Giỏ hàng" class="fas fa-shopping-cart"></a>
								 <a href="#" class="fas fa-heart"></a>
                           		 <a href="#" class="fas fa-eye"></a>
							</div>
							<div class="image">
								<img src="upload/hinhsp/${p.image}" alt="">
							</div>
							<div class="content">
								<h3>${p.name }</h3>
								<div class="amount badge badge-warning text-white font-bold">${p.price } VNĐ</div>
							</div>
						</div>
					</c:forEach>
					
					
						

				</div>

			</section>
			 <a href="product/product-view" class="btn btn-lg container text-center btn-primary mb-3">Xem Thêm Sản Phẩm</a>
        </div>
         
    </div>
   
    <!-- Products End -->

    <!-- Features Start -->
    <div class="container">
        <div class="row align-items-center">
            <div class="col-lg-5">
                <img class="img-fluid w-100" src="img/feature.jpg" alt="">
            </div>
            <div class="col-lg-7 py-5 py-lg-0 px-3 px-lg-5">
                <h4 class="text-secondary mb-3">Lý do bạn nên chọn chúng tôi?</h4>
                <h1 class="display-4 mb-4"><span class="text-primary">Chăm Sóc Đặc Biệt</span> Cho Thú Cưng</h1>
                <p class="mb-4">Đội ngũ y bác sĩ phục vụ tận tình , túc trực 24/7 , cung cấp dịch vụ hỗ trợ thú thú cưng tốt nhất với mức giá phù hợp nhất</p>
                <div class="row py-2">
                    <div class="col-6">
                        <div class="d-flex align-items-center mb-4">
                            <h1 class="flaticon-cat font-weight-normal text-secondary m-0 mr-3"></h1>
                            <h5 class="text-truncate m-0">Lựa chọn tốt nhất</h5>
                        </div>
                    </div>
                    <div class="col-6">
                        <div class="d-flex align-items-center mb-4">
                            <h1 class="flaticon-doctor font-weight-normal text-secondary m-0 mr-3"></h1>
                            <h5 class="text-truncate m-0">Dịch vụ khẩn cấp</h5>
                        </div>
                    </div>
                    <div class="col-6">
                        <div class="d-flex align-items-center">
                            <h1 class="flaticon-care font-weight-normal text-secondary m-0 mr-3"></h1>
                            <h5 class="text-truncate m-0">Chăm sóc tận tâm</h5>
                        </div>
                    </div>
                    <div class="col-6">
                        <div class="d-flex align-items-center">
                            <h1 class="flaticon-dog font-weight-normal text-secondary m-0 mr-3"></h1>
                            <h5 class="text-truncate m-0">Hỗ trợ tận tình</h5>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- Features End -->


    <!-- Pricing Plan Start -->
    <div class="container-fluid bg-light pt-5 pb-4">
        <div class="container py-5">
            <div class="d-flex flex-column text-center mb-5">
                <h4 class="text-secondary mb-3">Bảng giá dịch vụ</h4>
                <h1 class="display-4 m-0">Lựa Chọn Giá Dịch Vụ<span class="text-primary"> Tốt Nhất</span></h1>
            </div>
            <div class="row">
                <div class="col-lg-4 mb-4">
                    <div class="card border-0">
                        <div class="card-header position-relative border-0 p-0 mb-4">
                            <img class="card-img-top" src="img/price-1.jpg" alt="">
                            <div class="position-absolute d-flex flex-column align-items-center justify-content-center w-100 h-100" style="top: 0; left: 0; z-index: 1; background: rgba(0, 0, 0, .5);">
                                <h3 class="text-primary mb-3">Cơ bản</h3>
                                <h1 class="display-4 text-white mb-0">
                                    <small class="align-top" style="font-size: 22px; line-height: 45px;">VNĐ</small>549k<small class="align-bottom" style="font-size: 16px; line-height: 40px;">/ Tuần</small>
                                </h1>
                            </div>
                        </div>
                        <div class="card-body text-center p-0">
                            <ul class="list-group list-group-flush mb-4">
                                <li class="list-group-item p-2"><i class="fa fa-check text-secondary mr-2"></i>Cho ăn</li>
                                <li class="list-group-item p-2"><i class="fa fa-check text-secondary mr-2"></i>Lưu trú</li>
                                <li class="list-group-item p-2"><i class="fa fa-times text-danger mr-2"></i>Spa & Chăm Sóc, Cắt tỉa</li>
                                <li class="list-group-item p-2"><i class="fa fa-times text-danger mr-2"></i>Chăm sóc thú y</li>
                            </ul>
                        </div>
                        <div class="card-footer border-0 p-0">
                            <a href="" class="btn btn-primary btn-block p-3" style="border-radius: 0;">Đăng Ký Ngay</a>
                        </div>
                    </div>
                </div>
                <div class="col-lg-4 mb-4">
                    <div class="card border-0">
                        <div class="card-header position-relative border-0 p-0 mb-4">
                            <img class="card-img-top" src="img/price-2.jpg" alt="">
                            <div class="position-absolute d-flex flex-column align-items-center justify-content-center w-100 h-100" style="top: 0; left: 0; z-index: 1; background: rgba(0, 0, 0, .5);">
                                <h3 class="text-secondary mb-3">Thông Thường</h3>
                                <h1 class="display-4 text-white mb-0">
                                    <small class="align-top" style="font-size: 22px; line-height: 45px;">VNĐ</small>1,19Triệu<small class="align-bottom" style="font-size: 16px; line-height: 40px;">/ Tuần</small>
                                </h1>
                            </div>
                        </div>
                        <div class="card-body text-center p-0">
                            <ul class="list-group list-group-flush mb-4">
                                <li class="list-group-item p-2"><i class="fa fa-check text-secondary mr-2"></i>Cho ăn</li>
                                <li class="list-group-item p-2"><i class="fa fa-check text-secondary mr-2"></i>Lưu trú</li>
                                <li class="list-group-item p-2"><i class="fa fa-check text-secondary mr-2"></i>Spa & Chăm Sóc, Cắt tỉa</li>
                                <li class="list-group-item p-2"><i class="fa fa-times text-danger mr-2"></i>Chăm sóc thú y</li>
                            </ul>
                        </div>
                        <div class="card-footer border-0 p-0">
                            <a href="" class="btn btn-secondary btn-block p-3" style="border-radius: 0;">Đăng Ký Ngay</a>
                        </div>
                    </div>
                </div>
                <div class="col-lg-4 mb-4">
                    <div class="card border-0">
                        <div class="card-header position-relative border-0 p-0 mb-4">
                            <img class="card-img-top" src="img/price-3.jpg" alt="">
                            <div class="position-absolute d-flex flex-column align-items-center justify-content-center w-100 h-100" style="top: 0; left: 0; z-index: 1; background: rgba(0, 0, 0, .5);">
                                <h3 class="text-primary mb-3">Đặc Biệt</h3>
                                <h1 class="display-4 text-white mb-0">
                                    <small class="align-top" style="font-size: 22px; line-height: 45px;">VNĐ</small>2,19Triệu<small class="align-bottom" style="font-size: 16px; line-height: 40px;">/ Tuần</small>
                                </h1>
                            </div>
                        </div>
                        <div class="card-body text-center p-0">
                            <ul class="list-group list-group-flush mb-4">
                                <li class="list-group-item p-2"><i class="fa fa-check text-secondary mr-2"></i>Cho ăn</li>
                                <li class="list-group-item p-2"><i class="fa fa-check text-secondary mr-2"></i>Lưu trú</li>
                                <li class="list-group-item p-2"><i class="fa fa-check text-secondary mr-2"></i>Spa & Chăm Sóc, Cắt tỉa</li>
                                <li class="list-group-item p-2"><i class="fa fa-check text-secondary mr-2"></i>Chăm sóc thú y</li>
                            </ul>
                        </div>
                        <div class="card-footer border-0 p-0">
                            <a href="" class="btn btn-primary btn-block p-3" style="border-radius: 0;">Đăng Ký Ngay</a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- Pricing Plan End -->


    <!-- Team Start -->
    <div class="container mt-5 pt-5 pb-3">
        <div class="d-flex flex-column text-center mb-5">
            <h4 class="text-secondary mb-3">Thành viên nhóm</h4>
            <h1 class="display-4 m-0">Gặp gỡ <span class="text-primary">Thành viên nhóm</span></h1>
        </div>
        <div class="row">
            <div class="col-lg-3 col-md-6">
                <div class="team card position-relative overflow-hidden border-0 mb-4">
                    <img class="card-img-top" src="img/tao.jpg" alt="" style="height: 297px; width: 255px;">
                    <div class="card-body text-center p-0">
                        <div class="team-text d-flex flex-column justify-content-center bg-light">
                            <h5>Hùng</h5>
                            <i>Người sáng lập & CEO</i>
                        </div>
                        <div class="team-social d-flex align-items-center justify-content-center bg-dark">
                            <a class="btn btn-outline-primary rounded-circle text-center mr-2 px-0" style="width: 36px; height: 36px;" href="#"><i class="fab fa-twitter"></i></a>
                            <a class="btn btn-outline-primary rounded-circle text-center mr-2 px-0" style="width: 36px; height: 36px;" href="#"><i class="fab fa-facebook-f"></i></a>
                            <a class="btn btn-outline-primary rounded-circle text-center mr-2 px-0" style="width: 36px; height: 36px;" href="#"><i class="fab fa-linkedin-in"></i></a>
                            <a class="btn btn-outline-primary rounded-circle text-center px-0" style="width: 36px; height: 36px;" href="#"><i class="fab fa-instagram"></i></a>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-lg-3 col-md-6">
                <div class="team card position-relative overflow-hidden border-0 mb-4">
                    <img class="card-img-top" src="img/quy.jpg" alt="">
                    <div class="card-body text-center p-0">
                        <div class="team-text d-flex flex-column justify-content-center bg-light">
                            <h5>Quý</h5>
                            <i>Co-Founder</i>
                        </div>
                        <div class="team-social d-flex align-items-center justify-content-center bg-dark">
                            <a class="btn btn-outline-primary rounded-circle text-center mr-2 px-0" style="width: 36px; height: 36px;" href="#"><i class="fab fa-twitter"></i></a>
                            <a class="btn btn-outline-primary rounded-circle text-center mr-2 px-0" style="width: 36px; height: 36px;" href="#"><i class="fab fa-facebook-f"></i></a>
                            <a class="btn btn-outline-primary rounded-circle text-center mr-2 px-0" style="width: 36px; height: 36px;" href="#"><i class="fab fa-linkedin-in"></i></a>
                            <a class="btn btn-outline-primary rounded-circle text-center px-0" style="width: 36px; height: 36px;" href="#"><i class="fab fa-instagram"></i></a>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-lg-3 col-md-6">
                <div class="team card position-relative overflow-hidden border-0 mb-4">
                    <img class="card-img-top" src="img/khang.jpg" alt="">
                    <div class="card-body text-center p-0">
                        <div class="team-text d-flex flex-column justify-content-center bg-light">
                            <h5>Khang</h5>
                            <i>Chó Rách</i>
                        </div>
                        <div class="team-social d-flex align-items-center justify-content-center bg-dark">
                            <a class="btn btn-outline-primary rounded-circle text-center mr-2 px-0" style="width: 36px; height: 36px;" href="#"><i class="fab fa-twitter"></i></a>
                            <a class="btn btn-outline-primary rounded-circle text-center mr-2 px-0" style="width: 36px; height: 36px;" href="#"><i class="fab fa-facebook-f"></i></a>
                            <a class="btn btn-outline-primary rounded-circle text-center mr-2 px-0" style="width: 36px; height: 36px;" href="#"><i class="fab fa-linkedin-in"></i></a>
                            <a class="btn btn-outline-primary rounded-circle text-center px-0" style="width: 36px; height: 36px;" href="#"><i class="fab fa-instagram"></i></a>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-lg-3 col-md-6">
                <div class="team card position-relative overflow-hidden border-0 mb-4">
                    <img class="card-img-top" src="img/canh.jpg" alt="">
                    <div class="card-body text-center p-0">
                        <div class="team-text d-flex flex-column justify-content-center bg-light">
                            <h5>Cảnh</h5>
                            <i>Trainer</i>
                        </div>
                        <div class="team-social d-flex align-items-center justify-content-center bg-dark">
                            <a class="btn btn-outline-primary rounded-circle text-center mr-2 px-0" style="width: 36px; height: 36px;" href="#"><i class="fab fa-twitter"></i></a>
                            <a class="btn btn-outline-primary rounded-circle text-center mr-2 px-0" style="width: 36px; height: 36px;" href="#"><i class="fab fa-facebook-f"></i></a>
                            <a class="btn btn-outline-primary rounded-circle text-center mr-2 px-0" style="width: 36px; height: 36px;" href="#"><i class="fab fa-linkedin-in"></i></a>
                            <a class="btn btn-outline-primary rounded-circle text-center px-0" style="width: 36px; height: 36px;" href="#"><i class="fab fa-instagram"></i></a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- Team End -->


    <!-- Testimonial Start -->
    <div class="container-fluid bg-light my-5 p-0 py-5">
        <div class="container p-0 py-5">
            <div class="d-flex flex-column text-center mb-5">
                <h4 class="text-secondary mb-3">Phản hồi từ khách hàng</h4>
                <h1 class="display-4 m-0">Feed Back từ <span class="text-primary">Khách Hàng</span></h1>
            </div>
            <div class="owl-carousel testimonial-carousel">
                <div class="bg-white mx-3 p-4">
                    <div class="d-flex align-items-end mb-3 mt-n4 ml-n4">
                        <img class="img-fluid" src="img/may.jpg" style="width: 80px; height: 80px;" alt="">
                        <div class="ml-3">
                            <h5>Mây</h5>
                            <i>Khách hàng thân thiết</i>
                        </div>
                    </div>
                    <p class="m-0">"tui cảm thấy quá hài lòng về dịch vụ thú cưng tại đây , ở đây cho tui cảm giác tự nhiên như ở nhà vì tui là chủ mà hehe"</p>
                </div>
                <div class="bg-white mx-3 p-4">
                    <div class="d-flex align-items-end mb-3 mt-n4 ml-n4">
                        <img class="img-fluid" src="img/testimonial-2.jpg" style="width: 80px; height: 80px;" alt="">
                        <div class="ml-3">
                            <h5>Client Name</h5>
                            <i>Profession</i>
                        </div>
                    </div>
                    <p class="m-0">dịch vụ quá tuyệt vời</p>
                </div>
                <div class="bg-white mx-3 p-4">
                    <div class="d-flex align-items-end mb-3 mt-n4 ml-n4">
                        <img class="img-fluid" src="img/testimonial-3.jpg" style="width: 80px; height: 80px;" alt="">
                        <div class="ml-3">
                            <h5>Client Name</h5>
                            <i>Profession</i>
                        </div>
                    </div>
                    <p class="m-0">rất hài lòng về dịch vụ , sẽ ủng hộ lâu dài</p>
                </div>
                <div class="bg-white mx-3 p-4">
                    <div class="d-flex align-items-end mb-3 mt-n4 ml-n4">
                        <img class="img-fluid" src="img/testimonial-4.jpg" style="width: 80px; height: 80px;" alt="">
                        <div class="ml-3">
                            <h5>Client Name</h5>
                            <i>Profession</i>
                        </div>
                    </div>
                    <p class="m-0">Sed ea amet kasd elitr stet, stet rebum et ipsum est duo elitr eirmod clita lorem. Dolor tempor ipsum sanct clita</p>
                </div>
            </div>
        </div>
    </div>
    <!-- Testimonial End -->


    <!-- Blog Start -->
    <div class="container pt-5">
        <div class="d-flex flex-column text-center mb-5">
            <h4 class="text-secondary mb-3">Thú cưng Blog</h4>
            <h1 class="display-4 m-0"><span class="text-primary">Cập nhật từ</span> Blog</h1>
        </div>
        <div class="row pb-3">
            <div class="col-lg-4 mb-4">
                <div class="card border-0 mb-2">
                    <img class="card-img-top" src="img/blog-1.jpg" alt="">
                    <div class="card-body bg-light p-4">
                        <h4 class="card-title text-truncate">Ca phẩu thuật hôm qua</h4>
                        <div class="d-flex mb-3">
                            <small class="mr-2"><i class="fa fa-user text-muted"></i> Admin</small>
                            <small class="mr-2"><i class="fa fa-folder text-muted"></i> Web Design</small>
                            <small class="mr-2"><i class="fa fa-comments text-muted"></i> 999+</small>
                        </div>
                        <p>Hôm qua chúng tôi vừa có một ca phẩu thuật thành công cho chú mèo vàng khi ăn nhầm phải quả dưa hấu </p>
                        <a class="font-weight-bold" href="">Đọc thêm</a>
                    </div>
                </div>
            </div>
            <div class="col-lg-4 mb-4">
                <div class="card border-0 mb-2">
                    <img class="card-img-top" src="img/dog.jpg" alt="" style="height: 235px;">
                    <div class="card-body bg-light p-4">
                        <h4 class="card-title text-truncate">Dạy lệnh cho cún từ nhỏ?</h4>
                        <div class="d-flex mb-3">
                            <small class="mr-2"><i class="fa fa-user text-muted"></i> Admin</small>
                            <small class="mr-2"><i class="fa fa-folder text-muted"></i> Web Design</small>
                            <small class="mr-2"><i class="fa fa-comments text-muted"></i> 130303</small>
                        </div>
                        <p>Các lệnh bắt tay ,ngồi, đứng và còn rất nhiều lệnh hay khác mà bạn nên cho cún của mình học khi còn nhỏ</p>
                        <a class="font-weight-bold" href="">Đọc thêm</a>
                    </div>
                </div>
            </div>
            <div class="col-lg-4 mb-4">
                <div class="card border-0 mb-2">
                    <img class="card-img-top" src="img/CatFat.jfif" alt="" style="height: 235px;">
                    <div class="card-body bg-light p-4">
                        <h4 class="card-title text-truncate">Giảm cân cho mèo béo</h4>
                        <div class="d-flex mb-3">
                            <small class="mr-2"><i class="fa fa-user text-muted"></i> Admin</small>
                            <small class="mr-2"><i class="fa fa-folder text-muted"></i> Web Design</small>
                            <small class="mr-2"><i class="fa fa-comments text-muted"></i> 1303</small>
                        </div>
                        <p>Sau 1 tháng điều trị vất vả cùng với việc cân bằng lại khẩu phần ăn chúng tôi đã giảm cân thành công cho mèo béo!</p>
                        <a class="font-weight-bold" href="">Đọc thêm</a>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- Blog End -->


    <!-- Footer Start -->
    <div class="container-fluid bg-dark text-white mt-5 py-5 px-sm-3 px-md-5">
        <div class="row pt-5">
            <div class="col-lg-4 col-md-12 mb-5">
                <h1 class="mb-3 display-5 text-capitalize text-white"><span class="text-primary">Louvre</span>PetShop</h1>
                <p class="m-0">Thương hiệu LouvrePetshop thuộc sở hữu của Công ty Cổ phần Louvre Việt Nam. Chúng tôi cũng là thành viên của Hiệp hội những nhà nhân giống chó tại Việt Nam (VKA) từ năm 2018. Là một trong những đơn vị đầu tiên nhập khẩu chó mèo cảnh tại Việt Nam. Sau nhiều năm, Louvre đã mang đến cho cộng đồng yêu cún cưng nhiều thế hệ thú cưng thuần chủng, chất lượng.</p>
            </div>
            <div class="col-lg-8 col-md-12">
                <div class="row">
                    <div class="col-md-4 mb-5">
                        <h5 class="text-primary mb-4">Get In Touch</h5>
                        <p><i class="fa fa-map-marker-alt mr-2"></i>Ninh kiều , Cần Thơ, Việt Nam</p>
                        <p><i class="fa fa-phone-alt mr-2"></i>+012 345 67890</p>
                        <p><i class="fa fa-envelope mr-2"></i>louvre@fpt.edu.vn</p>
                        <div class="d-flex justify-content-start mt-4">
                            <a class="btn btn-outline-light rounded-circle text-center mr-2 px-0" style="width: 36px; height: 36px;" href="#"><i class="fab fa-twitter"></i></a>
                            <a class="btn btn-outline-light rounded-circle text-center mr-2 px-0" style="width: 36px; height: 36px;" href="#"><i class="fab fa-facebook-f"></i></a>
                            <a class="btn btn-outline-light rounded-circle text-center mr-2 px-0" style="width: 36px; height: 36px;" href="#"><i class="fab fa-linkedin-in"></i></a>
                            <a class="btn btn-outline-light rounded-circle text-center mr-2 px-0" style="width: 36px; height: 36px;" href="#"><i class="fab fa-instagram"></i></a>
                        </div>
                    </div>
                    <div class="col-md-4 mb-5">
                        <h5 class="text-primary mb-4">Popular Links</h5>
                        <div class="d-flex flex-column justify-content-start">
                            <a class="text-white mb-2" href="#"><i class="fa fa-angle-right mr-2"></i>Trang chủ</a>
                            <a class="text-white mb-2" href="#"><i class="fa fa-angle-right mr-2"></i>Về chúng tôi</a>
                            <a class="text-white mb-2" href="#"><i class="fa fa-angle-right mr-2"></i>Dịch vụ</a>
                            <a class="text-white mb-2" href="#"><i class="fa fa-angle-right mr-2"></i>Thành viên</a>
                            <a class="text-white" href="#"><i class="fa fa-angle-right mr-2"></i>Liên hệ</a>
                        </div>
                    </div>
                    <div class="col-md-4 mb-5">
                        <h5 class="text-primary mb-4">Tin mới</h5>
                        <form action="">
                            <div class="form-group">
                                <input type="text" class="form-control border-0" placeholder="Nhập tên" required="required" />
                            </div>
                            <div class="form-group">
                                <input type="email" class="form-control border-0" placeholder="Nhập Email" required="required" />
                            </div>
                            <div>
                                <button class="btn btn-lg btn-primary btn-block border-0" type="submit">Gửi ngay</button>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="container-fluid text-white py-4 px-sm-3 px-md-5" style="background: #111111;">
        <div class="row">
            <div class="col-md-6 text-center text-md-left mb-3 mb-md-0">
                <p class="m-0 text-white">
                    &copy; <a class="text-white font-weight-bold" href="">Louvre</a>. All Rights Reserved. Designed by
                    <a class="text-white font-weight-bold" href="">G1 - </a>
                </p>
            </div>
            <div class="col-md-6 text-center text-md-right">
                <ul class="nav d-inline-flex">
                    <li class="nav-item">
                        <a class="nav-link text-white py-0" href="#">Privacy</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link text-white py-0" href="#">Terms</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link text-white py-0" href="#">FAQs</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link text-white py-0" href="#">Help</a>
                    </li>
                </ul>
            </div>
        </div>
    </div>
    <!-- Footer End -->
  <!-- Back to Top -->
    <a href="#" class="btn btn-lg btn-primary back-to-top"><i class="fa fa-angle-double-up"></i></a>
    <!-- Optional JavaScript -->
    <!-- JavaScript Libraries -->
    <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.bundle.min.js"></script>
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