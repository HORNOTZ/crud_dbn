<%@ page import="java.sql.*" %>
<%@ page import="config.Conexion" %>
<%
    String id = request.getParameter("id");

    try {
        if (id != null && !id.isEmpty()) {

            // 🔹 Usar Conexion.java para conectarse a Clever Cloud
            Conexion cn = new Conexion();
            Connection con = cn.getConnection();

            // Preparar sentencia SQL para eliminar
            PreparedStatement ps = con.prepareStatement("DELETE FROM solicitudes WHERE id=?");
            ps.setInt(1, Integer.parseInt(id));
            ps.executeUpdate();

            // Cerrar recursos
            ps.close();
            con.close();
        }

        // ✅ Después de eliminar, redirige al listado
        response.sendRedirect("listar.jsp");

    } catch(Exception e) {
        e.printStackTrace(); // Mostrar error en consola para depuración
        // ❌ Si hay error, redirige con indicador de error
        response.sendRedirect("listar.jsp?error=1");
    }
%>
