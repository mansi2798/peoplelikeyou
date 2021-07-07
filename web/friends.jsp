<%-- 
    Document   : friends
    Created on : Mar 7, 2021, 3:38:56 PM
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
        <div class="container">
        <% 
        UserBean user = (UserBean)session.getAttribute("user");
     if (user==null){
             RequestDispatcher rd= request.getRequestDispatcher("login.jsp");
             rd.forward(request, response);
         }
         %>
        <%  
       try{ 
           String username=user.getUsername();
       
        Class.forName("com.mysql.jdbc.Driver");
        Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/peoplelikeyou","root","");
        String sql = "select usergroup from users where username=?";
        PreparedStatement smt = con.prepareStatement(sql);
        smt.setString(1, username);
        ResultSet rs = smt.executeQuery();
        if(rs.next()){
            out.println("<center><h1>hy    "+username+"</h1></center>");
            String usergroup = rs.getString("usergroup");
           // out.println(usergroup);
           //  int i= usergroup.indexOf(',');
             String[] hbs = usergroup.split(",");%>
             <table class="table" align="center"><tr><th>Friend's name</th><th>Friend's Group</th></tr>
            <% for (String h : hbs){
            //out.println("<br/>" + h)
            sql = "select username from users where usergroup=?";
             smt = con.prepareStatement(sql);
             smt.setString(1, h);
              rs= smt.executeQuery();
  while(rs.next()){%><tr><td><%out.println(rs.getString("username"));%></td><td> <%out.println(h);%></td></tr><%}
        
}%></table><%
        
        }
         
        }
         catch(Exception e){
            System.out.println("Error " + e.getMessage());
        }%>
    </div>
    </body>
</html>
