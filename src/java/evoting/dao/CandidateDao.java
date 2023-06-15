
package evoting.dao;

import evoting.dto.CandidateDetails;
import evoting.dto.CandidateDto;
import evoting.dto.CandidateVote;
import evoting.utills.DBConnection;
import java.io.ByteArrayInputStream;
import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.sql.Blob;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Base64;
import java.util.List;

public class CandidateDao {
    
    //    PreparedStatement static - so that we can access it inside static block... 
    private static PreparedStatement ps, ps1, ps2, ps3, ps4, ps5, ps6, ps7;
    
//    sabhi candidate ki id's lene ke liye query dynamic ni hogi , to ek statement bhi chalega... 
    private static Statement st;
    static {
        try{
//            candidate_details me rows ke count ke get karne ke liye query...
            ps = DBConnection.getConnection().prepareStatement("SELECT count(*) from candidate_details");
            
//            ADHAR_ID ke base par name chahihye hai... 
            ps1 = DBConnection.getConnection().prepareStatement("SELECT USERNAME FROM user_details WHERE ADHAR_NO = ?");
            
//            sabhi cities ko get karo...
            ps2 = DBConnection.getConnection().prepareStatement("SELECT DISTINCT city from user_details");
            
//            pura candidate lekar use database me store karane ke liye... 
            ps3 = DBConnection.getConnection().prepareStatement("Insert into candidate_details values(?, ?, ?, ?, ?)");
            
//            sabhi candidate's ki id pull karna ke liye... 
            st = DBConnection.getConnection().createStatement();
            
//            candidate ki deitails pull karne ke liye candidate id ke base par... 
            ps4 = DBConnection.getConnection().prepareStatement("select * from candidate_details where CANDIDATE_ID = ?");
            
            ps5 = DBConnection.getConnection().prepareStatement("SELECT candidate_details.CANDIDATE_ID, user_details.USERNAME, candidate_details.PARTY, candidate_details.SYMBOL, user_details.CITY FROM candidate_details INNER JOIN user_details ON candidate_details.USER_ID = user_details.ADHAR_NO WHERE candidate_details.CITY = (SELECT CITY FROM user_details WHERE ADHAR_NO = ?);");
        
            ps6 = DBConnection.getConnection().prepareStatement("DELETE FROM candidate_details WHERE CANDIDATE_ID = ?");
        
            ps7 = DBConnection.getConnection().prepareStatement("select user_id from candidate_details where party = ? and city = ?");
        
        }
        catch(SQLException se) {
            se.printStackTrace();
        }
    }
    
//    change
    public static boolean validateCandidateBaseUponCityAndParty(String city, String party) throws SQLException{
        ps7.setString(1, party);
        ps7.setString(2, city);
        ResultSet rs = ps7.executeQuery();
        if(rs.next())
            return false;
        else
            return true;
    }
//      change    
    
    public static boolean removeCandidate(String cid) throws SQLException{
        ps6.setString(1, cid);
        int ans = ps6.executeUpdate();
        if(ans == 1)
            return true;
        return false;
    }
    
//    generate new id... 
    public static String getNewId() throws SQLException{
        
//        resultset for ps... 
        ResultSet rs = ps.executeQuery();
        rs.next();
        
//      let's image if there are 2 candidates , then rs.getInt() will give us 2 , we will add 1 so the id will become C103...
//      and if rs.getInt() gives us 0 then the id will be C101...
        return "C"+(100+rs.getInt(1)+1);
        
    }
    
//    adhar id ke base par username... 
    public static  String getUserNameById(String uid) throws SQLException{
        ps1.setString(1, uid);
        ResultSet rs = ps1.executeQuery();
        if(rs.next()){
            return rs.getString(1);
        }
        else{
            return null;
        }
    }
    
//    cites ki list return karna hai... 
    public static List<String> getCity() throws SQLException{
        List<String> citylist = new ArrayList<String>();
        ResultSet rs = ps2.executeQuery();
        
//        cities ki ek list bhi ho sakti hai isliye ek loop lagana pada hai... 
        while(rs.next()) {
            citylist.add(rs.getString(1));
        }
        return citylist;
    }
    
    public static boolean addCandidate(CandidateDto obj) throws SQLException, IOException{
            String id = obj.getCandidateid();
            String party = obj.getParty();
            String user_id = obj.getUserid();
            InputStream symbol = obj.getSymbol();
            String city = obj.getCity();


            ps3.setString(1, id);
            ps3.setString(2, party);
            ps3.setString(3, user_id);
            ps3.setBinaryStream(4, symbol);
            ps3.setString(5, city);
        
        return ps3.executeUpdate() != 0;
    }
    
    public static ArrayList<String> getCandidateIds() throws SQLException{
        ArrayList<String> cadidateList = new ArrayList<String>();
        ResultSet rs = st.executeQuery("select CANDIDATE_ID from candidate_details");
        while(rs.next()){
            cadidateList.add(rs.getString(1));
        }
        return cadidateList;
    }
    
    
    public static CandidateDetails getDetailsById(String cid) throws SQLException, IOException{
        
        ps4.setString(1, cid);
        ResultSet rs = ps4.executeQuery();
        CandidateDetails candidate = new CandidateDetails();
        Blob blobdata;
        InputStream inputStream;
        byte buffer[];
        byte imageBytes[];
        int bytesRead;
        String base64Image;
        ByteArrayOutputStream outputStream;
        
        if(rs.next()){
//            getting image in the form of blob... 
            blobdata = rs.getBlob(4);
//            getting inputStream Object ( to access the actual binary data ) through getBinaryStream()...
            inputStream = blobdata.getBinaryStream();
//            yaha par humne inputStream ki ek method read(byte []) ka use kyu ni kiya ye pata lagao... 
//            getting byte[] from binary data...
            outputStream = new ByteArrayOutputStream();
//            ByteArrayOutputStream iske paas ek method hai write() jo paramter me ek array leta hai , jiska statndard size hai 4096 , aur utne bytes
//            jitne array me hai unko copy karta jata hai buffer me...
//            humne ek byte array bana diya 4096 ka...  
            buffer = new byte[4096];
            bytesRead = -1;
            while( (bytesRead = inputStream.read(buffer)) != -1 ){
                outputStream.write(buffer, 0, bytesRead);
            }
            imageBytes = outputStream.toByteArray();
            Base64.Encoder en = Base64.getEncoder();
            base64Image = en.encodeToString(imageBytes);
            candidate.setSymbol(base64Image);
            candidate.setCandidateid(cid);
            candidate.setCandidatename(getUserNameById(rs.getString(3)));
            candidate.setParty(rs.getString(2));
            candidate.setCity(rs.getString(5));
            candidate.setUserid(rs.getString(3));
        }
         return candidate;
    }
    
    public static ArrayList<CandidateVote> viewCandidate(String adhar_no) throws SQLException, IOException{
        ArrayList<CandidateVote> candidatelist = new ArrayList<CandidateVote>();
        ps5.setString(1, adhar_no);
        ResultSet rs = ps5.executeQuery();
        Blob blobdata;
        InputStream inputstream;
        byte buffer[];
        byte imagebytes[];
        int bytesread;
        String base64Image;
        ByteArrayOutputStream outputstream;
        
        while(rs.next()) {
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
            CandidateVote candidatevote = new CandidateVote();
            candidatevote.setCandidateId(rs.getString(1));
            candidatevote.setCandidateName(rs.getString(2));
            candidatevote.setParty(rs.getString(3));
            candidatevote.setCity(rs.getString(5));
            candidatevote.setSymbol(base64Image);
            candidatelist.add(candidatevote);
        }
        return candidatelist;
    }
}
