package com.offcn.controller;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.offcn.pojo.Record;
import com.offcn.pojo.Teacher;
import com.offcn.service.RecordService;

@Controller
@RequestMapping("/record")
public class RecordController {
	@Resource
	private RecordService recordService;

	@RequestMapping("/tealist")
	public String gettealist(@RequestParam(required=false,defaultValue="1") int pageNO,Model model,HttpSession session) {
		int size=10;
		Teacher tea=(Teacher)session.getAttribute("user");
	    List<Record> slist=recordService.getRecordPager(tea.getId(),pageNO, size);
	    model.addAttribute("pageNO", pageNO);
	    model.addAttribute("size", size);
	    model.addAttribute("count", recordService.getCount());
	    model.addAttribute("slist", slist);
		return "record/list";
	}
	@RequestMapping("/list")
	public String getlist(@RequestParam(required=false,defaultValue="1") int pageNO,Model model,HttpSession session) {
		int size=10;
	    List<Record> slist=recordService.getRecordPager(null,pageNO, size);
	    model.addAttribute("pageNO", pageNO);
	    model.addAttribute("size", size);
	    model.addAttribute("count", recordService.getCount());
	    model.addAttribute("slist", slist);
		return "record/list";
	}
	
	@RequestMapping("/delete/{id}")
	public String  delete(@PathVariable int id,Model model,RedirectAttributes redirectAttributes,HttpSession session) {
		int count = recordService.deleteByPrimaryKey(id);
		if(count>0){
			redirectAttributes.addFlashAttribute("message", "删除成功！");
		}else{
			redirectAttributes.addFlashAttribute("message", "删除失败！");
		}
		Object obj=session.getAttribute("user");
		if(obj instanceof Teacher){
			return "redirect:/record/tealist";
		}
		return "redirect:/record/list";
	}
	
	@RequestMapping("/deletes")
	public String  deletes(@RequestParam("id") int[] ids,Model model,RedirectAttributes redirectAttributes,HttpSession session) {
		int rows=0;
		rows=recordService.multiDelete(ids);
		if(rows>0){
			redirectAttributes.addFlashAttribute("message", "删除"+rows+"行记录成功！");
		}else{
			redirectAttributes.addFlashAttribute("message", "删除失败！");
		}
		Object obj=session.getAttribute("user");
		if(obj instanceof Teacher){
			return "redirect:/record/tealist";
		}
		return "redirect:/record/list";
	}
}
