<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admin Portal - Employee Registration</title>
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@300;400;500;700&display=swap" rel="stylesheet">
    <style>
        :root {
            --primary-color: #1976d2;
            --secondary-color: #f5f5f5;
            --accent-color: #ff9800;
            --text-primary: #212121;
            --text-secondary: #757575;
            --error-color: #d32f2f;
            --success-color: #388e3c;
        }
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: 'Roboto', sans-serif;
        }
        body {
            background-color: #f5f7fa;
            color: var(--text-primary);
        }
        .header {
            background-color: var(--primary-color);
            color: white;
            padding: 1rem 2rem;
            display: flex;
            justify-content: space-between;
            align-items: center;
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
        }
        .header-title {
            display: flex;
            align-items: center;
            gap: 10px;
        }
        .header-actions {
            display: flex;
            gap: 15px;
        }
        .header-actions a {
            color: white;
            text-decoration: none;
            display: flex;
            align-items: center;
            gap: 5px;
        }
        .container {
            max-width: 1200px; 
            margin: 2rem auto;
            padding: 0 1rem;
        }
        .auth-container {
            display: flex;
            min-height: 70vh; 
            border-radius: 8px;
            overflow: hidden;
            box-shadow: 0 4px 12px rgba(0, 0, 0, 0.1);
            margin-bottom: 2rem; 
        }
        .auth-image {
            flex: 1;
            background: linear-gradient(rgba(25, 118, 210, 0.85), rgba(25, 118, 210, 0.85)), 
                        url('https://images.unsplash.com/photo-1551434678-e076c223a692?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1470&q=80') center/cover no-repeat;
            color: white;
            padding: 3rem; 
            display: flex;
            flex-direction: column;
            justify-content: center;
        }
        .auth-image h2 {
            font-size: 2.2rem; 
            margin-bottom: 1.5rem;
            font-weight: 700;
        }
        .auth-image p {
            font-size: 1.05rem; 
            line-height: 1.7;
            margin-bottom: 2.5rem;
        }
        .auth-features {
            list-style: none;
        }
        .auth-features li {
            margin-bottom: 1.2rem; 
            display: flex;
            align-items: center;
            gap: 12px; 
            font-size: 1rem;
        }
         .auth-features li .material-icons {
            color: var(--accent-color); 
         }
        .auth-form-container {
            flex: 1.2; 
            background-color: white;
            padding: 2.5rem 3rem; 
            display: flex;
            flex-direction: column;
            justify-content: center;
        }
        .auth-topic {
            font-size: 1.8rem;
            color: var(--primary-color);
            margin-bottom: 1.5rem; 
            text-align: center;
            font-weight: 600;
        }
        .auth-form {
            display: flex; /* Changed from grid to flex for single column */
            flex-direction: column;
            gap: 1.2rem; 
        }
        .form-group {
            display: flex;
            flex-direction: column;
            gap: 0.3rem; 
        }
        .form-label {
            font-size: 0.9rem;
            color: var(--text-secondary);
            display: flex;
            align-items: center;
            gap: 6px; 
            font-weight: 500;
        }
        .form-input {
            padding: 0.8rem 1rem;
            border: 1px solid #ddd;
            border-radius: 4px;
            font-size: 1rem;
            transition: all 0.3s;
            width: 100%; 
        }
        .form-input:focus {
            outline: none;
            border-color: var(--primary-color);
            box-shadow: 0 0 0 2px rgba(25, 118, 210, 0.2);
        }
        .form-input.error {
            border-color: var(--error-color);
            background-color: #fff7f7; 
        }
        .error-message {
            color: var(--error-color);
            font-size: 0.8rem;
            margin-top: 0.1rem; 
            display: none; 
        }
        .phone-input-container {
            display: flex;
            gap: 10px;
        }
        .country-code {
            flex: 0 0 100px; 
        }
        .phone-number {
            flex: 1;
        }
        .auth-btn {
            background-color: var(--primary-color);
            color: white;
            border: none;
            padding: 0.9rem; 
            border-radius: 4px;
            font-size: 1rem;
            font-weight: 500;
            cursor: pointer;
            transition: background-color 0.3s;
            display: flex;
            align-items: center;
            justify-content: center;
            gap: 8px;
            margin-top: 0.5rem; 
        }
        .auth-btn:hover {
            background-color: #1565c0;
        }
        .footer {
            background-color: var(--primary-color);
            color: white;
            text-align: center;
            padding: 1.5rem;
            font-size: 0.9rem;
            width: 100%; 
        }
        html, body {
            height: 100%;
        }
        body {
            display: flex;
            flex-direction: column;
        }
        .container {
            flex: 1 0 auto; 
        }
        @media (max-width: 992px) { 
            .auth-image {
                display: none; 
            }
            .auth-form-container {
                flex: 1 1 100%; 
                padding: 2rem;
            }
            .auth-container{
                min-height: auto; 
                flex-direction: column;
            }
        }
        @media (max-width: 768px) {
             .header-actions {
                gap: 10px; 
            }
            .header-actions a span {
                display: none; 
            }
             .header-actions a .material-icons {
                font-size: 1.8rem; 
            }
             .auth-form-container {
                padding: 1.5rem;
            }
             .auth-topic {
                font-size: 1.5rem;
             }
        }
    </style>
</head>
<body>
    <header class="header">
        <div class="header-title">
            <i class="material-icons">admin_panel_settings</i>
            <h1>Admin Portal</h1>
        </div>
        <div class="header-actions">
            <a href="../dashboard.jsp">
                <i class="material-icons">dashboard</i>
                <span>Dashboard</span>
            </a>
            <a href="http://localhost:8090/Admin/validateUser">
                <i class="material-icons">people</i>
                <span>Customers</span>
            </a>
        </div>
    </header>
    <div class="container">
        <div class="auth-container">
            <div class="auth-image">
                <h2>Employee Onboarding</h2>
                <p>Add new members to your team. Capture their essential information to integrate them smoothly into the organization.</p>
                <ul class="auth-features">
                    <li><i class="material-icons">check_circle</i> Basic Profile Creation</li>
                    <li><i class="material-icons">check_circle</i> Contact Information Storage</li>
                    <li><i class="material-icons">check_circle</i> User Account Setup</li>
                    <li><i class="material-icons">check_circle</i> HR Record Foundation</li>
                </ul>
            </div>
            <div class="auth-form-container">
                <h1 class="auth-topic">Register New Employee</h1>
                <form class="auth-form" action="CustomerInsert" method="post" id="registrationForm">
                    <div class="form-group">
                        <label for="fullname" class="form-label"><i class="material-icons">person_outline</i>Full Name</label>
                        <input type="text" id="fullname" name="fullname" required class="form-input" placeholder="e.g., Jane Smith">
                        <span class="error-message" id="fullname-error">Full name cannot be empty.</span>
                    </div>
                    <div class="form-group">
                        <label for="username" class="form-label"><i class="material-icons">account_circle</i>Username</label>
                        <input type="text" id="username" name="username" required class="form-input" placeholder="Unique login username">
                        <span class="error-message" id="username-error">Username must be 4-20 characters.</span>
                    </div>
                    <div class="form-group">
                        <label for="nic" class="form-label"><i class="material-icons">fingerprint</i>NIC Number</label>
                        <input type="text" id="nic" name="nic" required class="form-input" placeholder="12 digits or 9 digits + V/X" maxlength="12">
                        <span class="error-message" id="nic-error">Enter a valid NIC.</span>
                    </div>
                    <div class="form-group">
                        <label for="email" class="form-label"><i class="material-icons">email_outline</i>Work Email</label>
                        <input type="email" id="email" name="email" required class="form-input" placeholder="e.g., employee@company.com">
                        <span class="error-message" id="email-error">Please enter a valid email.</span>
                    </div>
                    <div class="form-group">
                        <label class="form-label"><i class="material-icons">phone_iphone</i>Phone Number</label>
                        <div class="phone-input-container">
                            <select id="countryCode" name="countryCode" class="form-input country-code">
                                <option value="+94">+94 (LK)</option>
                                <option value="+1">+1 (US)</option>
                                <option value="+44">+44 (UK)</option>
                                <option value="+91">+91 (IN)</option>
                            </select>
                            <input type="text" id="phone" name="phone" required class="form-input phone-number" placeholder="9-digit number" maxlength="9">
                        </div>
                        <span class="error-message" id="phone-error">Enter a valid 9-digit phone number.</span>
                    </div>
                    <div class="form-group">
                        <label for="address" class="form-label"><i class="material-icons">location_on_outline</i>Address</label>
                        <textarea id="address" name="address" required class="form-input" rows="3" placeholder="Employee's residential address"></textarea>
                        <span class="error-message" id="address-error">Address cannot be empty.</span>
                    </div>
                    <button type="submit" class="auth-btn">
                        <i class="material-icons">person_add</i>
                        Register Employee
                    </button>
                </form>
            </div>
        </div>
    </div>
    <footer class="footer">
        <p>&copy; <span id="currentYear"></span> Admin Portal. All rights reserved.</p>
    </footer>
    <script>
        document.addEventListener('DOMContentLoaded', function () {
            const registrationForm = document.getElementById('registrationForm');
            if (registrationForm) {
                registrationForm.addEventListener('submit', function(event) {
                    let isValid = true;
                    function showError(inputId, message) {
                        document.getElementById(inputId + '-error').textContent = message;
                        document.getElementById(inputId + '-error').style.display = 'block';
                        document.getElementById(inputId).classList.add('error');
                        isValid = false;
                    }
                    function clearError(inputId) {
                        const errorEl = document.getElementById(inputId + '-error');
                        if(errorEl) errorEl.style.display = 'none';
                        const inputEl = document.getElementById(inputId);
                        if(inputEl) inputEl.classList.remove('error');
                    }
                    ['fullname', 'username', 'nic', 'email', 'phone', 'address'].forEach(clearError);

                    const fullname = document.getElementById('fullname').value.trim();
                    if (fullname === '') showError('fullname', 'Full name cannot be empty.');

                    const username = document.getElementById('username').value.trim();
                    if (username.length < 4 || username.length > 20) showError('username', 'Username must be 4-20 characters long.');
               
                    const nic = document.getElementById('nic').value.trim().toUpperCase();
                    if (!(/^(\d{12}|\d{9}[VX])$/.test(nic))) showError('nic', 'NIC must be 12 digits or 9 digits followed by V or X.');

                    const email = document.getElementById('email').value.trim();
                    if (!/^[^\s@]+@[^\s@]+\.[^\s@]+$/.test(email)) showError('email', 'Please enter a valid email address.');

                    const phone = document.getElementById('phone').value.trim();
                    if (!/^\d{9}$/.test(phone)) showError('phone', 'Please enter a valid 9-digit phone number.');

                    const address = document.getElementById('address').value.trim();
                    if (address === '') showError('address', 'Address cannot be empty.');
                  
                    if (!isValid) {
                        event.preventDefault(); 
                    }
                });
            }

            const nicInput = document.getElementById('nic');
            if (nicInput) {
                nicInput.addEventListener('input', function() {
                    this.value = this.value.toUpperCase(); 
                    if (this.value.length > 12) this.value = this.value.substring(0, 12);
                });
            }
            const phoneInput = document.getElementById('phone');
            if (phoneInput) {
                phoneInput.addEventListener('input', function() {
                    this.value = this.value.replace(/\D/g, ''); 
                    if (this.value.length > 9) this.value = this.value.substring(0, 9);
                });
            }
            const currentYearSpan = document.getElementById('currentYear');
            if (currentYearSpan) currentYearSpan.textContent = new Date().getFullYear();
        });
    </script>
    <% String message = (String) request.getAttribute("message"); %>
    <% if (message != null && !message.isEmpty()) { %>
    <script>
        alert("<%= message.replace("\"", "\\\"").replace("\n", "\\n").replace("\r", "\\r") %>"); 
    </script>
    <% } %>
</body>
</html>