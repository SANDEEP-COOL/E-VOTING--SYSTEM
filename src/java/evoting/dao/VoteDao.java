
package evoting.dao;

import evoting.dto.CandidateVote;
import evoting.dto.VoteDto;
import evoting.utills.DBConnection;
import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.sql.Blob;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Base64;
import java.util.LinkedHashMap;
import java.util.Map;


public class VoteDao {
    private static PreparedStatement ps1, ps2, ps3, ps4, ps5;
    private static Statement st;
    static{
        try{
//            is voter ne jis bhi candidate ko vote kiya h use get karo...
            ps1 = DBConnection.getConnection().prepareStatement("SELECT CANDIDATE_ID FROM voter_details WHERE VOTER_ID = ?");
//            aur ab isi candidate id ki ps2 ke ? se replace kar dena so that is candidate_id waale candidate ki hi details db se aa paaye... 
            ps2 = DBConnection.getConnection().prepareStatement("SELECT  CANDIDATE_ID, USERNAME, PARTY, SYMBOL FROM CANDIDATE_DETAILS,USER_DETAILS WHERE CANDIDATE_DETAILS.USER_ID = USER_DETAILS.ADHAR_NO AND CANDIDATE_DETAILS.CANDIDATE_ID = ?");
//            agar voter ne kisi ko bhi vote nahi diya hai tab sab kuch kar lene ke baad mtlb user se vote dalwaane ke baad hume voter ko db me register bhi karna hai... 
            ps3 = DBConnection.getConnection().prepareStatement("INSERT INTO VOTER_DETAILS VALUES (?, ?, ?)");
            
            ps4 = DBConnection.getConnection().prepareStatement("SELECT candidate_id, count(*) AS votes_obtained FROM voter_details GROUP BY CANDIDATE_ID ORDER BY votes_obtained  desc");
            
//            ps5= DBConnection.getConnection().prepareStatement("select count(*) from voter_details where city = ?");
            ps5= DBConnection.getConnection().prepareStatement("select count(*) from candidate_details where city = ?");
            
            st = DBConnection.getConnection().createStatement();
        }
        catch(SQLException sq){
            sq.printStackTrace();
        }
    }
    
    public static int getCountOfCandidateAsSelectedVoterFromVoterDetials(String city) throws SQLException{
        int count = 0;
        ps5.setString(1, city);
        ResultSet rs = ps5.executeQuery();
        if(rs.next()) {
            count = rs.getInt(1);
        }
        return count;
    }
    
    public static Map<String, Integer> getResult() throws SQLException{
        Map<String , Integer> result = new LinkedHashMap<String, Integer>();
        ResultSet rs = ps4.executeQuery();
        while(rs.next()) {
            result.put(rs.getString(1), rs.getInt(2));
        }
       return result; 
    }  
    
    public static Integer getVoteCount() throws SQLException{
        ResultSet rs = st.executeQuery("SELECT count(*) as total_votes FROM candidate_details");
//        ResultSet rs = st.executeQuery("SELECT count(*) as total_votes FROM voter_details");
        if(rs.next())
            return rs.getInt(1);
        return 0;
    }
    
    
//            is voter ne jis bhi candidate ko vote kiya h use get karo..
    public static String getCandidateIdOfVoter(String userid) throws SQLException{
        ps1.setString(1, userid);
        ResultSet rs = ps1.executeQuery();
        if(rs.next()){
            return rs.getString(1);
        }
        return null;
    }
    
    public static CandidateVote getVote(String cid) throws SQLException, IOException{
        ps2.setString(1, cid);
        ResultSet rs = ps2.executeQuery();
        CandidateVote candidatevote = new CandidateVote();
        Blob blobdata;
        InputStream inputstream;
        byte buffer[];
        byte imagebytes[];
        int bytesread = -1;
        String base64Image;
        ByteArrayOutputStream outputstream;
        
        while(rs.next()){
            blobdata = rs.getBlob(4);
            inputstream = blobdata.getBinaryStream();
            outputstream = new ByteArrayOutputStream();
            buffer = new byte[4096];
            bytesread = -1;
            while((bytesread = inputstream.read(buffer)) != -1){
                outputstream.write(buffer, 0, bytesread);
            }
            imagebytes = outputstream.toByteArray();
            Base64.Encoder en = Base64.getEncoder();
            base64Image = en.encodeToString(imagebytes);
            candidatevote.setCandidateId(rs.getString(1));
            candidatevote.setCandidateName(rs.getString(2));
            candidatevote.setParty(rs.getString(3));
            candidatevote.setSymbol(base64Image);
        }
        return candidatevote;
    }
    
    public static boolean addVote(VoteDto obj) throws SQLException{
        ps3.setString(1, obj.getCandidateId());
        ps3.setString(2, obj.getVoterid());
        ps3.setString(3, obj.getCity());
        return ps3.executeUpdate() != 0;
    }
}
