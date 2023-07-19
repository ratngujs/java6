package com.poly.admin.controller;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.data.domain.Sort.Direction;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.poly.custominterface.OrderDAO;
import com.poly.entity.Account;
import com.poly.entity.Order;

@Controller
@Component("adminOrder")
public class OrderController {
	@Autowired
	OrderDAO orDao;

	@GetMapping("/admin/order")
	public String index(Model m, @RequestParam("p") Optional<Integer> p) {
		Sort sort = Sort.by(Direction.DESC, "createDate");
		int np = p.orElse(0);
		if (np < 0)
			return "redirect:/admin/order";
		Pageable page = PageRequest.of(np, 1, sort);

		Page<Order> dsdh = orDao.findAll(page);
		if (!dsdh.hasContent())
			return "redirect:/admin/order";
		m.addAttribute("pages", dsdh);
		return "admin/order/index";
	}

	@GetMapping("/admin/order/detail")
	public String detail(@RequestParam("id") Optional<Long> opIdOrders, Model m) {
		if (opIdOrders.isPresent()) {
			Long id = opIdOrders.get();
			Optional<Order> opOrder = orDao.findById(id);
			if (opOrder.isPresent()) {
				Order order = opOrder.get();
				m.addAttribute("order", order);
			} else
				return "redirect:/admin/order";
		} else
			return "redirect:/admin/order";
		return "admin/order/detail";
	}

	@GetMapping("/admin/order/cancel")
	public String OrderCancel(Model m, @RequestParam("id") Optional<Long> opIdOrders) {
		if (opIdOrders.isPresent()) {
			Long id = opIdOrders.get();
			Optional<Order> opOrder = orDao.findById(id);
			if (opOrder.isPresent()) {
				Order order = opOrder.get();
				if (!order.getStatus() && !order.getCancel()) {
					order.setCancel(true);
					orDao.save(order);
				}
				return "redirect:/admin/order/detail?id=" + order.getId();
			} else
				return "redirect:/admin/order";
		} else
			return "redirect:/admin/order";
	}

	@GetMapping("/admin/order/accept")
	public String OrderAccept(Model m, @RequestParam("id") Optional<Long> opIdOrders) {
		if (opIdOrders.isPresent()) {
			Long id = opIdOrders.get();
			Optional<Order> opOrder = orDao.findById(id);
			if (opOrder.isPresent()) {
				Order order = opOrder.get();
				if (!order.getStatus() && !order.getCancel()) {
					order.setStatus(true);
					orDao.save(order);
				}
				return "redirect:/admin/order/detail?id=" + order.getId();
			} else
				return "redirect:/admin/order";
		} else
			return "redirect:/admin/order";
	}
}
