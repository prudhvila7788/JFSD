package com.example.springboot.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.example.springboot.model.loanAmount;

@Repository
public interface LoanAmountRepository extends JpaRepository<loanAmount, Long> {

	public List<loanAmount> findByUserId(String userId);

}
