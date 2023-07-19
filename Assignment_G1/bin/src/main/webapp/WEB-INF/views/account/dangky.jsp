<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="fr"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Đăng ký</title>
</head>
<body>
	<div style="width: 100%">
		<ul class="breadcrumb">
			<li><a href="index.html">Home</a> <span class="divider">/</span></li>
			<li class="active">Registration</li>
		</ul>
		<h3>Registration</h3>
		<hr class="soft" />
		${message}
		<div class="well">
			<fr:form class="form-horizontal" method="POST" enctype="multipart/form-data" modelAttribute="account">
				<h3>Thông tin đăng ký</h3>
				<div class="control-group">
					<label class="control-label" for="inputFname">Tài khoản<sup>*</sup></label>
					<div class="controls">
						<fr:input type="text" path="username" placeholder="Nhập thông tin tài khoản"/>
					</div>
				</div>
				<div class="control-group">
					<label class="control-label" for="inputLname">Họ tên<sup>*</sup></label>
					<div class="controls">
						<fr:input type="text" path="fullname" placeholder="Nhập họ tên"/>
					</div>
				</div>
				<div class="control-group">
					<label class="control-label" for="inputFname">Mật khẩu <sup>*</sup></label>
					<div class="controls">
						<fr:password path="password" placeholder="Nhập mật khẩu"/>
					</div>
				</div>
				<div class="control-group">
					<label class="control-label" for="inputFname">Mật khẩu lần 2 <sup>*</sup></label>
					<div class="controls">
						<input type="password" name="repassword" placeholder="Nhập lại mật khẩu"/>
					</div>
				</div>
				
				<div class="control-group">
					<label class="control-label" for="inputEmail">Email <sup>*</sup></label>
					<div class="controls">
						<fr:input type="text" path="email" placeholder="Nhập địa chỉ Email"/>
					</div>
				</div>
				<div class="control-group">
					<label class="control-label" for="inputEmail">Hình ảnh <sup>*</sup></label>
					<div class="controls">
						<input type="file" name="hinh" />
					</div>
				</div>
				<div class="control-group">
					<div class="controls">
						<input type="submit" name="submitAccount" value="Register"
							class="exclusive shopBtn">
					</div>
				</div>
			</fr:form>
		</div>
	</div>
</div>
</body>
</html>