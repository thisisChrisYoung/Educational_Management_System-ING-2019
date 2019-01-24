package com.teamfive.service;

import com.teamfive.pojo.Student;
import com.teamfive.pojo.Teacher;

public interface TeacherService {
	Teacher checkLogin(String t_username, String t_password);
	void RegistS(Student student);
	void RegistT(Teacher teacher);
	void updateTeac(Teacher teacher);
	void updateTPW(Teacher teacher);
}
