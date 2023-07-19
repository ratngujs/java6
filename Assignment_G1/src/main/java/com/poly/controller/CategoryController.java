package com.poly.controller;

import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.poly.custominterface.CategoryDAO;
import com.poly.entity.Category;

@Controller
public class CategoryController {
	@Autowired
	CategoryDAO dao;
	
	@GetMapping("/category")
	public String index(@RequestParam("id") Optional<String> cid, Model m) {
		if(cid.isPresent()) {
			Optional<Category> c = dao.findById(cid.get());
			if(c.isPresent()) {
				m.addAttribute("product",c.get().getProducts());
			}
			else {
				return "redirect:/";
			}
		}
		else {
			return "redirect:/";
		}
		return "home/category";
	}
}
