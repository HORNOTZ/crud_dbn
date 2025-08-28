package config;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class Conexion {
    private Connection con;

    public Connection getConnection() {
        try {
            // Cargar el driver de MySQL
            Class.forName("com.mysql.cj.jdbc.Driver");

            // Datos de conexión de Clever Cloud
            String url = "mysql://ucp7tsvfxhqaihek:AjuDzaHxPIpQqx8H7Xws@bgbpxv1djuq8zjluwtza-mysql.services.clever-cloud.com:3306/bgbpxv1djuq8zjluwtza";
            String user = "ucp7tsvfxhqaihek";
            String password = "AjuDzaHxPIpQqx8H7Xws"; // <-- pega aquí la contraseña de Clever Cloud

            con = DriverManager.getConnection(url, user, password);
            System.out.println("✅ Conexión exitosa a Clever Cloud!");
        } catch (ClassNotFoundException | SQLException e) {
            System.out.println("❌ Error en conexión: " + e.getMessage());
        }
        return con;
    }
}
