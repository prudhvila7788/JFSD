<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="mainnav.jsp" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Lender Registration Form</title>
    <style>
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background-color: #f0f4f8;
            margin: 0;
            padding: 0;
        }

        .error-message {
            color: red;
            font-size: 0.8em;
            margin-top: 5px;
        }

        .form-container {
            width: 400px;
            margin: 50px auto;
            background: white;
            padding: 30px;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }

        .form-container h2 {
            margin-bottom: 20px;
            font-size: 1.5rem;
            color: #333;
        }

        .form-group {
            margin-bottom: 15px;
        }

        .form-group input, .form-group select {
            width: 100%;
            padding: 10px;
            border: 1px solid #ddd;
            border-radius: 4px;
        }

        .form-group label {
            font-size: 0.9rem;
            color: #555;
            margin-bottom: 5px;
            display: block;
        }

        .btn {
            display: inline-block;
            width: 100%;
            padding: 10px;
            background-color: #007bff;
            color: white;
            font-size: 1rem;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            text-align: center;
            transition: background-color 0.3s;
        }

        .btn:hover {
            background-color: #0056b3;
        }

        .btn.secondary {
            background-color: #6c757d;
        }

        .btn.secondary:hover {
            background-color: #5a6268;
        }

        .buttons {
            margin-top: 20px;
            display: flex;
            justify-content: space-between;
            gap: 10px;
        }
    </style>
</head>
<body>
<div class="form-container">
    <h2>Lender Registration</h2>
    <form id="registrationForm" action="/insertlender" method="post" onsubmit="return validateForm()">
        <div class="form-group">
            <label>Lender Name</label>
            <input type="text" id="name" name="name" required>
            <div id="nameError" class="error-message"></div>
        </div>
        
        <div class="form-group">
            <label>Email</label>
            <input type="email" id="email" name="email" required>
            <div id="emailError" class="error-message"></div>
        </div>
        
        <div class="form-group">
            <label>Phone Number</label>
            <input type="tel" id="phonenumber" name="phonenumber" required>
            <div id="phoneError" class="error-message"></div>
        </div>
        
        <div class="form-group">
            <label>Password</label>
            <input type="password" id="password" name="password" required>
            <div id="passwordError" class="error-message"></div>
        </div>
        
        <div class="form-group">
            <label>Business Type</label>
            <select id="bussinessType" name="bussinessType" required>
                <option value="">Select Business Type</option>
                <option value="Bank">Bank</option>
                <option value="Financial Institution">Financial Institution</option>
                <option value="Private Lender">Private Lender</option>
                <option value="Peer-to-Peer Lending">Peer-to-Peer Lending</option>
            </select>
            <div id="businessTypeError" class="error-message"></div>
        </div>
        
        <div class="buttons">
            <button type="submit" class="btn">Register</button>
            <button type="button" class="btn secondary" onclick="location.href='/lenderlogin'">Login</button>
        </div>
    </form>
</div>

<script>
function validateForm() {
    // Reset previous error messages
    var errorElements = document.querySelectorAll('.error-message');
    errorElements.forEach(el => el.textContent = '');

    // Validation variables
    var isValid = true;
    var name = document.getElementById('name');
    var email = document.getElementById('email');
    var phone = document.getElementById('phonenumber');
    var password = document.getElementById('password');
    var businessType = document.getElementById('bussinessType');

    // Name validation (2-20 characters, letters only)
    var nameRegex = /^[A-Za-z\s]{2,20}$/;
    if (!nameRegex.test(name.value)) {
        document.getElementById('nameError').textContent = 'Name must be 2-20 letters';
        isValid = false;
    }

    // Email validation
    var emailRegex = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
    if (!emailRegex.test(email.value)) {
        document.getElementById('emailError').textContent = 'Invalid email format';
        isValid = false;
    }

    // Phone validation (10 digits, starts with 6-9)
    var phoneRegex = /^[6-9]\d{9}$/;
    if (!phoneRegex.test(phone.value)) {
        document.getElementById('phoneError').textContent = 'Invalid 10-digit phone number';
        isValid = false;
    }

    // Password validation (8-20 chars, one uppercase, one lowercase, one number, one special char)
    var passwordRegex = /^(?=.*[A-Z])(?=.*[a-z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{8,20}$/;
    if (!passwordRegex.test(password.value)) {
        document.getElementById('passwordError').textContent = 'Password must be 8-20 chars with complexity';
        isValid = false;
    }

    // Business type validation
    if (!businessType.value) {
        document.getElementById('businessTypeError').textContent = 'Please select business type';
        isValid = false;
    }

    return isValid;
}
</script>
</body>
</html>
