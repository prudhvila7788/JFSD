<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Lender Dashboard</title>
    
    <!-- Bootstrap 5 CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet">
    
    <!-- Bootstrap Icons -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.0/font/bootstrap-icons.css" rel="stylesheet">
    
    <style>
        :root {
            --sidebar-width: 270px;
            --sidebar-bg: #2c3034;
            --sidebar-text: #adb5bd;
            --sidebar-hover-bg: #495057;
        }

        body {
            overflow-x: hidden;
            background-color: #f4f6f8;
        }

        .sidebar {
            position: fixed;
            top: 0;
            left: 0;
            width: var(--sidebar-width);
            height: 100vh;
            background-color: var(--sidebar-bg);
            transition: all 0.3s;
            z-index: 1000;
            padding-top: 20px;
        }

        .sidebar-logo {
            text-align: center;
            margin-bottom: 30px;
            padding: 0 15px;
        }

        .sidebar-logo h3 {
            color: white;
            font-weight: bold;
            display: flex;
            align-items: center;
            justify-content: center;
        }

        .sidebar-nav {
            list-style: none;
            padding: 0;
            margin: 0;
        }

        .sidebar-nav li {
            margin-bottom: 5px;
        }

        .sidebar-nav a {
            display: flex;
            align-items: center;
            color: var(--sidebar-text);
            padding: 12px 20px;
            text-decoration: none;
            transition: all 0.3s;
        }

        .sidebar-nav a:hover {
            background-color: var(--sidebar-hover-bg);
            color: white;
        }

        .sidebar-nav a i {
            margin-right: 15px;
            font-size: 1.2rem;
        }

        .content {
            margin-left: var(--sidebar-width);
            padding: 20px;
            transition: all 0.3s;
        }

        @media (max-width: 768px) {
            .sidebar {
                left: -var(--sidebar-width);
            }

            .content {
                margin-left: 0;
            }

            .sidebar-open .sidebar {
                left: 0;
            }

            .sidebar-open .content {
                margin-left: var(--sidebar-width);
            }
        }

        .card-dashboard {
            border-radius: 10px;
            box-shadow: 0 4px 6px rgba(0,0,0,0.1);
            transition: all 0.3s;
        }

        .card-dashboard:hover {
            transform: translateY(-5px);
            box-shadow: 0 6px 12px rgba(0,0,0,0.15);
        }
    </style>
</head>
<body>
    <div class="sidebar">
        <div class="sidebar-logo">
            <h3>
                <i class="bi bi-bank2 me-2"></i>
                EasyPay
            </h3>
        </div>
        
        <ul class="sidebar-nav">
            <li>
                <a href="lenderdashboard.jsp">
                    <i class="bi bi-speedometer2"></i>
                    Dashboard
                </a>
            </li>
            <li>
                <a href="viewloanrequest">
                    <i class="bi bi-cash-stack"></i>
                    Loan Requests
                </a>
            </li>
            <li>
                <a href="#payments">
                    <i class="bi bi-credit-card"></i>
                    Payments
                </a>
            </li>
            <li>
                <a href="lenderprofile">
                    <i class="bi bi-person-circle"></i>
                    Profile
                </a>
            </li>
            <li>
                <a href="#support">
                    <i class="bi bi-headset"></i>
                    Support
                </a>
            </li>
            <li>
                <a href="lenderlogout" class="text-danger">
                    <i class="bi bi-box-arrow-right"></i>
                    Logout
                </a>
            </li>
        </ul>
    </div>

    

    <!-- Bootstrap Bundle with Popper -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>