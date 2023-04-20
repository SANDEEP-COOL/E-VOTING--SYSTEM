
package evoting.dto;

import java.io.InputStream;


public class CandidateDto {

    private String candidateid;
    private String party;
    private String city;
    private String userid;
    private InputStream symbol;
    
    public CandidateDto(){
        
    }
    
    @Override
    public String toString() {
        return "candidateDto{" + "candidateid=" + candidateid + ", party=" + party + ", city=" + city + ", userid=" + userid + ", symbol=" + symbol + '}';
    }

    public String getCandidateid() {
        return candidateid;
    }

    public void setCandidateid(String candidateid) {
        this.candidateid = candidateid;
    }

    public String getParty() {
        return party;
    }

    public void setParty(String party) {
        this.party = party;
    }

    public String getCity() {
        return city;
    }

    public void setCity(String city) {
        this.city = city;
    }

    public String getUserid() {
        return userid;
    }

    public void setUserid(String userid) {
        this.userid = userid;
    }

    public InputStream getSymbol() {
        return symbol;
    }

    public void setSymbol(InputStream symbol) {
        this.symbol = symbol;
    }

    public CandidateDto(String candidateid, String party, String city, String userid, InputStream symbol) {
        this.candidateid = candidateid;
        this.party = party;
        this.city = city;
        this.userid = userid;
        this.symbol = symbol;
    }
    
}
