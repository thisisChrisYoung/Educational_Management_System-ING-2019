package com.teamfive.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;

import com.teamfive.pojo.Student;
import com.teamfive.service.StudentService;

@Controller
@RequestMapping("/student")
@SessionAttributes("student")
public class StudentController {
	@Autowired StudentService studentService;
	
	//跳转登录
	@RequestMapping("/login2")
	public String login() {
		return "login2";
	}
	
	//登录验证
	@RequestMapping("/checkLogin")
	public String checkLogin(Student student, Model model) {
		student = studentService.checkLogin(student.getS_username(), student.getS_password());
		System.out.println(student);
		if (student != null && student.getGid() == 4) {
			model.addAttribute("student", student);
			return "success3";
		}
		return "login2";
	}
	
	//跳转测试
	@RequestMapping("/anotherpage")
	public String hrefpage() {
		return "anotherpage2";
	}
	
	//登出
	@RequestMapping("/outLogin")
	public String outLogin(HttpSession session, SessionStatus sessionStatus) {
		session.removeAttribute("student");
		session.invalidate();
		sessionStatus.setComplete();
		return "login2";
	}
	
	//跳转修改
	@RequestMapping("/updateS")
	public String studentUpdate() {
		return "updateS";
	}
	
	//修改执行
	@RequestMapping("/doUpdate")
	public String doUpdate(Student student, Model model) {
		System.out.println("当前用户："+student.getS_name());
		try {
			studentService.updateStu(student);
			System.out.println("success!!!!!!!!!!!!!!!!!!!!!!!!!!");
			return "success3";
		} catch (Exception e) {
			return "error";
		}
	}
	
	//修改密码
	@RequestMapping("/updateSPW")
	public String updateSPW() {
		return "updateSPW";
	}
	
	//修改密码执行
	@RequestMapping("/doUpdatePW")
	public String doUpdatePW(Student student, Model model) {
		System.out.println("当前用户："+student.getS_name());
		try {
			studentService.updateSPW(student);
			System.out.println("success!!!!!!!!!!!!!!!!!!!!!!!!!!");
			return "updateS";
		} catch (Exception e) {
			return "error";
		}
	}
	
	//查询个人成绩
	@RequestMapping("/getscore")
	public ModelAndView getScoreList(ScoreVo scoreVo, Model model ,Student student){
		List<Score> listScore = studentService.getScoreList(student.getSid());
		ModelAndView mv = new ModelAndView();
		mv.addObject("listScore", listScore);
		mv.setViewName("showscore");
		return mv;
	}
}
