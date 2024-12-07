<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ include file="usernav.jsp" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>User Loan Requests</title>
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
    <!-- Font Awesome for Icons -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
    <style>
        body {
            background-color: #f4f6f9;
        }
        .container {
            background-color: white;
            border-radius: 10px;
            box-shadow: 0 4px 6px rgba(0,0,0,0.1);
            padding: 30px;
            margin-top: 50px;
        }
        .table thead {
            background-color: #3498db;
            color: white;
        }
        .table thead th {
            vertical-align: middle !important;
        }
        .table tbody tr:hover {
            background-color: rgba(52, 152, 219, 0.1);
        }
        .table td, .table th {
            vertical-align: middle !important;
        }
        .btn-action {
            display: inline-flex;
            align-items: center;
        }
        .btn-action i {
            margin-right: 5px;
        }
        .status-icon {
            margin-right: 5px;
        }
    </style>
</head>
<body>
<div class="container mt-5">
<h2 class="text-center mb-4">
    <i class="fas fa-file-invoice-dollar"></i> Your Loan Requests
</h2>
<table class="table table-bordered table-striped">
<thead class="thead-dark">
<tr>
<th><i class="fas fa-hashtag"></i> ID</th>
<th><i class="fas fa-user"></i> Name</th>
<th><i class="fas fa-dollar-sign"></i> Loan Amount</th>
<th><i class="fas fa-briefcase"></i> Purpose</th>
<th><i class="fas fa-calendar-alt"></i> Loan Term</th>
<th><i class="fas fa-percentage"></i> Annual Interest</th>
<th><i class="fas fa-calendar-check"></i> Request Date</th>
<th><i class="fas fa-chart-line"></i> Annual Income</th>
<th><i class="fas fa-info-circle"></i> Status</th>
<th><i class="fas fa-plus-circle"></i> Add More Details</th>
<th><i class="fas fa-eye"></i> View Details</th>
</tr>
</thead>
<tbody>
<c:forEach var="loan" items="${loanrequestlist}">
<tr>
<td>${loan.id}</td>
<td>${loan.name}</td>
<td>${loan.loanAmount}</td>
<td>${loan.purpose}</td>
<td>${loan.loanTerm}</td>
<td>${loan.annualInterest}</td>
<td>${loan.requestDate}</td>
<td>${loan.annualIncome}</td>
<td>
<c:choose>
<c:when test="${loan.status}">
<span class="badge badge-success">
    <i class="fas fa-check-circle status-icon"></i>Approved
</span>
</c:when>
<c:otherwise>
<span class="badge badge-warning">
    <i class="fas fa-clock status-icon"></i>Pending
</span>
</c:otherwise>
</c:choose>
</td>
<td>
<a href="addmoredetails.jsp?loanId=${loan.id}" class="btn btn-primary btn-sm btn-action">
    <i class="fas fa-plus"></i>Add Details
</a>
</td>
<td>
<a href="ViewMyowndetails?userId=${loan.userId}" class="btn btn-info btn-sm btn-action">
    <i class="fas fa-eye"></i>View Details
</a>
</td>
</tr>
</c:forEach>
</tbody>
</table>
</div>
</body>
</html>