<%@page import="com.example.springboot.model.User"%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    HttpSession httpSession = request.getSession();
    User user = (User) httpSession.getAttribute("user");
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Loan Request Form</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
</head>
<body>
<%@ include file="usernav.jsp" %>
<div class="container mt-5">
    <h2 class="text-center">Loan Request Form</h2>
    <form action="insertloanrequest" method="post">
        <!-- Full Name -->
        <div class="form-group">
            <label for="name">Full Name:</label>
            <input type="text" class="form-control" id="name" name="name" required maxlength="20">
        </div>
        
        <!-- User ID (Auto-filled from Session) -->
        <div class="form-group">
            <label for="userid">User Id:</label>
            <input type="text" class="form-control" id="userid" name="userid" value="<%= user != null ? user.getId() : "" %>" readonly>
        </div>

        <!-- Loan Amount -->
        <div class="form-group">
            <label for="loanAmount">Loan Amount:</label>
            <input type="number" class="form-control" id="loanAmount" name="loanAmount" required step="0.01">
        </div>

        <!-- Loan Purpose -->
        <div class="form-group">
            <label for="purpose">Purpose:</label>
            <input type="text" class="form-control" id="purpose" name="purpose" required maxlength="50">
        </div>

        <!-- Loan Term (Years) -->
        <div class="form-group">
            <label for="loanTerm">Loan Term (Years):</label>
            <input type="number" class="form-control" id="loanTerm" name="loanTerm" required min="1">
        </div>

        <!-- Annual Interest Rate -->
        <div class="form-group">
            <label for="annualInterest">Annual Interest Rate (%):</label>
            <input type="number" class="form-control" id="annualInterest" name="annualInterest" required step="0.01">
        </div>

        <!-- Request Date (Auto-filled to Current Date) -->
        <div class="form-group">
            <label for="requestDate">Request Date:</label>
            <input type="date" class="form-control" id="requestDate" name="requestDate" required value="<%= new java.text.SimpleDateFormat("yyyy-MM-dd").format(new java.util.Date()) %>">
        </div>

        <!-- Annual Income -->
        <div class="form-group">
            <label for="annualIncome">Annual Income:</label>
            <input type="number" class="form-control" id="annualIncome" name="annualIncome" required step="0.01">
        </div>

        <!-- Submit Button -->
        <button type="submit" class="btn btn-primary">Submit Loan Request</button>
    </form>
</div>

<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.0.7/dist/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

</body>
</html>