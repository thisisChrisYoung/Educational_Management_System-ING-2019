package com.teamfive.pojo;

import java.util.List;

public class Score {

    private String course_name;
    private Integer course_score;
    private Student student;


    public Student getStudent() {
        return student;
    }

    public void setStudent(Student student) {
        this.student = student;
    }

    public String getCourse_name() {
        return course_name;
    }

    public void setCourse_name(String course_name) {
        this.course_name = course_name;
    }

    public Integer getCourse_score() {
        return course_score;
    }

    public void setCourse_score(Integer course_score) {
        this.course_score = course_score;
    }

    @Override
    public String toString() {
        return "Score{" +
                ", course_name='" + course_name + '\'' +
                ", course_score=" + course_score +
                '}';
    }
}
