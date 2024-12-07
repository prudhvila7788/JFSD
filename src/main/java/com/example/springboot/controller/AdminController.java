package com.example.springboot.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.example.springboot.model.Admin;
import com.example.springboot.model.Lender;
import com.example.springboot.model.User;
import com.example.springboot.service.AdminService;


import jakarta.servlet.http.HttpServletRequest;

@Controller
public class AdminController {
	
	@Autowired
	public AdminService adminService;
	
	
	@GetMapping("/")
	public ModelAndView home()
	{
		ModelAndView mv = new ModelAndView();
		mv.setViewName("index");
		return mv;
	}
	@GetMapping("adminlogin")
	public   ModelAndView adminlogin() 
	{
			 ModelAndView mv = new ModelAndView();
			mv.setViewName("adminlogin");
			 return mv;
	}
	@GetMapping("adminlogout")
	public   ModelAndView adminlogout() 
	{
			 ModelAndView mv = new ModelAndView();
			mv.setViewName("redirect:/");
			 return mv;
	}
	@GetMapping("adminhome")
	public   ModelAndView adminhome() 
	{
			 ModelAndView mv = new ModelAndView();
			mv.setViewName("adminhome");
			 return mv;
	}
	@PostMapping("checkadminlogin")
	//@ResponseBody
	public ModelAndView checkadminlogin(HttpServletRequest request)
	{
			ModelAndView mv = new ModelAndView();
			
			String auname = request.getParameter("auname");
			String apwd = request.getParameter("apwd");
			
			Admin admin = adminService.checkadminlogin(auname, apwd);
			if(admin!=null)
			{
				//return "Admin Login Success";
				mv.setViewName("redirect:/adminhome");
			}		
			else
			{
				//return admin login fail
				mv.setViewName("adminlogin");
				mv.addObject("message","Login Failed");
			}
			  return mv;
	}
	
	@GetMapping("viewallusers")
	public ModelAndView viewallusers() {
		ModelAndView mv = new ModelAndView("viewallusers");
		List<User> userList = adminService.ViewAllUsers();
        mv.addObject("userlist", userList);
		
		return mv;
		
	}
	@GetMapping("deleteuser")
	public ModelAndView deleteuser(@RequestParam("id") int id) {
		ModelAndView mv=new ModelAndView();
	    String msg=adminService.deleteUser(id);
	    
	    mv.addObject("msg",msg);
	    mv.setViewName("redirect:/viewallusers");
	    
	    return mv;
	}
	
	@GetMapping("verifyuser")
	public ModelAndView verifyUser(@RequestParam("id") int id) {
		ModelAndView mv=new ModelAndView();
	    String msg=adminService.verifyUser(id);
	    
	    mv.addObject("msg",msg);
	    mv.setViewName("redirect:/viewallusers");
	    
	    
	    return mv;
	}
	@GetMapping("viewalllenders")
	public ModelAndView viewalllenders() {
		ModelAndView mv = new ModelAndView("viewalllenders");
		List<Lender> lenderList = adminService.ViewAllLenders();
	    long count = adminService.lendercount();
        mv.addObject("lenderlist", lenderList);
		
		return mv;
}
	@GetMapping("deletelender")
	public ModelAndView deletelender(@RequestParam("id") int id) {
		ModelAndView mv=new ModelAndView();
	    String msg=adminService.deleteLender(id);
	    
	    mv.addObject("msg",msg);
	    mv.setViewName("redirect:/viewalllenders");
	    
	    return mv;
	}
	@GetMapping("verifylender")
	public ModelAndView verifyLender(@RequestParam("id") int id) {
		ModelAndView mv=new ModelAndView();
	    String msg=adminService.verifyLender(id);
	    
	    mv.addObject("msg",msg);
	    mv.setViewName("redirect:/viewalllenders");
	    
	    
	    return mv;
	}
	
	
}