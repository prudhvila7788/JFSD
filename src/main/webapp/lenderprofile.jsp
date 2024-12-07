<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ include file="lendernav.jsp" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>My Profile</title>
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700&display=swap" rel="stylesheet">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css" rel="stylesheet">
    <style>
        :root {
            --primary-color: #4a90e2;
            --secondary-color: #2ecc71;
            --accent-color: #3498db;
            --text-color: #333;
            --background-color: #f0f4f8;
            --card-background: #ffffff;
            --border-radius: 20px;
            --shadow: 0 15px 35px rgba(0,0,0,0.1);
        }

        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            font-family: 'Poppins', Arial, sans-serif;
            background-color: var(--background-color);
            line-height: 1.6;
            display: flex;
            justify-content: center;
            align-items: center;
            min-height: 100vh;
            perspective: 1000px;
        }

        .profile-container {
            width: 100%;
            max-width: 1100px;
            background-color: var(--card-background);
            border-radius: var(--border-radius);
            box-shadow: var(--shadow);
            overflow: hidden;
            transition: all 0.4s ease-in-out;
            transform-style: preserve-3d;
            will-change: transform;
        }

        .profile-container:hover {
            transform: rotateX(5deg) rotateY(-5deg) scale(1.02);
            box-shadow: 0 20px 40px rgba(0,0,0,0.12);
        }

        .profile-header {
            background: linear-gradient(135deg, var(--primary-color), var(--accent-color));
            color: white;
            padding: 2.5rem;
            text-align: center;
            position: relative;
            overflow: hidden;
        }

        .profile-header::before {
            content: '';
            position: absolute;
            top: -50%;
            left: -50%;
            width: 200%;
            height: 200%;
            background: rgba(255,255,255,0.1);
            transform: rotate(-45deg);
            z-index: 1;
        }

        .profile-header h1 {
            font-size: 2.8rem;
            font-weight: 700;
            margin-bottom: 0.7rem;
            letter-spacing: -1.5px;
            position: relative;
            z-index: 2;
        }

        .profile-header p {
            font-size: 1.1rem;
            opacity: 0.85;
            position: relative;
            z-index: 2;
        }

        .profile-details {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(220px, 1fr));
            gap: 1.8rem;
            padding: 3rem;
            background-color: var(--card-background);
        }

        .profile-details > div {
            background-color: #f9f9f9;
            padding: 1.5rem;
            border-radius: 15px;
            display: flex;
            flex-direction: column;
            justify-content: center;
            transition: all 0.3s ease;
            border: 2px solid transparent;
            position: relative;
            overflow: hidden;
        }

        .profile-details > div::before {
            content: '';
            position: absolute;
            top: 0;
            left: 0;
            width: 0;
            height: 100%;
            background-color: var(--primary-color);
            opacity: 0.05;
            transition: width 0.3s ease;
        }

        .profile-details > div:hover::before {
            width: 100%;
        }

        .profile-details > div:hover {
            transform: translateY(-10px);
            border-color: var(--primary-color);
            box-shadow: 0 10px 20px rgba(74,144,226,0.1);
        }

        .profile-label {
            font-weight: 600;
            color: var(--accent-color);
            margin-bottom: 0.5rem;
            font-size: 0.9rem;
            text-transform: uppercase;
            letter-spacing: 1px;
            display: flex;
            align-items: center;
        }

        .profile-label i {
            margin-right: 10px;
            color: var(--primary-color);
        }

        .profile-value {
            font-weight: 500;
            color: var(--text-color);
            font-size: 1.2rem;
            transition: color 0.3s ease;
        }

        .verification-status {
            display: inline-flex;
            align-items: center;
        }

        .verification-status i {
            margin-right: 8px;
        }

        @media screen and (max-width: 768px) {
            .profile-details {
                grid-template-columns: repeat(2, 1fr);
                padding: 2rem;
            }

            .profile-header h1 {
                font-size: 2.3rem;
            }
        }

        @media screen and (max-width: 480px) {
            .profile-details {
                grid-template-columns: 1fr;
                padding: 1.5rem;
            }

            .profile-header h1 {
                font-size: 2rem;
            }
        }
    </style>
</head>
<body>
    <div class="profile-container">
        <div class="profile-header">
            <h1>Lender Profile</h1>
            <p>Your Personal Information at a Glance</p>
        </div>

        <div class="profile-details">
            <div>
                <span class="profile-label"><i class="fas fa-user"></i>Name</span>
                <span class="profile-value">${lender.name}</span>
            </div>
    
            <div>
                <span class="profile-label"><i class="fas fa-envelope"></i>Email</span>
                <span class="profile-value">${lender.email}</span>
            </div>

            <div>
                <span class="profile-label"><i class="fas fa-phone"></i>Mobile Number</span>
                <span class="profile-value">${lender.phonenumber}</span>
            </div>

            <div>
                <span class="profile-label"><i class="fas fa-briefcase"></i>Business Type</span>
                <span class="profile-value">${lender.bussinessType}</span>
            </div>

            <div>
                <span class="profile-label"><i class="fas fa-check-circle"></i>Verification Status</span>
                <span class="profile-value">
                    <c:choose>
                        <c:when test="${lender.verified}">
                            <span class="verification-status" style="color: var(--secondary-color);">
                                <i class="fas fa-check-circle"></i>Verified
                            </span>
                        </c:when>
                        <c:otherwise>
                            <span class="verification-status" style="color: #ff4d4d;">
                                <i class="fas fa-times-circle"></i>Not Verified
                            </span>
                        </c:otherwise>
                    </c:choose>
                </span>
            </div>
        </div>
    </div>
</body>
</html>