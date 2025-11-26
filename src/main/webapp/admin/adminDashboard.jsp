<%@ page import="dao.ServiceDao, dao.CategoryDao, dao.ClientDao" %>
<%@ page import="java.util.List" %>
<%@ page import="dao.ServiceDao, dao.CategoryDao, dao.ClientDao, models.Service, models.Category" %>

<%@ include file="../includes/header.jsp" %>
<%@ include file="../includes/navbar.jsp" %>

<%
    // Check admin session
    if (session.getAttribute("admin") == null) {
        response.sendRedirect(request.getContextPath() + "/admin/adminLogin.jsp");
        return;
    }

    // Load dashboard data
    ServiceDao serviceDao = new ServiceDao();
    CategoryDao categoryDao = new CategoryDao();
    ClientDao clientDao = new ClientDao(); 

    int totalServices = serviceDao.getAllServices().size();
    int totalCategories = categoryDao.getAllCategories().size();
    int totalClients = clientDao.getAllClients().size();
%>

<style>
    .dashboard-card {
        border-radius: 16px;
        transition: 0.25s;
        background: white;
    }
    .dashboard-card:hover {
        transform: translateY(-5px);
        box-shadow: 0 8px 18px rgba(0,0,0,0.12);
    }
    .dashboard-title {
        font-weight: 700;
        color: #333;
    }
    .dashboard-value {
        font-size: 42px;
        font-weight: 800;
    }
    .table-section {
        margin-top: 40px;
    }
</style>

<div class="container-fluid">
    <div class="row">

        <!-- Sidebar -->
        <div class="col-md-2 bg-light vh-100 p-3">
            <%@ include file="../includes/sidebar.jsp" %>
        </div>

        <!-- Main Content -->
        <main class="col-md-10 px-4 mt-4">

            <h2 class="dashboard-title mb-4">Admin Dashboard</h2>

            <div class="row">
                <!-- Total Services -->
                <div class="col-md-4 mb-3">
                    <div class="card dashboard-card shadow-sm p-4 text-center">
                        <h5>Total Services</h5>
                        <h2 class="dashboard-value text-primary"><%= totalServices %></h2>
                    </div>
                </div>

                <!-- Total Categories -->
                <div class="col-md-4 mb-3">
                    <div class="card dashboard-card shadow-sm p-4 text-center">
                        <h5>Total Categories</h5>
                        <h2 class="dashboard-value text-success"><%= totalCategories %></h2>
                    </div>
                </div>

                <!-- Total Clients -->
                <div class="col-md-4 mb-3">
                    <div class="card dashboard-card shadow-sm p-4 text-center">
                        <h5>Total Clients</h5>
                        <h2 class="dashboard-value text-danger"><%= totalClients %></h2>
                    </div>
                </div>
            </div>

            <!-- Recent Services Table -->
            <div class="table-section">
                <div class="card p-3 shadow-sm">
                    <table class="table table-striped">
                        <thead>
                            <tr>
                                <th>Service Name</th>
                                <th>Category</th>
                            </tr>
                        </thead>
                        <tbody>
                            <%
                                List<models.Service> list = serviceDao.getAllServices();
                                for (models.Service s : list) { 
                                    models.Category cat = categoryDao.getCategoryById(s.getCategoryId());
                            %>
                            <tr>
                                <td><%= s.getServiceName() %></td>
                                <td><%= cat != null ? cat.getCategoryName() : "N/A" %></td>
                            </tr>
                            <% } %>
                        </tbody>
                    </table>
                </div>
            </div>

        </main>

    </div>
</div>

<%@ include file="../includes/footer.jsp" %>
