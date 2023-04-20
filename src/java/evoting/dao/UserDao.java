
package evoting.dao;

import evoting.dto.UserDetails;
import evoting.dto.UserDto;
import evoting.utills.DBConnection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;


public class UserDao {
    
//    static - so that we can access it inside static block... 
    private static PreparedStatement ps;
    private static Statement st;
    static {
        try{
            ps = DBConnection.getConnection().prepareStatement("SELECT USER_TYPE FROM user_details WHERE ADHAR_NO = ? AND PASSWORD = ?");
            st = DBConnection.getConnection().createStatement();
        }
        catch(SQLException se) {
            se.printStackTrace();
        }
    }
    
    public static String validateUser(UserDto user) throws SQLException{
        ps.setString(1, user.getUserid());
        ps.setString(2, user.getPassword());
        ResultSet rs = ps.executeQuery();
        if(rs.next()){
            String str = rs.getString(1);
            return str;
        }
        return null;
    }
    
    public static ArrayList<UserDetails> getUserDetails() throws SQLException{
        ResultSet rs = ps.executeQuery("SELECT USERNAME, ADHAR_NO, email_id, ADDRESS, MOBILE_NO, CITY FROM user_details WHERE USER_TYPE = 'voter'");
        ArrayList<UserDetails> userlist = new ArrayList<UserDetails>();
        while(rs.next()){
            String username = rs.getString(1);
            String userid = rs.getString(2);
            String emailid = rs.getString(3);
            String address = rs.getString(4);
            long mobileno = rs.getLong(5);
            String city = rs.getString(6);
            UserDetails user = new UserDetails(username, userid, emailid, address, mobileno, city, null );
            userlist.add(user);
        }
        return userlist;
    }
}
