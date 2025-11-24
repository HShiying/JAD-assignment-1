<%@ page import="dao.ServiceDao, dao.CategoryDao, java.util.List, models.Service, models.Category" %>
<%@ include file="../../includes/header.jsp" %>
<%@ include file="../../includes/navbar.jsp" %>
<%@ include file="../../includes/adminSessionCheck.jsp" %>


<%
    ServiceDao serviceDao = new ServiceDao();
    List<Service> services = serviceDao.getAllServices();
    CategoryDao categoryDao = new CategoryDao();
%>

<div class="container-fluid">
    <div class="row">
        <!-- Sidebar -->
        <div class="col-md-2 d-none d-md-block bg-light sidebar vh-100">
            <%@ include file="../../includes/sidebar.jsp" %>
        </div>

        <!-- Main Content -->
        <main class="col-md-10 ms-sm-auto px-4">
            <h2 class="mt-4">Services</h2>
            <a href="<%=request.getContextPath() %>/admin/services/adminAddService.jsp" class="btn btn-primary mb-3">Add Service</a>

            <div class="table-responsive">
                <table class="table table-bordered">
                    <thead>
                        <tr>
                            <th>ID</th>
                            <th>Category</th>
                            <th>Name</th>
                            <th>Price</th>
                            <th>Image</th>
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
                            <td>$<%= s.getPrice() %></td>
                            <td>
                                  <img src="<%= request.getContextPath() + "/" + s.getImagePath() %>" width="100" alt="<%= s.getServiceName() %>"/>
                            </td>
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

<%@ include file="../../includes/footer.jsp" %>
