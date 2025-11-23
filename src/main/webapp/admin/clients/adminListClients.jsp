<%@ page import="dao.ClientDao, models.Client, java.util.*" %>
<%@ include file="../../includes/header.jsp" %>
<%@ include file="../../includes/navbar.jsp" %>
<%@ include file="../../includes/adminSessionCheck.jsp" %>

<%
    // Admin session check
    if (session.getAttribute("admin") == null) {
        response.sendRedirect("adminLogin.jsp");
        return;
    }

    ClientDao dao = new ClientDao();
    List<Client> clients = dao.getAllClients();
%>

<div class="container-fluid">
    <div class="row">

        <!-- Sidebar -->
        <div class="col-md-2 d-none d-md-block bg-light sidebar vh-100">
            <%@ include file="../../includes/sidebar.jsp" %>
        </div>

        <!-- MAIN CONTENT -->
        <div class="col-md-10">
            <div class="container mt-4">
                <h2>All Clients</h2>

                <table class="table table-bordered mt-3">
                    <thead>
                        <tr>
                            <th>ID</th>
                            <th>Full Name</th>
                            <th>Email</th>
                            <th>Phone</th>
                            <th>Address</th>
                            <th>Actions</th>
                        </tr>
                    </thead>

                    <tbody>
                    <% for(Client c : clients) { %>
                        <tr>
                            <td><%= c.getClientId() %></td>
                            <td><%= c.getFullName() %></td>
                            <td><%= c.getEmail() %></td>
                            <td><%= c.getPhone() %></td>
                            <td><%= c.getAddress() %></td>

                            <td>
                                <a href="adminEditClient.jsp?id=<%= c.getClientId() %>" class="btn btn-primary btn-sm">Edit</a>
                                <form action="<%= request.getContextPath() %>/AdminController" method="post" style="display:inline;">
                                <input type="hidden" name="action" value="deleteClient">
                                <input type="hidden" name="clientId" value="<%= c.getClientId() %>">
                                <button type="submit" class="btn btn-danger btn-sm" onclick="return confirm('Are you sure you want to delete this client?');">
                                Delete
                                </button>
                                </form>

                            </td>

                        </tr>
                    <% } %>
                    </tbody>
                </table>
            </div>
        </div>

    </div> <!-- row -->
</div> <!-- container-fluid -->

<%@ include file="../../includes/footer.jsp" %>
