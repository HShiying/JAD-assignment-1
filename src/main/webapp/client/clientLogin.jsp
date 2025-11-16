<%@ include file="../includes/header.jsp" %>
<%@ include file="../includes/navbar.jsp" %>

<div class="container mt-5" style="max-width: 500px;">

    <h2 class="mb-4">Client Login</h2>

    <form action="/ST0510-JAD-Assignment1/AuthController" method="post">
        <input type="hidden" name="action" value="clientLogin">

        <div class="mb-3">
            <label>Email</label>
            <input type="email" name="email" class="form-control" required>
        </div>

        <div class="mb-3">
            <label>Password</label>
            <input type="password" name="password" class="form-control" required>
        </div>

        <% if (request.getAttribute("error") != null) { %>
            <p class="text-danger"><%= request.getAttribute("error") %></p>
        <% } %>

        <button class="btn btn-primary w-100">Login</button>
    </form>

    <p class="mt-3">
        New user?
        <a href="registerClient.jsp">Register here</a>
    </p>
</div>

<%@ include file="../includes/footer.jsp" %>
