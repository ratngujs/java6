package com.poly.service;

import java.io.File;
import java.util.ArrayList;
import java.util.List;

import javax.mail.MessagingException;
import javax.mail.internet.MimeMessage;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Service;

import com.poly.model.MailModel;

@Service
public class MailerService {
	@Autowired
	JavaMailSender sender;
	List<MimeMessage> queue = new ArrayList<>();

	public void send(String to, String subject, String body) throws MessagingException {
		MailModel mail = new MailModel(to, subject, body);
		this.send(mail);
	}
	
	public void push(String to, String subject, String body) throws MessagingException {
		MailModel mail = new MailModel(to, subject, body);
		this.push(mail);
	}

	public void send(MailModel mail) throws MessagingException {
		MimeMessage message = sender.createMimeMessage();
		MimeMessageHelper helper = new MimeMessageHelper(message, true, "utf-8");
		helper.setFrom(mail.getFrom());
		helper.setTo(mail.getTo());
		helper.setSubject(mail.getSubject());
		helper.setText(mail.getBody(), true);
		helper.setReplyTo(mail.getFrom());
		for (String email : mail.getCc()) {
			helper.addCc(email);
		}
		for (String email : mail.getBcc()) {
			helper.addBcc(email);
		}
		for (File file : mail.getFiles()) {
			helper.addAttachment(file.getName(), file);
		}
		sender.send(message);
	}
	
	public void push(MailModel mail) throws MessagingException {
		MimeMessage message = sender.createMimeMessage();
		MimeMessageHelper helper = new MimeMessageHelper(message, true, "utf-8");
		helper.setFrom(mail.getFrom());
		helper.setTo(mail.getTo());
		helper.setSubject(mail.getSubject());
		helper.setText(mail.getBody(), true);
		helper.setReplyTo(mail.getFrom());
		for (String email : mail.getCc()) {
			helper.addCc(email);
		}
		for (String email : mail.getBcc()) {
			helper.addBcc(email);
		}
		for (File file : mail.getFiles()) {
			helper.addAttachment(file.getName(), file);
		}
		queue.add(message);
	}

	//@Scheduled(fixedDelay = 1000)
	public void run() {
		int success = 0, error = 0;
		while (!queue.isEmpty()) {
			MimeMessage message = queue.remove(0);
			try {
				sender.send(message);
				success++;
			} catch (Exception e) {
				error++;
			}
		}
		System.out.printf(">> Sent: %d, Error: %d\r\n", success, error);
	}

}
