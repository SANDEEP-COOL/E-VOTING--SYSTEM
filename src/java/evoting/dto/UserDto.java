
package evoting.dto;


public class UserDto {

//    change... 
    @Override
    public String toString() {
        return "UserDto{" + "userid=" + userid + ", password=" + password + '}';
    }

    public UserDto(String userid, String password) {
        this.userid = userid;
        this.password = password;
    }

    public String getUserid() {
        return userid;
    }

    public void setUserid(String userid) {
        this.userid = userid;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }
    private String userid;
    private String password;
}
