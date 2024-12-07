package com.example.springboot.service;


import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.springboot.model.AddMoreDetails;
import com.example.springboot.model.Lender;
import com.example.springboot.model.LoanRequest;
import com.example.springboot.model.User;
import com.example.springboot.model.loanAmount;
import com.example.springboot.repository.AddMoreDetailsRepository;
import com.example.springboot.repository.LenderRepository;
import com.example.springboot.repository.LoanAmountRepository;
import com.example.springboot.repository.LoanRequestRepository;

@Service
public class LenderServiceImpl implements LenderService {

	
	@Autowired
	public LenderRepository lenderRepository;
	
	@Autowired
	public LoanAmountRepository loanamountRepository;
	
	@Autowired
	public LoanRequestRepository loanrequestRepository;
	
	@Autowired
	public AddMoreDetailsRepository addmoredetailsRepository;
	
	@Override
	public String Register(Lender lender) {
		
		lenderRepository.save(lender);
		return "Lender Saved Successfully";
		
	}

	@Override
	public Lender checkLogin(String email, String password) {
		return lenderRepository.checkLenderLogin(email, password);
	}

	@Override
	public List<LoanRequest> ViewLoanRequest() {
	
		return loanrequestRepository.findAll();
	}

	@Override
	public String verifyLoan(long id) {
		  Optional<LoanRequest> optionalLoan = loanrequestRepository.findById(id);

		    if (optionalLoan.isPresent()) {
		        LoanRequest loanRequest = optionalLoan.get();
		        loanRequest.setStatus(true);
		        loanrequestRepository.save(loanRequest);
		        
		        return "Lender verified successfully";
		    } else {
		        return "Lender not found. Please try again.";
		    }
	}
	@Override
	public String deleteLoan(long id) {
		loanrequestRepository.deleteById(id);
		return "Lender Deleted Successfully";
	}
	public List<AddMoreDetails> getDetailsByUserId(String userId) {
	    return addmoredetailsRepository.findByUserId(userId);
	}

	@Override
	public String loanamount(loanAmount amount) {
		loanamountRepository.save(amount);
		return "LOAN SANCTIONED SUCCESSFULLY";
	}

	@Override
	public List<loanAmount> findByUserId(String userId) {
		return loanamountRepository.findByUserId(userId);
	}


}
