<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>User Profile</title>
    <script src="https://cdn.tailwindcss.com"></script>
    <style>
        body {
            background-color: #f3f4f6;
            font-family: 'Arial', sans-serif;
        }

        .profile-card {
            background: white;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
            border-radius: 8px;
            max-width: 900px;
            margin: auto;
        }

        .profile-card-header {
            background: #f0f8ff;
            border-bottom: 1px solid #e5e7eb;
            padding: 20px;
        }

        .section-header {
            font-size: 20px;
            font-weight: 600;
            color: #1e40af;
            margin-bottom: 10px;
        }

        .detail-row {
            display: flex;
            align-items: center;
            margin-bottom: 10px;
        }

        .detail-label {
            font-weight: 600;
            color: #6b7280;
            width: 120px;
        }

        .detail-value {
            color: #1f2937;
        }

        .image-container {
            display: flex;
            flex-direction: column;
            align-items: center;
        }

        .image-container h3 {
            font-size: 18px;
            font-weight: 600;
            color: #1e40af;
            margin-bottom: 10px;
        }

        .image-container img {
            border-radius: 8px;
            max-width: 100%;
            height: auto;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
        }
    </style>
</head>

<body>
    <div class="flex">
        <%@ include file="usernav.jsp" %>
        <!-- Profile Content -->
        <main class="flex-1 p-8">
            <div class="profile-card">
                <div class="profile-card-header">
                    <h1 class="text-2xl font-bold text-blue-800">More Details</h1>
                </div>

                <!-- Personal Information -->
                <div class="p-6 grid grid-cols-1 md:grid-cols-2 gap-6">
                    <div>
                        <h2 class="section-header">Personal Information</h2>
                        <div class="detail-row">
                            <span class="detail-label">User ID:</span>
                            <span class="detail-value"><c:out value="${details.userId}" /></span>
                        </div>
                        <div class="detail-row">
                            <span class="detail-label">Email:</span>
                            <span class="detail-value"><c:out value="${details.email}" /></span>
                        </div>
                        <div class="detail-row">
                            <span class="detail-label">Phone:</span>
                            <span class="detail-value"><c:out value="${details.phoneNumber}" /></span>
                        </div>
                        <div class="detail-row">
                            <span class="detail-label">Address:</span>
                            <span class="detail-value"><c:out value="${details.address}" /></span>
                        </div>
                    </div>

                    <!-- Financial Information -->
                    <div>
                        <h2 class="section-header">Financial Details</h2>
                        <div class="detail-row">
                            <span class="detail-label">Bank Account:</span>
                            <span class="detail-value"><c:out value="${details.bankAccountNumber}" /></span>
                        </div>
                        <div class="detail-row">
                            <span class="detail-label">Branch Name:</span>
                            <span class="detail-value"><c:out value="${details.branchName}" /></span>
                        </div>
                        <div class="detail-row">
                            <span class="detail-label">IFSC Code:</span>
                            <span class="detail-value"><c:out value="${details.ifscCode}" /></span>
                        </div>
                    </div>
                </div>

                <!-- Images -->
                <div class="p-6 grid md:grid-cols-2 gap-6">
                    <div class="image-container">
                        <h3>Adhar Image</h3>
                        <img src="/displayUserAdharImages?userId=<c:out value='${details.userId}' />" alt="Adhar Image">
                    </div>
                    <div class="image-container">
                        <h3>Nominee Adhar Image</h3>
                        <img src="/displayNomineeAdharImages?userId=<c:out value='${details.userId}' />" alt="Nominee Adhar Image">
                    </div>
                </div>

                <!-- Nominee Information -->
                <div class="p-6">
                    <h2 class="section-header">Nominee Information</h2>
                    <div class="detail-row">
                        <span class="detail-label">Nominee Name:</span>
                        <span class="detail-value"><c:out value="${details.nomineeName}" /></span>
                    </div>
                    <div class="detail-row">
                        <span class="detail-label">Nominee Phone:</span>
                        <span class="detail-value"><c:out value="${details.nomineePhoneNumber}" /></span>
                    </div>
                    <div class="detail-row">
                        <span class="detail-label">Nominee Address:</span>
                        <span class="detail-value"><c:out value="${details.nomineeAddress}" /></span>
                    </div>
                    <div class="detail-row">
                        <span class="detail-label">Relationship:</span>
                        <span class="detail-value"><c:out value="${details.nomineeRelationship}" /></span>
                    </div>
                </div>
            </div>
        </main>
    </div>
</body>

</html>
