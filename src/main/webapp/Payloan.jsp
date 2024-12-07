<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Loan Details</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
</head>
<body>
    <div class="container mt-5">
        <h2>Loan Details</h2>

        <!-- Display error message if loan details are not found -->
        <c:if test="${not empty error}">
            <div class="alert alert-danger">
                <strong>Error:</strong> ${error}
            </div>
        </c:if>

        <!-- Display loan details -->
        <c:if test="${not empty loan}">
            <div class="card">
                <div class="card-header">
                    Loan Information
                </div>
                <div class="card-body">
                    <table class="table table-bordered">
                        <tr>
                            <th>Loan ID</th>
                            <td>${loan.loanId}</td>
                        </tr>
                        <tr>
                            <th>User ID</th>
                            <td>${loan.userId}</td>
                        </tr>
                        <tr>
                            <th>Sanctioned Amount</th>
                            <td>${loan.sanctionedAmount}</td>
                        </tr>
                        <tr>
                            <th>Amount Paid</th>
                            <td>${loan.amountPaid}</td>
                        </tr>
                        <tr>
                            <th>Payment Date</th>
                            <td>${loan.paymentDate}</td>
                        </tr>
                    </table>

                    <<form action="${pageContext.request.contextPath}/payloan" method="post">
   
    <input type="hidden" name="userId" value="${loan.userId}">
    <div class="form-group">
        <label for="sanctionedAmount">Sanctioned Amount</label>
        <input type="text" class="form-control" id="sanctionedAmount" name="sanctionedAmount" value="${loan.sanctionedAmount}" readonly>
    </div>
    <div class="form-group">
        <label for="amountPaid">Amount Paid</label>
        <input type="text" class="form-control" id="amountPaid" name="amountPaid" required>
    </div>
    <div class="form-group">
        <label for="paymentDate">Payment Date</label>
        <input type="date" class="form-control" id="paymentDate" name="paymentDate" required>
    </div>
    <button type="submit" class="btn btn-primary">Process Payment</button>
</form>
                    
                </div>
            </div>
        </c:if>
    </div>

    <!-- Bootstrap JS (Optional) -->
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.4/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
