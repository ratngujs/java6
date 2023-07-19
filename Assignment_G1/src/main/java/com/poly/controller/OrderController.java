package com.poly.controller;

import java.util.List;
import java.util.Optional;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.poly.custominterface.OrderDAO;
import com.poly.entity.Account;
import com.poly.entity.Order;

@Controller
public class OrderController {
	@Autowired
	HttpSession session;

	@Autowired
	OrderDAO orDao;

	@GetMapping("/order/view")
	public String OrderView(Model m) {
		Account acc = (Account) session.getAttribute("user");
		if (acc != null) {
			List<Order> orders = orDao.findAllByAccount(acc.getUsername());
			m.addAttribute("orders", orders);
		} else
			return "redirect:/";
		return "order/index";
	}

	@GetMapping("/order/detail")
	public String OrderDetailView(Model m, @RequestParam("id") Optional<Long> opIdOrders) {
		Account acc = (Account) session.getAttribute("user");
		if (opIdOrders.isPresent()) {
			Long id = opIdOrders.get();
			Optional<Order> opOrder = orDao.findById(id);
			if(opOrder.isPresent()) {
				Order order = opOrder.get();
				m.addAttribute("order", order);
				if (!order.getAccount().getUsername().equalsIgnoreCase(acc.getUsername()))
					return "redirect:/order/view";
			}
			else
				return "redirect:/order/view";
		} else
			return "redirect:/order/view";
		return "order/detail";
	}

	@GetMapping("/order/cancel")
	public String OrderCancel(Model m, @RequestParam("id") Optional<Long> opIdOrders) {
		Account acc = (Account) session.getAttribute("user");
		if (opIdOrders.isPresent()) {
			Long id = opIdOrders.get();
			Optional<Order> opOrder = orDao.findById(id);
			if(opOrder.isPresent()) {
				Order order = opOrder.get();
				if (!order.getAccount().getUsername().equalsIgnoreCase(acc.getUsername()))
					return "redirect:/order/view";
				else {
					if (order.getStatus() != true) {
						order.setCancel(true);
						orDao.save(order);
					}
					return "redirect:/order/detail?id="+order.getId();
				}
			}
			else
				return "redirect:/order/view";
		} else
			return "redirect:/order/view";
	}
}
