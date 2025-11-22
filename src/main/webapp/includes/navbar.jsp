<nav class="navbar navbar-expand-lg navbar-light bg-light px-3">

  <a class="navbar-brand" href="<%=request.getContextPath() %>/public/home.jsp">
    Silver Care
  </a>

  <ul class="navbar-nav ms-auto">

    <!-- PUBLIC -->
    <li class="nav-item">
      <a class="nav-link" href="<%=request.getContextPath() %>/public/serviceCategories.jsp">Services</a>
    </li>

    <!-- CLIENT LOGGED IN -->
    <%
      Object client = session.getAttribute("client");
      if (client != null) {
    %>
      <li class="nav-item">
        <a class="nav-link" href="<%=request.getContextPath() %>/client/clientDashboard.jsp">Dashboard</a>
      </li>
      <li class="nav-item">
        <form action="<%=request.getContextPath() %>/AuthController" method="post">
          <input type="hidden" name="action" value="logout">
          <button class="btn btn-danger btn-sm">Logout</button>
        </form>
      </li>
    <% } else { %>
      <!-- NOT LOGGED IN -->
      <li class="nav-item">
        <a class="nav-link" href="<%=request.getContextPath() %>/client/clientLogin.jsp">Login</a>
      </li>
    <% } %>

    <!-- ADMIN -->
    <%
      Object admin = session.getAttribute("admin");
      if (admin != null) {
    %>
      <li class="nav-item">
        <a class="nav-link" href="<%=request.getContextPath() %>/admin/adminDashboard.jsp">Admin</a>
      </li>
    <% } %>

  </ul>
</nav>

