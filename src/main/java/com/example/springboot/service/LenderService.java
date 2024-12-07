package com.example.springboot.service;

import java.util.List;

import com.example.springboot.model.AddMoreDetails;
import com.example.springboot.model.Lender;
import com.example.springboot.model.LoanRequest;
import com.example.springboot.model.loanAmount;



public interface LenderService {

	public String Register(Lender lender);
	public Lender checkLogin(String email, String password);
	public List<LoanRequest> ViewLoanRequest();
	public String verifyLoan(long id);
	public String deleteLoan(long id);
	public List<AddMoreDetails>  getDetailsByUserId(String userId);
	public String loanamount(loanAmount amount);
	public List<loanAmount> findByUserId(String userId);
}
