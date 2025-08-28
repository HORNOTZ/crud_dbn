<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%
    // Obtener el ID desde la URL
    String id = request.getParameter("id");
    String nombre = "", correo = "", telefono = "", sexo = "", direccion = "";
    String fechaNacimiento = "";

    if (id != null) {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/crud_dbn", "root", "");
            PreparedStatement ps = con.prepareStatement("SELECT * FROM solicitudes WHERE id=?");
            ps.setInt(1, Integer.parseInt(id));
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                nombre = rs.getString("nombre");
                correo = rs.getString("correo");
                telefono = rs.getString("telefono");
                sexo = rs.getString("sexo");
                direccion = rs.getString("direccion");
                java.sql.Date fecha = rs.getDate("fechaNacimiento");
                if (fecha != null) {
                    fechaNacimiento = fecha.toString();
                }
            }
            con.close();
        } catch (Exception e) {
            out.println("<div class='alert alert-danger'>❌ Error: " + e.getMessage() + "</div>");
        }
    }
%>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <title>Editar Solicitud</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons/font/bootstrap-icons.css" rel="stylesheet">
    <style>
        body {
            background: linear-gradient(135deg, #4facfe, #00f2fe);
            min-height: 100vh;
            display: flex;
            align-items: center;
        }
        .card {
            border-radius: 20px;
            overflow: hidden;
            animation: fadeIn 1s ease-in-out;
        }
        .card-header {
            background: linear-gradient(90deg, #007bff, #6610f2);
            font-weight: bold;
            letter-spacing: 1px;
        }
        .btn-success {
            background: linear-gradient(90deg, #28a745, #20c997);
            border: none;
        }
        .btn-success:hover {
            background: linear-gradient(90deg, #20c997, #28a745);
            transform: scale(1.05);
            transition: all 0.3s ease;
        }
        .btn-secondary:hover {
            transform: scale(1.05);
            transition: all 0.3s ease;
        }
        @keyframes fadeIn {
            from {opacity: 0; transform: translateY(-20px);}
            to {opacity: 1; transform: translateY(0);}
        }
    </style>
</head>
<body>

<div class="container">
    <div class="card shadow-lg mx-auto" style="max-width: 650px;">
        <div class="card-header text-white text-center fs-3 py-3">
            ✏️ Editar Solicitud
        </div>
        <div class="card-body p-4">
            <form action="actualizar.jsp" method="post">
                <input type="hidden" name="id" value="<%= id %>">

                <div class="mb-3">
                    <label class="form-label fw-bold"><i class="bi bi-person-fill"></i> Nombre</label>
                    <input type="text" name="nombre" class="form-control form-control-lg" value="<%= nombre %>" required>
                </div>

                <div class="mb-3">
                    <label class="form-label fw-bold"><i class="bi bi-envelope-fill"></i> Correo</label>
                    <input type="email" name="correo" class="form-control form-control-lg" value="<%= correo %>" required>
                </div>

                <div class="mb-3">
                    <label class="form-label fw-bold"><i class="bi bi-telephone-fill"></i> Teléfono</label>
                    <input type="text" name="telefono" class="form-control form-control-lg" value="<%= telefono %>">
                </div>

                <div class="mb-3">
                    <label class="form-label fw-bold"><i class="bi bi-gender-ambiguous"></i> Sexo</label>
                    <select name="sexo" class="form-select form-select-lg">
                        <option value="Masculino" <%= "Masculino".equals(sexo) ? "selected" : "" %>>Masculino</option>
                        <option value="Femenino" <%= "Femenino".equals(sexo) ? "selected" : "" %>>Femenino</option>
                        <option value="Otro" <%= "Otro".equals(sexo) ? "selected" : "" %>>Otro</option>
                    </select>
                </div>

                <div class="mb-3">
                    <label class="form-label fw-bold"><i class="bi bi-house-door-fill"></i> Dirección</label>
                    <input type="text" name="direccion" class="form-control form-control-lg" value="<%= direccion %>">
                </div>

                <div class="mb-3">
                    <label class="form-label fw-bold"><i class="bi bi-calendar-event-fill"></i> Fecha de Nacimiento</label>
                    <input type="date" name="fechaNacimiento" class="form-control form-control-lg" value="<%= fechaNacimiento %>">
                </div>

                <div class="d-flex justify-content-between mt-4">
                    <a href="listar.jsp" class="btn btn-secondary btn-lg">
                        ⬅️ Cancelar
                    </a>
                    <button type="submit" class="btn btn-success btn-lg">
                        💾 Guardar Cambios
                    </button>
                </div>
            </form>
        </div>
    </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
