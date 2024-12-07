package com.example.springboot.controller;

import java.awt.PageAttributes.MediaType;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.example.springboot.model.AddMoreDetails;
import com.example.springboot.model.Lender;
import com.example.springboot.model.LoanRequest;
import com.example.springboot.model.User;
import com.example.springboot.model.loanAmount;
import com.example.springboot.service.LenderService;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;

@Controller
public class LenderController {
	
	
	@Autowired
	private LenderService lenderService;
	
	 @GetMapping("lenderregister")
		public ModelAndView lenderregister() {
			ModelAndView mv=new ModelAndView();
			mv.setViewName("lenderregister");
		    return mv;
		}
	   @GetMapping("lenderlogout")
		public   ModelAndView adminlogout() 
		{
				 ModelAndView mv = new ModelAndView();
				mv.setViewName("redirect:/");
				 return mv;
		}
	   @GetMapping("lenderprofile")
		public ModelAndView farmerrofile()
		{
			ModelAndView mv = new ModelAndView();
			mv.setViewName("lenderprofile");
			return mv;
		}
	 

	 @GetMapping("lenderdashboard")
		public ModelAndView lenderdashboard() {
			ModelAndView mv=new ModelAndView();
			mv.setViewName("lenderdashboard");
			
			
			return mv;
		}
		
	
	@PostMapping("/insertlender")
	public ModelAndView insertlender(HttpServletRequest request)
	{
		String Name = request.getParameter("name");
		String Email = request.getParameter("email");
		String PhoneNumber = request.getParameter("phonenumber");
		String Password =request.getParameter("password");
		String BussinessType = request.getParameter("bussinessType");
		
		
		Lender lender = new Lender();
		
		lender.setName(Name);
		lender.setEmail(Email);
		lender.setPhonenumber(PhoneNumber);
		lender.setPassword(Password);
		lender.setBussinessType(BussinessType);
		
		lenderService.Register(lender);
		ModelAndView mv = new ModelAndView();
		mv.setViewName("lenderregister");

		return mv;
	}
	@GetMapping("lenderlogin")
	public ModelAndView login() {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("lenderlogin");
		return mv;
	}
	
	@PostMapping("/checklenderlogin")
	public ModelAndView checkLenderLogin(HttpServletRequest request) {
	    String email = request.getParameter("email");
	    String password = request.getParameter("password");
	    ModelAndView mv = new ModelAndView();

	    System.out.println(email + " " + password);

	    Lender lender = lenderService.checkLogin(email, password);

	    if (lender == null) {
	        HttpSession session = request.getSession();
	        session.setAttribute("error", "Check your credentials");
	        mv.setViewName("redirect:/lenderlogin"); 
	    } else if (!lender.isVerified()) {
	        mv.addObject("msg", "Your account is not verified. Kindly contact Admin (in Contact page)");
	        mv.setViewName("ErrorPage");
	        System.out.println(lender.toString()+"");
	    } else {
	        HttpSession session = request.getSession();
	        session.setAttribute("lender", lender);
	        mv.setViewName("redirect:/lenderdashboard");
	        System.out.println(lender.toString());
	    }
	    return mv;
	}
	
	
	@GetMapping("viewloanrequest")
	public ModelAndView viewloanrequest() {
		ModelAndView mv = new ModelAndView("viewloanrequest");
		List<LoanRequest> loanrequestlist = lenderService.ViewLoanRequest();
        mv.addObject("loanrequestlist", loanrequestlist);
		
		return mv;
	}
	@GetMapping("verifyloan")
	public ModelAndView verifyloan(@RequestParam("id") long id) {
	    ModelAndView mv = new ModelAndView();
	    String msg = lenderService.verifyLoan(id);
	    
	    mv.addObject("msg", msg);  // Optional: pass the message to display it on the redirected page.
	    mv.setViewName("redirect:/viewloanrequest");  // Ensure this path matches the actual mapping
	    
	    return mv;
	}
	@GetMapping("deleteloan")
	public ModelAndView deleteloan(@RequestParam("id") int id) {
		ModelAndView mv=new ModelAndView();
	    String msg=lenderService.deleteLoan(id);
	    
	    mv.addObject("msg",msg);
	    mv.setViewName("redirect:/viewloanrequest");
	    
	    return mv;
	}
	
	@GetMapping("/viewmoredetails")
	public ModelAndView viewUserDetails(@RequestParam(name = "UserId", required = false) String UserId) {
	    ModelAndView mv = new ModelAndView();

	    if (UserId == null) {
	        mv.setViewName("errormsg");
	        mv.addObject("message", "User ID is required to view details.");
	        return mv;
	    }

	    mv.setViewName("viewmoredetails");
	    List<AddMoreDetails> detailsList = lenderService.getDetailsByUserId(UserId);
	    mv.addObject("detailsList", detailsList);
	    return mv;
	}
	@GetMapping("/displayUserAdharImage")
	public ResponseEntity<byte[]> displayUserAdharImage(@RequestParam String userId) throws Exception {
	    List<AddMoreDetails> detailsList = lenderService.getDetailsByUserId(userId);
	    if (detailsList.isEmpty()) {
	        return ResponseEntity.notFound().build();  // Return 404 if no details found
	    }

	    AddMoreDetails details = detailsList.get(0);  // Assuming you want the first record
	    byte[] imageBytes = details.getUseradharImage().getBytes(1, (int) details.getUseradharImage().length());

	    return ResponseEntity.ok().contentType(org.springframework.http.MediaType.IMAGE_JPEG).body(imageBytes);
	}

	@GetMapping("/displayNomineeAdharImage")
	public ResponseEntity<byte[]> displayNomineeAdharImage(@RequestParam String userId) throws Exception {
	    List<AddMoreDetails> detailsList = lenderService.getDetailsByUserId(userId);
	    if (detailsList.isEmpty()) {
	        return ResponseEntity.notFound().build();  // Return 404 if no details found
	    }

	    AddMoreDetails details = detailsList.get(0);  // Assuming you want the first record
	    byte[] imageBytes = details.getNomineeAdharImage().getBytes(1, (int) details.getNomineeAdharImage().length());

	    return ResponseEntity.ok().contentType(org.springframework.http.MediaType.IMAGE_JPEG).body(imageBytes);
	}
	
	 @GetMapping("addloan")
		public ModelAndView addloan(@RequestParam("userId") String userId) {
			ModelAndView mv=new ModelAndView();
			mv.setViewName("addloan");
			mv.addObject("userId", userId); 
			        return mv;
			
		    }
		    
	
	 @PostMapping("/insertloan")
	 public ModelAndView insertloan(HttpServletRequest request) {
	     String userId = request.getParameter("userId");
	     String sanctionedAmountStr = request.getParameter("sanctionedAmount");
	     Double sanctionedAmount = null;

	     try {
	         sanctionedAmount = Double.parseDouble(sanctionedAmountStr);
	     } catch (NumberFormatException e) {
	         // Handle the case where the input is invalid, e.g., show an error message
	         // Log the exception if necessary
	         System.out.println("Invalid number format for sanctionedAmount");
	     }

	     String loanTerm = request.getParameter("loanTerm");
	     String monthlyPayment = request.getParameter("monthlyPayment");
	     String annualInterest = request.getParameter("annualInterest");
	     Date sanctionDate = new Date();

	     loanAmount amount = new loanAmount();
	     amount.setUserId(userId);
	     amount.setSanctionedAmount(sanctionedAmount); // Set as Double
	     amount.setLoanTerm(loanTerm);
	     amount.setMonthlyPayment(monthlyPayment);
	     amount.setAnnualInterest(annualInterest);
	     amount.setSanctionDate(sanctionDate);

	     lenderService.loanamount(amount);

	     ModelAndView mv = new ModelAndView();
	     mv.setViewName("addloan");
	     return mv;
	 }

	
}