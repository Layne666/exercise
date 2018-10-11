package com.offcn.pojo;

public class Record {
	private Integer id;
	private Integer kss;
	private String ksrq;
	private Student student;
	private Teacher teacher;
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public Integer getKss() {
		return kss;
	}
	public void setKss(Integer kss) {
		this.kss = kss;
	}
	public String getKsrq() {
		return ksrq;
	}
	public void setKsrq(String ksrq) {
		this.ksrq = ksrq;
	}
	public Student getStudent() {
		return student;
	}
	public void setStudent(Student student) {
		this.student = student;
	}
	public Teacher getTeacher() {
		return teacher;
	}
	public void setTeacher(Teacher teacher) {
		this.teacher = teacher;
	}
	public Record() {
		super();
	}
	public Record(Student student, Teacher teacher) {
		super();
		this.student = student;
		this.teacher = teacher;
	}
	
}
