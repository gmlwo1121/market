package com.market.model;

public class Member {
	private String id; // 아이디
	private String name; // 이름
	private String password; // 비번
	private String hiredate; // 가입 일자
	
	// getter, setter, toString 구현
	@Override
	public String toString() {
		return "Member [id=" + id + ", name=" + name + ", password=" + password + ", hiredate=" + hiredate + "]";
	}
	
	public String getHiredate() {
		return hiredate;
	}
	public void setHiredate(String hiredate) {
		this.hiredate = hiredate;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
}
