
package evoting.utills;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;


public class DBConnection {
    private static Connection conn = null;
    
//    static block apne aap chalta hai
//    jab pehli baar is particular class ka use hoga (iska mtlb jab pehla voter register karga)
    static {
        
        try{
//        register mysql driver
        Class.forName("com.mysql.cj.jdbc.Driver");
        
//         Open connection
        String url = "jdbc:mysql://localhost:3306/vote_for_change";
        String user = "root";
        String password = "admin";
        conn = DriverManager.getConnection(url, user, password);
        
        System.out.println("driver loaded and connection opened");
        } 
        catch(ClassNotFoundException cnf){
            cnf.printStackTrace();
        }
        catch(SQLException sqe){
            sqe.printStackTrace();
        }
    }
    
    public static Connection getConnection(){
        return conn;
    }
    public static void closeConnection() {
        try{
            if(conn != null){
                conn.close();
                return;
            }
        }
        catch(SQLException sqe){
            sqe.printStackTrace();
        }
    } 
}
