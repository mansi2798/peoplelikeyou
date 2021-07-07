<%-- 
    Document   : userprofile
    Created on : Apr 7, 2021, 12:09:41 PM
    Author     : mansi
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page contentType="text/html" import="java.sql.*" %>
<%@page contentType="text/html" import="beans.*" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
      <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">

<!-- Optional theme -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" integrity="sha384-rHyoN1iRsVXV4nD0JutlnGaslCJuC7uwjduW9SVrLvRYooPp2bWYgmgJQIXwl/Sp" crossorigin="anonymous">

<!-- Latest compiled and minified JavaScript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script> 
    </head>
    <body>
         <% 
        UserBean user = (UserBean)session.getAttribute("user");
     if (user==null){
             response.sendRedirect("login.jsp");
         }
         %>
        <%  
            out.println("<center><h1>Hello "+user.getUsername()+"</h1></center>");%>
        <form action="userprofilecontroller" method="post" class="form_container" enctype="multipart/form-data"> 
            <center><input type="file" name="pic" id="pic" required="required" style="display: none;"/></center>
            <center> <input type="button" value="Upload your Pic" class="btn btn-primary" onclick="pic.click();"/></center><br/>
        <input type="submit" class="btn btn-primary form-control" value="Register" name="submit"/>      
        </form>
            <%
                try{  Class.forName("com.mysql.cj.jdbc.Driver");
                Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/peoplelikeyou","root","");
               // String sql= "select userid from users where username=?;
               // PreparedStatement smt= con.prepareStatement(sql);
               
               // smt.setString(1, username);
                //smt.executeUpdate();
                 
                
               String  sql= "select userpost from userprofilepost where username=?";
               PreparedStatement smt= con.prepareStatement(sql);
               
         
               smt.setString(1, user.getUsername());
                
                
                ResultSet rs = smt.executeQuery();
       while(rs.next()){
            String userpost = rs.getString("userpost");
            
%>          <table class="table">
            <tr><td><center>
            <img src="<%=userpost%>">
            </center></td></tr>
            
                
            

                    <%    } 
          } 
         catch (Exception ex) {
              System.out.println("Error " + ex.getMessage());
         }
                
            %>
	
      
    </body>
</html>
