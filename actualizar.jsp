<%@ page import="java.sql.*" %>
<%
    request.setCharacterEncoding("UTF-8");

    String id = request.getParameter("id");
    String nombre = request.getParameter("nombre");
    String correo = request.getParameter("correo");
    String telefono = request.getParameter("telefono");
    String sexo = request.getParameter("sexo");
    String direccion = request.getParameter("direccion");
    String fechaNacimiento = request.getParameter("fechaNacimiento");

    try {
        Class.forName("com.mysql.cj.jdbc.Driver");
        Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/crud_dbn", "root", "");

        String sql = "UPDATE solicitudes SET nombre=?, correo=?, telefono=?, sexo=?, direccion=?, fechaNacimiento=? WHERE id=?";
        PreparedStatement ps = con.prepareStatement(sql);

        ps.setString(1, nombre);
        ps.setString(2, correo);
        ps.setString(3, telefono);
        ps.setString(4, sexo);
        ps.setString(5, direccion);

        if (fechaNacimiento != null && !fechaNacimiento.isEmpty()) {
            ps.setDate(6, java.sql.Date.valueOf(fechaNacimiento));
        } else {
            ps.setNull(6, java.sql.Types.DATE);
        }

        ps.setInt(7, Integer.parseInt(id));
        ps.executeUpdate();

        con.close();
        response.sendRedirect("listar.jsp");
    } catch (Exception e) {
        out.println("<div class='alert alert-danger'>❌ Error al actualizar: " + e.getMessage() + "</div>");
    }
%>
