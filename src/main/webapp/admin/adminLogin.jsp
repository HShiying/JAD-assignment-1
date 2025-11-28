<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<%@ include file="../includes/header.jsp" %>
<%@ include file="../includes/navbar.jsp" %>

<link rel="stylesheet" href="<%=request.getContextPath()%>/assets/css/admin.css?v=3">

<div class="page-wrapper d-flex flex-column">
    <div class="admin-layout d-flex flex-column flex-grow-1">

        <main class="admin-content d-flex justify-content-center">

            <div class="admin-form-card mt-5" style="max-width: 420px; width: 100%;">

                <h2 class="text-center mb-3">Admin Login</h2>

                <form action="<c:url value='/AuthController' />" method="post">
    <input type="hidden" name="action" value="adminLogin"/>

    <!-- Username -->
    <div class="form-group">
        <label for="username">Username</label>
        <input 
            type="text" 
            id="username" 
            name="username" 
            class="form-control" 
            required 
            placeholder=" "
            autocomplete="username"
        >
    </div>

    <!-- Password -->
    <div class="form-group">
        <label for="password">Password</label>
        <input 
            type="password" 
            id="password" 
            name="password" 
            class="form-control" 
            required 
            placeholder=" "
            autocomplete="current-password"
        >
    </div>

    <div class="mt-4">
        <button type="submit" class="btn btn-primary w-100">Login</button>
    </div>

    <!-- Error -->
    <c:if test="${not empty error}">
        <div class="alert alert-danger mt-3 text-center">
            ${error}
        </div>
    </c:if>
</form>


            </div>

        </main>

    </div>
</div>

<%@ include file="../includes/footer.jsp" %>
