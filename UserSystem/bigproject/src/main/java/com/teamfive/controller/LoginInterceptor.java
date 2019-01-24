package com.teamfive.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import com.teamfive.pojo.Student;
import com.teamfive.pojo.Teacher;


public class LoginInterceptor implements HandlerInterceptor{
	
	private static final String[] IGNORE_URI= {"/checkLogin"};
	
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		
		boolean flag = false;
		String servletPath = request.getServletPath();
		for (String s : IGNORE_URI) {
			if (servletPath.contains(s)) {
				flag = true;
				break;
			}
		}
		if (flag == false) {
			Teacher teacher = (Teacher) request.getSession().getAttribute("teacher");
			Student student = (Student) request.getSession().getAttribute("student");
			if (teacher == null&&student == null) {
				System.out.println("=========================请求已拦截=========================");
				request.getRequestDispatcher("checkLogin").forward(request, response);
			}else {
				flag = true;
				System.out.println("=========================请求通过=========================");
			}
		}
		return flag;
	}
	
	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
			ModelAndView modelAndView) throws Exception {
		// TODO Auto-generated method stub
	}
	
	@Override
	public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object handler, Exception ex)
			throws Exception {
		// TODO Auto-generated method stub
	}
}
