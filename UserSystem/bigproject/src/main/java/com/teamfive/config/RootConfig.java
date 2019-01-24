package com.teamfive.config;

import java.sql.SQLException;

import javax.sql.DataSource;

import org.apache.ibatis.session.SqlSessionFactory;
import org.mybatis.spring.SqlSessionFactoryBean;
import org.mybatis.spring.mapper.MapperFactoryBean;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.FilterType;
import org.springframework.context.annotation.ComponentScan.Filter;
import org.springframework.stereotype.Controller;

import com.alibaba.druid.pool.DruidDataSource;
import com.mysql.cj.jdbc.Driver;
import com.teamfive.dao.StudentMapper;
import com.teamfive.dao.TeacherMapper;

@Configuration
@ComponentScan(basePackages="com.teamfive", excludeFilters=@Filter(type=FilterType.ANNOTATION, classes=Controller.class))
public class RootConfig {
	@Bean
	public DataSource dataSource() {
		DruidDataSource druidDataSource = new DruidDataSource();
		try {
			druidDataSource.setDriver(new Driver());
			druidDataSource.setUrl("jdbc:mysql://localhost:3306/project_db?useUnicode=true&characterEncoding=UTF-8&serverTimezone=UTC");
			druidDataSource.setUsername("root");
			druidDataSource.setPassword("root");
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return druidDataSource;
	}
	
	@Bean
	public SqlSessionFactory sqlSessionFactoryBean(DataSource dataSource) throws Exception {
		SqlSessionFactoryBean bean = new SqlSessionFactoryBean();
		bean.setDataSource(dataSource);
		return bean.getObject();
	}
	
	@Bean
	public MapperFactoryBean<TeacherMapper> mapperFactoryBean(SqlSessionFactory sqlSessionFactory){
		MapperFactoryBean<TeacherMapper> bean = new MapperFactoryBean<>();
		bean.setSqlSessionFactory(sqlSessionFactory);
		bean.setMapperInterface(TeacherMapper.class);
		return bean;
	}
	
	@Bean
	public MapperFactoryBean<StudentMapper> smapperFactoryBean(SqlSessionFactory sqlSessionFactory){
		MapperFactoryBean<StudentMapper> bean = new MapperFactoryBean<>();
		bean.setSqlSessionFactory(sqlSessionFactory);
		bean.setMapperInterface(StudentMapper.class);
		return bean;		
	}
}
