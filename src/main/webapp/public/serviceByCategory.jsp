<%@ page import="dao.ServiceDao, java.util.List, models.Service" %>

<%
    int categoryId = Integer.parseInt(request.getParameter("categoryId"));
    ServiceDao dao = new ServiceDao();
    List<Service> list = dao.getServicesByCategory(categoryId);
%>

<%@ include file="../includes/header.jsp" %>
<%@ include file="../includes/navbar.jsp" %>

<div class="container mt-4">
    <h2>Services in this Category</h2>

    <div class="row">
        <% for (Service s : list) { %>
            <div class="col-md-4 mt-3">
                <div class="card p-3">
                    <h5><%= s.getServiceName() %></h5>
                    <p><%= s.getServiceDesc() %></p>
                    <p><strong>Price: </strong>$<%= s.getPrice() %></p>

                    <a href="serviceDetails.jsp?serviceId=<%= s.getServiceId() %>"
                       class="btn btn-secondary">
                       View Details
                    </a>
                </div>
            </div>
        <% } %>
    </div>
</div>

<%@ include file="../includes/footer.jsp" %>
