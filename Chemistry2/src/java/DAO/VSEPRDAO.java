/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAO;

import ConnectionUtil.ConnectionFactory;
import java.sql.PreparedStatement;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

/**
 *
 * @author aishwarya
 */
public class VSEPRDAO {
    private Connection connection1;
    private PreparedStatement statement1;
    public VSEPRDAO()
    {
        
    }
    public int addCompound(String cname,int ep,int lp,String shape) throws SQLException
    {
        int status;
        if(ep<=7)
        {
       status=0;
        connection1 = ConnectionFactory.getConnection();
        
        String sql = "INSERT INTO VSEPR (compound_name,shape_id,lonepairs,shape) VALUES (?, ?, ?, ?)";
        statement1 = connection1.prepareStatement(sql);
         try{
             ep=ep-1;
             
                statement1.setString(1, cname);
                   statement1.setInt(2, ep);
                statement1.setInt(3, lp);
                statement1.setString(4, shape);
                 status=statement1.executeUpdate();

          System.out.println("Data is successfully inserted!");
        }
        catch(Exception e){
        e.printStackTrace();
        }
       
    }
        else
        {
            status=0;
        }
        return status;
    }
    
}

