package com.teamfive.pojo;

public class Course {
    private String course_name;
    private String course_student;
    private Integer course_score;

    public String getCourse_name() {
        return course_name;
    }

    public void setCourse_name(String course_name) {
        this.course_name = course_name;
    }

    public String getCourse_student() {
        return course_student;
    }

    public void setCourse_student(String course_student) {
        this.course_student = course_student;
    }

    public Integer getCourse_score() {
        return course_score;
    }

    public void setCourse_score(Integer course_score) {
        this.course_score = course_score;
    }

    @Override
    public String toString() {
        return "Course{" +
                "course_name='" + course_name + '\'' +
                ", course_student='" + course_student + '\'' +
                ", course_score=" + course_score +
                '}';
    }
}
