<%@page import="java.sql.*"%>
<%@page import="config.Conexion"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <title>Listado de Personas</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons/font/bootstrap-icons.css" rel="stylesheet">
    <style>
        body {
            background: linear-gradient(135deg, #00c6ff, #0072ff);
            min-height: 100vh;
            display: flex;
            align-items: center;
            justify-content: center;
        }
        .container {
            background: #ffffffee;
            padding: 40px;
            border-radius: 20px;
            box-shadow: 0 10px 30px rgba(0,0,0,0.3);
            animation: fadeIn 1.2s ease-in-out;
        }
        h2 {
            font-weight: bold;
            color: #0072ff;
            text-transform: uppercase;
            letter-spacing: 2px;
            text-shadow: 2px 2px 5px rgba(0,0,0,0.2);
        }
        .table {
            border-radius: 15px;
            overflow: hidden;
        }
        thead {
            background: linear-gradient(135deg, #ff512f, #dd2476);
            color: white;
            font-size: 1.1rem;
            letter-spacing: 1px;
        }
        tbody tr:hover {
            background: rgba(0, 114, 255, 0.1);
            transform: scale(1.01);
            transition: 0.3s ease;
        }
        .btn {
            border-radius: 50px;
            font-weight: bold;
            transition: all 0.3s ease;
        }
        .btn-warning {
            background: linear-gradient(135deg, #ffb347, #ffcc33);
            border: none;
            color: #fff;
        }
        .btn-danger {
            background: linear-gradient(135deg, #ff416c, #ff4b2b);
            border: none;
            color: #fff;
        }
        .btn-success {
            background: linear-gradient(135deg, #00b09b, #96c93d);
            border: none;
            color: #fff;
        }
        .btn-secondary {
            background: linear-gradient(135deg, #757f9a, #d7dde8);
            border: none;
            color: #fff;
        }
        .btn:hover {
            transform: translateY(-3px);
            box-shadow: 0 5px 15px rgba(0,0,0,0.3);
        }
        @keyframes fadeIn {
            from {opacity: 0; transform: translateY(-20px);}
            to {opacity: 1; transform: translateY(0);}
        }
    </style>
</head>
<body>

<div class="container mt-5 shadow-lg">
    <!-- Título -->
    <h2 class="text-center mb-4">
        <i class="bi bi-people-fill"></i> Listado de Personas
    </h2>

    <!-- Tabla -->
    <div class="table-responsive">
        <table class="table table-hover align-middle text-center shadow-sm">
            <thead>
                <tr>
                    <th>ID</th>
                    <th>Nombre</th>
                    <th>Correo</th>
                    <th>Teléfono</th>
                    <th>Sexo</th>
                    <th>Dirección</th>
                    <th>Fecha de Nacimiento</th>
                    <th>Acciones</th>
                </tr>
            </thead>
            <tbody>
                <%
                    Conexion cn = new Conexion();
                    Connection con = cn.getConnection();
                    Statement st = con.createStatement();
                    ResultSet rs = st.executeQuery("SELECT * FROM solicitudes ORDER BY id ASC");

                    while(rs.next()){
                %>
                <tr>
                    <td><%= rs.getInt("id") %></td>
                    <td><%= rs.getString("nombre") %></td>
                    <td><%= rs.getString("correo") %></td>
                    <td><%= rs.getString("telefono") %></td>
                    <td><%= rs.getString("sexo") %></td>
                    <td><%= rs.getString("direccion") %></td>
                    <td><%= rs.getDate("fechaNacimiento") %></td>
                    <td>
                        <!-- Botón Editar -->
                        <a href="editar.jsp?id=<%= rs.getInt("id") %>" 
                           class="btn btn-warning btn-sm"
                           onclick="return confirm('⚠️ ¿Seguro que quieres editar esta solicitud?')">
                           <i class="bi bi-pencil-square"></i> Editar
                        </a>

                        <!-- Botón Eliminar -->
                        <a href="eliminar.jsp?id=<%= rs.getInt("id") %>" 
                           class="btn btn-danger btn-sm"
                           onclick="return confirm('❌ ¿Seguro que quieres eliminar esta solicitud?')">
                           <i class="bi bi-trash"></i> Eliminar
                        </a>
                    </td>
                </tr>
                <% } %>
            </tbody>
        </table>
    </div>

    <!-- Botón para registrar nueva persona -->
    <div class="text-center mt-4">
        <a href="index.jsp" class="btn btn-success btn-lg shadow">
            <i class="bi bi-plus-circle"></i> Registrar Nueva Persona
        </a>
    </div>

    <!-- Botones de navegación -->
    <div class="text-center mt-3">
        <a href="index.jsp" class="btn btn-secondary shadow">⬅️ Volver al Create</a>
    </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
