package com.teamfive.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.teamfive.dao.TeacherMapper;
import com.teamfive.pojo.Student;
import com.teamfive.pojo.Teacher;

@Service

public class TeacherServiceImpl implements TeacherService {
	@Autowired
	TeacherMapper teacherMapper;

	@Override
	public Teacher checkLogin(String t_username, String t_password) {
		Teacher teacher = teacherMapper.findBYUsername(t_username);
		if (teacher != null && teacher.getT_password().equals(t_password)) {
			if (teacher.getGid() == 1) {
				return teacher;
			} else if (teacher.getGid() == 2 || teacher.getGid() == 3) {
				return teacher;
			}
			return null;
		}
		return null;
	}

	@Override
	@Transactional
	public void RegistS(Student student) {
		try {
			teacherMapper.registStu(student.getS_name(), student.getSex(), student.getBirthday(), student.getS_phone(),
					student.getS_username(), student.getS_password(), student.getTid());
		} catch (Exception e) {
			throw new RuntimeException("出现异常，事务回滚");
		}
	}
	
	@Override
	public void RegistT(Teacher teacher) {
		try {
			teacherMapper.registTeac(teacher.getT_name(), teacher.getSex(), teacher.getBirthday(), teacher.getT_phone(),
					teacher.getT_username(), teacher.getT_password());
		} catch (Exception e) {
			throw new RuntimeException("出现异常，事务回滚");
		}
	}

	@Override
	public void updateTeac(Teacher teacher) {
		try {
			teacherMapper.updateTeac(teacher.getSex(), teacher.getBirthday(), teacher.getT_phone(), teacher.getT_password(), teacher.getTid());
		} catch (Exception e) {
			throw new RuntimeException("出现异常，事务回滚");
		}
	}

	@Override
	public void updateTPW(Teacher teacher) {
		try {
			teacherMapper.updateTPW(teacher.getT_password(), teacher.getTid());
		} catch (Exception e) {
			throw new RuntimeException("出现异常，事务回滚");
		}
	}

}
