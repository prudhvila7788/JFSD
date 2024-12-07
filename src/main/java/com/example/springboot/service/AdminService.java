package com.example.springboot.service;

import java.util.List;



import com.example.springboot.model.Admin;
import com.example.springboot.model.Lender;
import com.example.springboot.model.User;


public interface AdminService {
	
	public Admin checkadminlogin(String uname, String pwd);
	public List<User> ViewAllUsers();
	public String deleteUser(long id);
	public String verifyUser(long id);
	public List<Lender> ViewAllLenders();
	public String deleteLender(long id);
	public String verifyLender(long id);
	public long lendercount();
	
}
