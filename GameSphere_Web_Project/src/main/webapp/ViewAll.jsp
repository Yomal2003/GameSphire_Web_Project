<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="net.webapp.model.Customer" %>
<%!
    // Helper function to escape strings for JavaScript, place this in a utility class or import if available
    // This is a simplified version. For production, use a library like Apache Commons Text StringEscapeUtils.escapeEcmaScript().
    public String escapeForJavaScript(String s) {
        if (s == null) {
            return "";
        }
        return s.replace("\\", "\\\\")
                .replace("'", "\\'")
                .replace("\"", "\\\"")
                .replace("\n", "\\n")
                .replace("\r", "\\r")
                .replace("\t", "\\t")
                .replace("\b", "\\b")
                .replace("\f", "\\f");
    }
%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admin Portal - Customer Management</title>
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@300;400;500;700&display=swap" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        :root {
            --primary-color: #1976d2; /* Blue */
            --secondary-color: #f5f5f5;
            --accent-color: #ff9800; /* Orange */
            --success-color: #388e3c; /* Green */
            --error-color: #d32f2f; /* Red */
            --info-color: #0288d1; /* Light Blue */
            --text-primary: #212121;
            --text-secondary: #757575;
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
            display: flex;
            flex-direction: column;
            min-height: 100vh;
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
            font-size: 1.5rem; 
        }
        
        .header-actions {
            display: flex;
            gap: 20px; 
        }
        
        .header-actions a {
            color: white;
            text-decoration: none;
            display: flex;
            align-items: center;
            gap: 8px; 
            font-size: 0.95rem; 
            padding: 0.5rem 0.75rem; 
            border-radius: 4px;
            transition: background-color 0.2s ease-in-out;
        }

        .header-actions a:hover {
            background-color: rgba(255, 255, 255, 0.15); 
        }
        
        .main-container { 
            flex: 1;
            max-width: 1300px; 
            margin: 2rem auto;
            padding: 0 1.5rem; 
            width: 100%;
        }
        
        .page-title {
            font-size: 2rem;
            color: var(--primary-color);
            margin-bottom: 1.5rem;
            text-align: center;
            display: flex;
            align-items: center;
            justify-content: center;
            gap: 10px;
        }

        /* Style for the reinstated View All button's form */
        .view-all-form {
            text-align: center; /* Centers the button within the form */
            margin-bottom: 1.5rem; /* Space below the button */
        }
        
        .view-all-btn { 
            background-color: var(--primary-color);
            color: white;
            border: none;
            padding: 0.7rem 1.2rem; 
            border-radius: 5px; 
            font-size: 0.95rem; 
            font-weight: 500;
            cursor: pointer;
            transition: background-color 0.3s;
            display: inline-flex;
            align-items: center;
            justify-content: center;
            gap: 8px;
            text-decoration: none; 
        }
        
        .view-all-btn:hover {
            background-color: #1565c0; 
        }
        
        .customer-table {
            width: 100%;
            border-collapse: collapse;
            background-color: white;
            box-shadow: 0 4px 12px rgba(0, 0, 0, 0.08); 
            border-radius: 8px;
            overflow: hidden; 
        }
        
        .customer-table thead {
            background-color: var(--primary-color);
            color: white;
        }
        
        .customer-table th, 
        .customer-table td {
            padding: 1rem 1.2rem; 
            text-align: left;
            border-bottom: 1px solid #e8ebee; 
        }
        
        .customer-table th {
            font-weight: 500;
            font-size: 0.9rem; 
            text-transform: uppercase; 
            letter-spacing: 0.5px;
        }
        
        .customer-table tbody tr:hover {
            background-color: rgba(25, 118, 210, 0.04); 
        }
        
        .action-btn {
            padding: 0.4rem 0.8rem; 
            border: none;
            border-radius: 4px;
            font-size: 0.85rem; 
            font-weight: 500;
            cursor: pointer;
            transition: all 0.2s;
            display: inline-flex;
            align-items: center;
            justify-content: center;
            gap: 5px;
            text-decoration: none;
            margin-right: 6px; 
            line-height: 1.4; 
        }
        .action-btn .material-icons {
            font-size: 1.1rem; 
        }
        
        .update-btn {
            background-color: var(--success-color);
            color: white;
        }
        
        .update-btn:hover {
            background-color: #2e7d32;
        }
        
        .delete-btn {
            background-color: var(--error-color);
            color: white;
        }
        
        .delete-btn:hover {
            background-color: #c62828;
        }
        
        .no-data {
            text-align: center;
            padding: 2.5rem; 
            color: var(--text-secondary);
            font-size: 1.1rem;
        }
        .no-data .material-icons {
            font-size: 2.5rem;
            display: block;
            margin-bottom: 0.5rem;
        }
        
        .modal-content {
            border-radius: 8px;
            overflow: hidden;
            border: none; 
            box-shadow: 0 10px 30px rgba(0,0,0,0.15); 
        }
        
        .modal-header {
            background-color: var(--primary-color);
            color: white;
            padding: 1.2rem 1.5rem; 
        }
        
        .modal-title {
            display: flex;
            align-items: center;
            gap: 10px;
            margin: 0;
            font-size: 1.3rem; 
            font-weight: 500;
        }
        
        .form-control {
            padding: 0.75rem 1rem; 
            border: 1px solid #ced4da; 
            border-radius: 5px; 
            font-size: 0.95rem; 
            transition: all 0.3s;
            width: 100%;
        }
        
        .form-control:focus {
            outline: none;
            border-color: var(--primary-color);
            box-shadow: 0 0 0 3px rgba(25, 118, 210, 0.25); 
        }
        
        .form-label {
            font-size: 0.9rem;
            color: var(--text-secondary);
            margin-bottom: 0.5rem;
            display: block;
            font-weight: 500; 
        }
        
        .modal-footer {
            padding: 1rem 1.5rem;
            background-color: #f8f9fa;
            border-top: 1px solid #dee2e6;
        }
        
        .modal-footer .btn {
            display: inline-flex;
            align-items: center;
            gap: 5px;
            padding: 0.6rem 1.2rem; 
            font-weight: 500;
        }
        
        .footer {
            background-color: var(--primary-color); 
            color: white;
            text-align: center;
            padding: 1.2rem; 
            margin-top: auto; 
            font-size: 0.9rem;
        }
        
        .btn-close {
            filter: invert(1) brightness(2); 
        }
    </style>
</head>

<body>
    <header class="header">
        <div class="header-title">
            <i class="material-icons" style="font-size: 2rem;">admin_panel_settings</i> 
            <h1>Admin Portal</h1>
        </div>
        <div class="header-actions">
            <a href="Homepage"> 
                <i class="material-icons">dashboard</i>
                <span>Homepage</span>
           
            <a href="/GameSphere_Web_Project/CustomerInsert"> 
                <i class="material-icons">person_add</i>
                <span>Add Employee</span>
            </a>
            <a href="offerManage"> 
                <i class="material-icons">local_offer</i>
                <span>Manage Offers</span>
            </a>
        </div>
    </header>

    <div class="main-container">
        <h1 class="page-title">
            <i class="material-icons" style="font-size: 2.5rem;">group</i> 
            Registered Employee
        </h1>
        
        <form class="view-all-form" action="validateUser" method="post">
            <button type="submit" class="view-all-btn">
                <i class="material-icons">refresh</i>
                View All
            </button>
        </form>
        <div style="overflow-x: auto;"> 
            <table class="customer-table">
                <thead>
                    <tr>
                        <th>Full Name</th>
                        <th>Username</th>
                        <th>NIC</th>
                        <th>Address</th>
                        <th>Email</th>
                        <th>Phone</th>
                        <th>Actions</th>
                    </tr>
                </thead>
                <tbody>
                    <%
                        List<Customer> customers = (List<Customer>) request.getAttribute("customers");
                        if (customers != null && !customers.isEmpty()) {
                            for (Customer customer : customers) {
                    %>
                    <tr>
                        <td><%= customer.getFullname() %></td>
                        <td><%= customer.getUsername() %></td>
                        <td><%= customer.getNic() %></td>
                        <td><%= customer.getAddress() %></td>
                        <td><%= customer.getEmail() %></td>
                        <td><%= customer.getPhone() %></td>
                        <td>
                            <button class="action-btn update-btn" onclick="openUpdateModal(
                                '<%= escapeForJavaScript(customer.getFullname()) %>', 
                                '<%= escapeForJavaScript(customer.getUsername()) %>', 
                                '<%= escapeForJavaScript(customer.getNic()) %>', 
                                '<%= escapeForJavaScript(customer.getAddress()) %>', 
                                '<%= escapeForJavaScript(customer.getEmail()) %>', 
                                '<%= escapeForJavaScript(customer.getPhone()) %>'
                            )">
                                <i class="material-icons">edit</i>
                                Update
                            </button>
                            <form action="delete" method="post" style="display: inline;">
                                <input type="hidden" name="id" value="<%= customer.getId() %>">
                                <button type="submit" class="action-btn delete-btn" onclick="return confirm('Are you sure you want to delete this customer?');">
                                    <i class="material-icons">delete</i>
                                    Delete
                                </button>
                            </form>
                        </td>
                    </tr>
                    <%
                            }
                        } else {
                            String errorMessage = (String) request.getAttribute("errorMessage");
                            if (errorMessage != null && !errorMessage.isEmpty()) {
                    %>
                    <tr>
                        <td colspan="7" class="no-data">
                            <i class="material-icons">warning</i> 
                            <%= errorMessage %>
                        </td>
                    </tr>
                    <%  } else { %>
                     <tr>
                        <td colspan="7" class="no-data">
                            <i class="material-icons">info</i>
                            No customer details found.
                        </td>
                    </tr>
                    <% 
                            }
                        } 
                    %>
                </tbody>
            </table>
        </div>
    </div>

    <div class="modal fade" id="updateModal" tabindex="-1" aria-labelledby="updateModalLabel" aria-hidden="true">
      <div class="modal-dialog modal-lg">
        <div class="modal-content">
            <form method="post" action="CustomerUpdateServlet"> 
                <div class="modal-header">
                    <h5 class="modal-title" id="updateModalLabel">
                        <i class="material-icons">edit_note</i> 
                        Update Customer Details
                    </h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    <input type="hidden" name="username" id="modalUsername">

                    <div class="row">
                        <div class="col-md-6 mb-3">
                            <label for="modalFullname" class="form-label">Full Name</label>
                            <input type="text" class="form-control" id="modalFullname" name="fullname" required>
                        </div>
                        <div class="col-md-6 mb-3">
                            <label for="modalUsernameDisplay" class="form-label">Username (Cannot be changed)</label>
                            <input type="text" class="form-control" id="modalUsernameDisplay" disabled>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-6 mb-3">
                            <label for="modalNic" class="form-label">NIC</label>
                            <input type="text" class="form-control" id="modalNic" name="nic" required maxlength="12" pattern="\d{12}|\d{9}[vV]">
                        </div>
                         <div class="col-md-6 mb-3">
                            <label for="modalEmail" class="form-label">Email</label>
                            <input type="email" class="form-control" id="modalEmail" name="email" required>
                        </div>
                    </div>
                    <div class="mb-3">
                        <label for="modalAddress" class="form-label">Address</label>
                        <textarea class="form-control" id="modalAddress" name="address" required rows="2"></textarea>
                    </div>
                   
                    <div class="mb-3">
                        <label for="modalPhone" class="form-label">Phone</label>
                        <div class="input-group">
                            <select id="modalCountryCode" name="countryCode" class="form-select" style="max-width: 120px; flex-grow: 0; flex-shrink:0; flex-basis: auto;">
                                <option value="+94">+94 (LK)</option>
                                <option value="+1">+1 (US)</option>
                                <option value="+44">+44 (UK)</option>
                                <option value="+91">+91 (IN)</option>
                                <option value="+60">+60 (MY)</option>
                                </select>
                            <input type="text" class="form-control" id="modalPhoneNumber" name="phoneNumber" required maxlength="9" pattern="\d{9}">
                        </div>
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">
                        <i class="material-icons">cancel</i>
                        Cancel
                    </button>
                    <button type="submit" class="btn btn-primary">
                        <i class="material-icons">save_as</i> 
                        Save Changes
                    </button>
                </div>
            </form>
        </div>
      </div>
    </div>
    <footer class="footer">
        <p>&copy; <span id="currentYear"></span> Admin Portal. All rights reserved.</p> 
    </footer>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>

    <script>
        function openUpdateModal(fullname, username, nic, address, email, phone) {
            document.getElementById("modalFullname").value = fullname;
            document.getElementById("modalUsername").value = username; 
            document.getElementById("modalUsernameDisplay").value = username; 
            document.getElementById("modalNic").value = nic;
            document.getElementById("modalAddress").value = address;
            document.getElementById("modalEmail").value = email;
            
            let countryCode = "+94"; 
            let phoneNumber = "";

            if (phone) {
                const phoneString = String(phone).trim();
                const parts = phoneString.split(' ');
                const knownCountryCodes = ["+94", "+1", "+44", "+91", "+60"]; 

                if (parts.length === 2 && parts[0].startsWith("+") && /^\d+$/.test(parts[1])) {
                    countryCode = parts[0];
                    phoneNumber = parts[1];
                } else if (phoneString.startsWith("+")) {
                    let matched = false;
                    for (const cc of knownCountryCodes) {
                        if (phoneString.startsWith(cc)) {
                            const potentialNum = phoneString.substring(cc.length).replace(/\D/g, ''); 
                            if (potentialNum.length > 0) { 
                                countryCode = cc;
                                phoneNumber = potentialNum;
                                matched = true;
                                break;
                            }
                        }
                    }
                    if (!matched) { 
                        phoneNumber = phoneString.replace(/\D/g, '');
                    }
                } else if (/^\d+$/.test(phoneString)) { 
                    phoneNumber = phoneString;
                } else {
                    phoneNumber = phoneString.replace(/\D/g, '');
                }
            }

            document.getElementById("modalCountryCode").value = countryCode;
            
            if (!Array.from(document.getElementById("modalCountryCode").options).some(opt => opt.value === countryCode)) {
                 document.getElementById("modalCountryCode").value = "+94"; 
            }

            document.getElementById("modalPhoneNumber").value = phoneNumber.substring(0,9); 

            var updateModalElement = document.getElementById("updateModal");
            if (updateModalElement) {
                var updateModal = new bootstrap.Modal(updateModalElement);
                updateModal.show();
            } else {
                console.error("Update modal element not found!");
            }
        }
        
        const modalNicInput = document.getElementById('modalNic');
        if (modalNicInput) {
            modalNicInput.addEventListener('input', function() {
                this.value = this.value.toUpperCase().replace(/[^0-9V]/g, '');
            });
        }
        
        const modalPhoneNumberInput = document.getElementById('modalPhoneNumber');
        if (modalPhoneNumberInput) {
            modalPhoneNumberInput.addEventListener('input', function() {
                this.value = this.value.replace(/\D/g, '').substring(0, 9);
            });
        }

        document.getElementById('currentYear').textContent = new Date().getFullYear();
    </script>
</body>
</html>