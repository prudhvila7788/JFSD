<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>EasyPay Sidebar</title>
    <!-- Font Awesome for icons -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            font-family: 'Arial', sans-serif;
        }

        .sidebar {
            width: 260px;
            height: 100vh;
            background: linear-gradient(135deg, #2c3e50, #3498db);
            color: #fff;
            position: fixed;
            top: 0;
            left: 0;
            padding: 30px 15px;
            overflow-y: auto;
            box-shadow: 4px 0 10px rgba(0,0,0,0.1);
            transition: width 0.3s ease;
        }

        .sidebar-logo {
            display: flex;
            align-items: center;
            justify-content: center;
            margin-bottom: 30px;
        }

        .sidebar-logo i {
            font-size: 2.5rem;
            margin-right: 10px;
            color: #fff;
        }

        .sidebar-logo h4 {
            color: #fff;
            font-size: 1.8rem;
            font-weight: bold;
        }

        .sidebar-menu {
            list-style-type: none;
        }

        .sidebar-menu li {
            margin-bottom: 10px;
        }

        .sidebar-menu a {
            display: flex;
            align-items: center;
            color: #e0e0e0;
            text-decoration: none;
            padding: 12px 15px;
            border-radius: 8px;
            transition: all 0.3s ease;
        }

        .sidebar-menu a i {
            margin-right: 12px;
            font-size: 1.2rem;
            width: 25px;
            text-align: center;
        }

        .sidebar-menu a:hover {
            background-color: rgba(255,255,255,0.1);
            color: #fff;
            transform: translateX(5px);
        }

        .sidebar-dropdown {
            position: relative;
        }

        .dropdown-toggle {
            cursor: pointer;
            display: flex;
            justify-content: space-between;
            align-items: center;
        }

        .dropdown-toggle::after {
            content: '\f107';
            font-family: 'Font Awesome 5 Free';
            font-weight: 900;
            transition: transform 0.3s ease;
        }

        .dropdown-toggle[aria-expanded="true"]::after {
            transform: rotate(180deg);
        }

        .dropdown-menu {
            background-color: rgba(0,0,0,0.1);
            border: none;
            border-radius: 8px;
            padding: 10px 0;
            margin: 5px 0;
        }

        .dropdown-menu a {
            padding: 10px 15px 10px 40px;
            color: #e0e0e0;
            transition: all 0.3s ease;
        }

        .dropdown-menu a:hover {
            background-color: rgba(255,255,255,0.2);
            color: #fff;
        }

        /* Responsive adjustments */
        @media (max-width: 768px) {
            .sidebar {
                width: 70px;
            }

            .sidebar-logo h4 {
                display: none;
            }

            .sidebar-menu a span {
                display: none;
            }
        }
    </style>
</head>
<body>
    <div class="sidebar">
        <div class="sidebar-logo">
            <i class="fas fa-money-check-alt"></i>
            <h4>EasyPay</h4>
        </div>

        <ul class="sidebar-menu">
            <li>
                <a href="userdashboard">
                    <i class="fas fa-tachometer-alt"></i>
                    <span>Dashboard</span>
                </a>
            </li>
            <li>
                <a href="loanrequest">
                    <i class="fas fa-hand-holding-usd"></i>
                    <span>Loan Request</span>
                </a>
            </li>
            <li>
                <a href="loanrequestuserid">
                    <i class="fas fa-list-alt"></i>
                    <span>Requested Loans</span>
                </a>
            </li>
            <li>
                <a href="viewloanamountbyid">
                    <i class="fas fa-file-invoice-dollar"></i>
                    <span>Sanctioned Loans</span>
                </a>
            </li>
            <li>
                <a href="userprofile">
                    <i class="fas fa-user-circle"></i>
                    <span>Profile</span>
                </a>
            </li>
            <li>
                <a href="#support">
                    <i class="fas fa-headset"></i>
                    <span>Support</span>
                </a>
            </li>
            <li class="sidebar-dropdown">
                <a class="dropdown-toggle" data-toggle="dropdown" aria-expanded="false">
                    <span>
                        <i class="fas fa-cog"></i>
                        Account
                    </span>
                </a>
                <div class="dropdown-menu">
                    <a href="#settings" class="dropdown-item">
                        <i class="fas fa-sliders-h"></i>
                        Settings
                    </a>
                    <a href="userlogout" class="dropdown-item">
                        <i class="fas fa-sign-out-alt"></i>
                        Logout
                    </a>
                </div>
            </li>
        </ul>
    </div>

    <!-- Optional: Bootstrap and Popper.js for dropdown functionality -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
</body>
</html>