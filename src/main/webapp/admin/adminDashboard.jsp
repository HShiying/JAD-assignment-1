<!--<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

</body>
</html>-->

<%@ include file="../includes/header.jsp" %>
<%@ include file="../includes/navbar.jsp" %>
<%
    if (session.getAttribute("admin") == null) {
        response.sendRedirect("adminLogin.jsp"); // redirect to login if not logged in
        return;
    }
%>



<div class="container-fluid">
    <div class="row">
        <!-- Sidebar -->
        <nav class="col-md-2 d-none d-md-block bg-light sidebar vh-100">
            <div class="sidebar-sticky p-3">
                <h5>Admin Dashboard</h5>
                <ul class="nav flex-column mt-4">
                    <li class="nav-item">
                        <a class="nav-link active" href="adminDashboard.jsp">Dashboard Home</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="<%=request.getContextPath() %>/admin/categories/adminListCategories.jsp">Manage Service Categories</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="<%=request.getContextPath() %>/admin/services/adminListServices.jsp">Manage Services</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="<%=request.getContextPath() %>/admin/clients/adminListClients.jsp">Manage Clients</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link text-danger" href="<%=request.getContextPath() %>/AuthController?action=logout">Logout</a>
                    </li>
                </ul>
            </div>
        </nav>

        <!-- Main Content -->
        <main class="col-md-10 ms-sm-auto px-4">
            <div class="d-flex justify-content-between flex-wrap flex-md-nowrap align-items-center pt-3 pb-2 mb-3 border-bottom">
                <h1 class="h2">Dashboard Home</h1>
            </div>

            <!-- Quick Actions -->
            <div class="mb-4">
                <a href="<%=request.getContextPath() %>/admin/categories/adminAddCategory.jsp" class="btn btn-success me-2">Add Category</a>
                <a href="<%=request.getContextPath() %>/admin/services/adminAddService.jsp" class="btn btn-primary">Add Service</a>
            </div>


            <!-- Example Table -->
            <h4>Services Overview</h4>
            <div class="table-responsive">
                <table class="table table-striped table-bordered align-middle">
                    <thead>
                        <tr>
                            <th>ID</th>
                            <th>Category</th>
                            <th>Service Name</th>
                            <th>Image</th>
                            <th>Price</th>
                            <th>Actions</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <td>1</td>
                            <td>Food</td>
                            <td>Pizza Delivery</td>
                            <td><img src="../images/p101.png" width="50" alt="Pizza"></td>
                            <td>$10</td>
                            <td>
                                <button class="btn btn-sm btn-warning">Edit</button>
                                <button class="btn btn-sm btn-danger">Delete</button>
                            </td>
                        </tr>
                        <!-- Repeat rows dynamically from DB -->
                    </tbody>
                </table>
            </div>
        </main>
    </div>
</div>

<%@ include file="../includes/footer.jsp" %>
