
package evoting.dto;

public class SelectedCandByVoterInfoDto {

    public SelectedCandByVoterInfoDto() {
    }

    @Override
    public String toString() {
        return "SelectedCandByVoterInfoDto{" + "USERNAME=" + USERNAME + ", ADDRESS=" + ADDRESS + ", CITY=" + CITY + ", EMAIL_ID=" + EMAIL_ID + ", MOBILE_NO=" + MOBILE_NO + ", GENDER=" + GENDER + '}';
    }

    public String getUSERNAME() {
        return USERNAME;
    }

    public void setUSERNAME(String USERNAME) {
        this.USERNAME = USERNAME;
    }

    public String getADDRESS() {
        return ADDRESS;
    }

    public void setADDRESS(String ADDRESS) {
        this.ADDRESS = ADDRESS;
    }

    public String getCITY() {
        return CITY;
    }

    public void setCITY(String CITY) {
        this.CITY = CITY;
    }

    public String getEMAIL_ID() {
        return EMAIL_ID;
    }

    public void setEMAIL_ID(String EMAIL_ID) {
        this.EMAIL_ID = EMAIL_ID;
    }

    public String getMOBILE_NO() {
        return MOBILE_NO;
    }

    public void setMOBILE_NO(String MOBILE_NO) {
        this.MOBILE_NO = MOBILE_NO;
    }

    public String getGENDER() {
        return GENDER;
    }

    public void setGENDER(String GENDER) {
        this.GENDER = GENDER;
    }

  private String USERNAME;
  private String ADDRESS;
  private String CITY;
  private String EMAIL_ID;
  private String MOBILE_NO;
  private String GENDER;
}
