package com.offcn.controller;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.offcn.pojo.Classes;
import com.offcn.pojo.Record;
import com.offcn.pojo.Sc;
import com.offcn.pojo.Student;
import com.offcn.pojo.Teacher;
import com.offcn.service.ClassesService;
import com.offcn.service.RecordService;
import com.offcn.service.StudentService;

@Controller
@RequestMapping("/stu")
public class StudentController {

	@Resource
	StudentService studentService;
	
	@Resource
	ClassesService classesService;
	
	@Resource
	RecordService recordService;
	
	@GetMapping("/daka/{id}")
	public String dakaget(Model model,@PathVariable int id) {
		model.addAttribute("entity", studentService.selectByPrimaryKey(id));
		return "student/daka";
	}
	
	@PostMapping("/daka")
	@ResponseBody
	public void dakapost(Integer tid,Record record,HttpSession session){
		Student stu = studentService.selectByPrimaryKey(tid);
		stu.setSykss(stu.getSykss()-record.getKss());
		Teacher tea = (Teacher) session.getAttribute("user");
		record.setStudent(stu);
		record.setTeacher(tea);
		recordService.insert(record);
		studentService.updateByPrimaryKey(stu);
	}
	
	@RequestMapping("/list")
	public String getlist(@RequestParam(required=false,defaultValue="1") int pageNO,Model model) {
		int size=10;
	    List<Student> slist=studentService.getStudentPager(pageNO, size);
	    model.addAttribute("pageNO", pageNO);
	    model.addAttribute("size", size);
	    model.addAttribute("count", studentService.getCount());
	    model.addAttribute("slist", slist);
		return "student/list";
	}
	/*@RequestMapping("/tealist")
	public String gettealist(@RequestParam(required=false,defaultValue="1") int pageNO,Model model) {
		int size=10;
	    List<Student> slist=studentService.getStudentPager(pageNO, size);
	    model.addAttribute("pageNO", pageNO);
	    model.addAttribute("size", size);
	    model.addAttribute("count", studentService.getCount());
	    model.addAttribute("slist", slist);
		return "student/tealist";
	}*/
	@RequestMapping("/dakalist")
	public String getdakalist(@RequestParam(required=false,defaultValue="1") int pageNO,Model model,HttpSession session) {
		int size=10;
	    List<Student> slist=studentService.getStudentPager(pageNO, size);
	    model.addAttribute("pageNO", pageNO);
	    model.addAttribute("size", size);
	    model.addAttribute("count", studentService.getCount());
	    model.addAttribute("slist", slist);
		return "student/dakalist";
	}
	//重定向一定要写绝对路径eg:redirect:/stu/list
	@RequestMapping("/delete/{id}")
	public String  delete(@PathVariable int id,Model model,RedirectAttributes redirectAttributes) {
		int count = studentService.deleteByPrimaryKey(id);
		if(count>0){
			redirectAttributes.addFlashAttribute("message", "删除成功！");
		}else{
			redirectAttributes.addFlashAttribute("message", "删除失败！");
		}
		return "redirect:/stu/list";
	}
	
	@RequestMapping("/deletes")
	public String  deletes(@RequestParam("id") int[] ids,Model model,RedirectAttributes redirectAttributes) {
		int rows=0;
		rows=studentService.multiDelete(ids);
		if(rows>0){
			redirectAttributes.addFlashAttribute("message", "删除"+rows+"行记录成功！");
		}else{
			redirectAttributes.addFlashAttribute("message", "删除失败！");
		}
		return "redirect:/stu/list";
	}
	
	//
	@RequestMapping("/add")
	public String add(Model model) {
		List<Classes> clist=classesService.getAllClasses();
		model.addAttribute("clist", clist);
		model.addAttribute("entity", new Student());
		return "student/add";
	}
	
	//
	@RequestMapping("/addSave")
	public String addSave(Model model,@ModelAttribute("entity") @Valid Student entity,BindingResult bindingResult,RedirectAttributes redirectAttributes) {
		if(bindingResult.hasErrors()){
			 model.addAttribute("entity", entity);
			 List<Classes> clist=classesService.getAllClasses();
			 model.addAttribute("clist", clist);
			 //redirectAttributes.addFlashAttribute("entity", arg1)
             return "student/add";
			 //return "redirect:/add";
		}else{
			List<Classes> clist=classesService.getAllClasses();
			model.addAttribute("clist", clist);
			model.addAttribute("entity", new Student());
			studentService.insert(entity);
			return "redirect:/stu/list";
		}
		
	}
	
	//edit/${entity.id}
	@RequestMapping("/edit/{id}")
	public String add(Model model,@PathVariable int id) {
		List<Classes> clist=classesService.getAllClasses();
		model.addAttribute("clist", clist);
		model.addAttribute("entity", studentService.selectByPrimaryKey(id));
		return "student/edit";
	}
	
	//
	@RequestMapping("/editSave")
	public String editSave(Model model,@ModelAttribute("entity") @Valid Student entity,BindingResult bindingResult) {
		if(bindingResult.hasErrors()){
			 model.addAttribute("entity", entity);
            return "student/edit";
		}else{
			studentService.updateByPrimaryKey(entity);
			return "redirect:/stu/list";
		}
	}
	
	/*@RequestMapping("/dakalist")
	public String dakalist(@RequestParam(required=false,defaultValue="1") int pageNO,Model model) {
		int size=10;
	    List<Student> slist=studentService.getStudentPager(pageNO, size);
	    model.addAttribute("pageNO", pageNO);
	    model.addAttribute("size", size);
	    model.addAttribute("count", studentService.getCount());
	    model.addAttribute("slist", slist);
		return "student/dakalist";
	}*/
	
	/*@RequestMapping("/getXuXiu")
	public String getXuXiu(Model model,HttpServletRequest req){
		HttpSession session=req.getSession();
		Student student=(Student) session.getAttribute("user");
		List<CourseExt> clist= studentService.getXuxiu(student.getClassid());
		model.addAttribute("colist", clist);
		return "student/colist";
	}*/
	
	@RequestMapping(value="/semycou",produces="text/html;charset=utf8")
	@ResponseBody
	public String semycou(@RequestParam("cou") String[] ct,HttpServletRequest req){
		HttpSession session=req.getSession();
		Student student=(Student) session.getAttribute("user");
		List<Sc> sclist=new ArrayList<Sc>();
		for(int i=0;i<ct.length;i++){
			Sc sc=new Sc();
			String cteveryone=ct[i];
			String[] ctarray=cteveryone.split("_");
			sc.setCid(Integer.parseInt(ctarray[0]));
			sc.setTid(Integer.parseInt(ctarray[1]));
			sc.setSid(student.getId());
			sclist.add(sc);
		}
		String msg="";
		try{
			studentService.inserBatch(sclist);
			msg="选课成功！";
		}catch(Exception e){
			msg="选课可能有重复，请审核后重试！";
		}
		return msg;
	}
	
	
	/*@RequestMapping("/getStuCourse")
	public String getStuCourse(Model model,HttpServletRequest req){
		HttpSession session=req.getSession();
		Student student=(Student) session.getAttribute("user");
		List<CourseExt> ctlist=studentService.getMycourses(student.getClassid(), student.getId());
		model.addAttribute("ctlist", ctlist);
		return "student/cslist";
	}*/
	
	
}
