package com.poly.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Component;
import org.springframework.web.servlet.HandlerInterceptor;

import com.poly.entity.Account;
@Component
public class AuthInterceptor implements HandlerInterceptor {

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		String uri = request.getRequestURI();
		Account acc = (Account)request.getSession().getAttribute("user");
		request.getSession().setAttribute("uri-redirect", uri);
		if(acc == null) {
			request.getSession().setAttribute("message", "Phải đăng nhập trước khi truy cập vào chức năng này!");
			response.sendRedirect("/login");
			return false;
		}
		else if(acc != null && !acc.isAdmin() && uri.startsWith("/admin/product")) {
			request.getSession().setAttribute("message", "Bạn phải là quản trị mới vào được trang quản lý");
			response.sendRedirect("/login");
			return false;
		}
		return true;
	}

}
