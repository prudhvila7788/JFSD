<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>EasyPay Sidebar</title>
    <!-- Font Awesome CDN -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            font-family: 'Arial', sans-serif;
            background-color: #f4f4f4;
        }

        .sidebar {
            width: 250px;
            height: 100vh;
            background-color: #2c3e50;
            color: #ecf0f1;
            padding: 20px 0;
            position: fixed;
            left: 0;
            top: 0;
            transition: all 0.3s ease;
        }

        .sidebar h2 {
            text-align: center;
            margin-bottom: 30px;
            color: #3498db;
            font-size: 24px;
        }

        .sidebar a {
            display: block;
            color: #ecf0f1;
            padding: 12px 15px;
            text-decoration: none;
            transition: background-color 0.3s ease;
        }

        .sidebar a:hover {
            background-color: #34495e;
            color: #3498db;
        }

        .sidebar a i {
            margin-right: 10px;
            width: 20px;
            text-align: center;
        }

        .dropdown {
            position: relative;
        }

        .dropdown-toggle {
            cursor: pointer;
        }

        .dropdown-content {
            display: none;
            background-color: #34495e;
        }

        .dropdown:hover .dropdown-content {
            display: block;
        }

        .dropdown-content a {
            padding-left: 40px;
            font-size: 0.9em;
        }

        .active {
            background-color: #3498db;
            color: white;
        }
    </style>
</head>
<body>
    <div class="sidebar">
        <h2><i class="fas fa-money-check-alt"></i> EasyPay</h2>
        
        <a href="adminhome">
            <i class="fas fa-chart-pie"></i> Dashboard
        </a>
        
        <div class="dropdown">
            <a href="#" class="dropdown-toggle">
                <i class="fas fa-users"></i> Manage Users
            </a>
            <div class="dropdown-content">
                <a href="viewallusers">
                    <i class="fas fa-list"></i> View All Users
                </a>
                <a href="viewallusers">
                    <i class="fas fa-user-edit"></i> Update User
                </a>
                <a href="viewallusers">
                    <i class="fas fa-user-times"></i> Delete User
                </a>
            </div>
        </div>
        
        <a href="viewalllenders">
            <i class="fas fa-hand-holding-usd"></i> Manage Lenders
        </a>
     
        <a href="#">
            <i class="fas fa-user-tie"></i> Manage Fund Advisors
        </a>
        
        <a href="#">
            <i class="fas fa-comment-dots"></i> Feedback and Reviews
        </a>
         <a href="adminlogout">
            <i class="fas fa-hand-holding-usd"></i> Logout
        </a>
        
    </div>
</body>
</html>