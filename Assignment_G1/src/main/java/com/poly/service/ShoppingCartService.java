package com.poly.service;

import java.util.List;

import com.poly.entity.CartItem;

public interface ShoppingCartService {
	List<CartItem> getItems();
	void add(int id);
	void remove(int id);
	void update(int id, int qty);
	void clear();
	int getCount();
	double getAmount();
}
