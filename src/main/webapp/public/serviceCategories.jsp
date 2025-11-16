<%@ page import="dao.CategoryDao, java.util.List, models.Category" %>
<%
    CategoryDao dao = new CategoryDao();
    List<Category> list = dao.getAllCategories();
%>

<%@ include file="../includes/header.jsp" %>
<%@ include file="../includes/navbar.jsp" %>

<div class="container mt-4">
    <h2>Service Categories</h2>

    <div class="row">
        <% for (Category c : list) { %>
            <div class="col-md-4 mt-3">
                <div class="card p-3">
                    <h5><%= c.getCategoryName() %></h5>
                    <p><%= c.getCategoryDesc() %></p>

                    <a class="btn btn-primary"
                       href="servicesByCategory.jsp?categoryId=<%= c.getCategoryId() %>">
                       View Services
                    </a>
                </div>
            </div>
        <% } %>
    </div>
</div>

<%@ include file="../includes/footer.jsp" %>
