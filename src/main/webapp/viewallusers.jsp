<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<%@ include file="adminsidebar.jsp" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>View All Users</title>
    <!-- Font Awesome CDN -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
    <style>
        /* Google Fonts Import */
        @import url('https://fonts.googleapis.com/css2?family=Roboto:wght@300;400;600&display=swap');

        /* Reset and Base Styles */
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            font-family: 'Roboto', sans-serif;
            background-color: #f0f2f5;
            color: #333;
            line-height: 1.6;
        }

        /* Container Styles */
        .container {
            width: 95%;
            max-width: 1600px;
            margin: 30px auto;
            padding: 20px;
            background-color: white;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
            border-radius: 8px;
        }

        /* Heading Styles */
        h3 {
            text-align: center;
            font-size: 2rem;
            color: #2c3e50;
            margin-bottom: 30px;
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
            background-color: #3498db;
        }

        /* Table Styles */
        .users-table {
            width: 100%;
            border-collapse: separate;
            border-spacing: 0;
            box-shadow: 0 5px 15px rgba(0, 0, 0, 0.05);
        }

        .users-table thead {
            background-color: #3498db;
            color: white;
        }

        .users-table th, .users-table td {
            padding: 15px;
            text-align: left;
            border-bottom: 1px solid #e0e0e0;
            transition: background-color 0.3s ease;
        }

        .users-table th {
            text-transform: uppercase;
            letter-spacing: 1px;
            font-weight: 600;
        }

        .users-table tr:nth-child(even) {
            background-color: #f9f9f9;
        }

        .users-table tr:hover {
            background-color: #f1f6ff;
        }

        /* Action Button Styles */
        .btn {
            display: inline-flex;
            align-items: center;
            justify-content: center;
            padding: 8px 15px;
            border-radius: 4px;
            text-decoration: none;
            font-weight: 500;
            transition: all 0.3s ease;
        }

        .btn-success {
            background-color: #2ecc71;
            color: white;
        }

        .btn-danger {
            background-color: #e74c3c;
            color: white;
        }

        .btn:hover {
            opacity: 0.9;
            transform: translateY(-2px);
        }

        /* Status Badge Styles */
        .badge {
            padding: 5px 10px;
            border-radius: 20px;
            font-size: 0.8rem;
            font-weight: 600;
        }

        .badge-success {
            background-color: #2ecc71;
            color: white;
        }

        .badge-danger {
            background-color: #e74c3c;
            color: white;
        }

        /* Responsive Adjustments */
        @media (max-width: 768px) {
            .users-table {
                font-size: 0.9rem;
            }

            .users-table th, .users-table td {
                padding: 10px;
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
                margin-bottom: 10px;
                border: 1px solid #ddd;
                position: relative;
            }

            .users-table td {
                text-align: right;
                border-bottom: 1px solid #ddd;
                padding-left: 50%;
                position: relative;
            }

            .users-table td::before {
                content: attr(data-label);
                position: absolute;
                left: 10px;
                width: 45%;
                padding-right: 10px;
                white-space: nowrap;
                text-align: left;
                font-weight: bold;
            }
        }
    </style>
</head>
<body>
    <div class="container">
        <h3><i class="fas fa-users"></i> User Management</h3>
        
        <table class="users-table">
            <thead>
                <tr>
                    <th>ID</th>
                    <th>Name</th>
                    <th>Gender</th>
                    <th>Date of Birth</th>
                    <th>Email</th>
                    <th>Phone Number</th>
                    <th>Verification Status</th>
                    <th>Actions</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach items="${userlist}" var="user">
                    <tr>
                        <td data-label="ID"><c:out value="${user.id}"/></td>
                        <td data-label="Name">
                            <i class="fas fa-user"></i> 
                            <c:out value="${user.name}"/>
                        </td>
                        <td data-label="Gender">
                            <i class="fas fa-venus-mars"></i> 
                            <c:out value="${user.gender}"/>
                        </td>
                        <td data-label="Date of Birth">
                            <i class="fas fa-calendar"></i> 
                            <c:out value="${user.dateofbirth}"/>
                        </td>
                        <td data-label="Email">
                            <i class="fas fa-envelope"></i> 
                            <c:out value="${user.email}"/>
                        </td>
                        <td data-label="Phone Number">
                            <i class="fas fa-phone"></i> 
                            <c:out value="${user.phonenumber}"/>
                        </td>
                        <td data-label="Verification Status">
                            <c:choose>
                                <c:when test="${user.verified}">
                                    <span class="badge badge-success">
                                        <i class="fas fa-check-circle"></i> Verified
                                    </span>
                                </c:when>
                                <c:otherwise>
                                    <span class="badge badge-danger">
                                        <i class="fas fa-times-circle"></i> Not Verified
                                    </span>
                                </c:otherwise>
                            </c:choose>
                        </td>
                        <td data-label="Actions">
                            <c:if test="${!user.verified}">
                                <a href="verifyuser?id=${user.id}" class="btn btn-success">
                                    <i class="fas fa-user-check"></i> Verify
                                </a>
                            </c:if>
                            <a href="deleteuser?id=${user.id}" class="btn btn-danger" 
                               onclick="return confirm('Are you sure you want to delete this user?');">
                                <i class="fas fa-trash-alt"></i> Delete
                            </a>
                        </td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
    </div>
</body>
</html>