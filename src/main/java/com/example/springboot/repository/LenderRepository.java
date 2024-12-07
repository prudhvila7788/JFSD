package com.example.springboot.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import com.example.springboot.model.Lender;
import com.example.springboot.model.LoanRequest;
import com.example.springboot.model.User;



@Repository
public interface LenderRepository extends JpaRepository<Lender, Long>
{
	@Query("select l from Lender l where l.email=?1 and l.password=?2")
	public Lender checkLenderLogin(String email, String password);

	


}
