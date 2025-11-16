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
    <h2 class="text-danger">Delete Account</h2>

    <p>Are you sure you want to permanently delete your account?</p>

    <form action="/ST0510-JAD-Assignment1/ClientController" method="post">
        <input type="hidden" name="action" value="deleteClient">
        <input type="hidden" name="clientId" value="<%= c.getClientId() %>">

        <button class="btn btn-danger">YES, Delete My Account</button>
        <a href="clientDashboard.jsp" class="btn btn-secondary">Cancel</a>
    </form>
</div>

<%@ include file="../includes/footer.jsp" %>
