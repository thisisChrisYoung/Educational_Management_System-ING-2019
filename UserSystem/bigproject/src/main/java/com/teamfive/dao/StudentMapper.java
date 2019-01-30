package com.teamfive.dao;

import java.util.Date;

import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import com.teamfive.pojo.Student;

public interface StudentMapper {
	@Select("SELECT * FROM t_student where s_username=#{s_username}")
	Student findBYUsername(String s_username);

	@Select("SELECT * FROM t_student where sid=#{sid}")
	Student findById(Integer sid);
	
	@Update("UPDATE t_student SET sex=#{sex}, birthday=#{birthday}, s_phone=#{s_phone} where sid=#{sid}")
	void updateStu(@Param("sex") String sex, @Param("birthday") Date birthday, @Param("s_phone") Long s_phone,
			@Param("sid") Integer sid);

	@Update("UPDATE t_student SET s_password=#{s_password} where sid=#{sid}")
	void updateSPW(@Param("s_password") String s_password, @Param("sid") Integer sid);
	
	@Select("SELECT t_course.course_name AS course_name, IFNULL(score,0) AS course_score FROM t_student INNER JOIN t_course LEFT JOIN t_score ON t_course.cid = t_score.cid AND t_student.sid = t_score.sid WHERE t_student.sid = #{sid}")
	List<Score> getScore(Integer sid);
}
