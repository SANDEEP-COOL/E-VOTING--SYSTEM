
package evoting.dto;


public class UserDetails {

    public UserDetails() {
         
    }
  
    @Override
    public String toString() {
        return "UserDetails{" + "username=" + username + ", userid=" + userid + ", emailid=" + emailid + ", address=" + address + ", mobile=" + mobile + ", city=" + city + ", password=" + password + '}';
    }

    public String getUserName() {
        return username;
    }

    public void setUserName(String username) {
        this.username = username;
    }

    public String getUserId() {
        return userid;
    }

    public void setUserId(String userid) {
        this.userid = userid;
    }

    public String getEmailId() {
        return emailid;
    }

    public void setEmailId(String emailid) {
        this.emailid = emailid;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public long getMobile() {
        return mobile;
    }

    public void setMobile(long mobile) {
        this.mobile = mobile;
    }

    public String getCity() {
        return city;
    }

    public void setCity(String city) {
        this.city = city;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public UserDetails(String username, String userid, String emailid, String address, long mobile, String city, String password) {
        this.username = username;
        this.userid = userid;
        this.emailid = emailid;
        this.address = address;
        this.mobile = mobile;
        this.city = city;
        this.password = password;
    }

    public UserDetails(String username, String userid, String emailid, String address, long mobile, String city, String password, String gender) {
        this.username = username;
        this.userid = userid;
        this.emailid = emailid;
        this.address = address;
        this.mobile = mobile;
        this.city = city;
        this.password = password;
        this.gender = gender;
    }
    private String username;
    private String userid;
    private String emailid;
    private String address;
    private long mobile;
    private String city;
    private String password;
    
//    change
    private String gender;

    public String getGender() {
        return gender;
    }

    public void setGender(String gender) {
        this.gender = gender;
    }
    
}
