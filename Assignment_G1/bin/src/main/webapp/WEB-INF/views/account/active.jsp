<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Kích hoạt tài khoản</title>
</head>
<body>
	${mesage}
	<form class="form-horizontal" method="POST">
		<h3>Kích hoạt tài khoản</h3>
		<div class="control-group">
			<label class="control-label" for="inputFname">Tài khoản<sup>*</sup></label>
			<div class="controls">
				<input type="text" name="username"
					placeholder="Nhập thông tin tài khoản" />
			</div>
		</div>
		<div class="control-group">
			<label class="control-label" for="inputLname">Mã kích hoạt<sup>*</sup></label>
			<div class="controls">
				<input type="text" name="token" placeholder="Nhập mã kích hoạt" />
			</div>
		</div>
		<div class="control-group">
			<div class="controls">
				<input type="submit" name="submitAccount" value="Kích hoạt"
					class="exclusive shopBtn">
			</div>
		</div>
	</form>
	</div>
</body>
</html>