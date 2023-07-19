package com.poly.controller;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Sort;
import org.springframework.data.domain.Sort.Direction;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.poly.custominterface.*;


@Controller
public class ThongKeController {
	@Autowired 
	OrderDetailDAO odDao;
	
	@GetMapping("admin/thongke/top10")
	public String getTop10SP(Model m) {
		m.addAttribute("top10",odDao.getTop10SPBanChay(PageRequest.of(0, 10, Sort.by(Direction.DESC, "soLuong"))));
		return "admin/thongke/top10";
	}
	@GetMapping("admin/thongke/top10range")
	public String getTop10Range() {
		return "redirect:/admin/thongke/top10";
	}
	@PostMapping("admin/thongke/top10range")
	public String getTop10Range(Model m, @RequestParam("startDate") Optional<String> start, @RequestParam("endDate") Optional<String> end) {
		Date startDate = new Date();
		Date endDate = new Date();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		if(start.isPresent() && end.isPresent()) {
			m.addAttribute("start", start.get());
			m.addAttribute("end", end.get());
			try {
				startDate = sdf.parse(start.get());
				endDate = sdf.parse(end.get());
			} catch (ParseException e) {
			}
		}
		m.addAttribute("top10",odDao.getTop10SPTheoThoiGian(startDate, endDate, PageRequest.of(0, 10, Sort.by(Direction.DESC, "soLuong"))));
		return "admin/thongke/top10";
	}
}
