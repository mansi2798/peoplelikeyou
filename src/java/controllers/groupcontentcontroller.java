/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controllers;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.commons.io.*;
import org.apache.commons.fileupload.*;
import org.apache.commons.fileupload.servlet.*;
import org.apache.commons.fileupload.disk.*;
import java.util.*;
import beans.*;
import javax.servlet.http.HttpSession;
public class groupcontentcontroller extends HttpServlet {
    
 protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
             response.setContentType("text/html");
            HttpSession session=request.getSession();
            System.out.println("Session : "+session);
          UserBean user = (UserBean)session.getAttribute("user");
          
        String username=user.getUsername();
        String group =(String) session.getAttribute("group");
          
        
        PrintWriter out= response.getWriter();
       
         
         
          String uploadDirectory = "uploads";
          String imgPath="";
          if (ServletFileUpload.isMultipartContent(request)) {
            
         
        // configures upload settings
        DiskFileItemFactory factory = new DiskFileItemFactory();
          
        ServletFileUpload upload = new ServletFileUpload(factory);
          
        // constructs the directory path to store upload file
        String uploadPath = getServletContext().getRealPath("")+ File.separator + uploadDirectory;
        // creates the directory if it does not exist
        File uploadDir = new File(uploadPath);
        if (!uploadDir.exists()) {
            uploadDir.mkdir();
        }
         
        try {
            // parses the request's content to extract file data
            List formItems = upload.parseRequest(request);
            Iterator iter = formItems.iterator();
             
            // iterates over form's fields
            while (iter.hasNext()) {
                FileItem item = (FileItem) iter.next();
                // processes only fields that are not form fields
                if (!item.isFormField()) {
                    System.out.println("image found...");
                    String fileName = new File(item.getName()).getName();
                    String filePath = uploadPath + File.separator + fileName;
                    File storeFile = new File(filePath);
                     
                    // saves the file on disk
                    item.write(storeFile);
                    imgPath = uploadDirectory +"/"+ fileName;
                    System.out.println("image uploaded...");
                }
               
            }
            //jdbc :
                Class.forName("com.mysql.cj.jdbc.Driver");
                Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/peoplelikeyou","root","");
               // String sql= "select userid from users where username=?;
               // PreparedStatement smt= con.prepareStatement(sql);
               
               // smt.setString(1, username);
                //smt.executeUpdate();
                 
                
               String  sql= "insert into contentingroup(content,usergroup,username)values(?,?,?)";
               PreparedStatement smt= con.prepareStatement(sql);
               
         
               smt.setString(1, imgPath);
               smt.setString(2, group);
               
                smt.setString(3, username);
                
                int n = smt.executeUpdate();
                con.close();
                
               

            
          } catch (Exception ex) {
              System.out.println("Error " + ex.getMessage());
         }
          
         }   
           
          
       
    }
}
