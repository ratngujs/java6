package com.poly.service;

import java.text.SimpleDateFormat;
import java.util.Date;

import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Service;

@Service
public class TestSchedule {
	private SimpleDateFormat sdf = new SimpleDateFormat("dd/MM/yyyy HH:mm:ss");
	//@Scheduled(fixedRate =  1000)
	public void chayLich() {
		System.out.println(sdf.format(new Date()));
	}
}
