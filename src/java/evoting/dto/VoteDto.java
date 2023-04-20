
package evoting.dto;


public class VoteDto {

    @Override
    public String toString() {
        return "VoteDto{" + "candidateId=" + candidateid + ", voterid=" + voterid + '}';
    }

    public String getCandidateId() {
        return candidateid;
    }

    public void setCandidateId(String candidateId) {
        this.candidateid = candidateId;
    }

    public String getVoterid() {
        return voterid;
    }

    public void setVoterid(String voterid) {
        this.voterid = voterid;
    }

    public VoteDto(String candidateId, String voterid) {
        this.candidateid = candidateId;
        this.voterid = voterid;
    }
    private String candidateid;
    private String voterid;
}
