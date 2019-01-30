package com.teamfive.service;

import com.teamfive.pojo.PageInfo;
import com.teamfive.pojo.Student;
import com.teamfive.pojo.Teacher;

public interface TeacherService {
	Teacher checkLogin(String t_username, String t_password);
	
	PageInfo showPage(String s_name,String t_name,String pageSize,String pageNumber);

	void RegistS(Student student);

	void RegistT(Teacher teacher);

	void updateTeac(Teacher teacher);

	void updateTPW(Teacher teacher);
	
	List<Course> courseList(Integer cid);
}
