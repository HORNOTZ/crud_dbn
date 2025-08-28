<%@ page import="java.sql.*" %>
<%
    // Datos recibidos del formulario
    String codigo = request.getParameter("codigo");
    String sexo = request.getParameter("sexo");
    String servicio = request.getParameter("servicio");
    String departamento = request.getParameter("departamento");
    String descripcion = request.getParameter("descripcion");

    // Conexión a PostgreSQL
    String url = "jdbc:postgresql://localhost:5432/tu_base"; // <-- CAMBIA "tu_base"
    String user = "postgres";  // <-- tu usuario
    String pass = "1234";      // <-- tu contraseña

    Connection con = null;
    PreparedStatement ps = null;
    try {
        Class.forName("org.postgresql.Driver");
        con = DriverManager.getConnection(url, user, pass);

        String sql = "INSERT INTO solicitudes(codigo_empleado, sexo, servicio, departamento, descripcion) VALUES (?, ?, ?, ?, ?)";
        ps = con.prepareStatement(sql);
        ps.setString(1, codigo);
        ps.setString(2, sexo);
        ps.setString(3, servicio);
        ps.setString(4, departamento);
        ps.setString(5, descripcion);

        int filas = ps.executeUpdate();
        if (filas > 0) {
%>
            <h2>Registro guardado correctamente ✅</h2>
            <a href="listar.jsp">Ver lista de registros</a>
<%
        } else {
%>
            <h2>Error: no se pudo guardar el registro ❌</h2>
<%
        }
    } catch (Exception e) {
%>
        <h2>Error en la base de datos: <%= e.getMessage() %></h2>
<%
    } finally {
        if (ps != null) ps.close();
        if (con != null) con.close();
    }
%>
