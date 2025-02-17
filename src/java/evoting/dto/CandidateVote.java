
package evoting.dto;


public class CandidateVote {

    public CandidateVote() {
    }

    @Override
    public String toString() {
        return "CandidateVote{" + "candidateId=" + candidateId + ", candidateName=" + candidateName + ", party=" + party + ", symbol=" + symbol + '}';
    }

    public String getCandidateId() {
        return candidateId;
    }

    public void setCandidateId(String candidateId) {
        this.candidateId = candidateId;
    }

    public String getCandidateName() {
        return candidateName;
    }

    public void setCandidateName(String candidateName) {
        this.candidateName = candidateName;
    }

    public String getParty() {
        return party;
    }

    public void setParty(String party) {
        this.party = party;
    }

    public String getSymbol() {
        return symbol;
    }

    public void setSymbol(String symbol) {
        this.symbol = symbol;
    }
    
    public String getCity() {
        return city;
    }

    public void setCity(String city) {
        this.city = city;
    }

    public CandidateVote(String candidateId, String candidateName, String party, String symbol) {
        this.candidateId = candidateId;
        this.candidateName = candidateName;
        this.party = party;
        this.symbol = symbol;
    }
    private String candidateId;
    private String candidateName;
    private String party;
    private String symbol;
    private String city;

    
}
