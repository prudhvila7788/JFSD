package com.example.springboot.service;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.springboot.model.Admin;
import com.example.springboot.model.Lender;
import com.example.springboot.model.User;
import com.example.springboot.repository.AdminRepository;
import com.example.springboot.repository.LenderRepository;
import com.example.springboot.repository.UserRepository;


@Service
public class AdminServiceImpl implements AdminService {
	
	 @Autowired
	 public AdminRepository adminRepository;
	 
	 @Autowired
	 public UserRepository userRepository;
	 
	 @Autowired
	 public LenderRepository lenderRepository;
	
	public Admin checkadminlogin(String uname, String pwd) 
	{
		return adminRepository.checkadminlogin(uname, pwd);
	}

	@Override
	public List<User> ViewAllUsers() {
		
		return userRepository.findAll();
	}
	
	@Override
	public String deleteUser(long id) {
		userRepository.deleteById(id);
		return "User Deleted Successfully";
	}
	@Override
	public String verifyUser(long id) {
	    Optional<User> optionalUser = userRepository.findById(id);

	    if (optionalUser.isPresent()) {
	        User user = optionalUser.get();
	        user.setVerified(true);
	        userRepository.save(user);
	        
	        return "User verified successfully";
	    } else {
	        return "User not found. Please try again.";
	    }
	}
	@Override
	public List<Lender> ViewAllLenders() {
		
		return lenderRepository.findAll();
	}
	@Override
	public String deleteLender(long id) {
		lenderRepository.deleteById(id);
		return "Lender Deleted Successfully";
	}
	@Override
	public String verifyLender(long id) {
	    Optional<Lender> optionalLender = lenderRepository.findById(id);

	    if (optionalLender.isPresent()) {
	        Lender lender = optionalLender.get();
	        lender.setVerified(true);
	        lenderRepository.save(lender);
	        
	        return "Lender verified successfully";
	    } else {
	        return "Lender not found. Please try again.";
	    }
	}

	@Override
	public long lendercount() {
		   return lenderRepository.count();
		
	}
}
