package com.lcvc.ebuy_maven_ssm.model;

import java.util.Date;

public class Admin {
	private Integer id;
	private String username;//账户名
	private String password;//密码
	private String name;//网名
	private Date createTime;//注册时间或创建该账户的时间	
	
	public Admin() {
		super();
	}
	
	
	public Admin(Integer id) {
		super();
		this.id = id;
	}


	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public Date getCreateTime() {
		return createTime;
	}
	public void setCreateTime(Date createTime) {
		this.createTime = createTime;
	}
	
	
	
	
	
}
