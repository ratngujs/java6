package com.poly.controller;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.poly.custominterface.OrderDAO;
import com.poly.custominterface.OrderDetailDAO;
import com.poly.entity.Account;
import com.poly.entity.CartItem;
import com.poly.entity.Order;
import com.poly.entity.OrderDetail;
import com.poly.service.ShoppingCart;

@Controller
public class ThanhToanController {
	@Autowired 
	OrderDAO orderDao;
	@Autowired
	OrderDetailDAO odetailDao;
	
	@Autowired
	ShoppingCart cart;
	
	@Autowired
	HttpSession session;
	
	@GetMapping("/thanhtoan")
	public String getViewThanhToan() {
		return "thanhtoan/index";
	}
	
	@PostMapping("/thanhtoan")
	public String processThanhToan(@RequestParam("diachi") String diachi) {
		Order order = new Order();
		order.setAccount((Account)session.getAttribute("user"));
		order.setCreateDate(new Date());
		order.setAddress(diachi);
		List<CartItem> items = cart.getItems();
		List<OrderDetail> odetails = new ArrayList<>();
		float tongTien = 0;
		for(CartItem i : items) {
			OrderDetail odDetail = new OrderDetail();
			odDetail.setOrder(order);
			odDetail.setPrice(i.getP().getPrice());
			odDetail.setProduct(i.getP());
			odDetail.setQuantity(i.getQuatity());
			odetails.add(odDetail);
			tongTien += i.getQuatity() * i.getP().getPrice();
		}
		order.setOrderDetails(odetails);
		order.setTotal(tongTien);
		order.setStatus(false);
		order.setCancel(false);
		orderDao.save(order);
		odetailDao.saveAllAndFlush(odetails);
		cart.clear();
		
		return "redirect:/index";
	}
}
