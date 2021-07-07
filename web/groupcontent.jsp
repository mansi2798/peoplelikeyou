<%-- 
    Document   : userprofile
    Created on : Apr 7, 2021, 12:09:41 PM
    Author     : mansi
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page contentType="text/html" import="java.sql.*" %>
<%@page contentType="text/html" import="beans.*" %>
<%@page contentType="text/html" import="java.io.*" %>


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
        <div class="container">
         <% 
        UserBean user = (UserBean)session.getAttribute("user");
     if (user==null){
             response.sendRedirect("login.jsp");
         }
         %>
        <%  String group=(String)session.getAttribute("group");
            
            out.println("<center><h1>welcome to group "+group+"</h1></center>");%>
        <form action="groupcontentcontroller" method="post" class="form_container" enctype="multipart/form-data"> 
         <input type="file" name="pic" id="pic" required="required" style="display: none;"/>
         <center> <input type="button" value="Upload your content" class="btn btn-primary" onclick="pic.click();"/></center><br/>
         <center>  <input type="submit" class="btn btn-primary form-control" value="Register" name="submit"/> </center>     
        </form>
            <%
                try{  Class.forName("com.mysql.cj.jdbc.Driver");
                Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/peoplelikeyou","root","");
               // String sql= "select userid from users where username=?;
               // PreparedStatement smt= con.prepareStatement(sql);
               
               // smt.setString(1, username);
                //smt.executeUpdate();
                 
                
               String  sql= "select content,username from contentingroup where usergroup=?";
               PreparedStatement smt= con.prepareStatement(sql);
               
         
               smt.setString(1, group);
                
                
                ResultSet rs = smt.executeQuery();
       while(rs.next()){
            String content = rs.getString("content");
            String username= rs.getString("username");%>
            <table class="table">
               <tr><td><center>uploaded by <%=username%></center></td></tr></center><br>
               <td><center><img src="<%=content%>" width=200 height=200"></center></td></tr><br>
            </table>
            
                
            

                    <%    } 
          } 
         catch (Exception ex) {
              System.out.println("Error " + ex.getMessage());
         }
                
            %>
	
        </div>
    </body>
</html>
