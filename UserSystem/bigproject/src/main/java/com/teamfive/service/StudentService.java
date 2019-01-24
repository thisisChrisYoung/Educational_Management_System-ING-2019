package com.teamfive.service;

import com.teamfive.pojo.Student;

public interface StudentService {
	Student checkLogin(String s_username, String s_password);
	void updateStu(Student student);
	void updateSPW(Student student);
	
}
