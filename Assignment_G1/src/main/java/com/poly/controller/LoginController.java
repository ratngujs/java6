package com.poly.controller;

import java.util.Optional;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.poly.custominterface.AccountDAO;
import com.poly.entity.Account;

@Controller
public class LoginController {
	@Autowired
	AccountDAO repo;

	@Autowired
	HttpSession session;
	
	@GetMapping("/login")
	public String getViewLogin(Model m) {
		if (session.getAttribute("user") != null)
			return "redirect:/";
		String message = (String) session.getAttribute("message");
		if (message != null && !message.isBlank())
			m.addAttribute("message", message);
		session.removeAttribute("message");
		return "login/index";
	}

	@PostMapping("/login")
	public String processLogin(@RequestParam("username") String uname, @RequestParam("password") String passwd,
			Model m) {
		Optional<Account> opAcc = repo.findById(uname);
		if (opAcc.isPresent()) {
			Account acc = opAcc.get();
			if (acc.getPassword().equals(passwd)) {
				session.setAttribute("user", acc);
				String uri = (String) session.getAttribute("uri-redirect");
				if (uri != null && !uri.isBlank())
					return "redirect:" + uri;
				else
					return "redirect:/index";
			}
		} 
		session.setAttribute("message", "Tài khoản và mật khẩu không đúng!");
		return "login/index";
		
	}

	@GetMapping("/logout")
	public String logout() {
		Boolean isAdmin = false;
		if (session.getAttribute("user") != null) {
			Account acc = (Account) session.getAttribute("user");
			isAdmin = acc.isAdmin();
			session.removeAttribute("user");
		}
		if (isAdmin)
			return "redirect:/login";
		else
			return "redirect:/index";
	}
}
