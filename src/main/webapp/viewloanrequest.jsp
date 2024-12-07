<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>View All Loan Requests</title>
    
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
    
    <!-- Font Awesome for Icons -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">
    
    <style>
        body {
            background-color: #f4f6f9;
        }
        .container {
            background-color: white;
            border-radius: 10px;
            box-shadow: 0 4px 6px rgba(0,0,0,0.1);
            padding: 30px;
            margin-top: 30px;
        }
        .table-responsive {
            margin-top: 20px;
        }
        .table thead {
            background-color: #007bff;
            color: white;
        }
        .table th, .table td {
            vertical-align: middle;
            padding: 12px;
        }
        .table-striped tbody tr:nth-of-type(even) {
            background-color: rgba(0,123,255,0.05);
        }
        .table-hover tbody tr:hover {
            background-color: rgba(0,123,255,0.1);
            transition: background-color 0.3s ease;
        }
        .btn-custom-size {
            padding: 6px 12px;
            font-size: 0.8rem;
        }
        .status-badge {
            padding: 6px 10px;
            font-size: 0.8rem;
        }
        .table-bordered {
            border: 1px solid #dee2e6;
        }
        .icon-space {
            margin-right: 5px;
        }
    </style>
</head>
<body>
<%@include file="lendernav.jsp" %>
<div class="container">
    <h2 class="text-center mb-4">
        <i class="fas fa-file-invoice-dollar icon-space"></i>
        Loan Requests Overview
    </h2>
    
    <div class="table-responsive">
        <table class="table table-bordered table-striped table-hover">
            <thead>
                <tr>
                    <th><i class="fas fa-hashtag icon-space"></i>ID</th>
                    <th><i class="fas fa-user icon-space"></i>Name</th>
                    <th><i class="fas fa-id-card icon-space"></i>User ID</th>
                    <th><i class="fas fa-dollar-sign icon-space"></i>Loan Amount</th>
                    <th><i class="fas fa-comment-dollar icon-space"></i>Purpose</th>
                    <th><i class="fas fa-calendar-alt icon-space"></i>Loan Term</th>
                    <th><i class="fas fa-percent icon-space"></i>Annual Interest</th>
                    <th><i class="fas fa-calendar-check icon-space"></i>Request Date</th>
                    <th><i class="fas fa-money-bill-wave icon-space"></i>Annual Income</th>
                    <th><i class="fas fa-check-circle icon-space"></i>Status</th>
                    <th><i class="fas fa-tasks icon-space"></i>Actions</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach var="loan" items="${loanrequestlist}">
                    <tr>
                        <td>${loan.id}</td>
                        <td>${loan.name}</td>
                        <td>${loan.userId}</td>
                        <td>$${loan.loanAmount}</td>
                        <td>${loan.purpose}</td>
                        <td>${loan.loanTerm} months</td>
                        <td>${loan.annualInterest}%</td>
                        <td>${loan.requestDate}</td>
                        <td>$${loan.annualIncome}</td>
                        <td>
                            <c:choose>
                                <c:when test="${loan.status}">
                                    <span class="badge badge-success status-badge">
                                        <i class="fas fa-check-circle icon-space"></i>Verified
                                    </span>
                                </c:when>
                                <c:otherwise>
                                    <span class="badge badge-danger status-badge">
                                        <i class="fas fa-times-circle icon-space"></i>Not Verified
                                    </span>
                                </c:otherwise>
                            </c:choose>
                        </td>
                        <td>
                            <div class="btn-group" role="group">
                                <c:if test="${!loan.status}">
                                    <a href="verifyloan?id=${loan.id}" class="btn btn-success btn-custom-size mr-1" 
                                       title="Verify Loan">
                                        <i class="fas fa-check icon-space"></i>Verify
                                    </a>
                                </c:if>
                                <a href="deleteloan?id=${loan.id}" class="btn btn-danger btn-custom-size mr-1" 
                                   onclick="return confirm('Are you sure you want to delete this loan request?');" 
                                   title="Delete Loan">
                                    <i class="fas fa-trash icon-space"></i>Delete
                                </a>
                                <a href="viewmoredetails?UserId=${loan.userId}" class="btn btn-info btn-custom-size mr-1" 
                                   title="View Details">
                                    <i class="fas fa-eye icon-space"></i>Details
                                </a>
                                <a href="${pageContext.request.contextPath}/addloan?userId=${loan.userId}" 
                                   class="btn btn-primary btn-custom-size" 
                                   title="Add New Loan">
                                    <i class="fas fa-plus-circle icon-space"></i>Add Loan
                                </a>
                            </div>
                        </td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
    </div>
</div>

<!-- Optional: Bootstrap JS and dependencies (if you need modal or other interactive features) -->
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
</body>
</html>