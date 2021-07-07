<%-- 
    Document   : groups
    Created on : Mar 7, 2021, 10:56:29 AM
    Author     : mansi
<%response.sendRedirect("groups.jsp?name="+request.getParameter("name"));%>
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page contentType="text/html" import="java.sql.*" %>
<%@page contentType="text/html" import="java.io.*" %>
<%@page contentType="text/html" import="beans.*" %>




<html>
    <head><meta charset="UTF-8">
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
       String username = user.getUsername();
        Class.forName("com.mysql.jdbc.Driver");
        Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/peoplelikeyou","root","");
        String sql = "select usergroup from users where username=?";
        PreparedStatement smt = con.prepareStatement(sql);
        smt.setString(1, username);
        ResultSet rs = smt.executeQuery();
        if(rs.next()){%><h1><%
            String usergroup = rs.getString("usergroup");
            System.out.println(usergroup);
           out.println("<center>hy   "+username+"</center>");%></h1><%
               String[] hbs = usergroup.split(",");%><table class="table" border="1" align="center"><tr><th><h2><center>groups</center></h2></th></tr><%
            for (String h : hbs){
               session.setAttribute("group",h);
               %>     <tr><td><center><a href="groupcontent.jsp"><input type="button" name="<%=h%>" value=<%=h%>></a></center></td><tr>
                
               
        
          <% }%></table>
        
                 
         
            
         
         <%}
       }
         catch(Exception e){
            System.out.println("Error " + e.getMessage());
        }
                %>
               </div>
    </body>
</html>
