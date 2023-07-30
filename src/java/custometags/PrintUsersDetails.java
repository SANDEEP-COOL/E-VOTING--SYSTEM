
package custometags;
import javax.servlet.jsp.tagext.SimpleTagSupport;
import javax.servlet.jsp.JspException;
import javax.servlet.jsp.JspContext;
import javax.servlet.jsp.JspWriter;
import java.io.IOException;
import evoting.dto.UserDetails;
import java.util.List;

public class PrintUsersDetails extends SimpleTagSupport{

    public List<UserDetails> getList() {
        return list;
    }

    public void setList(List<UserDetails> list) {
        this.list = list;
    }
    
    private List<UserDetails> list;

    @Override
    public void doTag() throws JspException, IOException {
        
//      JspContext provides access to various JSP-related objects and methods, like the JspWriter.
        JspContext context = super.getJspContext();
        
//      It is essentially a character output stream that allows you to write HTML or other content dynamically during the JSP rendering.
        JspWriter out = context.getOut();
        
        out.println("<div class='container mt-3'>");
        out.println("<table class='table'>");
        out.println("<tr><th class='col pb-5 customeFont'>#</th><th class='col customeFont'>User Id</th><th class='col customeFont'>User Name</th><th class='col customeFont'>Email Id</th><th class='col customeFont'>Address</th><th class='col customeFont'>Mobile No</th><th class='col customeFont'>City</th><th class='col customeFont'>Remove</th></tr>");
        
        int i = 1;
        for(UserDetails user : list) {
            
            
            out.println("<tr><th scope='row' class='p-2 customeFont'>" + i + "</th><td class='p-2'>" + user.getUserName() + "</td><td class='p-2'>" + user.getUserId() + "</td><td class='p-2'>" + user.getMobile() + "</td><td class='p-2'>" + user.getEmailId() + "</td><td class='p-2'>" + user.getAddress() + "</td><td class='p-2'>" + user.getCity() + "</td><td class='p-2'><a href='RemoveUserServlet?userId=" + user.getUserId() + "' class='btn btn-danger' onclick='askAgain()'>Remove User</a></td></tr>");
            i++;
            
        }
        
        out.println("</table>");
        out.println("</div>");
    }
    
}
