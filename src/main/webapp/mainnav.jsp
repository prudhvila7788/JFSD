<!-- mainnav.jsp -->
<link rel="stylesheet" href="assets/css/easilon.css" />
<nav class="main-header__nav">
    <ul class="main-menu__list">
        <!-- Logo -->
        <li class="logo">
            <a href="/">
                <img src="assets/images/logo-dark.png" alt="Easy Loans Logo" style="height: 50px;">
            </a>
        </li>

        <!-- Navigation Links -->
        <li>
            <a href="/">Home</a>
        </li>
        <li>
            <a href="about.jsp">About Us</a>
        </li>
        <li class="dropdown">
            <a href="#">Logins</a>
            <ul class="dropdown-menu">
                <li><a href="userlogin">User Login</a></li>
                <li><a href="adminlogin">Admin Login</a></li>
                <li><a href="lenderlogin">Lender Login</a></li>
            </ul>
        </li>
        <li>
            <a href="contact.jsp">Contact Us</a>
        </li>
    </ul>
</nav>

<style>
/* General Navbar Styling */
.main-header__nav {
    background-color: #007bff; /* Blue background */
    padding: 10px 20px;
    display: flex;
    align-items: center;
    justify-content: space-between;
    box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1); /* Add slight shadow */
    position: sticky; /* Sticky positioning for the navbar */
    top: 0;
    z-index: 1000;
}

/* Navbar Menu List */
.main-menu__list {
    list-style: none;
    display: flex;
    align-items: center;
    margin: 0;
    padding: 0;
}

.main-menu__list > li {
    margin: 0 15px;
    position: relative; /* For dropdown positioning */
}

/* Logo Styling */
.logo img {
    display: inline-block;
    vertical-align: middle;
    height: 50px;
}

/* Links Styling */
.main-menu__list a {
    text-decoration: none;
    color: white;
    font-weight: bold;
    padding: 10px 15px;
    transition: background-color 0.3s, color 0.3s;
    border-radius: 5px;
}

.main-menu__list a:hover {
    background-color: #0056b3;
}

/* Dropdown Menu Styling */
.dropdown .dropdown-menu {
    display: none;
    position: absolute;
    top: 100%; /* Position below the parent */
    left: 0;
    background-color: #007bff;
    list-style: none;
    padding: 0;
    margin: 0;
    border-radius: 5px;
    box-shadow: 0 4px 10px rgba(0, 0, 0, 0.2);
    z-index: 1000; /* Ensure it's above other elements */
}

.dropdown:hover .dropdown-menu {
    display: block; /* Show dropdown on hover */
}

.dropdown-menu li {
    margin: 0;
}

.dropdown-menu li a {
    display: block;
    padding: 10px 20px;
    color: white;
    white-space: nowrap; /* Prevent text from wrapping */
}

.dropdown-menu li a:hover {
    background-color: #0056b3;
}
</style>
