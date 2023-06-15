
package evoting.dao;

import evoting.dto.SelectedCandByVoterInfoDto;
import evoting.utills.DBConnection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class SelectedCandByVoterInfoDao {
    private static PreparedStatement ps;
    static{
        try{
            ps = DBConnection.getConnection().prepareStatement("SELECT USERNAME, ADDRESS, CITY, EMAIL_ID, MOBILE_NO, GENDER FROM USER_DETAILS WHERE ADHAR_NO = (SELECT USER_ID FROM CANDIDATE_DETAILS WHERE CANDIDATE_ID = (SELECT CANDIDATE_ID FROM VOTER_DETAILS WHERE VOTER_ID = ?));");
        }
        catch(SQLException sq){
            sq.printStackTrace();
        }
    }
    
    public static SelectedCandByVoterInfoDto getVotersCandidateInfo(String userid) throws SQLException{
        ps.setString(1, userid);
        ResultSet rs = ps.executeQuery();
        SelectedCandByVoterInfoDto cand = new SelectedCandByVoterInfoDto();
        while(rs.next()){
            cand.setUSERNAME(rs.getString(1));
            cand.setADDRESS(rs.getString(2));
            cand.setCITY(rs.getString(3));
            cand.setEMAIL_ID(rs.getString(4));
            cand.setMOBILE_NO(rs.getString(5));
            cand.setGENDER(rs.getString(6));
        }
        return cand;
    }
}
