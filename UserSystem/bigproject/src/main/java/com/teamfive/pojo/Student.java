package com.teamfive.pojo;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

public class Student {
	private Integer sid;
	private String s_name;
	private String sex;

	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date birthday;

	private Long s_phone;
	private String s_username;
	private String s_password;
	private Integer tid;
	private Integer gid;
	private Teacher teacher;

	public Integer getSid() {
		return sid;
	}

	public void setSid(Integer sid) {
		this.sid = sid;
	}

	public String getS_name() {
		return s_name;
	}

	public void setS_name(String s_name) {
		this.s_name = s_name;
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

	public Long getS_phone() {
		return s_phone;
	}

	public void setS_phone(Long s_phone) {
		this.s_phone = s_phone;
	}

	public String getS_username() {
		return s_username;
	}

	public void setS_username(String s_username) {
		this.s_username = s_username;
	}

	public String getS_password() {
		return s_password;
	}

	public void setS_password(String s_password) {
		this.s_password = s_password;
	}

	public Integer getGid() {
		return gid;
	}

	public void setGid(Integer gid) {
		this.gid = gid;
	}

	public Teacher getTeacher() {
		return teacher;
	}

	public Integer getTid() {
		return tid;
	}

	public void setTid(Integer tid) {
		this.tid = tid;
	}

	public void setTeacher(Teacher teacher) {
		this.teacher = teacher;
	}

	public Student() {

	}

	@Override
	public String toString() {
		return "Student [sid=" + sid + ", s_name=" + s_name + ", sex=" + sex + ", birthday=" + birthday + ", s_phone="
				+ s_phone + ", s_username=" + s_username + ", s_password=" + s_password + ", tid=" + tid + ", gid="
				+ gid + "]";
	}
	
}
