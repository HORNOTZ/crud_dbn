import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class Conexion {

    private static final String URL = "jdbc:mysql://bgbpxv1djuq8zjluwtza-mysql.services.clever-cloud.com:3306/bgbpxv1djuq8zjluwtza";
    private static final String USER = "ucp7tsvfxhqaihek";
    private static final String PASSWORD = "AjuDzaHxPIpQqx8H7Xws";

    public Connection getConnection() {
        Connection con = null;
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            con = DriverManager.getConnection(URL, USER, PASSWORD);
            System.out.println("✅ Conexión exitosa a la base de datos de Clever Cloud.");
        } catch (ClassNotFoundException e) {
            System.out.println("❌ Error: No se encontró el driver MySQL: " + e.getMessage());
        } catch (SQLException e) {
            System.out.println("❌ Error en la conexión a la base de datos: " + e.getMessage());
        }
        return con;
    }
}