package com.offcn.pojo;

import javax.validation.constraints.NotNull;
import javax.validation.constraints.Pattern;

import org.hibernate.validator.constraints.NotBlank;

public class Teacher {
    private Integer id;
    
    @NotBlank(message="姓名不可以为空！")
    private String name;
    
    @Pattern(regexp="^1[3,4,5,6,7,8,9]\\d{9}$",message="手机号码格式不正确！")
    private String tel;
    
    @NotBlank(message="性别不可以为空！")
    private String sex;
    
    @NotNull(message="年龄不可以为空！")
    private Integer age;

    @Pattern(regexp="^[1-9]\\d{5}(18|19|([23]\\d))\\d{2}((0[1-9])|(10|11|12))(([0-2][1-9])|10|20|30|31)\\d{3}[0-9Xx]$",message="请输入正确的身份证！")
    private String idcard;

    @NotBlank(message="登录名不可以为空！")
    private String loginname;

    @NotBlank(message="登录密码不可以为空！")
    private String password;

    private Integer usertype;

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

	public String getTel() {
		return tel;
	}

	public void setTel(String tel) {
		this.tel = tel;
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

	public String getIdcard() {
		return idcard;
	}

	public void setIdcard(String idcard) {
		this.idcard = idcard;
	}

	public String getLoginname() {
		return loginname;
	}

	public void setLoginname(String loginname) {
		this.loginname = loginname;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public Integer getUsertype() {
		return usertype;
	}

	public void setUsertype(Integer usertype) {
		this.usertype = usertype;
	}
	
    
}