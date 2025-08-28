<%@ page import="java.sql.*" %>
<%@ page import="config.Conexion" %>
<%
    request.setCharacterEncoding("UTF-8");

    // Obtener datos del formulario
    String id = request.getParameter("id");
    String nombre = request.getParameter("nombre");
    String correo = request.getParameter("correo");
    String telefono = request.getParameter("telefono");
    String sexo = request.getParameter("sexo");
    String direccion = request.getParameter("direccion");
    String fechaNacimiento = request.getParameter("fechaNacimiento");

    Connection con = null;
    PreparedStatement ps = null;

    try {
        // 🔹 Conexión a Clever Cloud
        Conexion cn = new Conexion();
        con = cn.getConnection();

        // 🔹 Sentencia SQL para actualizar
        String sql = "UPDATE solicitudes SET nombre=?, correo=?, telefono=?, sexo=?, direccion=?, fechaNacimiento=? WHERE id=?";
        ps = con.prepareStatement(sql);

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

        // Ejecutar actualización
        ps.executeUpdate();

        // 🔹 Cerrar recursos
        ps.close();
        con.close();

        // 🔹 Redirigir a listar.jsp después de actualizar
        response.sendRedirect("listar.jsp");

    } catch (Exception e) {
        e.printStackTrace();
        out.println("<div class='alert alert-danger'>❌ Error al actualizar: " + e.getMessage() + "</div>");
    }
%>
