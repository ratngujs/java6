package com.poly.entity;

import java.io.Serializable;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
@Data
@NoArgsConstructor
@AllArgsConstructor
public class CartItem implements Serializable{
	private static final long serialVersionUID = 1455155371707452873L;
	private Product p;
	private int quatity;
}
