<%
    if (session.getAttribute("admin") == null) {
        response.sendRedirect("../adminLogin.jsp"); // redirect to login if not logged in
        return;
    }
%>
