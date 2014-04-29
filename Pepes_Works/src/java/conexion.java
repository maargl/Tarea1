import java.sql.Connection;
import java.sql.DriverManager;

public class conexion {
    public Connection getConnection() throws Exception
    { 
         String driver = "oracle.jdbc.driver.OracleDriver";
         String url = "jdbc:oracle:thin:@172.16.190.130:1522:database";
         String username = "system";
         String password = "database";
         Class.forName(driver);
         return DriverManager.getConnection(url, username, password);
    } 
    
}

