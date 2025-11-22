<%@ include file="../includes/header.jsp" %>
<%@ include file="../includes/navbar.jsp" %>

<div class="container mt-5" style="max-width: 600px;">

    <h2 class="mb-4">Create Client Account</h2>

    <form action="<%=request.getContextPath() %>/ClientController" method="post">
        <input type="hidden" name="action" value="register">

        <div class="mb-3">
            <label>Full Name</label>
            <input type="text" name="fullName" class="form-control" required>
        </div>

        <div class="mb-3">
            <label>Email</label>
            <input type="email" name="email" class="form-control" required>
        </div>

        <div class="mb-3">
            <label>Password</label>
            <input type="password" name="password" class="form-control" required>
        </div>

        <div class="mb-3">
            <label>Phone Number</label>
            <input type="text" name="phone" class="form-control">
        </div>

        <div class="mb-3">
            <label>Address</label>
            <textarea name="address" class="form-control"></textarea>
        </div>

        <% if (request.getAttribute("error") != null) { %>
            <p class="text-danger"><%= request.getAttribute("error") %></p>
        <% } %>

        <button class="btn btn-success w-100">Register</button>
    </form>

</div>

<%@ include file="../includes/footer.jsp" %>
