package com.example.springboot.service;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.springboot.model.AddMoreDetails;
import com.example.springboot.model.LoanRequest;
import com.example.springboot.model.Payloan;
import com.example.springboot.model.User;
import com.example.springboot.model.loanAmount;
import com.example.springboot.repository.AddMoreDetailsRepository;
import com.example.springboot.repository.LoanAmountRepository;
import com.example.springboot.repository.LoanRequestRepository;
import com.example.springboot.repository.PayloanRepository;
import com.example.springboot.repository.UserRepository;


@Service
public class UserServiceImpl implements UserService {

	
	@Autowired
	private UserRepository userRepository;
	@Autowired
	private LoanRequestRepository loanrequestRepository;
	
	@Autowired
	private AddMoreDetailsRepository addmoredetailsRepository;
	 
	@Autowired
	private LoanAmountRepository loanAmountRepository;
	
	@Autowired
	private PayloanRepository payloanRepository;
	
	@Override
	public String Register(User user) {
		
		userRepository.save(user);
		return "User Register Successfully";
	}
	@Override
	public User checkLogin(String email, String password) {
			return userRepository.checkUserLogin(email, password);
		}
	@Override
	public String LoanRegister(LoanRequest loanrequest) {
		
		 loanrequestRepository.save(loanrequest);
		 return "Loan Requested Successfully";
	}
	
	
	@Override
	public List<LoanRequest> findByUserId(String userId) {
	    return loanrequestRepository.findByUserId(userId);
	}
	@Override
	public String AddDetails(AddMoreDetails addmoredetails) {
		
		addmoredetailsRepository.save(addmoredetails);
		return "details are added successfully";
	}
	public List<AddMoreDetails> getDetailsByUserId(String userId) {
	    return addmoredetailsRepository.findByUserId(userId);
	 }
	public String savePayloan(Payloan payloan) {
        payloanRepository.save(payloan); 
        return "Loan Payement Successfully";
    }
	
	public Payloan getLoanById(Long loanId, Long userId) {
        // Fetch the Payloan from the repository using loanId and userId
        Optional<Payloan> loanOptional = payloanRepository.findByLoanIdAndUserId(loanId, userId);

      
        if (loanOptional.isPresent()) {
            return loanOptional.get();
        } else {
            throw new RuntimeException("Loan not found for Loan ID: " + loanId + " and User ID: " + userId);
        }
    }

	
	
	

}
