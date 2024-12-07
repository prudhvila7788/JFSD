<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<%@ include file="adminsidebar.jsp" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>View All Users</title>
    <!-- Font Awesome for icons -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
    <style>
        /* Modern color palette and typography */
        :root {
            --primary-color: #3498db;
            --secondary-color: #2ecc71;
            --danger-color: #e74c3c;
            --text-color: #2c3e50;
            --background-color: #f7f9fc;
        }

        body {
            font-family: 'Inter', 'Segoe UI', Roboto, sans-serif;
            background-color: var(--background-color);
            margin: 0;
            padding: 20px;
            color: var(--text-color);
            line-height: 1.6;
        }

        h3 {
            text-align: center;
            font-size: 2rem;
            color: var(--text-color);
            margin-bottom: 30px;
            font-weight: 700;
            position: relative;
            padding-bottom: 10px;
        }

        h3::after {
            content: '';
            position: absolute;
            bottom: 0;
            left: 50%;
            transform: translateX(-50%);
            width: 100px;
            height: 3px;
            background-color: var(--primary-color);
        }

        /* Enhanced Table Styling */
        .users-table {
            width: 100%;
            max-width: 1500px;
            margin: 0 auto;
            border-radius: 10px;
            overflow: hidden;
            box-shadow: 0 10px 20px rgba(0, 0, 0, 0.1);
            background-color: white;
        }

        .users-table thead {
            background-color: var(--primary-color);
            color: white;
        }

        .users-table th, .users-table td {
            padding: 15px;
            text-align: left;
            border-bottom: 1px solid #e9ecef;
            transition: background-color 0.3s ease;
        }

        .users-table th {
            text-transform: uppercase;
            letter-spacing: 1px;
            font-weight: 600;
        }

        .users-table tr:hover {
            background-color: rgba(46, 204, 113, 0.05);
        }

        /* Action Buttons */
        .action-btn {
            display: inline-flex;
            align-items: center;
            justify-content: center;
            padding: 8px 15px;
            border-radius: 5px;
            text-decoration: none;
            font-weight: 500;
            transition: all 0.3s ease;
        }

        .btn-verify {
            background-color: var(--secondary-color);
            color: white;
        }

        .btn-verify:hover {
            background-color: #27ae60;
        }

        .btn-delete {
            background-color: var(--danger-color);
            color: white;
        }

        .btn-delete:hover {
            background-color: #c0392b;
        }

        .action-btn i {
            margin-right: 8px;
        }

        /* Status Badges */
        .badge {
            padding: 5px 10px;
            border-radius: 20px;
            font-size: 0.8rem;
            font-weight: 600;
            text-transform: uppercase;
        }

        .badge-success {
            background-color: rgba(46, 204, 113, 0.2);
            color: #27ae60;
        }

        .badge-danger {
            background-color: rgba(231, 76, 60, 0.2);
            color: #c0392b;
        }

        /* Responsive Adjustments */
        @media (max-width: 768px) {
            .users-table {
                border-radius: 0;
            }

            .users-table th, .users-table td {
                padding: 12px;
            }
        }

        @media (max-width: 480px) {
            .users-table, .users-table tbody, .users-table tr, .users-table td {
                display: block;
                width: 100%;
            }

            .users-table thead {
                display: none;
            }

            .users-table tr {
                margin-bottom: 15px;
                border: 1px solid #e9ecef;
                border-radius: 5px;
                overflow: hidden;
            }

            .users-table td {
                display: flex;
                justify-content: space-between;
                align-items: center;
                border-bottom: 1px solid #f1f3f5;
            }

            .users-table td::before {
                content: attr(data-label);
                font-weight: 600;
                text-transform: uppercase;
                color: var(--text-color);
            }
        }
    </style>
</head>
<body>
    <h3>View All Users</h3>
    
    <table class="users-table">
        <thead>
            <tr>
                <th>ID</th>
                <th>Name</th>
                <th>Email</th>
                <th>Phone Number</th>
                <th>Business Type</th>
                <th>Verification Status</th>
                <th>Actions</th>
            </tr>
        </thead>
        <tbody>
            <c:forEach items="${lenderlist}" var="lender">
                <tr>
                    <td data-label="ID"><c:out value="${lender.id}"/></td>
                    <td data-label="Name"><i class="fas fa-user"></i> <c:out value="${lender.name}"/></td>
                    <td data-label="Email"><i class="fas fa-envelope"></i> <c:out value="${lender.email}"/></td>
                    <td data-label="Phone Number"><i class="fas fa-phone"></i> <c:out value="${lender.phonenumber}"/></td>
                    <td data-label="Business Type"><i class="fas fa-briefcase"></i> <c:out value="${lender.bussinessType}"/></td>
                    <td data-label="Verification Status">
                        <c:choose>
                            <c:when test="${lender.verified}">
                                <span class="badge badge-success"><i class="fas fa-check-circle"></i> Verified</span>
                            </c:when>
                            <c:otherwise>
                                <span class="badge badge-danger"><i class="fas fa-times-circle"></i> Not Verified</span>
                            </c:otherwise>
                        </c:choose>
                    </td>
                    <td data-label="Actions">
                        <c:if test="${!lender.verified}">
                            <a href="verifylender?id=${lender.id}" class="action-btn btn-verify" 
                               onclick="return confirm('Verify this user?');">
                                <i class="fas fa-user-check"></i> Verify
                            </a>
                        </c:if>
                        <a href="deletelender?id=${lender.id}" class="action-btn btn-delete" 
                           onclick="return confirm('Are you sure you want to delete this user?');">
                            <i class="fas fa-trash-alt"></i> Delete
                        </a>
                    </td>
                </tr>
            </c:forEach>
        </tbody>
    </table>
</body>
</html>