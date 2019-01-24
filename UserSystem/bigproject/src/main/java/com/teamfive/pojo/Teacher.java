package com.teamfive.pojo;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

public class Teacher {
	private Integer tid;
	private String t_name;
	private String sex;
	
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date birthday;
	
	private Long t_phone;
	private String t_username;
	private String t_password;
	private Integer gid;

	public Integer getTid() {
		return tid;
	}

	public void setTid(Integer tid) {
		this.tid = tid;
	}

	public String getT_name() {
		return t_name;
	}

	public void setT_name(String t_name) {
		this.t_name = t_name;
	}

	public String getSex() {
		return sex;
	}

	public void setSex(String sex) {
		this.sex = sex;
	}

	public Date getBirthday() {
		return birthday;
	}

	public void setBirthday(Date birthday) {
		this.birthday = birthday;
	}
	
	public Long getT_phone() {
		return t_phone;
	}

	public void setT_phone(Long t_phone) {
		this.t_phone = t_phone;
	}


	public String getT_username() {
		return t_username;
	}

	public void setT_username(String t_username) {
		this.t_username = t_username;
	}

	public String getT_password() {
		return t_password;
	}

	public void setT_password(String t_password) {
		this.t_password = t_password;
	}

	public Integer getGid() {
		return gid;
	}

	public void setGid(Integer gid) {
		this.gid = gid;
	}

	public Teacher() {

	}

	@Override
	public String toString() {
		return "Teacher [tid=" + tid + ", t_name=" + t_name + ", sex=" + sex + ", brithday=" + birthday + ", t_phone="
				+ t_phone + ", t_username=" + t_username + ", t_password=" + t_password + ", gid=" + gid + "]";
	}

}
