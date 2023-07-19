package com.poly.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.context.annotation.SessionScope;

import com.poly.custominterface.ProductDAO;
import com.poly.entity.CartItem;
import com.poly.entity.Product;

@SessionScope
@Service("cart")
public class ShoppingCart implements ShoppingCartService {
	@Autowired
	ProductDAO repo;

	Map<Integer, CartItem> map = new HashMap<Integer, CartItem>();

	@Override
	public List<CartItem> getItems() {
		ArrayList<CartItem> ds = new ArrayList<CartItem>();
		for (Integer key : map.keySet()) {
			ds.add(map.get(key));
		}
		return ds;
	}

	@Override
	public void add(int id) {
		Optional<Product> p = repo.findById(id);
		if(p.isPresent()) {
			CartItem item = map.get(p.get().getId()); 
			if(item != null) {
				item.setQuatity(item.getQuatity() + 1);
			}
			else
				item = new CartItem(p.get(), 1);
			map.put(id, item);
		}
	}

	@Override
	public void remove(int id) {
		map.remove(id);
	}

	@Override
	public void update(int id, int qty) {
		CartItem item = map.get(id);
		if (item != null) {
			item.setQuatity(qty);
			map.put(id, item);
		}
	}

	@Override
	public void clear() {
		map.clear();
	}

	@Override
	public int getCount() {
		CartItem item = null;
		int tongsp = 0;	
		for (Integer id : map.keySet()) {
			item = map.get(id);
			tongsp += item.getQuatity();
		}
		return tongsp;
	}

	@Override
	public double getAmount() {
		Double tongtien = 0.0;
		CartItem item = null;
		for (Integer id : map.keySet()) {
			item = map.get(id);
			tongtien += item.getP().getPrice() * item.getQuatity();
		}
		return tongtien;
	}
	

}
