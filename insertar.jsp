<%@ page import="java.sql.*" %>
<%@ page import="config.Conexion" %>
<%
    String nombre = request.getParameter("nombre");
    String correo = request.getParameter("correo");
    String telefono = request.getParameter("telefono");
    String sexo = request.getParameter("sexo");
    String direccion = request.getParameter("direccion");
    String fechaNacimiento = request.getParameter("fechaNacimiento");

    Connection con = null;
    PreparedStatement ps = null;

    try {
        // 🔹 Conexión a Clever Cloud usando Conexion.java
        Conexion cn = new Conexion();
        con = cn.getConnection();

        String sql = "INSERT INTO solicitudes (nombre, correo, telefono, sexo, direccion, fechaNacimiento) VALUES (?, ?, ?, ?, ?, ?)";
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

        ps.executeUpdate();

        // 🔹 Cerrar recursos
        ps.close();
        con.close();

        // 🔹 Redirigir a listar.jsp después de insertar
        response.sendRedirect("listar.jsp");

    } catch(Exception e) {
        e.printStackTrace(); // Mostrar error en consola
        // ❌ Si hay error, vuelve al formulario
        response.sendRedirect("index.jsp");
    }
%>
