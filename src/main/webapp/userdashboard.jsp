<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Borrower Dashboard</title>
    <!-- Bootstrap CSS -->
    <link href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
    <!-- Font Awesome for Icons -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
    <style>
        :root {
            --primary-color: #3498db;
            --secondary-color: #2ecc71;
            --dark-color: #2c3e50;
            --light-color: #ecf0f1;
        }

        body {
            background-color: var(--light-color);
            font-family: 'Arial', sans-serif;
        }

        .dashboard-container {
            display: flex;
            min-height: 100vh;
        }

        .sidebar {
            width: 260px;
            background: linear-gradient(135deg, var(--dark-color), #34495e);
            color: #fff;
            padding-top: 30px;
            position: fixed;
            height: 100vh;
            left: 0;
            top: 0;
            transition: all 0.3s ease;
            box-shadow: 2px 0 5px rgba(0,0,0,0.1);
        }

        .content {
            margin-left: 260px;
            padding: 30px;
            width: calc(100% - 260px);
            background-color: var(--light-color);
            transition: all 0.3s ease;
        }

        .dashboard-cards {
            display: flex;
            flex-wrap: wrap;
            gap: 20px;
        }

        .card-dashboard {
            flex: 1;
            min-width: 300px;
            background: white;
            border-radius: 10px;
            box-shadow: 0 10px 25px rgba(0,0,0,0.1);
            padding: 25px;
            transition: all 0.3s ease;
            border: none;
            display: flex;
            flex-direction: column;
            justify-content: space-between;
        }

        .card-dashboard:hover {
            transform: translateY(-10px);
            box-shadow: 0 15px 30px rgba(0,0,0,0.15);
        }

        .card-dashboard h5 {
            color: var(--dark-color);
            font-weight: bold;
            display: flex;
            align-items: center;
            margin-bottom: 15px;
        }

        .card-dashboard h5 i {
            margin-right: 15px;
            color: var(--primary-color);
            font-size: 1.5rem;
        }

        .card-dashboard p {
            color: #6c757d;
            margin-bottom: 20px;
        }

        .btn-custom {
            display: flex;
            align-items: center;
            justify-content: center;
            transition: all 0.3s ease;
        }

        .btn-custom i {
            margin-right: 10px;
        }

        .btn-custom:hover {
            transform: scale(1.05);
        }

        @media (max-width: 992px) {
            .sidebar {
                width: 70px;
            }

            .content {
                margin-left: 70px;
                width: calc(100% - 70px);
            }

            .dashboard-cards {
                flex-direction: column;
            }

            .card-dashboard {
                min-width: 100%;
            }
        }
    </style>
</head>
<body>
    <!-- Include the Navigation Bar -->
    <%@ include file="usernav.jsp" %>

    <div class="dashboard-container">
        <div class="content">
            <div class="dashboard-cards">
                <!-- Loan Requests Card -->
                <div class="card card-dashboard">
                    <div>
                        <h5><i class="fas fa-file-alt"></i>Loan Requests</h5>
                        <p>View and manage new loan applications from borrowers. Track, review, and process incoming loan requests efficiently.</p>
                    </div>
                    <a href="loanrequest" class="btn btn-primary btn-custom">
                        <i class="fas fa-plus-circle"></i>Loan Requests
                    </a>
                </div>

                <!-- Approved Loans Card -->
                <div class="card card-dashboard">
                    <div>
                        <h5><i class="fas fa-check-circle"></i>View Loan Request</h5>
                        <p>Review loans you have approved and track their status. Get comprehensive insights into your approved loan portfolio.</p>
                    </div>
                    <a href="loanrequestuserid" class="btn btn-success btn-custom">
                        <i class="fas fa-eye"></i>View Loan Request
                    </a>
                </div>

                <!-- Payment History Card -->
                <div class="card card-dashboard">
                    <div>
                        <h5><i class="fas fa-money-bill-wave"></i>Loans</h5>
                        <p>Sanction Loan Payments and manage your loan disbursements. Keep track of all sanctioned loans and their payment status.</p>
                    </div>
                    <a href="viewloanamountbyid" class="btn btn-warning btn-custom">
                        <i class="fas fa-list-alt"></i>Sanctioned Loans
                    </a>
                </div>
            </div>
        </div>
    </div>

    <!-- jQuery and Bootstrap JS -->
    <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.bundle.min.js"></script>
</body>
</html>