package com.offcn.pojo;

import javax.validation.constraints.NotNull;
import javax.validation.constraints.Pattern;

import org.hibernate.validator.constraints.NotBlank;

public class Student {
    private Integer id;

    @NotBlank(message="姓名不可以为空！")
    private String name;
    
    @NotBlank(message="性别不可以为空！")
    private String sex;
    
    @NotNull(message="年龄不可以为空！")
    private Integer age;
    
    @Pattern(regexp="^1[3,4,5,6,7,8,9]\\d{9}$",message="手机号码格式不正确！")
    private String tel;

    @NotNull(message="剩余课时数不可以为空！")
    private Integer sykss;
    
	public Integer getSykss() {
		return sykss;
	}

	public void setSykss(Integer sykss) {
		this.sykss = sykss;
	}

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getSex() {
		return sex;
	}

	public void setSex(String sex) {
		this.sex = sex;
	}

	public Integer getAge() {
		return age;
	}

	public void setAge(Integer age) {
		this.age = age;
	}

	public String getTel() {
		return tel;
	}

	public void setTel(String tel) {
		this.tel = tel;
	}

}