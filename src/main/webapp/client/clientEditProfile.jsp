<%@ page import="models.Client" %>

<%@ include file="../includes/header.jsp" %>
<%@ include file="../includes/navbar.jsp" %>

<%
    Client c = (Client) session.getAttribute("client");
    if (c == null) {
        response.sendRedirect("clientLogin.jsp");
        return;
    }
%>

<div class="container mt-4" style="max-width: 600px;">
    <h2>Edit Profile</h2>

    <form action="<%=request.getContextPath() %>/ClientController" method="post">
        <input type="hidden" name="action" value="updateProfile">
        <input type="hidden" name="clientId" value="<%= c.getClientId() %>">

        <div class="mb-3">
            <label>Full Name</label>
            <input type="text" name="fullName" value="<%= c.getFullName() %>" class="form-control" required>
        </div>

        <div class="mb-3">
            <label>Email</label>
            <input type="email" name="email" value="<%= c.getEmail() %>" class="form-control" required>
        </div>

        <div class="mb-3">
            <label>Phone</label>
            <input type="text" name="phone" value="<%= c.getPhone() %>" class="form-control">
        </div>

        <div class="mb-3">
            <label>Address</label>
            <textarea name="address" class="form-control"><%= c.getAddress() %></textarea>
        </div>

        <button class="btn btn-success w-100">Save Changes</button>
    </form>
</div>

<%@ include file="../includes/footer.jsp" %>
