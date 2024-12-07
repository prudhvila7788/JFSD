<%@ include file="lendernav.jsp" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Loan Amount Insertion</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.3.0-alpha1/css/bootstrap.min.css">
</head>
<body>
    <div class="container mt-5">
        <h2 class="text-center">Loan Amount Insertion</h2>
        <form action="${pageContext.request.contextPath}/insertloan" method="POST">
            <!-- User ID -->
            <div class="mb-3">
                <label for="userId" class="form-label">User ID</label>
                <input type="text" class="form-control" id="userId" name="userId" 
                       value="${userId}" readonly>
            </div>
            
            <!-- Sanction Amount -->
            <div class="mb-3">
                <label for="sanctionedAmount" class="form-label">Sanctioned Amount</label>
                <input type="number" class="form-control" id="sanctionedAmount" name="sanctionedAmount" required>
            </div>
            
            <!-- Loan Term -->
            <div class="mb-3">
                <label for="loanTerm" class="form-label">Loan Term (Months)</label>
                <input type="number" class="form-control" id="loanTerm" name="loanTerm" required>
            </div>
            
            <!-- Monthly Payment -->
            <div class="mb-3">
                <label for="monthlyPayment" class="form-label">Monthly Payment</label>
                <input type="number" class="form-control" id="monthlyPayment" name="monthlyPayment" required>
            </div>
            
            <!-- Annual Interest -->
            <div class="mb-3">
                <label for="annualInterest" class="form-label">Annual Interest (%)</label>
                <input type="number" class="form-control" id="annualInterest" name="annualInterest" step="0.01" required>
            </div>
            
            <!-- Submit Button -->
            <div class="mb-3 text-center">
                <button type="submit" class="btn btn-primary">Submit Loan Details</button>
            </div>
        </form>
    </div>
</body>
</html>
