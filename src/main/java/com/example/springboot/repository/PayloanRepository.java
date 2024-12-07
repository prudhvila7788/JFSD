package com.example.springboot.repository;

import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.example.springboot.model.Payloan;

@Repository
public interface PayloanRepository extends JpaRepository<Payloan, Long> {
	
	
	Optional<Payloan> findByLoanIdAndUserId(Long LoanId, Long userId);
	

}
