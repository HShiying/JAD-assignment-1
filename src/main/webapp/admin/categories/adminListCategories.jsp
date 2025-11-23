<%@ page import="dao.CategoryDao, java.util.List, models.Category" %>
<%@ include file="../../includes/header.jsp" %>
<%@ include file="../../includes/navbar.jsp" %>
<%@ include file="../../includes/adminSessionCheck.jsp" %>

<%
    CategoryDao dao = new CategoryDao();
    List<Category> categories = dao.getAllCategories();
%>

<div class="container-fluid">
    <div class="row">
        <!-- Sidebar -->
        <div class="col-md-2 d-none d-md-block bg-light sidebar vh-100">
            <%@ include file="../../includes/sidebar.jsp" %>
        </div>

        <!-- Main Content -->
        <main class="col-md-10 ms-sm-auto px-4">
            <h2 class="mt-4">Service Categories</h2>
            <a href="<%=request.getContextPath()%>/admin/categories/adminAddCategory.jsp" class="btn btn-success mb-3">Add Category</a>

            <div class="table-responsive">
                <table class="table table-bordered">
                    <thead>
                        <tr>
                            <th>ID</th>
                            <th>Category Name</th>
                            <th>Description</th>
                            <th>Actions</th>
                        </tr>
                    </thead>
                    <tbody>
                        <% for (Category c : categories) { %>
                        <tr>
                            <td><%= c.getCategoryId() %></td>
                            <td><%= c.getCategoryName() %></td>
                            <td><%= c.getCategoryDesc() %></td>
                            <td>
                                <a href="adminEditCategory.jsp?categoryId=<%=c.getCategoryId()%>" class="btn btn-warning btn-sm">Edit</a>
                                <form action="<%= request.getContextPath() %>/CategoryController" method="post" style="display:inline;">
                                    <input type="hidden" name="action" value="deleteCategory">
                                    <input type="hidden" name="id" value="<%= c.getCategoryId() %>">
                                    <button type="submit" class="btn btn-danger btn-sm" onclick="return confirm('Are you sure you want to delete this category?');">
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
