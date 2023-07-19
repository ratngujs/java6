package com.poly.entity;

import java.util.List;

import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;


import com.fasterxml.jackson.annotation.JsonIgnore;

import lombok.Data;

@Entity
@Table(name = "Categories")
@Data
public class Category {
	@Id
	String id;
	String name; 
	
	@JsonIgnore
    @OneToMany(mappedBy = "category", fetch = FetchType.LAZY)
	List<Product> products;
}
