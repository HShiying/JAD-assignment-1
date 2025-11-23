<!-- Sidebar only -->
<nav class="col-md-2 d-none d-md-block bg-light sidebar vh-100">
    <div class="sidebar-sticky p-3">
        <h5>Admin Dashboard</h5>
        <ul class="nav flex-column mt-4">
            <li class="nav-item">
                <a class="nav-link" href="<%=request.getContextPath()%>/admin/adminDashboard.jsp">Dashboard Home</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="<%=request.getContextPath()%>/admin/categories/adminListCategories.jsp">Manage Categories</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="<%=request.getContextPath()%>/admin/services/adminListServices.jsp">Manage Services</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="<%=request.getContextPath() %>/admin/clients/adminListClients.jsp">Manage Clients</a>
            </li>
            <li class="nav-item">
                <a class="nav-link text-danger" href="<%=request.getContextPath()%>/AuthController?action=logout">Logout</a>
            </li>
        </ul>
    </div>
</nav>
