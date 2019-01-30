package com.teamfive.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.teamfive.dao.StudentMapper;
import com.teamfive.pojo.Student;

@Service
public class StudentServiceImpl implements StudentService {
	@Autowired
	StudentMapper studentMapper;

	@Override
	public Student checkLogin(String s_username, String s_password) {
		Student student = studentMapper.findBYUsername(s_username);
		if (student != null && student.getS_password().equals(s_password)) {
			if (student.getGid() == 4) {
				return student;
			}
			return null;
		}
		return null;
	}

	@Override
	@Transactional
	public void updateStu(Student student) {
		try {
			studentMapper.updateStu(student.getSex(), student.getBirthday(), student.getS_phone(), student.getSid());
		} catch (Exception e) {
			throw new RuntimeException("出现异常，事务回滚");
		}
	}

	@Override
	public void updateSPW(Student student) {
		try {
			studentMapper.updateSPW(student.getS_password(), student.getSid());
		} catch (Exception e) {
			throw new RuntimeException("出现异常，事务回滚");
		}
	}
	
	@Override
	public List<Score> getScoreList(Integer sid){
		return studentMapper.getScore(sid);
	}
}
