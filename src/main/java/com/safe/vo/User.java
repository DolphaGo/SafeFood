package com.safe.vo;

import org.apache.ibatis.type.Alias;

@Alias("User")
public class User {
	private String id, pass, name, address, phone, allergy, filename;

	public User() {

	}

	public User(String id, String name) {
		this.id = id;
		this.name = name;
	}

	public User(String id, String pass, String name, String address, String phone, String allergy) {
		this.id = id;
		this.pass = pass;
		this.name = name;
		this.address = address;
		this.phone = phone;
		this.allergy = allergy;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getPass() {
		return pass;
	}

	public void setPass(String pass) {
		this.pass = pass;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getAllergy() {
		return allergy;
	}

	public void setAllergy(String allergy) {
		this.allergy = allergy;
	}

	public String getFilename() {
		return filename;
	}

	public void setFilename(String filename) {
		this.filename = filename;
	}

	@Override
	public String toString() {
		return "User [id=" + id + ", pass=" + pass + ", name=" + name + ", address=" + address + ", phone=" + phone
				+ ", allergy=" + allergy + "]";
	}
}
