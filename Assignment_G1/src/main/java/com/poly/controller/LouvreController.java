package com.poly.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Sort;
import org.springframework.data.domain.Sort.Direction;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import com.poly.custominterface.*;
import com.poly.entity.Product;


@Controller
public class LouvreController {
	@Autowired
	ProductDAO proDao;
	
	@GetMapping("index")
	public String index() {
		return "user/index";
	}
	@GetMapping("about")
	public String about() {
		return "user/about";
	}
	@GetMapping("booking")
	public String booking() {
		return "user/booking";
	}
	@GetMapping("price")
	public String price() {
		return "user/price";
	}
	@GetMapping("service")
	public String service() {
		return "user/service";
	}
	@GetMapping("contact")
	public String contact() {
		return "user/contact";
	}
	@ModelAttribute("newProduct")
	public List<Product> getNewProduct(){
		Page<Product> page = proDao.findAll(PageRequest.of(0, 2, Sort.by(Direction.DESC, "id")));
		return page.getContent();
	} 
	
}
