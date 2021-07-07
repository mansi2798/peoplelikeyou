package controllers;
import java.util.List;
import java.io.*;
import java.net.URLEncoder;
import java.nio.charset.StandardCharsets;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.commons.fileupload.*;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.*;
import java.sql.*;
import javax.servlet.RequestDispatcher;
import org.apache.commons.lang.*;
import java.util.Base64;
import javax.servlet.http.HttpSession;
import beans.*;
import daos.*;
public class UserController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html");
        PrintWriter out = response.getWriter();

           String op = request.getParameter("op");

            if (op != null && op.equals("signup")) {
            String username = request.getParameter("username");
            String usermail = request.getParameter("usermail");
            String userpassword = request.getParameter("userpassword");
            String usercity = request.getParameter("usercity");
            String userphone = request.getParameter("userphone");
            String usergroup[] = request.getParameterValues("usergroup");
            String ug= "";
            for (String x : usergroup) {
                ug += x + ",";
            }
            
            UserBean ub = new UserBean();
            ub.setUsername(username);
            ub.setUsermail(usermail);
            ub.setUserpassword(userpassword);
            ub.setUsercity(usercity);
            ub.setUserphone(userphone);
            ub.setUsergroup(ug);
            UserDao ud=new UserDao();
                   if(ud.add(ub))
               out.println("thankyou for signing up");
              //  response.sendRedirect("showStudents.jsp");
        }
             else if (op.equals("login"))
        {
            String usermail=request.getParameter("usermail");
            String userpassword=request.getParameter("userpassword");
            try{
              Class.forName("com.mysql.jdbc.Driver");
              Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/peoplelikeyou","root","");
              String sql= "select * from users where  usermail=? and userpassword=?";
              PreparedStatement smt = con.prepareStatement(sql);
              smt.setString(1, usermail);
             smt.setString(2, userpassword);
                System.out.println("hello");
                ResultSet rs = smt.executeQuery();
              // con.close();
              // smt.close();
                System.out.println(rs.getRow());
                RequestDispatcher rd =null;
                if (rs.next()){
                    UserBean user = new UserBean();
                    user.setUsername(rs.getString("username"));
                   // user.setId(rs.getInt("id"));
                   // user.setUserid(rs.getString("userid"));
                   // user.setPassword(rs.getString("password"));
                   // user.setGender(rs.getString("gender"));
                   // user.setHobbies(rs.getString("hobbies"));
                    //user.setImage(rs.getString("image"));
                    HttpSession session=request.getSession();
                    session.setAttribute("user", user);
                    rd = request.getRequestDispatcher("welcome.jsp");
                    rd.forward(request, response);
                }
                else{
                    out.println("<h2><font color='red'>Sorry! Userid or password is incorrect </font></h2>");
                rd = request.getRequestDispatcher("login.jsp");
                rd.include(request, response);
                }
            }catch(Exception e){
                System.out.println("Error "+e.getMessage());
            }
        
        
        }
        


    }

}