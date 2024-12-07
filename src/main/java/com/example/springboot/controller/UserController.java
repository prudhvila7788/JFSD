package com.example.springboot.controller;

import java.sql.Blob;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.example.springboot.model.AddMoreDetails;
import com.example.springboot.model.LoanRequest;
import com.example.springboot.model.Payloan;
import com.example.springboot.model.User;
import com.example.springboot.model.loanAmount;
import com.example.springboot.service.LenderService;
import com.example.springboot.service.UserService;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;

@Controller
public class UserController {

	 @Autowired
	 private UserService userService;
	 
	 @Autowired
	 private LenderService lenderService;
	 
	 @GetMapping("userregister")
		public ModelAndView userregister() {
			ModelAndView mv=new ModelAndView();
			mv.setViewName("userregister");
			return mv;
		}
	 @GetMapping("about")
		public ModelAndView about() {
			ModelAndView mv=new ModelAndView();
			mv.setViewName("about");
			
			
			return mv;
		}
	 @GetMapping("userprofile")
		public ModelAndView farmerrofile()
		{
			ModelAndView mv = new ModelAndView();
			mv.setViewName("userprofile");
			return mv;
		}
	 @GetMapping("userdashboard")
		public ModelAndView lenderdashboard() {
			ModelAndView mv=new ModelAndView();
			mv.setViewName("userdashboard");
			
			
			return mv;
		}
	 @GetMapping("userlogout")
		public   ModelAndView adminlogout() 
		{
				 ModelAndView mv = new ModelAndView();
				mv.setViewName("redirect:/");
				 return mv;
		}
		
	
	@PostMapping("/insertuser")
	public ModelAndView insertuser(HttpServletRequest request)
	{
		String Name = request.getParameter("name");
		String Gender = request.getParameter("gender");
		String DateofBirth = request.getParameter("dateofbirth");
		String Email = request.getParameter("email");
		String PhoneNumber = request.getParameter("phonenumber");
		String password =request.getParameter("password");
		
		User user = new User();
		user.setName(Name);
		user.setGender(Gender);
		user.setDateofbirth(DateofBirth);
		user.setEmail(Email);
		user.setPhonenumber(PhoneNumber);
		user.setPassword(password);
		
		userService.Register(user);
		ModelAndView mv = new ModelAndView();
		mv.setViewName("userregister");

		return mv;
	}
	@GetMapping("userlogin")
	public ModelAndView login() {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("userlogin");
		return mv;
	}
	
	@PostMapping("/checkuserlogin")
	public ModelAndView checkUserLogin(HttpServletRequest request) {
	    String email = request.getParameter("email");
	    String password = request.getParameter("password");
	    ModelAndView mv = new ModelAndView();

	    System.out.println(email + " " + password);

	    User user = userService.checkLogin(email, password);

	    if (user == null) {
	        HttpSession session = request.getSession();
	        session.setAttribute("error", "Check your credentials");
	        mv.setViewName("redirect:/userlogin"); 
	    } else if (!user.isVerified()) {
	        mv.addObject("msg", "Your account is not verified. Kindly contact Admin (in Contact page)");
	        mv.setViewName("ErrorPage");
	        System.out.println(user.toString()+"");
	    } else {
	        HttpSession session = request.getSession();
	        session.setAttribute("user", user);
	        mv.setViewName("redirect:/userdashboard");
	        System.out.println(user.toString());
	    }
	    return mv;
	}
	
	 
	 @GetMapping("loanrequest")
		public ModelAndView loanrequest() {
			ModelAndView mv=new ModelAndView();
			mv.setViewName("loanrequest");
		    return mv;
	}
	  @PostMapping("/insertloanrequest")
	    public ModelAndView insertLoanRequest(HttpServletRequest request) {
	        // Retrieve loan request parameters
	        String name = request.getParameter("name");
	        String userId = request.getParameter("userid");
	        double loanAmount = Double.parseDouble(request.getParameter("loanAmount"));
	        String purpose = request.getParameter("purpose");
	        int loanTerm = Integer.parseInt(request.getParameter("loanTerm"));
	        double annualInterest = Double.parseDouble(request.getParameter("annualInterest"));
	        Date requestDate = new Date();  // Assuming current date as request date
	        double annualIncome = Double.parseDouble(request.getParameter("annualIncome"));
	        
          
	        // Create and populate LoanRequest entity
	        LoanRequest loanRequest = new LoanRequest();
	        loanRequest.setName(name);
	        loanRequest.setUserId(userId);
	        loanRequest.setLoanAmount(loanAmount);
	        loanRequest.setPurpose(purpose);
	        loanRequest.setLoanTerm(loanTerm);
	        loanRequest.setAnnualInterest(annualInterest);
	        loanRequest.setRequestDate(requestDate);
	        loanRequest.setAnnualIncome(annualIncome);
	        
	        
	        // Save loan request
	        userService.LoanRegister(loanRequest);

	        // Create ModelAndView for response
	        ModelAndView mv = new ModelAndView();
	        mv.setViewName("loanrequest"); // Update view name as per your JSP or HTML page

	        return mv;
	    }
	  
	  
	  
		 @GetMapping("returncalculator")
			public ModelAndView returncalculator() {
				ModelAndView mv=new ModelAndView();
				mv.setViewName("returncalculator");
				
				
				return mv;
			}

		 
		 @GetMapping("/loanrequestuserid")
		 public ModelAndView loanRequestByUserId(HttpServletRequest request) {
		     ModelAndView mv = new ModelAndView("loanrequestuserid");

		    
		     HttpSession httpSession = request.getSession();
		     User user = (User) httpSession.getAttribute("user");
		     String userId = Long.toString( user.getId()) ; // Make sure this is correct; if it's a reference, use getUser().getId()

		        
		         List<LoanRequest> loanRequestList = userService.findByUserId(userId);
		         for(LoanRequest loanRequest: loanRequestList) {
		        	 System.out.println(loanRequest.getId());
		         }
		         mv.addObject("loanrequestlist", loanRequestList);
		    
		     return mv;
		 }
		 
		 @PostMapping("/insertaddmoredetails")
		 public ModelAndView insertAddMoreDetails(
		         HttpServletRequest request,
		         @RequestParam("userAdharImage") MultipartFile file,
		         @RequestParam("nomineeAdharImage") MultipartFile nomineeFile) throws Exception {

		     ModelAndView mv = new ModelAndView();
		     String msg;

		     try {
		         // Retrieve loan request parameters
		         String userId = request.getParameter("userid");
		         String email = request.getParameter("email");
		         String address = request.getParameter("address");
		         String phoneNumber = request.getParameter("phoneNumber");
		         String phonePayNumber = request.getParameter("phonePayNumber");
		         String nomineeName = request.getParameter("nomineeName");
		         String nomineePhoneNumber = request.getParameter("nomineePhoneNumber");
		         String nomineeRelationship = request.getParameter("nomineeRelationship");
		         String nomineeAddress = request.getParameter("nomineeAddress");
		         String bankAccountNumber = request.getParameter("bankAccountNumber");
		         String branchName = request.getParameter("branchName");
		         String ifscCode = request.getParameter("ifscCode");

		         // Convert MultipartFile to Blob
		         Blob adharBlob = new javax.sql.rowset.serial.SerialBlob(file.getBytes());
		         Blob nomineeBlob = new javax.sql.rowset.serial.SerialBlob(nomineeFile.getBytes());

		         // Populate AddMoreDetails entity
		         AddMoreDetails details = new AddMoreDetails();
		         details.setUserId(userId);
		         details.setEmail(email);
		         details.setAddress(address);
		         details.setPhoneNumber(phoneNumber);
		         details.setPhonePayNumber(phonePayNumber);
		         details.setNomineeName(nomineeName);
		         details.setNomineePhoneNumber(nomineePhoneNumber);
		         details.setNomineeRelationship(nomineeRelationship);
		         details.setNomineeAddress(nomineeAddress);
		         details.setBankAccountNumber(bankAccountNumber);
		         details.setBranchName(branchName);
		         details.setIfscCode(ifscCode);
		         details.setUseradharImage(adharBlob);
		         details.setNomineeAdharImage(nomineeBlob);

		         // Save details via service
		         msg = userService.AddDetails(details);
		         System.out.println(msg);
		         mv.setViewName("detailsmsg");
		         mv.addObject("message", msg);
		     } catch (Exception e) {
		         msg = e.getMessage();
		         System.out.println(msg);
		         mv.setViewName("errormsg");
		         mv.addObject("message", msg);
		     }

		     return mv;
		 }
		
		 
		 @GetMapping("/viewloanamountbyid")
		 public ModelAndView viewloanamountbyid(HttpServletRequest request) {
		     ModelAndView mv = new ModelAndView("viewloanamountbyid");

		    
		     HttpSession httpSession = request.getSession();
		     User user = (User) httpSession.getAttribute("user");
		     String userId = Long.toString( user.getId()) ; // Make sure this is correct; if it's a reference, use getUser().getId()

		        
		         List<loanAmount> loanAmountlist = lenderService.findByUserId(userId);
		         for(loanAmount loanAmount: loanAmountlist) {
		        	 System.out.println(loanAmount.getId());
		         }
		         mv.addObject("loanAmountlist", loanAmountlist);
		    
		     return mv;
		 }
		 @GetMapping("/ViewMyowndetails")
		 public ModelAndView viewUserDetails(@RequestParam(name = "userId") String userId) {
		     ModelAndView mv = new ModelAndView();

		     if (userId == null) {
		         mv.setViewName("errormsg");
		         mv.addObject("message", "User ID is required to view details.");
		         return mv;
		     }

		     List<AddMoreDetails> detailsList = lenderService.getDetailsByUserId(userId);

		     if (detailsList.isEmpty()) {
		         mv.setViewName("errormsg");
		         mv.addObject("message", "No details found for the given User ID.");
		         return mv;
		     }

		     mv.setViewName("ViewMyowndetails");
		     mv.addObject("details", detailsList.get(0)); // Assuming you want the first record
		     return mv;
		 }

		 @GetMapping("/displayUserAdharImages")
		 public ResponseEntity<byte[]> displayUserAdharImage(@RequestParam String userId) throws Exception {
		     List<AddMoreDetails> detailsList = lenderService.getDetailsByUserId(userId);
		     if (detailsList.isEmpty()) {
		         return ResponseEntity.notFound().build();  // Return 404 if no details found
		     }

		     AddMoreDetails details = detailsList.get(0);  // Assuming you want the first record
		     byte[] imageBytes = details.getUseradharImage().getBytes(1, (int) details.getUseradharImage().length());

		     return ResponseEntity.ok().contentType(org.springframework.http.MediaType.IMAGE_JPEG).body(imageBytes);
		 }

		 @GetMapping("/displayNomineeAdharImages")
		 public ResponseEntity<byte[]> displayNomineeAdharImage(@RequestParam String userId) throws Exception {
		     List<AddMoreDetails> detailsList = lenderService.getDetailsByUserId(userId);
		     if (detailsList.isEmpty()) {
		         return ResponseEntity.notFound().build();  // Return 404 if no details found
		     }

		     AddMoreDetails details = detailsList.get(0);  // Assuming you want the first record
		     byte[] imageBytes = details.getNomineeAdharImage().getBytes(1, (int) details.getNomineeAdharImage().length());

		     return ResponseEntity.ok().contentType(org.springframework.http.MediaType.IMAGE_JPEG).body(imageBytes);
		 }
		 
		 
}
		   



	
	
	

