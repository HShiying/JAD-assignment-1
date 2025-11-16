<%@ page import="dao.ServiceDao, models.Service" %>

<%
    int serviceId = Integer.parseInt(request.getParameter("serviceId"));
    ServiceDao dao = new ServiceDao();
    Service s = dao.getServiceById(serviceId);
%>

<%@ include file="../includes/header.jsp" %>
<%@ include file="../includes/navbar.jsp" %>

<div class="container mt-4">

    <h2><%= s.getServiceName() %></h2>

    <img src="<%= s.getImagePath() %>" width="250" class="mt-3">

    <p class="mt-3"><%= s.getServiceDesc() %></p>
    <p><strong>Price: </strong>$<%= s.getPrice() %></p>

    <a href="#" class="btn btn-primary">Add to Booking (Assignment 2)</a>

</div>

<%@ include file="../includes/footer.jsp" %>
