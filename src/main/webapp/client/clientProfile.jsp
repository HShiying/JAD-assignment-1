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

<div class="container mt-4">
    <h2>Your Profile</h2>

    <table class="table mt-3" style="max-width: 600px;">
        <tr>
            <th>Name</th>
            <td><%= c.getFullName() %></td>
        </tr>
        <tr>
            <th>Email</th>
            <td><%= c.getEmail() %></td>
        </tr>
        <tr>
            <th>Phone</th>
            <td><%= c.getPhone() %></td>
        </tr>
        <tr>
            <th>Address</th>
            <td><%= c.getAddress() %></td>
        </tr>
    </table>

    <a href="clientEditProfile.jsp" class="btn btn-warning">Edit Profile</a>
</div>

<%@ include file="../includes/footer.jsp" %>
