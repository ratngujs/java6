<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%> 
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="fr"%>

<!DOCTYPE html> 
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="/css/style2.css">
  <link href="https://fonts.googleapis.com/css?family=Nunito:400,600,700,800&display=swap" rel="stylesheet">
</head>
<body>
<div class="cont">
<form method="POST" action="/login">
<div class="form sign-in">
      <h2>Đăng Nhập</h2>
      <label>
        <span> Tài Khoản</span>
        <input type="text" name="username" class="form-control" id="username" placeholder="Nhập tài khoản" required="required">
      </label>
      <label>
        <span> Mật Khẩu</span>
        <input type="password" name="password" class="form-control" id="password" placeholder="Nhập mật khẩu" required="required">
      </label>
      <input type="checkbox" class="custom-control-input"
									id="customControlInline"> <label
									class="custom-control-label" for="customControlInline">Ghi nhớ đăng nhập</label>
      <button class="submit" type="submit" name="button">Đăng Nhập</button>
   <c:if test="${not(empty(message))}">
					<script>
						alert("${message}");
					</script>
				</c:if>
      <p class="forgot-pass">Quên mật khẩu ?</p>
      <div class="social-media">
        <ul>
          <li><img src="/img/facebook.png"></li>
          <li><img src="/img/twitter.png"></li>
          <li><img src="/img/linkedin.png"></li>
          <li><img src="/img/instagram.png"></li>
        </ul>
      </div>
    </div>
</form>
    

    <div class="sub-cont">
      <div class="img">
        <div class="img-text m-up">
          <h2>bạn chưa có tài khoản?</h2>
          <p>Đăng kí để bắt đầu mua hàng ngay!</p>
        </div>
        <div class="img-text m-in">
          <h2>bạn đã có tài khoản?</h2>
          <p>Đăng nhập và tiến hành mua sắm ngay thôi!</p>
        </div>
        <div class="img-btn">
          <span  class="m-up">Đăng nhập</span>
          <span  class="m-in">Đăng kí</span>
        </div>
      </div>
      <c:url var="url" value="/account"/>
      <form action ="/sign-up" method="POST">
       <div class="form sign-up">
        <h2>Đăng kí</h2>
      
        <label>
          <span>Tài khoản</span>
          <input name="id" type="text">
        </label>
        <label>
          <span>Email</span>
          <input name="email" type="email">
        </label>
        <label>
          <span>Mật khẩu</span>
          <input name="password" type="password">
        </label>
        <label>
          <span>Họ tên</span>
          <input name="fullname" type="text">
        </label>
        <input name="admin" type="hidden" value="false">
        <button formaction="/sign-up" class="submit">Đăng kí</button>
      </div>
      </form>
     
    </div>
  </div>
<script type="text/javascript" src="/js/script2.js"></script>
</body>
</html>