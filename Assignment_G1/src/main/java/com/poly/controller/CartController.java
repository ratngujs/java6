package com.poly.controller;

import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.poly.service.ShoppingCart;

@Controller
public class CartController {
	@Autowired
	ShoppingCart cart;

	@RequestMapping("cart/add")
	public String addCart(@RequestParam("id") Optional<Integer> MaSP) {
		cart.add(MaSP.orElse(0));
		return "redirect:/index";
	}

	@RequestMapping("cart/view")
	public String viewCart(Model m) {
		m.addAttribute("cart", cart);
		return "cart/index";
	}

	@RequestMapping("cart/update")
	public String updateCart(@RequestParam("id") Optional<Integer> id,
			@RequestParam("quatity") Optional<Integer> quatity, Model m) {
		if (id.isPresent() && quatity.isPresent()) {
			cart.update(id.get(), quatity.get());
		}
		m.addAttribute("cart", cart);
		return "redirect:/cart/view";
	}
	@RequestMapping("cart/delete")
	public String deleteCart(@RequestParam("id") Optional<Integer> id, Model m) {
		if (id.isPresent()) {
			cart.remove(id.get());
		}
		m.addAttribute("cart", cart);
		return "redirect:/cart/view";
	}
}
