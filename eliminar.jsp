<%@ page import="java.sql.*" %>
<%
    String id = request.getParameter("id");

    try {
        if (id != null && !id.isEmpty()) {
            // Cargar el driver
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/crud_dbn", "root", "");

            // Preparar sentencia SQL
            PreparedStatement ps = con.prepareStatement("DELETE FROM solicitudes WHERE id=?");
            ps.setInt(1, Integer.parseInt(id));
            ps.executeUpdate();

            con.close();
        }

        // ✅ Después de eliminar, redirige de nuevo al listado
        response.sendRedirect("listar.jsp");

    } catch(Exception e) {
        // ❌ Si hay error, vuelve al listado con indicador de error
        response.sendRedirect("listar.jsp?error=1");
    }
%>
