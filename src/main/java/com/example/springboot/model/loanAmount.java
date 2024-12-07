package com.example.springboot.model;

import jakarta.persistence.*;
import java.util.Date;

@Entity
@Table(name = "add_loanamount_details") // Updated table name for clarity
public class loanAmount {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id; // Updated field name

    @Column(name = "user_id", nullable = false)
    private String userId;

    @Column(name = "sanctioned_amount", nullable = false)
    private Double sanctionedAmount;

    @Column(name = "loan_term", nullable = false)
    private String loanTerm; // in months

    @Column(name = "monthly_payment", nullable = false)
    private String monthlyPayment;

    @Column(name = "annual_interest", nullable = false)
    private String annualInterest;

    @Temporal(TemporalType.DATE)
    @Column(name = "sanction_date", nullable = false)
    private Date sanctionDate;

    // Getters and Setters

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getUserId() {
        return userId;
    }

    public void setUserId(String userId) {
        this.userId = userId;
    }

    public Double getSanctionedAmount() {
        return sanctionedAmount;
    }

    public void setSanctionedAmount(Double sanctionedAmount) {
        this.sanctionedAmount = sanctionedAmount;
    }

    public String getLoanTerm() {
        return loanTerm;
    }

    public void setLoanTerm(String loanTerm) {
        this.loanTerm = loanTerm;
    }

    public String getMonthlyPayment() {
        return monthlyPayment;
    }

    public void setMonthlyPayment(String monthlyPayment) {
        this.monthlyPayment = monthlyPayment;
    }

    public String getAnnualInterest() {
        return annualInterest;
    }

    public void setAnnualInterest(String annualInterest) {
        this.annualInterest = annualInterest;
    }

    public Date getSanctionDate() {
        return sanctionDate;
    }

    public void setSanctionDate(Date sanctionDate) {
        this.sanctionDate = sanctionDate;
    }
}
