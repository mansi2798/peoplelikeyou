/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package daos;

import beans.UserBean;
import connection.DataConnection;
import java.sql.*;
import java.util.ArrayList;

public class UserDao {
    public boolean add(UserBean s){
        boolean status=false;
        try{
            Connection con = DataConnection.getConnection();
            if(con!=null){
                String sql = "insert into users (username,usermail,userpassword,usercity,userphone,usergroup) values(?,?,?,?,?,?)";
                PreparedStatement smt = con.prepareStatement(sql);
                smt.setString(1, s.getUsername());
                smt.setString(2, s.getUsermail());
                smt.setString(3, s.getUserpassword());
                smt.setString(4, s.getUsercity());
                smt.setString(5, s.getUserphone());
                smt.setString(6, s.getUsergroup());
                
                
                int n= smt.executeUpdate();
                if (n!=0)
                    status=true;
                con.close();
            }
            
        }catch(Exception e){
            System.out.println("Insertion error : "+ e.getMessage());
        }
        
        return status;
    }
}
