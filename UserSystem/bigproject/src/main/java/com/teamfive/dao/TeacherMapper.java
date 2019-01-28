package com.teamfive.dao;

import java.util.Date;
import java.util.List;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import com.teamfive.pojo.PageInfo;
import com.teamfive.pojo.Student;
import com.teamfive.pojo.Teacher;

public interface TeacherMapper {
	@Select("SELECT * FROM t_teacher where t_username=#{t_username}")
	Teacher findBYUsername(String t_username);

	@Select("SELECT * FROM t_teacher where tid=#{tid}")
	Teacher findById(Integer tid);
	
	@Insert("INSERT INTO t_student (s_name, sex, birthday, s_phone, s_username, s_password, tid, gid) VALUES(#{s_name}, #{sex}, #{birthday}, #{s_phone}, #{s_username}, #{s_password},#{tid}, 4)")
	void registStu(@Param("s_name") String s_name, @Param("sex") String sex, @Param("birthday") Date birthday,
			@Param("s_phone") Long s_phone, @Param("s_username") String s_username,
			@Param("s_password") String s_password, @Param("tid") Integer tid);

	@Insert("INSERT INTO t_teacher (t_name, sex, birthday, t_phone, t_username, t_password, gid) VALUES(#{tname}, #{sex}, #{birthday}, #{t_phone}, #{t_username}, #{t_password}, 3)")
	void registTeac(@Param("t_name") String t_name, @Param("sex") String sex, @Param("birthday") Date birthday,
			@Param("t_phone") Long t_phone, @Param("t_username") String t_username,
			@Param("t_password") String t_password);

	@Update("UPDATE t_teacher SET sex=#{sex}, birthday=#{birthday}, t_phone=#{t_phone} where tid=#{tid}")
	void updateTeac(@Param("sex") String sex, @Param("birthday") Date birthday, @Param("t_phone") Long t_phone,
			@Param("tid") Integer tid);

	@Update("UPDATE t_teacher SET t_password=#{t_password} where tid=#{tid}")
	void updateTPW(@Param("t_password") String t_password, @Param("tid") Integer tid);
	
	@Select("<script>select * from t_student\r\n" + 
			"		<where>\r\n" + 
			"			<if test=\"s_name!=null and s_name!=''\">\r\n" + 
			"				<bind name=\"s_name\" value=\"'%'+s_name+'%'\"></bind>\r\n" + 
			"				and name like #{s_name}\r\n" + 
			"			</if>		\r\n" + 
			"			<if test=\"t_name!=null and t_name!=''\">\r\n" + 
			"				<bind name=\"t_name\" value=\"'%'+t_name+'%'\"></bind>\r\n" + 
			"				and tid in (select id from t_teacher where name like #{t_name})\r\n" + 
			"			</if>\r\n" + 
			"		</where>\r\n" + 
			"		limit #{pageStart},#{pageSize}</script>")
	List<Student> selByPage(PageInfo pInfo);
	
	@Select("<script>select count(*) from t_student\r\n" + 
			"		<where>\r\n" + 
			"			<if test=\"s_name!=null and s_name!=''\">\r\n" + 
			"				<bind name=\"s_name\" value=\"'%'+s_name+'%'\"></bind>\r\n" + 
			"				and name like #{s_name}\r\n" + 
			"			</if>		\r\n" + 
			"			<if test=\"t_name!=null and t_name!=''\">\r\n" + 
			"				<bind name=\"t_name\" value=\"'%'+t_name+'%'\"></bind>\r\n" + 
			"				and tid in (select id from t_teacher where name like #{t_name})\r\n" + 
			"			</if>\r\n" + 
			"		</where></script>")
	Long selCountByPageInfo(PageInfo pInfo);
	
}
