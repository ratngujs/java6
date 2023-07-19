package com.poly.entity;

import java.util.List;

import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;

import com.fasterxml.jackson.annotation.JsonIgnore;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@Entity
@Table(name = "Accounts")
@NoArgsConstructor @AllArgsConstructor
public class Account {
	@Id
	String username;
	String password;
	String fullname;
	String email;
	String photo;
	boolean activated;
	boolean admin;
	
	@JsonIgnore
	@OneToMany(mappedBy = "account")
	List<Order> orders;
}
