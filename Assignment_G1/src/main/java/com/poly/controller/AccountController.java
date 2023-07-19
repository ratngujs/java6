package com.poly.controller;

import java.io.File;
import java.io.IOException;
import java.security.SecureRandom;
import java.util.Base64;
import java.util.Calendar;
import java.util.Date;

import javax.mail.MessagingException;
import javax.servlet.ServletContext;

import java.util.Base64.Encoder;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.poly.custominterface.AccountDAO;

import com.poly.entity.Account;
import com.poly.service.MailerService;

@Controller
public class AccountController {



	@Autowired
	AccountDAO accDao;
	
	@Autowired 
	ServletContext context;
	
	@Autowired
	MailerService mailer;

	@GetMapping("/account/dangky")
	public String getFormDangKy(Model m) {
		Account acc = new Account();
		m.addAttribute("account", acc);
		return "account/dangky";
	}

	@PostMapping("/account/dangky")
	public String dangKy(Model m, @ModelAttribute("account") Account acc,
			@RequestParam("hinh") MultipartFile hinh, @RequestParam("repassword") String repass) {
		if (!accDao.existsById(acc.getUsername())) {
			if (acc.getPassword().equals(repass)) {
				if (!hinh.isEmpty()) {
					try {
						File tmp = new File(context.getRealPath("/upload/account/"));
						if (!tmp.exists())
							tmp.mkdirs();
						File file = new File(context.getRealPath("/upload/account/" + hinh.getOriginalFilename()));
						hinh.transferTo(file);
						acc.setPhoto(hinh.getOriginalFilename());
					} catch (IllegalStateException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					} catch (IOException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}
				} else
					acc.setPhoto("user.png");

				acc.setActivated(true);
				acc.setAdmin(false);
					return "account/dangky";
				}
			
			else {
				m.addAttribute("message", "Mật khẩu không trùng nhau!");
				m.addAttribute("account", acc);
				return "account/dangky";
			}
		} else {
			m.addAttribute("message", "Tài khoản đã tồn tại!");
			m.addAttribute("account", acc);
			return "account/dangky";
		}
	}

	@GetMapping("/account/active")
	public String getViewActive() {
		return "account/active";
	}
//	@PostMapping("/account/active")
//	public String activeAcc(@RequestParam("username") String uname, @RequestParam("token") String token, Model m) {
//		AccountRegister accRe = accDao.getById(uname);
//		if(accRe != null) {
//			if(accRe.getToken().equals(token) && accRe.getValid().getTime() >= new Date().getTime()) {
//				Account acc =new Account();
//				acc.setUsername(accRe.getUsername());
//				acc.setFullname(accRe.getFullname());
//				acc.setPhoto(accRe.getPhoto());
//				acc.setEmail(accRe.getEmail());
//				acc.setPassword(accRe.getPassword());
//				acc.setAdmin(false);
//				acc.setActivated(true);
//				accDao.save(acc);
//				accReDao.delete(accRe);
//				accDao.flush();
//				return "redirect:/login";
//			}
//			else {
//				Calendar date = Calendar.getInstance();
//				long timeInSecs = date.getTimeInMillis();
//				Date afterAdding2Mins = new Date(timeInSecs + (2 * 60 * 1000));
//				accRe.setValid(afterAdding2Mins);
//				accRe.setToken(generateSafeToken());
//				accReDao.saveAndFlush(accRe);
//				try {
//					mailer.send(accRe.getEmail(), "Thông tin kích hoạt", String.format("<p>username: %s</p><p>Token: %s</p>",accRe.getUsername(),accRe.getToken()));
//				} catch (MessagingException ex) {
//					ex.printStackTrace();
//				}
//				m.addAttribute("message", "Token đã hết hạn hoặc không đúng! Hệ thống sẽ lại Token mới");
//			}
//		}
//		else
//			m.addAttribute("message", "Không tìm thấy tài khoản!");
//		return "account/active";
//	}

//	private String generateSafeToken() {
//		SecureRandom random = new SecureRandom();
//		byte bytes[] = new byte[10];
//		random.nextBytes(bytes);
//		Encoder encoder = Base64.getUrlEncoder().withoutPadding();
//		String token = encoder.encodeToString(bytes);
//		return token;
//	}
}
