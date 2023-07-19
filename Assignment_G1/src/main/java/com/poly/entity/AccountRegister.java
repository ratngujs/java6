package com.poly.entity;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@Entity
@Table(name="accountregister")
@NoArgsConstructor @AllArgsConstructor
public class AccountRegister {
	@Id
	String username;
	String password;
	String fullname;
	String email;
	String photo;
	String token;
	Boolean admin;
	Boolean Activated;
	@Temporal(TemporalType.TIMESTAMP)
	@Column(name = "valid")
	Date valid = new Date();
}
