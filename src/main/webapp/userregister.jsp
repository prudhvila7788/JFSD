<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Registration Form</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f5f5f5;
            margin: 0;
            padding: 0;
        }

        .main-container {
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            padding: 20px;
        }

        .form-container {
            background-color: #fff;
            border-radius: 8px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            padding: 20px;
            width: 100%;
            max-width: 400px;
        }

        h2 {
            text-align: center;
            color: #333;
        }

        .form-group {
            margin-bottom: 15px;
        }

        .form-group label {
            display: block;
            margin-bottom: 5px;
            font-weight: bold;
        }

        .form-group input, 
        .form-group select {
            width: 100%;
            padding: 10px;
            border: 1px solid #ccc;
            border-radius: 4px;
            font-size: 14px;
        }

        .form-group input:focus, 
        .form-group select:focus {
            outline: none;
            border-color: #007bff;
        }

        .form-group button {
            width: 100%;
            padding: 10px;
            background-color: #007bff;
            color: #fff;
            border: none;
            border-radius: 4px;
            font-size: 16px;
            cursor: pointer;
        }

        .form-group button:hover {
            background-color: #0056b3;
        }

        .login-link {
            text-align: center;
            margin-top: 15px;
        }

        .login-link a {
            color: #007bff;
            text-decoration: none;
        }

        .login-link a:hover {
            text-decoration: underline;
        }
    </style>
    <script>
        function validateForm(event) {
            const name = document.getElementById('name').value.trim();
            const gender = document.getElementById('gender').value;
            const dateOfBirth = document.getElementById('dateofbirth').value;
            const email = document.getElementById('email').value.trim();
            const phoneNumber = document.getElementById('phonenumber').value.trim();
            const password = document.getElementById('password').value.trim();

            // Name validation
            if (name === '') {
                alert('Name is required.');
                event.preventDefault();
                return false;
            }

            // Gender validation
            if (gender === '') {
                alert('Please select a gender.');
                event.preventDefault();
                return false;
            }

            // Date of Birth validation
            if (dateOfBirth === '') {
                alert('Date of Birth is required.');
                event.preventDefault();
                return false;
            }

            // Email validation
            const emailPattern = /^[a-zA-Z0-9._-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,6}$/;
            if (!emailPattern.test(email)) {
                alert('Please enter a valid email address.');
                event.preventDefault();
                return false;
            }

            // Phone number validation
            if (!/^\d{10}$/.test(phoneNumber)) {
                alert('Phone number must be a 10-digit number.');
                event.preventDefault();
                return false;
            }

            // Password validation
            const passwordPattern = /^(?=.*[A-Z])(?=.*\d)[A-Za-z\d@$!%*?&]{8,}$/;
            if (!passwordPattern.test(password)) {
                alert('Password must be at least 8 characters long, contain at least one uppercase letter, and one digit.');
                event.preventDefault();
                return false;
            }

            return true; // Allow form submission
        }
    </script>
</head>
<%@ include file="mainnav.jsp" %>
<body>

<div class="main-container">
    <div class="form-container">
        <h2>Registration Form</h2>
        <form action="/insertuser" method="post" onsubmit="return validateForm(event)">
            <div class="form-group">
                <label for="name">Name</label>
                <input type="text" id="name" name="name" maxlength="20" required>
            </div>
            
            <div class="form-group">
                <label for="gender">Gender</label>
                <select id="gender" name="gender" required>
                    <option value="">Select Gender</option>
                    <option value="Male">Male</option>
                    <option value="Female">Female</option>
                    <option value="Other">Other</option>
                </select>
            </div>
            
            <div class="form-group">
                <label for="dateofbirth">Date of Birth</label>
                <input type="date" id="dateofbirth" name="dateofbirth" required>
            </div>
            
            <div class="form-group">
                <label for="email">Email</label>
                <input type="email" id="email" name="email" maxlength="30" required>
            </div>
            
            <div class="form-group">
                <label for="phonenumber">Phone Number</label>
                <input type="tel" id="phonenumber" name="phonenumber" maxlength="10" required>
            </div>
            
            <div class="form-group">
                <label for="password">Password</label>
                <input type="password" id="password" name="password" maxlength="15" required>
            </div>

            <div class="form-group">
                <button type="submit">Register</button>
            </div>
        </form>

        <div class="login-link">
            <p>Already have an account? <a href="/userlogin">Login here</a></p>
        </div>
    </div>
</div>

</body>
</html>
