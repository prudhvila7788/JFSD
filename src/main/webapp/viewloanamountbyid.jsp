<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ include file="usernav.jsp" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Loan Amount Details</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.3.0-alpha1/css/bootstrap.min.css">
    
</head>
<body>
    <div class="container mt-5">
        <h2 class="text-center">Loan Amount Details</h2>
        <div class="row mt-4">
            <div class="col-12">
                <c:if test="${not empty loanAmountlist}">
                    <table class="table table-bordered">
                        <thead>
                            <tr>
                                <th>ID</th>
                                <th>User ID</th>
                                <th>Sanctioned Amount</th>
                                <th>Loan Term (Months)</th>
                                <th>Monthly Payment</th>
                                <th>Annual Interest</th>
                                <th>Sanction Date</th>
                                <th>Action</th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:forEach var="loan" items="${loanAmountlist}">
                                <tr>
                                    <td>${loan.id}</td>
                                    <td>${loan.userId}</td>
                                    <td>${loan.sanctionedAmount}</td>
                                    <td>${loan.loanTerm}</td>
                                    <td>${loan.monthlyPayment}</td>
                                    <td>${loan.annualInterest}</td>
                                    <td>${loan.sanctionDate}</td>
                                    <td>
                                        <button>
                                            <a href="PayLoan?id=${user.id}" class="btn btn-success">PayLoan</a>
                                        </button>
                                    </td>
                                </tr>
                            </c:forEach>
                        </tbody>
                    </table>
                </c:if>
                <c:if test="${empty loanAmountlist}">
                    <div class="alert alert-warning">
                        No loan records found for this user.
                    </div>
                </c:if>
            </div>
        </div>
    </div>
</body>
</html>
