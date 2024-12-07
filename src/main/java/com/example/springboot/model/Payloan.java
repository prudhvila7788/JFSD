package com.example.springboot.model;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.Table;
@Entity
@Table(name="Payment_laon")
public class Payloan {
	    
	    @Id
	    @GeneratedValue(strategy = GenerationType.IDENTITY)
	    private Long id;
	    @Column(name="loanId")
	    private Long loanId;
	    @Column(name="userId")
	    private Long userId; 
	    @Column(name="sanctionedAmount")
	    private String sanctionedAmount;
	    @Column(name="amountPaid")
	    private String amountPaid;
	    @Column(name="paymentDate")
	    private String paymentDate;
		
		public String getSanctionedAmount() {
			return sanctionedAmount;
		}
		public void setSanctionedAmount(String sanctionedAmount) {
			this.sanctionedAmount = sanctionedAmount;
		}
		
		public String getPaymentDate() {
			return paymentDate;
		}
		public void setPaymentDate(String paymentDate) {
			this.paymentDate = paymentDate;
		}
		public Long getId() {
			return id;
		}
		public void setId(Long id) {
			this.id = id;
		}
		public Long getLoanId() {
			return loanId;
		}
		public void setLoanId(Long loanId) {
			this.loanId = loanId;
		}
		public Long getUserId() {
			return userId;
		}
		public void setUserId(Long userId) {
			this.userId = userId;
		}
		public String getAmountPaid() {
			return amountPaid;
		}
		public void setAmountPaid(String amountPaid) {
			this.amountPaid = amountPaid;
		}

}
