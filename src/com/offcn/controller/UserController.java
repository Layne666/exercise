package com.offcn.controller;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.offcn.pojo.Teacher;
import com.offcn.pojo.User;
import com.offcn.service.TeacherService;
import com.offcn.service.UserService;

@Controller
@RequestMapping("/admin")
public class UserController {

	@Resource
	UserService userService;
	
	@Resource
	TeacherService teacherService;
	
	@RequestMapping("/login")
	public String login(User user,Model model,HttpSession session) {
		int usertype=-1;//初始化
		if(user!=null){
		  usertype=user.getUsertype();
		  if(usertype==1){
			  //管理员
			 User loginuser= userService.userlogin(user);
			 if(loginuser!=null){
				 session.setAttribute("user", loginuser);
				 return "redirect:/admin/index";
			 }else{
				 model.addAttribute("msg", "请输入正确的用户名和密码");
				 return "/index";
			 }
		  }else if(usertype==2){
			  //老师 
			  Teacher tea=new Teacher();
			  tea.setLoginname(user.getName());
			  tea.setPassword(user.getPassword());
			  Teacher logintea=teacherService.loginTea(tea);
			  if(logintea!=null){
				  session.setAttribute("user", logintea);
				  return "redirect:/admin/index";
			  }else{
				  model.addAttribute("msg", "请输入正确的用户名和密码");
				  return "/index";
			  }
			 
		  }
		  
		}
		return "/index";
	}
	
	@RequestMapping("/index")
	public String index(HttpSession session){
		if(session.getAttribute("user")==null){
			return "/login";
		}
		return "/homepage/index";
	}
	
	@RequestMapping("/logout")
	@ResponseBody
	public boolean logout(HttpSession session){
		session.invalidate();
		return true;
	}
	
	@RequestMapping("/resetpwd")
	public String add(Model model) {
		model.addAttribute("entity", new User());
		return "homepage/resetpwd";
	}
}
	
	

