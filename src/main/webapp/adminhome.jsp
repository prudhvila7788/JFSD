<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="adminsidebar.jsp" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admin Dashboard</title>
    <link href="https://cdnjs.cloudflare.com/ajax/libs/lucide-icons/0.263.0/font/lucide.min.css" rel="stylesheet">
    <style>
        /* Global styles */
        :root {
            --primary-color: #007bff;
            --secondary-color: #6c757d;
            --background-light: #f4f4f9;
            --text-dark: #333;
            --white: #ffffff;
        }

        * {
            box-sizing: border-box;
            margin: 0;
            padding: 0;
        }

        body {
            font-family: 'Arial', sans-serif;
            background-color: var(--background-light);
            color: var(--text-dark);
            line-height: 1.6;
        }

        /* Main content styles */
        .main {
            margin-left: 280px;
            padding: 20px;
            transition: margin-left 0.3s;
        }

        .dashboard-cards {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(250px, 1fr));
            gap: 20px;
            padding: 20px 0;
        }

        .card {
            background: var(--white);
            border-radius: 10px;
            box-shadow: 0 4px 20px rgba(0, 0, 0, 0.1);
            padding: 25px;
            display: flex;
            flex-direction: column;
            align-items: center;
            text-align: center;
            transition: all 0.3s ease;
        }

        .card:hover {
            transform: translateY(-10px);
            box-shadow: 0 8px 30px rgba(0, 0, 0, 0.15);
        }

        .card-icon {
            font-size: 3rem;
            color: var(--primary-color);
            margin-bottom: 15px;
        }

        .card h3 {
            color: var(--primary-color);
            margin-bottom: 10px;
        }

        .card p {
            color: var(--secondary-color);
            margin-bottom: 15px;
            font-size: 0.9rem;
        }

        .btn {
            background-color: var(--primary-color);
            color: var(--white);
            padding: 10px 15px;
            border: none;
            border-radius: 5px;
            text-decoration: none;
            transition: background-color 0.3s;
            display: inline-flex;
            align-items: center;
            gap: 8px;
        }

        .btn:hover {
            background-color: #0056b3;
        }

        /* Responsive design */
        @media (max-width: 768px) {
            .sidebar {
                width: 60px;
                overflow-x: hidden;
            }

            .sidebar a span {
                display: none;
            }

            .main {
                margin-left: 60px;
            }

            .dropdown-content {
                left: 60px;
                top: auto;
            }
        }
    </style>
</head>
<body>
   
    <div class="main">
        <h1>Admin Dashboard</h1>
        <div class="dashboard-cards">
            <div class="card">
                <i class="card-icon" data-lucide="users"></i>
                <h3>Manage Users</h3>
                <p>View and manage all registered users in the system.</p>
                <a href="viewallusers" class="btn">
                    <i data-lucide="eye"></i>
                    View Users
                </a>
            </div>
            <div class="card">
                <i class="card-icon" data-lucide="hand-coins"></i>
                <h3>Manage Lenders</h3>
                <p>Create, update, and delete Lenders for users and advisors.</p>
                <a href="viewalllenders" class="btn">
                    <i data-lucide="settings"></i>
                    Manage Lenders
                </a>
            </div>
            <div class="card">
                <i class="card-icon" data-lucide="coins"></i>
                <h3>Manage Funds</h3>
                <p>View and manage all registered funds in the system.</p>
                <a href="viewFunds.jsp" class="btn">
                    <i data-lucide="bar-chart-3"></i>
                    View Funds
                </a>
            </div>
            <div class="card">
                <i class="card-icon" data-lucide="graduation-cap"></i>
                <h3>Manage Advisors</h3>
                <p>View and manage all registered fund advisors.</p>
                <a href="viewAdvisors.jsp" class="btn">
                    <i data-lucide="list"></i>
                    View Advisors
                </a>
            </div>
        </div>
    </div>

    <script src="https://unpkg.com/lucide@latest/dist/umd/lucide.min.js"></script>
    <script>
        lucide.createIcons();
    </script>
</body>
</html>
