<%@ page import="dao.ServiceDao, dao.CategoryDao, java.util.List, models.Service, models.Category" %>
<%@ include file="../includes/header.jsp" %>
<%@ include file="../includes/navbar.jsp" %>
<%@ include file="../includes/adminSessionCheck.jsp" %>

<%
    // Fetch services dynamically
    ServiceDao serviceDao = new ServiceDao();
    List<Service> services = serviceDao.getAllServices();
    CategoryDao categoryDao = new CategoryDao();
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
                        <form action="<%=request.getContextPath() %>/AuthController" method="post" style="display:inline;">
                            <input type="hidden" name="action" value="logout">
                            <button type="submit" class="btn btn-link nav-link text-danger p-0">Logout</button>
                        </form>
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

            <!-- Services Table -->
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
                        <% for (Service s : services) { 
                            Category cat = categoryDao.getCategoryById(s.getCategoryId());
                        %>
                        <tr>
                            <td><%= s.getServiceId() %></td>
                            <td><%= cat != null ? cat.getCategoryName() : "N/A" %></td>
                            <td><%= s.getServiceName() %></td>
                            <td>
                                <img src="<%= request.getContextPath() + "/" + s.getImagePath() %>" width="50" alt="<%= s.getServiceName() %>"/>
                            </td>
                            <td>$<%= s.getPrice() %></td>
                            <td>
                                <a href="adminEditService.jsp?serviceId=<%=s.getServiceId()%>" class="btn btn-warning btn-sm">Edit</a>
                                <form action="<%= request.getContextPath() %>/ServiceController" method="post" style="display:inline;">
                                    <input type="hidden" name="action" value="deleteService">
                                    <input type="hidden" name="serviceId" value="<%= s.getServiceId() %>">
                                    <button type="submit" class="btn btn-danger btn-sm" onclick="return confirm('Are you sure you want to delete this service?');">
                                    Delete
                                    </button>
                                </form>
                            </td>
                        </tr>
                        <% } %>
                    </tbody>
                </table>
            </div>
        </main>
    </div>
</div>

<%@ include file="../includes/footer.jsp" %>
